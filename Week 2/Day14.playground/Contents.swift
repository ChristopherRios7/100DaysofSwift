import Cocoa

    ///Last Day of Fundementals of Swift
    ///Optionals, Nil Coalescing, Optional Chaining, and Function Failures
    ///
    ///Section 1: How to handle missing data with optionals
    ///
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]// ->String?/Nil

    //One way of unwrapping an optional
    //if there is a value for the optional string, then print the statement.
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
} else {
    print("The Optional was empty.")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}
func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}
    //this is called "Shadowing"
    //Temporary second constant to help you unwrap your optional
if let number = number {
    print(square(number: number))
}


    ///Section 2: Unwrap optionals with guard.
    ///
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        
            // 1: We *must* exit the function here
        return
    }
    
        // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

var myVar: Int? = 3

    //if let unwrapped = myVar {
    //    print("Run if myVar has a value inside")
    //}

    //guard let unwrapped = myVar else {
    //    print("Run if myVar doesn't have a value inside")
    //}


    ///guard is designed exactly for this style of programming, and in fact does two things to help: If you use guard to check a function’s inputs are valid, Swift will always require you to use return if the check fails.
    ///If the check passes and the optional you’re unwrapping has a value inside, you can use it after the guard code finishes.

///Swift requires you to use return if a guard check fails.
///if the optional you're unwrapping has a value, you can use it after the guard code finishes.

///Section 3: Nil Coalescing operator
///unwraping optionals
///
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

//This will be set as an optional String
//let new = captains["Serenity"] ?? "N/A"

//OR you can do this:

let new = captains["Serenity", default: "N/A"]
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let aNumber = Int(input) ?? 0
print(aNumber)


///Section 3: Optional Chaining
///Handling multiple Optionals
///
let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Books {
    let title: String
    let author: String?
}

var books: Books? = nil

///“if we have a book, and the book has an author, and the author has a first letter, then uppercase it and send it back, otherwise send back A”.
let newAuthor = books?.author?.first?.uppercased() ?? "A"
print(newAuthor)


///Section 4: Function error handling using Optionals
///
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)
