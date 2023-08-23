import Cocoa

    ///creating a function and assigning it as variable.
    ///Thus, creating a copy of the function, called a trival function

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()

    ///But what if you wanted to skip creating a separate function, and just assign the functionality directly to a constant or variable? Well, it turns out you can do that to
    //func greetUser() {
    //    print("Hi there!")
    //}
    //
    //greetUser()
    //
    //var greetCopy = greetUser
    //greetCopy()


    //a closure – a chunk of code we can pass around and call whenever we want.

    ///If you want the closure to accept parameters, they need to be written in a special way.
    ///You see, the closure starts and ends with the braces, which means we can’t put code outside those braces to control parameters or return value.
    ///So, Swift has a neat workaround: we can put that same information inside the braces, like this:
let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

    // the 'in' keyword, and it comes directly after the parameters and return type of the closure.

    ///'in'' is used to mark the end of the parameters and return type – everything after that is the body of the closure itself

    //Here is an example of using closures.
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

    //example of using "sorted()"
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

    //Creating a custom function to pass into the "sorted()" function
    //Sorting to make the "captain first.
    //sorted() can be passed a function to create a custom sort order, and as long as that function a) accepts two strings, and b) returns a Boolean, sorted() can use it.

    //func captainFirstSorted(name1: String, name2: String) -> Bool {
    //    if name1 == "Suzanne" {
    //        return true
    //    } else if name2 == "Suzanne" {
    //        return false
    //    }
    //
    //    return name1 < name2
    //}
    //
    //let captainFirstTeam = team.sorted(by: captainFirstSorted)
    //print(captainFirstTeam)


    //Here the same code show above 👆🏽 but using the closures concept:
    //let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    //    if name1 == "Suzanne" {
    //        return true
    //    } else if name2 == "Suzanne" {
    //        return false
    //    }
    //
    //    return name1 < name2
    //})
    //print(captainFirstTeam)

    //Reducing clutter using special syntax called "trailing closure syntax"

//let captainFirstTeam = team.sorted { name1, name2 in
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//    
//    return name1 < name2
//}
//print(captainFirstTeam)

    ///There’s one last way Swift can make closures less cluttered: Swift can automatically provide parameter names for us, using shorthand syntax.
    /// With this syntax we don’t even write name1, name2 in any more, and instead rely on specially named values that Swift provides for us: $0 and $1, for the first and second strings respectively.
    /// Using this syntax our code becomes even shorter:

let captainFirstTeam = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}

let reverseTeam = team.sorted { $0 > $1 }

print(reverseTeam)

//the filter() function lets us run some code on every item in the array, and will send back a new array containing every item that returns true for the function. So, we could find all team players whose name begins with T like this:
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

//That will print ["Tiffany", "Tasha"], because those are the only two team members whose name begins with T.

//the map() function lets us transform every item in the array using some code of our choosing, and sends back a new array of all the transformed items:
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

//That will print ["GLORIA", "SUZANNE", "PIPER", "TIFFANY", "TASHA"], because it has uppercased every name and produced a new array from the result.


func generateNumber() -> Int {
    Int.random(in: 1...20)
}

//accept functions as parameters
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

//
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}
doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}
