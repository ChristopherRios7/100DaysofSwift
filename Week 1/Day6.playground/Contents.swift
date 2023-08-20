import Cocoa

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

//for every item(os) in the platforms array, print the string with the array value
for os in platforms {
    print("Swift works great on \(os).")
}


//Rather than looping over an array (or set, or dictionary – the syntax is the same!), you can also loop over a fixed range of numbers. For example, we could print out the 5 times table from 1 through 12 like this:
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

//Nested Loops
for i in 1...12 {
    print("The \(i) times table:")
    
    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }
    
    print()
}
//Swift has a similar-but-different type of range that counts up to but excluding the final number: ..<

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

//you can replace the loop variable with an underscore, like this:
var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

//While Loops!
var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

//Making a 20-side die, like D&D.


// create an integer to store our roll
var roll = 0

    // carry on looping until we reach 20
while roll != 20 {
        // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

    // if we're here it means the loop ended – we got a 20!
print("Critical hit!")


//Learning how to use 'continue'
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    
    print("Found picture: \(filename)")
}
//👆🏽 That creates an array of filename strings, then loops over each one and checks to make sure it has the suffix “.jpg” – that it’s a picture. continue is used with all the filenames failing that test, so that the rest of the loop body is skipped.

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)



