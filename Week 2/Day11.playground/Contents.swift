import Cocoa

///Day 11: Structs Part 2
///
///
///Section 1: Limit access to internal data using access control
///
///using 'private keyword -- Don't let anything outside the struct use this.
///fileprivate keyword -- Don't let anything outside the current file use this.
///public ---Let anyone, anywhere use this
///private (set) -- let anyone read this property, but only let my methods write it.
struct BankAccount {
    private var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money sucessfully")

} else {
    print("Failed to get the money")
}


///Section 2:  Static Properties and Methods.
///

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

/// self -- the current value of a struct
///Self -- The current type of a struct
///
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}
struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfederighi", password: "hairforceone")
}
