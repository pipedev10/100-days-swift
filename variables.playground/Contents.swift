import UIKit

var greeting = "Hello, playground"

greeting = "good bye"
print(greeting)

var favoriteShow = "Orange is the new black"
favoriteShow = "The good place"
favoriteShow = "Doctor Who"

// String - Integer
var population = 8_000_000
var meaningOfLife = 42
// meaningOfLife = "Forty two" -- it's an error assign String in a variable Integer.


// multilines

var textLong = """
    this goes
    over multiple
    lines
"""
print(textLong)

var textLong2 = """
   this goes \
over multple \
lines
"""
print(textLong2)

// normal var
var quote = "Change the world by being yourself"

// variable multiline
var burns = """
The best laid schemes
O’ mice and men
Gang aft agley
"""

/*
 error
 var burns = """
 The best laid schemes
 O’ mice and men
 Gang aft agley"""
*/


// Doubles and booleans

var pi = 3.141
var awesome = true

// String interpolation

var score = 85
var scoreMessage = "your score was \(score)"
var results = "The test results are here: \(scoreMessage)"

// example:
var city = "Cardiff"
var message = "Welcome to \(city)"
print(message)

// Constants

let taylor = "swift"
// taylor = "change" -> not possible, you can't change the value to one constant


// Type annotations

let text = "SOme text"
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true

// Example:
var percentage: Double = 99
// That makes percentage a double with the value of 99.0.

var name: String

name = "Felipe Carrasco"

// Simple types: Summary

// 1. You make variables using var and constants using let. It’s preferable to use constants as often as possible.
    // variable
    var hello: String
    // constant
    let result: Int

/*
 2. Strings start and end with double quotes,
 but if you want them to run across multiple lines you should use three sets of double quotes.
 */
let messageComplete = """
    Hello world \
    this is a message \
thanks
"""

/*
 3 Integers hold whole numbers, doubles hold fractional numbers, and booleans hold true or false.
*/
let age: Int = 25
let percentageUse: Double = 55.5
let isUsed: Bool = true

/*
 4 String interpolation allows you to create strings from other variables and constants, placing their values inside your string.
 */

let messageInformation = "hello my age is \(age) I have this percentage of battery \(percentageUse) my cellphone is being used: \(isUsed)"
print(messageInformation)
