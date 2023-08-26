import Cocoa

    ///Checkpoint 7

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog:Animal {
    override init(legs: Int) {
        super.init(legs: legs)
    }
    func speak() {
        print("Bark Bark!")
    }
}

class Cat:Animal {
    var isTame: Bool
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    func speak() {
        print("Meow")
    }
}

class Corgi:Dog {
    override func speak() {
        print("Arf! Arf!")
    }
}

class Poodle:Dog {
    override func speak() {
        print("Yap! Yap!")
    }
}
class Persian:Cat{
    override func speak() {
        print("Purrr! Purr!")
    }
}

class Lion:Cat {
    override func speak() {
        print("Roooooarrrr!")
    }
}

let hammy = Corgi(legs: 4)
hammy.speak()

let alex = Lion(isTame: true, legs: 4)
print(alex.isTame)
if alex.isTame == false {print("Wild Animal!")}
else {print("Big Kitty")}

let chester = Persian(isTame: true, legs: 4)
chester.speak()

