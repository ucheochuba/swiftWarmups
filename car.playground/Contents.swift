import Cocoa

enum CarError: Error {
    case invalidGear(attemptedGear: Int)
}

struct Car {
    let model: String
    let seat_count: Int
    
    var gear: Int = 1 {
        willSet {
            print("Gear was \(gear)")
        } didSet {
            print("Gear is now \(gear)")
        }
    }
    
    mutating func shiftGear(amount: Int) throws {
        let newGear = gear + amount
        guard (newGear > 0) && (newGear < 10) else {
            throw CarError.invalidGear(attemptedGear: newGear)
        }
        
        gear = newGear
    }
}

var myCar = Car(model: "Lambo", seat_count: 2)

do {
    try myCar.shiftGear(amount: 5)
    try myCar.shiftGear(amount: -2)
    try myCar.shiftGear(amount: -5)
    print("Great success!")
} catch CarError.invalidGear(let attemptedGear) {
    print("Attempted to set the gear to \(attemptedGear)!")
}


