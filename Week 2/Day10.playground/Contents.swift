import Cocoa

//Day 10
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
    
}
let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)

let wings = Album(title: "Winga", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

//struct Employee {
//    let name: String
//    var vacationRemaining = 14
//    //learning to make structs mutatable.
//    mutating func takeVacation(days: Int) {
//        if vacationRemaining > days {
//            vacationRemaining -= days
//            print("I'm going on vacation!")
//            print("Days remaining: \(vacationRemaining)")
//        } else {
//            print("Oops! There aren't enough days remaining")
//        }
//    }
//}
/////initializing the struct 'init'
//var archer = Employee.init(name: "Sterling Archer", vacationRemaining: 14)
//archer.takeVacation(days: 5)
//print(archer.vacationRemaining)
//
//let kane = Employee(name: "Lana Kane")
//let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)


///Section 2
///Computing property values dynamically.
struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    //Calculated Dynamically
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)


//Section 3: Property Observers

struct Game {
    var score = 0  {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1


struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")


//Section 4
//Custom Initializers
struct Player {
    let name: String
    let number: Int
    
    ///No explicit Return Type
    ///Remember to initialize all values before the end of init
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Meagan R")
print(player.number)
