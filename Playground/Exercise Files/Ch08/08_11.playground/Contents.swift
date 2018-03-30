
class Vehicle {
    
    var passengerCapacity = 4
    let zeroTo60: Float
        
    init(passengers: Int, zeroTo60: Float) {
        passengerCapacity = passengers
        self.zeroTo60 = zeroTo60
    }
}

class ElectricVehicle : Vehicle {
    
    let rangePerCharge: Int
    
    init(passengers: Int, zeroTo60: Float, rangePerCharge: Int) {
        self.rangePerCharge = rangePerCharge
        super.init(passengers: passengers, zeroTo60: zeroTo60)
    }
}

let teslaModelS = ElectricVehicle(passengers: 4, zeroTo60: 2.5, rangePerCharge: 315)



struct Coordinate3D {
    let x: Int
    let y: Int
    let z: Int
    var label: String
    
    init(x: Int, y: Int, z: Int, label: String? = "(unlabeled)") {
        self.x = x
        self.y = y
        self.z = z
        self.label = label!
    }
}

let origin = Coordinate3D(x: 0, y: 0, z: 0, label: "Origin")

var destination = Coordinate3D(x: 10, y: 10, z: 10, label: "Destination")


