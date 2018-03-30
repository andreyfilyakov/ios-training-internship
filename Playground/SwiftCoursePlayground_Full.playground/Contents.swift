
//:![[swift book]](swift.png)

//:#Part 1 - Variables and constants
var hello : String = "Hello, World!"
print (hello)

var digit : Int
digit = 5

let digit1 = 10

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//let explicitFloat: Float = 4

var name = "John"
print ("Hello, " + name)

// print("John has " + digit + " apples")

print("John has " + String(digit) + " apples")

print ("John has \(digit) apples")

let apples = 5.0
let oranges = 4.5

print ("John has \(apples + oranges) pieces of fruit")

var цифра = 10

var a = "test"

var 🍻 = "beer"
print(🍻)
🍻 = "🍻"
print(🍻)

//:#Part 2 - Optionals
var digit3 : Int?
var digit4 : Int = 4

digit3 = digit4
//digit4 = digit3!

//Collection

var fruits = ["apple", "banana", "pineapple"]
print(fruits[2])

var carVendors = ["Chevrolet":"USA", "Ford":"USA", "Fiat":"France"]
print(carVendors["Chevrolet"] ?? "")

//fruits = []
//carVendors = [:]

var array : [String]
var dict : [String:Int]


//:#Part 3 - Control Flow
var number = 9

if number > 10 && number < 20 {
    print("Greater then 10")
}
else{
    print("Less then 10")
}

if let digit0 = digit3 {
    print("here")
}

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
//optionalName = nil

if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, Noname"
}

greeting = "Hello, \(optionalName ?? "Noname")"

import UIKit

for i in 0..<64{
    var point = sin(Double(i)*100)

}

for fruit in fruits{
    print (fruit)
}

carVendors["Fiat"] = "Italy"

for (model, vendor) in carVendors{
    print("\(model) is manufactured in \(vendor)")
}

// example_loops

var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

//cases
let vegetable = "red paper"
switch vegetable {
    case "tomato":
        print ("Vegetable is tomato")
    case let x where x.hasPrefix("red"):
        print ("Vegetable is red paper")
    default:
        print("Default")
}

var bool : Bool = true

//example_case


//:#Part 4 -Functions
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")


func greet (_ person : String, on day: String) -> String{
    return "Hello \(person), today is \(day)"
}

print (greet("John", on: "Friday"))



//Compaund value example_comp

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

//variable params example_func_var

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 597, 12)


//nested function example_func_nested

func returnFifteen() -> ((Int) -> String) {
    func add(_ value: Int) -> String {
        return "\(value)"
    }

    return add
}
returnFifteen()


func invoke (action : (Int) -> String){
    print (action(5))
}

invoke { (param) -> String in
    return "\(param + 10)"
}

//invoke(x => x.ToString())

//:#Part 5 - Classes
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

//example_class_named_shape

class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength


//:#Part 7 - Memory management
//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//var person1 :Person? = Person(name: "John")
//var person2 = person1
//person1 = nil
//person2 = nil

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var unit4a : Apartment? = Apartment(unit:"4a")
var john : Person? = Person(name: "John")


//:![[arc1]](arc1.png)

john?.apartment = unit4a
unit4a?.tenant = john

//:![[arc2]](arc2.png)
john = nil
unit4a = nil
//:![[arc3]](arc3.png)
//:![[arc4]](arc4.png)
//:![[arc5]](arc5.png)
//:![[arc6]](arc6.png)

