import Cocoa

///Day 13
///Protocols; How to create and use them
///


protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}
func getTravelEstimates(using vehicles: [Vehicle], distance: Int){
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
        
    }
}
let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car,bike], distance: 150)

///Section 2: How to use opaque return types
///allows us to change our mind later
///removes complexity inside our code
func getRandomNumber() -> some Equatable {
    Double.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}
print(getRandomNumber() == getRandomNumber())


//Section 3: Extensions
///Pros: Code completion
///Code organization
///Internal acess
///
//let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

///First implementation

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    mutating func trim() {
        self.self.trimmed()
    }
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmed()
quote.trim()

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
    
    //Disables automatice memberwise intitializer
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of The Rings", pageCount: 1178)


//Section 4: Extension Protocols

///Apple calls this Protocol Orirented Progrraming

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}
///But because it conforms to Person, we could use the default implementation we provided in our extension
///which is why we don't have to redeclare sayHello()
struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()
