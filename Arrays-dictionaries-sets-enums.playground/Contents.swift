import UIKit

/*
 Arrays are collections of values that are stored as a single value. For example, John, Paul, George, and Ringo are names, but arrays let you group them in a single value called The Beatles.
 */
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]

print("position 1 of array \(beatles[1])")

// beatles[9] --> error because the array only have 4 datas, but start from zero

/*
 Note: If you’re using type annotations, arrays are written in brackets: [String], [Int], [Double], and [Bool].
*/


// *********** SETS **************
/*
Sets are collections of values just like arrays, except they have two differences:
 1. Items aren’t stored in any order; they are stored in what is effectively a random order.
 2. No item can appear twice in a set; all items must be unique.
*/

// example

let colors = Set(["red", "green", "blue"])

// If you try to insert a duplicate item into a set, the duplicates get ignored. For example:

let colors2 = Set(["red", "green", "blue", "red", "blue"])
print(colors2)
// The final colors2 set will still only include red, green, and blue once.


// example with name

let names = Set(["Felipe", "Jorge", "Manuel", "Felipe"])
print(names)// no repeat Felipe

let arrayOfBlogCategories: [String] = ["Swift", "Debugging", "Xcode", "Workflow", "Optimization"]
var setOfBlogCategories: Set<String> = ["Swift", "Debugging", "Xcode", "Workflow", "Optimization"]

let (inserted, memberAfterInsert) = setOfBlogCategories.insert("Swift")

if !inserted {
    print("\(memberAfterInsert) already exists")
}

// Set(1, 1, 2, 2) -> Error


// ******* TUPLES ******** //
/*
 Tuples allow you to store several values together in a single value. That might sound like arrays, but tuples are different:

 1.- You can’t add or remove items from a tuple; they are fixed in size.
 2.- You can’t change the type of items in a tuple; they always have the same types they were created with.
 3.- You can access items in a tuple using numerical positions or by naming them, but Swift won’t let you read numbers or names that don’t exist.
 Tuples are created by placing multiple items into parentheses, like this:
 
*/


var name = (first: "Taylor", last: "Swift")
name.0
name.first
print("my name is \(name.first) \(name.last)")

var information = (firstName: "Felipe", lastName: "Carrasco", age: 28)
print("Hi! my name is \(information.firstName) \(information.lastName) and I'm \(information.age) years old")


// For example, if we wanted a variable tuple to store a website, we might write this:

var website = (name: "Apple", url: "www.apple.com")

var person = (name: "Paul", age: 40, isMarried: true)

// Arrays vs sets vs tuples

/*
 Arrays, sets, and tuples can seem similar at first, but they have distinct uses. To help you know which to use, here are some rules.
*/

// If you need a specific, fixed collection of related values where each item has a precise position or name, you should use a tuple:

let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")


//If you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly, you should use a set:

let jobs = Set(["aardvark", "astronaut", "azalea"])

// If you need a collection of values that can contain duplicates, or the order of your items matters, you should use an array:

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]


// ****** Dictionaries ******

/*
 Dictionaries are collections of values just like arrays, but rather than storing things with an integer position you can access them using anything you want.

 The most common way of storing dictionary data is using strings. For example, we could create a dictionary that stores the height of singers using their name:
*/

let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
var value = "Taylor Swift"
print("the height of \(value) is \(heights[value] ?? 0)")

// Note: When using type annotations, dictionaries are written in brackets with a colon between your identifier and value types.
//For example, [String: Double] and [String: String].



// ******* Dictionary default values ******
/*
 If you try to read a value from a dictionary using a key that doesn’t exist, Swift will send you back nil – nothing at all. While this might be what you want, there’s an alternative: we can provide the dictionary with a default value to use if we request a missing key.
 */

// To demonstrate this, let’s create a dictionary of favorite ice creams for two people:

let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

// we can read Paul's favorite ice cream like this:
favoriteIceCream["Paul"]

