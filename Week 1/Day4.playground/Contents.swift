import Cocoa

//Day 4

//Type Annotations

/* Lines 8 & 9 uses Swift's Type Inference, that 'surname' is a String variable
and score is a integer variable */

//let surname = "Lasso"
//var score = 0

/*This is an implemenatation of Type Annotations.
 It lets us explicitly tell Swift what data type to assign a variable or constant.
 surname must be a string, and score must be an integer.*/
let surname: String = "Lasso"
var score: Int = 0

//Strings hold text.
let playerName: String = "Roy"

//Int holds whole numbers.
var luckyNumber: Int = 13

//Double holds decimal numbers.
let pi: Double = 3.141

//Boolean holds true or false.
var isAuthenticated: Bool = true

//String Array
//var albums: [String] = ["Red", "Fearless"]

//String Dictionary
var user: [String: String] = ["id": "@twostraws"]

/*Set holds lots of different values, but stores them in an order that’s optimized for checking what it contains. This must be specialized, such as Set<String>: */

var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

//Creating an empty array of Strings.
var teams: [String] = [String]()

var cities: [String] = []


//Checkpoint 2

let albums = ["Red", "Fearless", "Speak Now", "Folklore", "Red"]
print(albums)

print("Number of Albums: \(albums.count)")

let newAlbums = Set(albums)

print(newAlbums)

print("Number of Unique Albums: \(newAlbums.count)")
