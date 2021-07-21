import UIKit

// ****************** Initializers

/*
 Initializers are special methods that provide different ways to create your struct. All structs come with one by default, called their memberwise initializer – this asks you to provide a value for each property when you create the struct.

 You can see this if we create a User struct that has one property:
*/

//struct User {
//    var username: String
//}

// When we create one of those structs, we must provide a username:

//var user = User(username: "pipe.dev.10")

//We can provide our own initializer to replace the default one. For example, we might want to create all new users as “Anonymous” and print a message, like this:

struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

/*
 You don’t write func before initializers, but you do need to make sure all properties have a value before the initializer ends.

 Now our initializer accepts no parameters, we need to create the struct like this:
*/

// var user = User(username: "felipe") -> Argument passed to call that takes no arguments

var user = User() // -> don't pass parameters, because init no receive parameters.
print(user.username)
user.username = "Felipe"
print(user.username)

// How do Swift’s memberwise initializers work?

/*
 By default, all Swift structs get a synthesized memberwise initializer by default, which means that we automatically get an initializer that accepts values for each of the struct’s properties. This initializer makes structs easy to work with, but Swift does two further things that make it especially clever.

 First, if any of your properties have default values, then they’ll be incorporated into the initializer as default parameter values. So, if I make a struct like this:
*/

struct Users {
    var name: String
    var yearsActive = 0
}
// Then I can create it in either of these two ways:

struct Employee {
    var name: String
    var yearsActive = 0
}

let felipe = Employee(name: "Felipe Carrasco")
let isabel = Employee(name: "Isabel Galindo", yearsActive: 15)

/*
 This makes them even easier to create, because you can fill in only the parts you need to.

 The second clever thing Swift does is remove the memberwise initializer if you create an initializer of your own.

 For example, if I had a custom initializer that created anonymous employees, it would look like this:
*/

struct EmployeeWithInit {
    var name: String
    var yearsActive = 0
    
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee..")
    }
}

// With that in place, I could no longer rely on the memberwise initializer, so this would no longer be allowed:
// let roslin = EmployeeWithInit(name: "Laura Roslin") -> with error

/*
 This isn’t an accident, but it’s a deliberate feature: we created our own initializer, and if Swift left its memberwise initializer in place then it might be missing important work we put into our own initializer.

 So, as soon as you add a custom initializer for your struct, the default memberwise initializer goes away. If you want it to stay, move your custom initializer to an extension, like this:
*/

/*
 struct Employee {
     var name: String
     var yearsActive = 0
 }
*/

extension Employee {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin = Employee(name: "Laura Roslin")
print("roslin: \(roslin.name)")

// as does creating an anonymous employee
let anon = Employee()
print("anon: \(anon.name)")


struct Cabinet {
    var height: Double
    var width: Double
    var area: Double
    init (itemHeight: Double, itemWidth: Double) {
        height = itemHeight
        width = itemWidth
        area = height * width
    }
}
let drawers = Cabinet(itemHeight: 1.4, itemWidth: 1.0)

// **************** Referring to the current instance
/*
 Inside methods you get a special constant called self, which points to whatever instance of the struct is currently being used. This self value is particularly useful when you create initializers that have the same parameter names as your property.

 For example, if you create a Person struct with a name property, then tried to write an initializer that accepted a name parameter, self helps you distinguish between the property and the parameter – self.name refers to the property, whereas name refers to the parameter.

 Here’s that in code:
*/

struct Person {
    var name: String
    
    init(name: String){
        print("\(name) was born!")
        self.name = name
    }
}

// When would you use self in a method?
/*
 Inside a method, Swift lets us refer to the current instance of a struct using self, but broadly speaking you don’t want to unless you specifically need to distinguish what you mean.

 By far the most common reason for using self is inside an initializer, where your likely to want parameter names that match the property names of your type, like this:
*/

struct Student {
    var name: String
    var bestFriend: String
    
    init(name: String, bestFriend: String) {
        print("Enrolling \(name) in class...")
        self.name = name
        self.bestFriend = bestFriend
    }
}

// You don’t have to use that, of course, but it gets a little clumsy adding some sort of prefix to the parameter names:

struct StudentWithInitWithNotSelf {
    var name: String
    var bestFriend: String

