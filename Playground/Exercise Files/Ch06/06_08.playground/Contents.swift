
class Employee {
    let name: String
    var manager: Employee? = nil
    
    init(name: String) {
        self.name = name
    }
    
    func printName() {
        print(name)
    }
}

let charlotte = Employee(name: "Charlotte")
let lori = Employee(name: "Lori")
let scott = Employee(name: "Scott")
let betty = Employee(name: "Betty")

betty.manager = scott
scott.manager = lori
lori.manager = charlotte


