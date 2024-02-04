import Cocoa

protocol Building {
    var roomCount: Int {get}
    var cost: Int {get}
    var agent: String {get}
    
    func summary() -> Void
}

struct House: Building {
    var roomCount: Int
    var cost: Int
    var agent: String
    
    func summary() {
        print("\(roomCount) rooms, sold by \(agent) for $\(cost).")
    }
}

struct Office: Building {
    var roomCount: Int
    var cost: Int
    var agent: String
    
    func summary() {
        print("\(roomCount) rooms, sold by \(agent) for $\(cost).")
    }
}

let mars = House(roomCount: 20, cost: 5_000_000, agent: "Tomi Sogade")
let greenLib = Office(roomCount: 50, cost: 10_000_000, agent: "MTL")

mars.summary()
greenLib.summary()