    init(name studentName: String, bestFriend studentBestFriend: String) {
        print("Enrolling \(studentName) in class…")
        name = studentName
        bestFriend = studentBestFriend
    }
}

struct District {
    var number: Int
    var supervisor: String
    init(number: Int, supervisor: String) {
        self.number = number
        self.supervisor = supervisor
    }
}
let district = District(number: 9, supervisor: "Unknown")

// **************** Lazy properties
/*
 As a performance optimization, Swift lets you create some properties only when they are needed. As an example, consider this FamilyTree struct – it doesn’t do much, but in theory creating a family tree for someone takes a long time:
*/

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

// We might use that FamilyTree struct as a property inside a Person struct, like this:

struct PersonFamily {
    var name: String
    // old code var familiTree = FamilyTree()
    //new code
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var ed = PersonFamily(name: "Ed")

/*
 But what if we didn’t always need the family tree for a particular person? If we add the lazy keyword to the familyTree property, then Swift will only create the FamilyTree struct when it’s first accessed:
*/

// lazy var familiTree = FamilyTree()

ed.familyTree


// When should properties be lazy?

/*
 Swift’s lazy properties let us delay the creation of a property until it’s actually used, which makes them like a computed property. However, unlike a computed property they store the result that gets calculated, so that subsequent accesses to the property don’t redo the work. This allows them to provide extra performance when they aren’t used (because their code is never run), and extra performance when they are used repeatedly (because their value is cached.)

 However, that doesn’t mean we should make every property lazy, or indeed most properties – in practice, the majority of properties are just standard stored properties. There are a few reasons why you would prefer stored or computed properties over a lazy property, such as:

 Using lazy properties can accidentally produce work where you don’t expect it. For example, if you’re building a game and access a complex lazy property for the first time it might cause your game to slow down, so it’s much better to do slow work up front and get it out of the way.
 Lazy properties always store their result, which might either be unnecessary (because you aren’t use it again) or be pointless (because it needs to be recalculated frequently).
 Because lazy properties change the underlying object they are attached to, you can’t use them on constant structs.
 When trying to optimize code, it’s usually a better idea to wait until you actually have a problem you need to optimize rather than prematurely scattering things like lazy properties around.

 For another perspective on lazy properties in Swift, check out this article from Keith Harrison: https://useyourloaf.com/blog/swift-lazy-property-initialization/
 */


// ********* Static properties and methods

/*
 All the properties and methods we’ve created so far have belonged to individual instances of structs, which means that if we had a Student struct we could create several student instances each with their own properties and methods:
*/

/*struct StudentPropertiesStatic {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}*/

/*
 You can also ask Swift to share specific properties and methods across all instances of the struct by declaring them as static.

 To try this out, we’re going to add a static property to the Student struct to store how many students are in the class. Each time we create a new student, we’ll add one to it:
*/

struct StudentPropertiesStatic {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        StudentPropertiesStatic.classSize += 1
    }
}

/*
 Because the classSize property belongs to the struct itself rather than instances of the struct, we need to read it using Student.classSize:
*/


let felipeC = StudentPropertiesStatic(name: "Felipe")
let taylot = StudentPropertiesStatic(name: "Taylor")

print(StudentPropertiesStatic.classSize)


// What’s the point of static properties and methods in Swift?

/*
 Most people learning Swift immediately see the value of regular properties and methods, but struggle to understand why static properties and methods would be useful. It’s certainly true that they are less useful than regular properties and methods, but they are still fairly common in Swift code.

 One common use for static properties and methods is to store common functionality you use across an entire app. For example, I make an app called Unwrap, which is a free iOS app for folks learning Swift. In the app I want to store some common information, such as the URL to the app on the App Store, so I can reference that anywhere the app needs it. So, I have code like this storing my data:
*/

struct Unwrap {
    static let appURL = "https://itunes.apple.com/app/id1440611372"
}

/*
 That way I can write Unwrap.appURL when someone shares something from the app, which helps other folks discover the app. Without the static keyword I’d need to make a new instance of the Unwrap struct just to read the fixed app URL, which isn’t really necessary.

 I also use both a static property and a static method to store some random entropy in the same struct, like this:
*/

struct LegoBrick {
    static var numberMade = 0
    var shape: String
    var color: String
    init(shape: String, color: String) {
        self.shape = shape
        self.color = color
        LegoBrick.numberMade += 1
    }
}


// ***************** Access control
/*
 Access control lets you restrict which code can use properties and methods. This is important because you might want to stop people reading a property directly, for example.

 We could create a Person struct that has an id property to store their social security number:


*/
 

/*struct PersonAccessControl {
    var id: String
    
    init(id: String) {
        self.id = id
    }
}

let pipeC = PersonAccessControl(id: "12345")
 */

/*
 Once that person has been created, we can make their id be private so you can’t read it from outside the struct – trying to write ed.id simply won’t work.

 Just use the private keyword, like this:
*/

struct PersonAccessControl {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
            return "My social security number is \(id)"
        }
}

