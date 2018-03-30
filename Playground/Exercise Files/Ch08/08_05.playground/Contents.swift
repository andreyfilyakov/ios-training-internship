
class Teacher {
    
    var students = [Student]()
    
    deinit {
        print("Teacher will be deallocated")
    }
}

class Student {
    
    let teacher: Teacher
    
    init(teacher: Teacher) {
        self.teacher = teacher
    }
    
    deinit {
        print("Student will be deallocated")
    }
}



class Band {
    
    var drummer: Drummer
    
    init(drummer: Drummer) {
        self.drummer = drummer
    }
    
    deinit {
        print("Band will be deallocated")
    }
}

class Drummer {
    
    var band: Band?
    
    deinit {
        print("Drummer will be deallocated")
    }
}



class Alpha {
    
    deinit {
        print("Alpha will be deallocated")
    }
    
}

class Bravo {
    
    let alpha = Alpha()
    
    lazy var printOutValues: () -> Void = {
        print("\(self), \(self.alpha)")
    }
    
    lazy var printOutAlphaValue: () -> Void = {
        print("\(self.alpha)")
    }
    
    deinit {
        print("Bravo will be deallocated")
    }
    
}


