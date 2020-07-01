import UIKit

class Bakery {
    typealias Completion = () -> ()
    
    var desctiption: String { return "Bakery" }
    
    func isSourdough() -> Bool {
        fatalError("Must be overriden")
    }
    
    func addYeast() {
        print("Adds the yeast")
    }
    
    func addEggs() {
        print("Adds eggs")
    }
    
    func addFlour() {
        print("Adds the flour")
    }
    
    final func cook(whenCooked: Completion) {
        if !isSourdough() {
            addYeast()
        }
        addEggs()
        addFlour()
        
        whenCooked()
    }
}

class Bread: Bakery {
    
    override var desctiption: String { return "Bread" }
    
    override func isSourdough() -> Bool {
        return false
    }
}

class SourdoughBread: Bakery {
    
    override var desctiption: String { return "SourdoughBread" }
    
    override func isSourdough() -> Bool {
        return true
    }
}

class Cookies: Bakery {
    
    override var desctiption: String { return "Cookies" }
    
    override func isSourdough() -> Bool {
        return false
    }
}

let bakeryMenu = [Bread(), SourdoughBread(), Cookies()]

for position in bakeryMenu {
    position.cook {
        print("Here is your hot fresh \(position.desctiption)\n")
    }
}
