import Cocoa


//How to create variables and constants

var name = "Ted"
name = "Rebecca"
name = "Keeley"
//Creating a constant variable
let character = "Daphne"
//Printing to the Debug console
var playerName = "Roy"
print(playerName)
playerName = "Dani"
print(playerName)
playerName = "Sam"
print(playerName)

let managerName = "Micheal Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"
print(managerName)
print(dogBreed)
print(meaningOfLife)

//Section 2: Strings/Multi-Line Strings
let actor = "Denzel Washington"
let filename = "paris.jpg"
let result = "⭐️ You Win! ⭐️"
let quote = "Then he taped a sign saying \"Believe\" and walked away"

//mutli-line strings
let movie = """
A day in
the life of an
Apple Engineer
"""
print(movie)

//finding the count of the string
let nameLength = actor.count //17, spaces count
print(nameLength)


//uppcase method explored
print(result.uppercased())


//hasPrefix/hasSuffix are case sensitive!
print(movie.hasPrefix("A day")) //hasPrefix is a boolean function call, checks if a string starts with our parameter.
print(filename.hasSuffix(".jpg")) //hasSuffix is a boolean function call, checks if a string ends with our parameter

//Working with Whole Numbers
let score = 10
let reallyBig = 100_000_000

//Arthemetic with whole numbers
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

//Working with special operators
var counter = 10
counter = counter + 5


counter += 5 //shorthand operator; works the same way as counter + 5
print(counter)

//More pracetice with shorrhand operators
counter *= 2
print(counter)
counter -= 10
print(counter)
counter /= 2
print(counter)

//Introduction of 'isMultipleOf' function; it's a boolean function that checks if a variable is a multiple of the parameter.
let number = 120
print(number.isMultiple(of: 3))

//Working with Doubles
let aNumber = 0.1 + 0.2
print(aNumber)

let a = 1
let b = 2.0
//let c = a + b //will result in an error
let c = Double(a) + b

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var rating = 5.0
rating *= 2
print(rating)

