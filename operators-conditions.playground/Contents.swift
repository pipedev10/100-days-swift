import UIKit

// ************** OPERATORS condition *************

// ****** Arithmetic operators

let firstScore = 12
let secondScore = 4

// Sum
let total = firstScore + secondScore
print(total)

// Substract
let difference = firstScore - secondScore
print(difference)

// Multiply
let product = firstScore * secondScore
print(product)

// divide
let divided = firstScore / secondScore
print(divided)

/**
 Swift has a special operator for calculating remainders after division: %. It calculates how many times one number can fit inside another, then sends back the value that’s left over.

 For example, we set secondScore to 4, so if we say 13 % secondScore we’ll get back one, because 4 fits into 13 three times with remainder one:
 */
let remainder = 13 % secondScore
print(remainder)


// more examples
let value: Double = 90000000000000001

let value2: Int = 90000000000000001

// Why does Swift have a dedicated division remainder operator?

/*
 Swift has an operator allows us to calculate the remainder after a division. This is sometimes called modulo, but if you wanted to be really specific it isn’t quite the same thing.

 First, let’s look at why it’s useful. If I said to you that there were 465 days until a special event, how would you show that value to a user in a more useful way?

 You might start with code like this:
*/

let weeks = 465 / 7
print("there are \(weeks) weeks until the event")

/*
 That will print that there are 66 weeks until the event, but that isn’t true. When faced with two integers like this, Swift will divide the two and round towards zero to make a whole number. 465 divided by 7 doesn’t equal exactly 66, so folks might miss your event entirely!

 Your second attempt might tell Swift to use a Double rather than an Int, so we get a more accurate answer:
*/

let weeks2: Double = 465 / 7
print("There are \(weeks2) weeks until the event.")

/*
 But now we get something that’s Technically Correct™ but not actually that useful: there are 66.42857142857143 weeks until the event.

 This is where the remainder operator comes in:
*/

let weeks3 = 465 / 7
let days = 465 % 7
print("There are \(weeks3) weeks and \(days) days until the event.")

let number = 465
let isMultiple = number.isMultiple(of: 7)
print(isMultiple)

// ******** Operator overloading


/*
 Swift supports operator overloading, which is a fancy way of saying that what an operator does depends on the values you use it with.
 For example, + sums integers like this:
*/
let meaningOfLife = 42
let doubleMeaning = 42 + 42

// But + also joins strings, like this:

let fakers = "Fakers gonna "
let action = fakers + "fake"

// You can even use + to join arrays, like this:

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf
//  ["John", "Paul", "George", "Ringo"]

/*
 Remember, Swift is a type-safe language, which means it won’t let you mix types. For example, you can’t add an integer to a string because it doesn’t make any sense.
*/
 


// ************** Compound assignment operators

/*
 Swift has shorthand operators that combine one operator with an assignment, so you can change a variable in place. These look like the existing operators you know – +, -, *, and /, but they have an = on the end because they assign the result back to whatever variable you were using.

 For example, if someone scored 95 in an exam but needs to be penalized 5 points, you could write this:
*/

var score = 95
score -= 5
print(score) // 90

// Similarly, you can add one string to another using +=:
var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"
print(quote)

// more example:
/*
 If you want to add 5 to a score variable, you’re perfectly able to write score = score + 5 if you want. Swift also allows us to write score += 5 to get the same result, but why?

 Well, it isn’t for performance reasons – under the hood, Swift turns score += 5 into score = score + 5 just as if we had written it.

 Instead, they are just available as a shorthand: a simpler way to write the same thing. This means less typing for us, less code to read, and also less chance of making mistakes – a win all around!
*/

score += 10
print(score) // 100


// ************** Comparison operators

/*
 Swift has several operators that perform comparison, and these work more or less like you would expect in mathematics.
*/

// Let’s start with a couple of example variables so we have something to work with:
let firstScore2 = 6
let secondScore2 = 4

// There are two operators that check for equality: == checks two values are the same, and != (pronounced “not equals”) checks two values are not the same:
firstScore2 == secondScore2 // equals
firstScore2 != secondScore2 // not equals

// There are four operators for comparing whether one value is greater than, less than, or equal to another. These are just like in mathematics:

firstScore2 < secondScore2
firstScore2 >= secondScore2

// Each of these also work with strings, because strings have a natural alphabetical order:
"Taylor" <= "Swift"

// Swift lets us compare many kinds of values out of the box, which means we can check a variety of values for equality and comparison. For example, if we had values such as these:
let firstName = "Paul"
let secondName = "Sophie"

let firstAge = 40
let secondAge = 10

// Then we could compare them in various ways:
print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

print(firstAge == secondAge)
print(firstAge != secondAge)
print(firstAge < secondAge)
print(firstAge >= secondAge)


/*
 Behind the scenes, Swift implements this in a remarkably clever way that actually allows it to compare a wide variety of things. For example, Swift has a special type for storing dates called Date, and you can compare dates using the same operators: someDate < someOtherDate, for example.

 From Swift 5.3 and later, we can even ask Swift to make our enums comparable, like this:
 */

enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)
// That will print “true”, because Swift small comes before large in the enum case list.


// **************** Conditions

/*
 Now you know some operators you can write conditions using if statements. You give Swift a condition, and if that condition is true it will run code of your choosing.

 To try this out, I want to use a Swift function called print(): you run it with some text, and it will be printed out.

 We can use conditions to check for a winning Blackjack hand:
*/

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
}

// The code inside the braces – { and } – will be run if the condition is true. If you want you can provide alternative code to run if the condition is false, using else:

if firstCard + secondCard == 21 {
    print("Blackjack")
}else{
    print("Regular card")
}

// You can also chain conditions together using else if:

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

