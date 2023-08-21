import Cocoa

//Day 8 -- default values, throwing functions

//'= 12' is a way to set default value for end
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)

///prints a times table for 8 all the way up to 12,
///since that is the default value.
printTimesTables(for: 8)


//Error handling in Functions
///Building on top of Swift's Existing Errorr Type
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

//let string = "12345"
////do means making an attempt to run the function
////if the function completes, function will return password rating
//do {
//    let result = try checkPassword(string)
//    print("Password rating: \(result)")
//    //Exception was thrown, meaning there was an error that occurred in the function.
//} catch {
//    print("There was an error.")
//}

//let string = "Hi"//Short
//let string = "Apple"//Ok
let string = "Swift1sC00l"//Excellent
//let string = "12345" //Obvious

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
    //This allows to specify what error was thrown
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}
