import Cocoa

///Checkpoint 6
///
///

struct Car {
     var gear = 0 {
        didSet {
            print("Current gear level: \(gear)")
        }
    }
    let model: String
    let seatCount: Int
    
    mutating func shiftGearUp(amount: Int) -> Bool {
        if gear < amount && gear < 10 {
            gear += amount
            return true
        }else{
            print("Cannot change gears!")
            return false
        }
    }
    
    mutating func shiftGearDown(amount: Int) -> Bool {
        if gear > amount {
            gear -= amount
            return true
        }else{
            print("Cannot change gears!")
            return false
        }
    }
    
    
    
    static let example = Car(model: "Toyota Camry", seatCount: 4)
}

var myCar = Car(model: "Ford F150", seatCount: 4)
myCar.shiftGearUp(amount: 5)
myCar.shiftGearDown(amount: 2)
myCar.shiftGearDown(amount: 4)
myCar.shiftGearUp(amount: 6)
myCar.shiftGearUp(amount: 2)