// ******* Combining conditions


/*Swift has two special operators that let us combine conditions together: they are && (pronounced “and”) and || (pronounced “or”).
 
 For example, we could check that the age of two people are both over a certain value like this:
*/

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("both are over 18")
}

/*
 That print() call will only happen if both ages are over 18, which they aren’t. In fact, Swift won’t even bother checking the value of age2 because it can see that age1 already failed the test.

 The alternative to && is ||, which evaluates as true if either item passes the test. For example we could print a message if either age is over 18:
*/

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}

// You can use && and || more than once in a single condition, but don’t make things too complicated otherwise it can be hard to read!


// more examples:
let isOwner = true
let isAdmin = true
let isEditingEnabled = false
if isOwner == true || isAdmin == true {
    print("You can delete this post")
}

/*
 Where things get more confusing is when we want to check several things. For example, we could say that regular users can delete messages only we allowed them, but admins can always delete posts. We might write code like this:
 */


if isOwner == true && isEditingEnabled || isAdmin == true {
    print("You can delete this post")
}

// But what is that trying to check? What order are the && and || checks executed? It could mean this:

if (isOwner == true && isEditingEnabled) || isAdmin == true {
    print("You can delete this post")
}

// *********** The ternary operator

/*
 Swift has a rarely used operator called the ternary operator. It works with three values at once, which is where its name comes from: it checks a condition specified in the first value, and if it’s true returns the second value, but if it’s false returns the third value.

 The ternary operator is a condition plus true or false blocks all in one, split up by a question mark and a colon, all of which which makes it rather hard to read. Here’s an example:
 */

let firstCard1 = 11
let secondCard1 = 10
print(firstCard1 == secondCard1 ? "Cards are the same" : "Cards are different")

/*
 That checks whether the two cards are the same, then prints “Cards are the same” if the condition is true, or “Cards are different” if it’s false. We could write the same code using a regular condition:
 */

if firstCard1 == secondCard1 {
    print("Cards are the same")
} else {
    print("Cards are different")
}

// The ternary operator lets us choose from one of two results based on a condition, and does so in a really concise way:

let isAuthenticated = true
print(isAuthenticated ? "Welcome!" : "Who are you?")

/*
 Some people rely very heavily on the ternary operator because it makes for very short code, whereas some stay away from it as much as possible because it can make code harder to read.

 I’m very much in the “avoid where possible” camp because even though this code is longer I do find it easier to follow:
 */

if isAuthenticated {
    print("Welcome")
} else {
    print("Who are you?")
}

/*
 Now, there is one time when the ternary operator gets a lot of use and that’s with SwiftUI. I don’t want to give code examples here because it can be a bit overwhelming, but you can really go to town with the ternary operator there if you want to. Even then, I prefer to remove them when possible, to make my code easier to read, but you should try it for yourself and come to your own conclusions.
 */


// **************** Switch statements

/*
 If you have several conditions using if and else if, it’s often clearer to use a different construct known as switch case. Using this approach you write your condition once, then list all possible outcomes and what should happen for each of them.

 To try this out, here’s a weather constant containing the string sunny:
*/

let weather = "sunny"

switch weather {
    case "rain":
        print("Bring an umbrella")
    case "snow":
        print("Wrap up warm")
    case "sunny":
        print("Wear sunscreen")
    default:
        print("Enjoy your day!")
}

/*
 In that example, the last case – default – is required because Swift makes sure you cover all possible cases so that no eventuality is missed off. If the weather is anything other than rain, snow, or sun, the default case will be run.

 Swift will only run the code inside each case. If you want execution to continue on to the next case, use the fallthrough keyword like this:
 */

switch weather {
    case "rain":
        print("Bring an umbrella")
    case "sunny":
        print("Wear sunscreen")
        fallthrough
    case "snow":
        print("Wrap up warm")
    
    default:
        print("Enjoy your day!")
}


// ************** Range operators

/*
 Swift gives us two ways of making ranges: the ..< and ... operators. The half-open range operator, ..<, creates ranges up to but excluding the final value, and the closed range operator, ..., creates ranges up to and including the final value.

 For example, the range 1..<5 contains the numbers 1, 2, 3, and 4, whereas the range 1...5 contains the numbers 1, 2, 3, 4, and 5.

 Ranges are helpful with switch blocks, because you can use them for each of your cases. For example, if someone sat an exam we could print different messages depending on their score:
*/

let scoreValue = 85

switch scoreValue {
    case 0..<50:
        print("You failed badly.")
    case 50..<85:
        print("You did OK.")
    default:
        print("You did great!")
}

// As before, the default case must be there to ensure all possible values are covered.

// more examples.
let names = ["Piper", "Alex", "Suzanne", "Gloria"]

// We could read out an individual name like this:
print(names[0])


// With ranges, we can also print a range of values like this:
print(names[1...3])

// That carries a small risk, though: if our array didn’t contain at least four items then 1...3 would fail. Fortunately, we can use a one-sided range to say “give me 1 to the end of the array”, like this:

print(names[1...])


// Operators and conditions summary

/*
 You’ve made it to the end of the third part of this series, so let’s summarize:

 1.- Swift has operators for doing arithmetic and for comparison; they mostly work like you already know.
 2.-There are compound variants of arithmetic operators that modify their variables in place: +=, -=, and so on.
 3.- You can use if, else, and else if to run code based on the result of a condition.
 4.- Swift has a ternary operator that combines a check with true and false code blocks. Although you might see it in other code, I wouldn’t recommend using it yourself.
 5.- If you have multiple conditions using the same value, it’s often clearer to use switch instead.
 6.- You can make ranges using ..< and ... depending on whether the last number should be excluded or included.

 */
