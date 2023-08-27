import Cocoa

protocol Building {
    var numberOfRooms: Int { get }
    var cost: Int { get }
    var estateAgent: String { get }
    func printSalesSummary()
}

struct House: Building {
    let numberOfRooms: Int
    let cost: Int
    let estateAgent: String
    
    func printSalesSummary() {
        print("This is a house with \(numberOfRooms) rooms, costing $\(cost), being sold by \(estateAgent).")
    }
}

struct Office: Building {
    let numberOfRooms: Int
    let cost: Int
    let estateAgent: String
    
    func printSalesSummary() {
        print("This is an office with \(numberOfRooms) rooms, costing $\(cost), being sold by \(estateAgent).")
    }
}
let myHouse = House(numberOfRooms: 3, cost: 250000, estateAgent: "John Smith")


let myOffice = Office(numberOfRooms: 5, cost: 540000, estateAgent: "Jane Appleseed")
//print(myHouse.numberOfRooms) // 3
//print(myHouse.cost) // 250000
//print(myHouse.estateAgent) // John Smith
myHouse.printSalesSummary() // This is a house with 3 rooms, costing $250000, being sold by John Smith.


myOffice.printSalesSummary()
