import Cocoa

//Day 12
///Working with classes
///Very similar to structs


class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

///Learning about inheritence
///make one class inherit from another

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    func printSummary() {
        print("I Wwork \(hours) hours a day")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm developer who will sometimes work \(hours) hours a day, but other tines will spend hours arguing about wheter code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()


//If you know for sure that your class should not support inheritance, you can mark it as final.


//Working with initializers
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

//Creating a deinitializer
///You dont use func with deinitializers
///Deinitializers can never take parameters or return data
///deinitializers run when the last copy of a class instance is destroyed
///We never call it directly
///structs dont have deintitalzers
class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
        //no parenthesis!
    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}
    /// we were adding our User instances as they were created, they would only be destroyed when the array is cleared:
var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

///Remember, the deinitializer is only called when the last remaining reference to a class instance is destroyed. This might be a variable or constant you have stashed away, or perhaps you stored something in an array.
///
///
///Working with Variables inside a class

class vUser {
    var name = "Paul"
}

let user = vUser()
user.name = "Taylor"
print(user.name)
//user = vUser() //will cause an error
//print(user.name)

