import UIKit

// ********* Writing functions

func imprimirAyuda() {
    let message = """
Welcome to my App!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""
    print(message)
}

imprimirAyuda()


/*
 ********** more  information function ********
 Functions are designed to let us re-use code easily, which means we don’t have to copy and paste code to get common behaviors. You could use them very rarely if you wanted, but honestly there’s no point – they are wonderful tools for helping us write clearer, more flexible code.

 There are three times you’ll want to create your own functions:
 
    1. The most common time is when you want the same functionality in many places. Using a function here means you can change one piece of code and have everywhere that uses your function get updated.
    2. Functions are also useful for breaking up code. If you have one long function it can be hard to follow everything that’s going on, but if you break it up into three or four smaller functions then it becomes easier to follow.
    3. The last reason is more advanced: Swift lets us build new functions out of existing functions, which is a technique called function composition. By splitting your work into multiple small functions, function composition lets us build big functions by combining those small functions in various ways, a bit like Lego bricks.
 */


// *********** Accepting parameters ***********

/*
 Functions become more powerful when they can be customized each time you run them. Swift lets you send values to a function that can then be used inside the function to change the way it behaves. We’ve used this already – we’ve been sending strings and integers to the print() function, like this:
*/
print("Hello, world!")

/*
 Values sent into functions this way are called parameters.

 To make your own functions accept parameters, give each parameter a name, then a colon, then tell Swift the type of data it must be. All this goes inside the parentheses after your function name.

 For example, we can write a function to print the square of any number:
*/
func square(number: Int) {
    print(number * number)
}

/*
 That tells Swift we expect to receive an Int, and it should be called number. This name is used both inside the function when you want to refer to the parameter, but also when you run the function, like this:
 */
square(number: 8)


// **************** Returning values

/*
 As well as receiving data, functions can also send back data. To do this, write a dash then a right angle bracket after your function’s parameter list, then tell Swift what kind of data will be returned.

 Inside your function, you use the return keyword to send a value back if you have one. Your function then immediately exits, sending back that value – no other code from that function will be run.

 We could rewrite our square() function to return a value rather than print it directly:
 */

func calculateSquare(number: Int) -> Int {
    return number * number
}

// Now we can grab that return value when the function is run, and print it there:

let resultSquare = calculateSquare(number: 8)
print("result \(resultSquare)")

// If you need to return multiple values, this is a perfect example of when to use tuples.

// return value

// one way
/*func greet(name: String) -> String {
    if name == "Taylor Swift" {
        return "Oh wow!"
    } else {
        return "Hello, \(name)"
    }
}*/

// second way
func greet(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}


// How can you return two or more values from a function?
/*
 Swift’s functions have a single return type, such as Int or String, but that doesn’t mean we can only return a single value. In fact, there are two ways we can send back multiple pieces of data:

 - Using a tuple, such as (name: String, age: Int)
 - Using some sort of collection, such as an array or a dictionary.
 
 If you had a hard time understanding why tuples were important, this is a really good example of a place where they really stand out.

 If we wanted to make a function that returns a person’s first name and last name, we could do it like this:
*/

func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print(user[0])

/*
 That sends back an array containing two strings and stores it in user, which does the job. However, the code is problematic for two reasons:

 1. Some cultures write their last names first (“Swift Taylor”), so it’s possible other developers might expect index 0 to be the last name and index 1 to be the first name.
 2. What if we inserted a middle name? It would push “Swift” back from index 1 to index 2, causing problems.
 A second pass at the function might look like this:
*/

func getUserDictionary() -> [String: String] {
    ["first": "Taylor", "last": "swift"]
}

let userDict = getUserDictionary()
print(userDict["first"])

/*
 That’s definitely better, because now we can be sure exactly where to find each value: user["first"] will always be “Taylor” no matter whether we change the dictionary order or if we insert a middle name.

 However, this solution still isn’t ideal:

 1. We’re need to look for values using strings, which means user["First"] will fail because we wrote “First” rather than “first”.
 2. Our dictionary might contain neither value – maybe our user was Prince, Plato, Beyonce, or someone else who goes by only one name.
 3. Every time we read a value from the dictionary we need to unwrap the optional, because Swift can’t be sure the value is definitely there.
 
 Tuples can solve the problem by letting us be specific about what data will come back: its name, its type, its order, and whether it’s optional or not. This means we can write functions to return multiple values much more safely:
*/

func getUserTuple() -> (first: String, last: String) {
    (first: "Taylor", last: "Swift")
}

let userTuple = getUserTuple()
print(userTuple.first)

/*
 Now we’ve written code that is immune to all our problems:

 1. Our data must be returned first name first and last name second.
 2. If we insert a middle name it will not affect the position of other values.
 3. We can’t make case-sensitive mistakes while reading values.
 4. There's no way we won’t get back a first name or last name – if someone only uses one name then we’ll get back an empty string.
 5. There is no optionality.
 
 So, tuples make fantastic candidates for returning multiple values from functions.
*/

func allTestsPassed(tests: [Bool]) -> Bool {
    for test in tests {
        if test == false {
            return false
        }
    }
    return true
}

func isEveryoneAdult(ages: [Int]) -> Bool {
    for age in ages {
        if age < 18 {
            return false
        }
    }
    return true
}
isEveryoneAdult(ages: [10, 20, 16, 24])


// *************** Parameter labels

/*
 Swift lets us provide two names for each parameter: one to be used externally when calling the function, and one to be used internally inside the function. This is as simple as writing two names, separated by a space.

 To demonstrate this, here’s a function that uses two names for its string parameter:
*/

func sayHello(to name: String){
    print("Hello, \(name)!")
}

/*
 The parameter is called to name, which means externally it’s called to, but internally it’s called name. This gives variables a sensible name inside the function, but means calling the function reads naturally:
*/

sayHello(to: "Felipe")

// more information
/*
 Many programming languages either do not use parameter labels or make them optional. Swift is unusual in that it uses them extensively, and it even lets us differentiate between external parameter names and internal parameter names – it’s doubly unusual!

 To look at why labels are useful, consider code like this:
*/

// setReactorStatus(true, true, false)

/*
 That’s perfectly normal code in many languages, but you will rarely if ever see that in Swift because we prefer to give our parameters names. So, we’d write our function like this:
 */

func setReactorStatus(primaryActive: Bool, backupActive: Bool, isEmergency: Bool){
    // code here
}

// As a result, Swift will require those Booleans to be used when calling the function, like this:

setReactorStatus(primaryActive: true, backupActive: true, isEmergency: false)

/*
 And now our code becomes much clearer – we know exactly what each value does when we call the function, rather than having to remember whether isEmergency comes first or last.

 Of course, Swift takes this even further by letting us write our labels twice, like this:
*/

func setAge(for person: String, to value: Int){
    print("\(person) is now \(value)")
}

/*
 This solves two problems at once: it makes those labels more meaningful inside the function, and also makes those labels more meaningful outside the function.

 To demonstrate this, here’s how the function is called right now:
*/

setAge(for: "Felipe", to: 28)



// ******************** Omitting parameter labels

/*
 You might have noticed that we don’t actually send any parameter names when we call print() – we say print("Hello") rather than print(message: "Hello").

 You can get this same behavior in your own functions by using an underscore, _, for your external parameter name, like this:
*/

func greet(_ person: String) {
    print("Hello, \(person)!")
}

// You can now call greet() without having to use the person parameter name:

greet("Felipe")

// When should you omit a parameter label?



// **** Default parameters

/*
 The print() function prints something to the screen, but always adds a new line to the end of whatever you printed, so that multiple calls to print() don’t all appear on the same line.

 You can change that behavior if you want, so you could use spaces rather than line breaks. Most of the time, though, folks want new lines, so print() has a terminator parameter that uses new line as its default value.

 You can give your own parameters a default value just by writing an = after its type followed by the default you want to give it. So, we could write a greet() function that can optionally print nice greetings:

*/

func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    }else{
        print("Oh no, it's \(person) again...")
    }
}

// That can be called in two ways:

greet("Felipe")
greet("Felipe", nicely: false)

// When to use default parameters for functions

/*
 Default parameters let us make functions easier to call by letting us provide common defaults for parameters. So, when we want to call that function using those default values we can just ignore the parameters entirely – as if they didn’t exist – and our function will just do the right thing. Of course, when we want something custom it’s there for us to change.

 Swift developers use default parameters very commonly, because they let us focus on the important parts that do need to change regularly. This can really help simplify complex function, and make your code easier to write.

 For example, imagine some route finding code such as this:


*/

func findDirections(from: String, to: String, route: String = "fastest", avoidHighways: Bool = false) {
    // code here
}

/*
 That assumes that most of the time folks want to drive between two locations by the fastest route, without avoiding highways – sensible defaults that are likely to work most of the time, while giving us the scope to provide custom values when needed.

 As a result, we can call that same function in any of three ways:
*/

findDirections(from: "London", to: "Glasgow")
findDirections(from: "London", to: "Glasgow", route: "scenic")
findDirections(from: "London", to: "Glasgow", route: "scenic", avoidHighways: true)



// ****** Variadic functions

/*
 Some functions are variadic, which is a fancy way of saying they accept any number of parameters of the same type. The print() function is actually variadic: if you pass lots of parameters, they are all printed on one line with spaces between them:
*/

print("Haters", "gonna", "hate")

/*
 You can make any parameter variadic by writing ... after its type. So, an Int parameter is a single integer, whereas Int... is zero or more integers – potentially hundreds.

 Inside the function, Swift converts the values that were passed in to an array of integers, so you can loop over them as needed.

 To try this out, let’s write a square() function that can square many numbers:
*/

func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

// Now we can run that with lots of numbers just by passing them in separated by commas:
square(numbers: 1, 2, 3, 4, 5, 6)


// When to use variadic functions

/*
 Swift’s variadic functions let us accept any number of parameters of the same type, separated by a comma. Inside the function they are handed to us as an array, which we can index into, loop over, and so on.

 The power of variadic parameters is that we can treat them as if they weren’t variadic most of the time. For example, if you had an open() function that opened a file for editing in Preview, TextEdit, or whatever was the correct program, you might call it like this:
*/

// open("photo.jpg")

// But that same function could take a variadic parameter – lots of filenames to open, so several could be opened at once:

// open("photo.jpg", "recipes.txt", "myCode.swift")

/*
 So, by making that parameter variadic, we can open up a whole range of additional functionality without having to change the way the function is called – it’s really useful!

 As for when you should use them, chances are you won’t use them that much while you’re learning because you’re going to be focused on very specific problems that are usually fairly small. But as your skills increase, you’ll find that you can change your existing functions to make them variadic without breaking any of your code – you can add functionality without changing what you already have.

*/


// *********************** Writing throwing functions

/*
 Sometimes functions fail because they have bad input, or because something went wrong internally. Swift lets us throw errors from functions by marking them as throws before their return type, then using the throw keyword when something goes wrong.

 First we need to define an enum that describes the errors we can throw. These must always be based on Swift’s existing Error type. We’re going to write a function that checks whether a password is good, so we’ll throw an error if the user tries an obvious password:
*/

enum PasswordError: Error {
    case obvious
}

/*
 Now we’ll write a checkPassword() function that will throw that error if something goes wrong. This means using the throws keyword before the function’s return value, then using throw PasswordError.obvious if their password is “password”.

 Here’s that in Swift:
*/

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}


// ***************** Running throwing functions

/*
 Swift doesn’t like errors to happen when your program runs, which means it won’t let you run an error-throwing function by accident.

 Instead, you need to call these functions using three new keywords: do starts a section of code that might cause problems, try is used before every function that might throw an error, and catch lets you handle errors gracefully.

 If any errors are thrown inside the do block, execution immediately jumps to the catch block. Let’s try calling checkPassword() with a parameter that throws an error:
*/

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

// When that code runs, “You can’t use that password” is printed, but “That password is good” won’t be – that code will never be reached, because the error is thrown.

// Why does Swift make us use try before every throwing function?

/*
 Using Swift’s throwing functions relies on three unique keywords: do, try, and catch. We need all three to be able to call a throwing function, which is unusual – most other languages use only two, because they don’t need to write try before every throwing function.

 The reason Swift is different is fairly simple: by forcing us to use try before every throwing function, we’re explicitly acknowledging which parts of our code can cause errors. This is particularly useful if you have several throwing functions in a single do block, like this:
*/

/*
do {
    try throwingFunction1()
    nonThrowingFunction1()
    try throwingFunction2()
    nonThrowingFunction2()
    try throwingFunction3()
} catch {
    // handle errors
}
*/


// ********************* inout parameters

/*
 All parameters passed into a Swift function are constants, so you can’t change them. If you want, you can pass in one or more parameters as inout, which means they can be changed inside your function, and those changes reflect in the original value outside the function.

 For example, if you want to double a number in place – i.e., change the value directly rather than returning a new one – you might write a function like this:
*/

func doubleInPlace(number: inout Int) {
    number *= 2
}

/*
 To use that, you first need to make a variable integer – you can’t use constant integers with inout, because they might be changed. You also need to pass the parameter to doubleInPlace using an ampersand, &, before its name, which is an explicit recognition that you’re aware it is being used as inout.

 In code, you’d write this:
*/

var myNum = 10
doubleInPlace(number: &myNum)

// When should you use inout parameters?

/*
 Swift’s inout parameters are very commonly used, but less commonly created. That is, they are the kind of thing you’ll rely on a lot, perhaps without even realizing, but it’s not common you’ll want to create functions with them – at least not while you’re learning.

 How common are they? Well, all of Swift’s operators are actually implemented as functions behind the scenes – things like +, -, and so on. Yes, they really are just functions behind the scenes. You can imagine them a bit like this:
*/


/*func +(leftNumber: Int, rightNumber: Int) -> Int {
    // code here
}
*/

/*
 So, when writing 5 + 3 we’re actually calling a function called + takes an integer on the left (5) and an integer on the right (3), and returns a new integer containing the result.

 Now think about the += operator, which both adds and assigns at the same time. That doesn’t have a return value, but actually modifies the original value directly. As a result, it looks a bit more like this
*/

func +=(leftNumber: inout Int, rightNumber: Int) {
    // code here
}


// ********************* Functions summary

//You’ve made it to the end of the fifth part of this series, so let’s summarize:

// 1. Functions let us re-use code without repeating ourselves.
func exampleFunction() {
    let message = "Welcome app"
    print(message)
}

// 2. Functions can accept parameters – just tell Swift the type of each parameter.
func squareSummary(number: Int) {
    print(number * number)
}

// 3. Functions can return values, and again you just specify what type will be sent back. Use tuples if you want to return several things.
func squareSummary(number: Int) -> Int{
    return number * number
}


// 4. You can use different names for parameters externally and internally, or omit the external name entirely.
func sayHelloSummary(to name: String) {
    print("Hello, \(name)!")
}


// 5. Parameters can have default values, which helps you write less code when specific values are common.
func greetSummary(_ person: String = "Taylor") {
    print(person)
}


// 6. Variadic functions accept zero or more of a specific parameter, and Swift converts the input to an array.
func squareVariadicSummary(numbers: Int...) {
    for number in numbers {
        let product = number * number
        print("\(number) squared is \(product)")
    }
}

// 7. Functions can throw errors, but you must call them using try and handle errors using catch.
do {
    try checkPassword("password")
    print("That password is good")
} catch {
    print("You can't acces")
}

// 8. You can use inout to change variables inside a function, but it’s usually better to return a new value.
func doubleInPlaceSummary(number: inout Int) {
    number *= 2
}