// but if you tried reading the favorite ice cream for Charlotte, we'd get back nil, meaning that swift doesn't have value for that key:

favoriteIceCream["Charlotte"] // return nil

// we can fix this giving the dictionary a default value "Unknow", so that when no ice cream is found for Charlotte we get back "Unknow" rather than nil:

favoriteIceCream["Charlotte", default: "Unknown"]

// examples

/*
 Whenever you read a value from a dictionary, you might get a value back or you might get back nil – there might be no value for that key. Having no value can cause problems in your code, not least because you need to add extra functionality to handle missing values safely, and that’s where dictionary default values come in: they let you provide a backup value to use for when the key you ask for doesn’t exist.

 For example, here’s a dictionary that stores the exam results for a student:
*/

let results = [
    "english": 100,
    "french": 85,
    "geography": 75
]

/*
 As you can see, they sat three exams and scored 100%, 85%, and 75% for English, French, and Geography. If we wanted to read their history score, how we do it depends on what we want:

 1.- If a missing value means the student failed to take the test, then we could use a default value of 0 so that we always get an integer back.
 2.- If a missing value means the student has yet to take the exam, then we should skip the default value and instead look for a nil value.
 So, it’s not like you always need a default value when working with dictionaries, but when you do it’s easy:
*/

let historyResult = results["history", default: 0]


// ************ Creating empty collections *******
/*
 Arrays, sets, and dictionaries are called collections, because they collect values together in one place.

 If you want to create an empty collection just write its type followed by opening and closing parentheses. For example, we can create an empty dictionary with strings for keys and values like this:
 */
var teams = [String: String]()

// we can then add entries later on, like this:
teams["Paul"] = "Red"

// Similarly, you can create an empty array to store integers like this:
var resultsTwo = [Int]()

// The exception is creating an empty set, which is done differently:
var words = Set<String>()
var numbers = Set<Int>()

// This is because Swift has special syntax only for dictionaries and arrays; other types must use angle bracket syntax like sets.
// If you wanted, you could create arrays and dictionaries with similar syntax:

var scores = Dictionary<String, Int>()
var resultThree = Array<Int>()

// ********** Enumerations *********

let result1 = "failure"
let result2 = "failed"
let result3 = "fail"

// All those three are different strings, so they mean different things.
//With enums we can define a Result type that can be either success or failure, like this:
enum Result {
    case sucess
    case failure
}

let result4 = Result.failure

// This stops you from accidentally using different strings each time.

// example

enum Direction {
    case north
    case south
    case east
    case west
}

Direction.north

// ************* Enum associated values


// That lets us say that someone is talking, but we don’t know what they are talking about, or we can know that someone is running, but we don’t know where they are running to.
//Enum associated values let us add those additional details:

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "Football")


// example:

enum Weather {
    case sunny
    case windy(speed: Int)
    case rainy(chance: Int, amount: Int)
}


// ************** Enum raw values

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

// Swift will automatically assign each of those a number starting from 0, and you can use that number to create an instance of the appropriate enum case. For example, earth will be given the number 2, so you can write this:

let earth = Planet(rawValue: 2)
print(earth as Any)

let mercury = Planet(rawValue: 1)


// Example:

enum Mood: Int {
    case happy
    case sad
    case grumpy
    case sleepy
    case hungry
}

print(Mood.happy)
print(Mood.sad)

/*
 You’ve made it to the end of the second part of this series, so let’s summarize:

 1.- Arrays, sets, tuples, and dictionaries let you store a group of items under a single value. They each do this in different ways, so which you use depends on the behavior you want.
 2.- Arrays store items in the order you add them, and you access them using numerical positions.
 3.- Sets store items without any order, so you can’t access them using numerical positions.
 4.- Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical positions or using your names.
 5.- Dictionaries store items according to a key, and you can read items using those keys.
 6.- Enums are a way of grouping related values so you can use them without spelling mistakes.
 7.- You can attach raw values to enums so they can be created from integers or strings, or you can add associated values to store additional information about each case.
*/
