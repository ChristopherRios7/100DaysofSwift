import Cocoa

//Checkpoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let result = luckyNumbers.filter { $0 % 2 != 0 }
    .sorted()
    .map { "\($0) is a lucky number" }

//using a loop to print each result in the array
for item in result {
    print(item)
}
