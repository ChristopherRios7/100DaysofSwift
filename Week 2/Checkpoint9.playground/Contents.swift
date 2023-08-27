import Cocoa


///This function takes an optional array of integers as a parameter and returns a non-optional integer. If the array is not nil and not empty, it returns a random element from the array using the randomElement() method. If the array is nil or empty, it returns a random integer in the range of 1 through 100 using the Int.random(in:) method. The nil coalescing operator (??) is used to provide a default value in case the left-hand side is nil

func randomInt(from array: [Int]?) -> Int { array?.randomElement() ?? Int.random(in: 1...100) }

let array = [1, 2, 3, 4, 5]
let result1 = randomInt(from: array)
print("Random integer from array: \(result1)")

let result2 = randomInt(from: nil)
print("Random integer from 1 to 100: \(result2)")
