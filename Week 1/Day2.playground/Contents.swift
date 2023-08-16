import Cocoa

//Day 2: Working with Booleans.
let filename = "paris.jpg"
//hasSuffix is a boolean function that checks if the variable used in the parameter ends with the suffix. either the string has the suffix or it doesn’t
print(filename.hasSuffix(".jpg"))

let number = 120
//isMultipleOf is a boolean function that checks if the variable passed is a multiple of the parameter used. either 120 is a multiple of 3 or it isn’t.
print(number.isMultiple(of: 3))

let isMultiple = 120.isMultiple(of: 3)
print(isMultiple)

//This example shows us how to flip a boolean variables value -- using the '!'operator
var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

//Booleans do have one more unique feature, toggle(). It's basically the same as using the '!'Operator.
var gameOver = false
print(gameOver)

gameOver.toggle()
print(gameOver)

//String Interpolation
let firstPart = "Hello, "
let secondPart = "world!"
//The '+' Operator let's you join two Strings together.
let greeting = firstPart + secondPart

//This is called operator overloading – the ability for one operator such as + to mean different things depending on how it’s used. For strings, it also applies to +=, which adds one string directly to another.
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

//using "\($variable) to print out a variable.
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let aNumber = 11
let missionMessage = "Apollo \(aNumber) landed on the moon."

print(missionMessage)

//You can put calculations inside string interpolation if you want to. For example, this will print “5 x 5 is 25”:
print("5 x 5 is \(5 * 5)")


//Checkpoint code! We are gonna Convert Celsius to Fahrenheit
let cTemp = 22.5
let fTemp = (cTemp * 9) / 5 + 32
print("\(cTemp)°C is \(fTemp)°F")
