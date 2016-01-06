/*:

# Converting between Result, Optionals, and Swift 2 errors

In this playground, I will show you how to easily convert between `Result` objects, Swift 2 errors, and Optionals.

For more information about this project, read the article on my website: [radex.io/swift/error-conversions](http://radex.io/swift/error-conversions/)

We'll start by defining a simple `Result` type, and an error type we'll use in our demo functions

*/

enum Result<T, E> {
    case Success(T)
    case Failure(E)
}

enum FileError: ErrorType {
    case NotFound
}

/*:

Now let's just define a few demo functions. They don't actually do anything useful, but imagine they load a file off the disk. The "successful_" functions return a string that represents the loaded file, whereas "failure_" functions return or throw some sort of error.

We'll define three pairs of these functions, for `Result` (error is a `.Failure(E)` case), Swift 2 errors (error is thrown), and Optionals (error is just `nil`)

*/

func successful_res() -> Result<String, FileError> {
    return .Success("This is some file!")
}

func failure_res() -> Result<String, FileError> {
    return .Failure(.NotFound)
}

func successful_throw() throws -> String {
    return "This is some file!"
}

func failure_throw() throws -> String {
    throw FileError.NotFound
}

func success_optional() -> String? {
    return "This is some file!"
}

func failure_optional() -> String? {
    return nil
}

/*:

## Throwable to Result

Now the fun begins. The function below takes a throwable function and returns a `Result` value

*/

func catchResult<T>(@autoclosure f: () throws -> T) -> Result<T, ErrorType> {
    do {
        return .Success(try f())
    } catch {
        return .Failure(error)
    }
}

/*:

Now simply `try` a throwable function in the auto-closure (observe the results on the timeline):

*/

catchResult(try successful_throw())
catchResult(try failure_throw())

import Foundation
catchResult(try NSData(contentsOfFile: "test", options: []))
catchResult(try NSString(contentsOfFile: "data.json", encoding: NSUTF8StringEncoding))

/*:

(Why a free function? The most intuitive place would be a `Result` initializer, but because throwable functions have untyped errors, we need to specialize `Result`’s error type as `ErrorType`, which isn’t possible with initializers. The second choice would be a `static func`, but it crashes the compiler in the current beta.)

*/
/*:

## Result to throwable

*/

extension Result {
    func extract() throws -> T {
        switch self {
        case .Success(let value):
            return value
        case .Failure(let error):
            throw error as! ErrorType
        }
    }
}

/*:

Now you can `try` calling `.extract()` on a `Result`:

*/

do {
    try successful_res().extract()
} catch {
    error
}

do {
    try failure_res().extract()
} catch {
    error
}

/*:

The above implementation is simplistic — it will crash at runtime if result’s error type isn’t an `ErrorType`. It would be best to add a `<E: ErrorType>` constraint to `Result`, but in the current beta, it crashes the compiler.

Here's a safe implementation that uses protocol extensions (it's ugly, but enforces the `E: ErrorType` constraint):

*/

protocol _ResultType {
    typealias ResultValueType
    typealias ResultErrorType
    var _result: Self { get }
}

extension Result: _ResultType {
    typealias ResultValueType = T
    typealias ResultErrorType = E
    var _result: Result { return self }
}

extension _ResultType where ResultErrorType: ErrorType {
    func extract2() throws -> ResultValueType {
        switch _result as! Result<ResultValueType, ResultErrorType> {
        case .Success(let value):
            return value
        case .Failure(let error):
            throw error
        }
    }
}

/*:

## Optional to throwable

It’s not uncommon to see a function that’s a “pipeline” of multiple operations, each of which can return `nil`. It might make sense to catch those nils at each stage of the pipeline and throw distinct errors for each of them. You could do that with `if let`, or `guard`, but here’s another idea:

*/

infix operator ?! {
    associativity right
    precedence 131
}

func ?! <T>(optional: T?, @autoclosure error: () -> ErrorType) throws -> T {
    if let optional = optional {
        return optional
    } else {
        throw error()
    }
}

/*:

And now you can unwrap values from optionals similarly to the nil coalescing operator (`??`) — but instead of replacing nils with non-nil values, it throws errors. Here's an example:

*/

do {
    try success_optional() ?! FileError.NotFound
} catch {
    error
}

do {
    try failure_optional() ?! FileError.NotFound
} catch {
    error
}

//func parseJSON(data: AnyObject?) throws -> Task {
//    let json     = try data as? NSDictionary ?! MyError.NoJSON
//    let taskData = try extractTaskData(json) ?! MyError.NoTaskData
//    return         try Task(json: taskData)  ?! MyError.ParsingError
//}

/*:

Now, should you actually create a custom operator like that, and give it a potentially confusing name like that? Perhaps not, it’s up to you. But you have to admit, it is pretty neat!

(Rob Napier has some more exploration of this [in his Gist](https://gist.github.com/rnapier/dbffbf54274a880a6ac7))

*/

/*:

## Conclusion

Who knows, maybe only hard-core FP enthusiasts will end up using `Result` values. Or maybe a future Swift 2 beta will make these helpers obsolete. And the `?!` operator, we might conclude, is not worth the cost over a simple `guard` statement.

But for now, it makes a lot of sense to experiment with those different error handling models and see how we can bridge them together.

You'll find the article online on my site: [radex.io/swift/error-conversions](http://radex.io/swift/error-conversions/)


***

Author: [Radek Pietruszewski](http://radex.io) • [Twitter](http://twitter.com/radexp) • [GitHub](http://github.com/radex) • © 2015

*/
