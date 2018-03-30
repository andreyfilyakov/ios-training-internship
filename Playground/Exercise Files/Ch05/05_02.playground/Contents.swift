
let a = 4
let b = 2
var c = a // Passed by copy
let d = 4

a == c



a > b
b < a

a >= d
a <= d



var e = true



func ==(lhs: SomeClass, rhs: SomeClass) -> Bool {
    return lhs.title == rhs.title
}

class SomeClass {
    var title = "SomeClass"
}

let x = SomeClass()
let y = SomeClass()
let z = x // Passed by reference

x == y
x == z


