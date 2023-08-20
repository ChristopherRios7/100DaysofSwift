import Cocoa

//Day 7!

//Section 1 : How to reuse code with function calls.
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}
showWelcome() //<- function call; prints all the statments inside that code block

////isMultiple has parameter 'of' that allows to chose what multiple we are checking for.
///
//let number = 139
//
//if number.isMultiple(of: 2) {
//    print("Even")
//} else {
//    print("Odd")
//}

func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)


//Section 2: return values from functions
let root = sqrt(169)
print(root)

//This function will return back an Int.
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

///Making a fuction that checks if two strings contain the same letters.
///returns a true or false

func isTheSame(str1:String, str2:String) -> Bool {
    return str1.sorted() == str2.sorted()
}

print(isTheSame(str1: "abc", str2: "cab"))

///First Solution for the Pythagoras func
//func pythagoras(a: Double, b: Double) -> Double {
//    let input = a * a + b * b
//    let root = sqrt(input)
//    return root
//}
//

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)

//Section 3 -- Return Multiple Values from a function
///This works but can be problematic
//func getUser() -> [String] {
//    ["Taylor", "Swift"]
//}
//
//let user = getUser()
//print("Name: \(user[0]) \(user[1])")

///This uses dictionaries but, is also problematic.
//func getUser() -> [String: String] {
//    [
//        "firstName": "Taylor",
//        "lastName": "Swift"
//    ]
//}
//
//let user = getUser()
//print("Name: \(user["firstName", default: "Anonymous"]) \(user["lastName", default: "Anonymous"])")


///This solution uses a Tuple for better readability
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")


//Destructuring
let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")


//Section 4 -- Customize Parameter Labels
//we add an underscore before the parameter name,
//we can remove the external parameter label like so:
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result2 = isUppercase(string)

///The other option is to write a second name there: one to use externally, and one to use internally.
///Here’s how that looks:

func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)
