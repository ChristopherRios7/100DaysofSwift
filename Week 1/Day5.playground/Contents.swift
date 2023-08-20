import Cocoa

//Day 5! Conditonal Statements and Ternary Operators.
let score = 85

if score > 80 {
    print("Great job!")
}

let speed = 88
let percentage = 85
let age = 18

/*Using Comparison Operators Greater than/EqualTo (>=)
 Less Than (<)
 */

if speed >= 88 {
    print("Where we're going we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote")
}

// if the user entered a name that comes after their friend’s name alphabetically, put the friend’s name first. You’ve seen how <, >= and others work great with numbers, but they also work equally well with strings right out of the box:

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// If we have over 3 items
if numbers.count > 3 {
// Remove the oldest number
    numbers.remove(at: 0)
}

// Display the result
print(numbers)

let country = "Canada"

//"Equals To" Operator
if country == "Australia" {
    print("G'day!")
}

let name = "Taylor Swift"

//Not Equal To Operator
if name != "Anonymous" {
    print("Welcome, \(name)")
}
// Create the username variable
var username = "taylorswift13"

// If `username` contains an empty string
if username == "" {
// Make it equal to "Anonymous"
    username = "Anonymous"
}

// Now print a welcome message
print("Welcome, \(username)!")

//isEmpty Method works with Strings, Arrays, Dictionaries, and Sets
if username.isEmpty == true {
    username = "Anonymous"
}
//This works even better.
if username.isEmpty {
    username = "Anonymous"
}
//Checking Multiple Condtions
let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

/*
 I’d like to pick out a few parts of that code:
 
 When we set the value for transport we need to be explicit that we’re referring to TransportOption.airplane. We can’t just write .airplane because Swift doesn’t understand we mean the TransportOption enum.
 Once that has happened, we don’t need to write TransportOption any more because Swift knows transport must be some kind of TransportOption. So, we can check whether it’s equal to .airplane rather than TransportOption.airplane.
 The code using || to check whether transport is equal to .airplane or equal to .helicopter, and if either of them are true then the condition is true, and “Let’s fly!” is printed.
 If the first condition fails – if the transport mode isn’t .airplane or .helicopter – then the second condition is run: is the transport mode .bicycle? If so, “I hope there’s a bike path…” is printed.
 If we aren’t going by bicycle either, then we check whether we’re going by car. If we are, “Time to get stuck in traffic.” is printed.
 Finally, if all the previous conditions fail then the else block is run, and it means we’re going by scooter.
 */

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}


//Switch Statments/cases!
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
    case .sun:
        print("It should be a nice day.")
    case .rain:
        print("Pack an umbrella.")
    case .wind:
        print("Wear something warm")
    case .snow:
        print("School is cancelled.")
    case .unknown:
        print("Our forecast generator is broken!")
}

let place = "Metropolis"

switch place {
    case "Gotham":
        print("You're Batman!")
    case "Mega-City One":
        print("You're Judge Dredd!")
    case "Wakanda":
        print("You're Black Panther!")
    default:
        print("Who are you?")
}

let day = 5
print("My true love gave to me…")

switch day {
    case 5:
        print("5 golden rings")
        fallthrough
    case 4:
        print("4 calling birds")
        fallthrough
    case 3:
        print("3 French hens")
        fallthrough
    case 2:
        print("2 turtle doves")
        fallthrough
    default:
        print("A partridge in a pear tree")
}
let day = 5
print("My true love gave to me…")

switch day {
    case 5:
        print("5 golden rings")
        fallthrough
    case 4:
        print("4 calling birds")
        fallthrough
    case 3:
        print("3 French hens")
        fallthrough
    case 2:
        print("2 turtle doves")
        fallthrough
    default:
        print("A partridge in a pear tree")
}
