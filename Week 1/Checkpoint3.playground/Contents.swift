import Cocoa

for j in 1...100 {
    switch j {
        case let k where k.isMultiple(of: 3) && k.isMultiple(of: 5):
            print("FizzBuzz")
        case let k where k.isMultiple(of: 3):
            print("Fizz")
        case let k where k.isMultiple(of: 5):
            print("Buzz")
        default:
            print(j)
    }
}