// Now only methods inside Person can read the id property. For example:
// Another common option is public, which lets all other code use the property or method.

let pipeC = PersonAccessControl(id: "1245")

// print("pipeC Id: \(pipeC.id)") // you don't hace access

print(pipeC.identify())

// What’s the point of access control?

/*
 Swift’s access control keywords let us restrict how different parts of our code can be accessed, but a lot of the time it’s just obeying the rules we put into place – we could remove them if we wanted and bypass the restrictions, so what’s the point?

 There are a few answers to that, but one is particularly easy so I’ll start there: sometimes access control is used in code you don’t own, so you can’t remove the restriction. This is common when you’re building apps with Apple’s APIs, for example: they place restrictions about what you can and cannot do, and you need to abide by those restrictions.

 In your own code, yes of course you can remove any access control restrictions you put in place, but that doesn’t make it pointless. Access control lets us determine how a value should be used, so that it something needs to accessed very carefully then you need to follow the rules.

 Previously I’ve mentioned Unwrap, my Swift learning app, and I want to use another example from there. When users learn different parts of Swift, I store the name of the thing they learned in a private Set inside a User struct, declared like this:
*/

private var learnedSection = Set<String>()

/*
 It’s private, which means no one can read or write to it directly. Instead, I provide public methods for reading or writing values that should be used instead. That’s intentional, because learning a section needs to do more than just insert a string into that set – it needs to update the user interface to reflect the change, and needs to save the new information so the app remembers it was learned.

 If I hadn’t made the learnedSections property private, it’s possible I might forget and write things to it directly. That would result in my UI being inconsistent with its data, and also not saving the change – bad all around!

 So, by using private here I’m asking Swift to enforce the rules for me: don’t let me read or write this property from anywhere outside the User struct.

 One other advantage to access control is that it lets us control how other people see our code – known as its “surface area”. Think about it: if I gave you a struct to use and it had 30 public properties and methods, you might not be sure which ones are there for you to use and which ones are really just for internal use. On the other hand, if I mark 25 of those as private then it’s immediately clear that you shouldn’t be using them externally.

 Access control can be quite a thorny issue, particularly when you take into account external code. So, it’s not a surprise Apple’s own documentation on it is quite long – you can find it here: https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html
*/

struct App {
    var name: String
    private var sales = 0
    init(name: String) {
        self.name = name
    }
}
let spotify = App(name: "Spotify")

// ********************** Structs summary

//You’ve made it to the end of the seventh part of this series, so let’s summarize:

// 1. You can create your own types using structures, which can have their own properties and methods.
struct Sports {
    var name: String
}

// 2. You can use stored properties or use computed properties to calculate values on the fly.
struct exampleStruct {
    var name: String
    var isOlympicSport: Bool
    var olimpicStatus: String {
        if isOlympicSport {
            return "\(name) is a Olympic sport"
        }else {
            return "\(name) is not an Olympic sport"
        }
    }
}

// 3. If you want to change a property inside a method, you must mark it as mutating.
struct exampleStruct1 {
    var name: String
    var isOlympicSport: Bool
    var olimpicStatus: String {
        if isOlympicSport {
            return "\(name) is a Olympic sport"
        }else {
            return "\(name) is not an Olympic sport"
        }
    }
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

// 4. Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.
struct exampleStruct2 {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user")
    }
    
}


// 5. Use the self constant to refer to the current instance of a struct inside a method.
struct exampleStruct3 {
    var name: String
    
    init(name: String) {
        print("\(name) was born")
        self.name = name
    }
}

// 6. The lazy keyword tells Swift to create properties only when they are first used.
struct PersonExample {
    var name: String
    lazy var familyTree = FamilyTree()
}

// 7. You can share properties and methods across all instances of a struct using the static keyword.
struct Estudiante {
    static var classSize = 0
    var name: String
}

// 8. Access control lets you restrict what code can use properties and methods.
struct Persona {
    private var id: String
    
    init(id: String){
        self.id = id
    }
}
