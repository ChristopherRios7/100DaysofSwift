import Cocoa

//Here is how to create a simple array
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

//Printing using the indexes
print(beatles[0])
print(numbers[1])
print(temperatures[2])

//If your array is variable, you can modify it after creating it. For example, you can use append() to add new items:
beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")
//assigning data to a variable using an array's index
let firstBeatle = beatles[0]
let firstNumber = numbers[0]
//Not allowed-- let notAllowed = firstBeatle + firstNumber

//explicitly declaring the array's data type.
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

//Arrays are so common in Swift that there’s a special way to create them: rather than writing Array<String>, you can instead write [String]. So, this kind of code is exactly the same as before:
var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

//count can read how many items are in an array
print(albums.count)

//remove(at:) to remove one item at a specific index, or removeAll() to remove everything.
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
//Removes "Ray", count is 3,
print(characters.count)

characters.removeAll()
print(characters.count)

//you can check whether an array contains a particular item by using contains()
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

/*That returns a new array with its items sorted in ascending order, which means alphabetically for strings but numerically for numbers – the original array remains unchanged.
 */
let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

//Reverses the the order of the array.
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)


//Working with Dictionaries
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]
//We need set default values to better handle Optionals
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])


/*You can also create an empty dictionary using whatever explicit types you want to store, then set keys one by one:
 */
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
//If your friend disagrees that The Joker is Batman’s arch-enemy, you can just rewrite that value by using the same key:
archEnemies["Batman"] = "Penguin"
//count and removeAll() still exists when working with Dictionaries.

//Working with Sets.
let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
print(people)

var peoples = Set<String>()
peoples.insert("Denzel Washington")
peoples.insert("Tom Cruise")
peoples.insert("Nicolas Cage")
peoples.insert("Samuel L Jackson")

//Notice how we’re using insert()? When we had an array of strings, we added items by calling append(), but that name doesn’t make sense here – we aren’t adding an item to the end of the set, because the set will store the items in whatever order it wants.


/* An enum – short for enumeration – is a set of named values we can create and use in our code. They don’t have any special meaning to Swift, but they are more efficient and safer, so you’ll use them a lot in your code.
*/


enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday

