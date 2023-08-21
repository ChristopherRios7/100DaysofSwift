import Cocoa

enum squareRootError: Error {
    case outOfBounds, noRoot
}

func squareRoot(_ number:Int) throws -> Int{
    if number < 1 || number > 10_000 {
        throw squareRootError.outOfBounds
    }
    
    var low = 1
    var high = number
    
    while low <= high {
        let mid = (low + high) / 2
        if mid * mid == number {
            return mid
        }
        else if mid * mid < number{
            low = mid + 1
        }
        else {
            high = mid - 1
        }
    }
    throw squareRootError.noRoot
}
let number = 25

do {
    let square_root = try squareRoot(number)
    print("The integer square root of \(number) is \(square_root)")
} catch squareRootError.noRoot {
    print("Error: No root was found.")
} catch squareRootError.outOfBounds {
    print("Error: Out of Bounds -- Number must be between 1 and 10,000")
}
