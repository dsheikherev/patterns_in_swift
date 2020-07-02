import UIKit

protocol Coffee {
    func cost() -> Double
    func ingredients() -> String
}

// All coffee drinks are based on Espresso
// Espresso is default implementation of Coffee
final class Espresso: Coffee {
    
    func cost() -> Double {
        return 50.0
    }
    
    func ingredients() -> String {
        return "Espresso"
    }
}

class BaseCoffeeDecorator: Coffee {
    
    private var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    func cost() -> Double {
        return coffee.cost()
    }
    
    func ingredients() -> String {
        return coffee.ingredients()
    }
}

final class MilkDecorator: BaseCoffeeDecorator {
    
    override func cost() -> Double {
        return super.cost() + 10.0
    }
    
    override func ingredients() -> String {
        return super.ingredients() + " and Milk"
    }
}

final class ChocolateDecorator: BaseCoffeeDecorator {
    
    override func cost() -> Double {
        return super.cost() + 20.0
    }
    
    override func ingredients() -> String {
        return super.ingredients() + " and Chocolate"
    }
}

final class IceCreamDecorator: BaseCoffeeDecorator {
    
    override func cost() -> Double {
        return super.cost() + 30.0
    }
    
    override func ingredients() -> String {
        return super.ingredients() + " and Ice-Cream"
    }
}


let espresso = Espresso()
let cappuccino = MilkDecorator(coffee: espresso)
let cappuccinoWithChocolateAndIceCream = IceCreamDecorator(coffee: ChocolateDecorator(coffee: cappuccino))


print(cappuccino.ingredients())
print(cappuccino.cost())
print("\n")
print(cappuccinoWithChocolateAndIceCream.ingredients())
print(cappuccinoWithChocolateAndIceCream.cost())
print("\n")
