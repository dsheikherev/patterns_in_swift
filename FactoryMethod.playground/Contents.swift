import UIKit

protocol MilkProduct {
    var pasteurized: Bool { get }
    var sour: Bool { get }
    
    func printProductName()
}

protocol Factory {
    func create() -> MilkProduct
}

class Milk35: MilkProduct {
    var pasteurized: Bool
    var sour = false
    
    init(pasteurized: Bool) {
        self.pasteurized = pasteurized
    }
    
    func printProductName() {
        print("This is 3.5% fat milk")
    }
}

class SourCream: MilkProduct {
    var pasteurized: Bool
    var sour: Bool
    
    init(pasteurized: Bool, sour: Bool) {
        self.pasteurized = pasteurized
        self.sour = sour
    }
    
    func printProductName() {
        print("This is sour cream")
    }
}

class MilkFactory: Factory {
    func create() -> MilkProduct {
        return Milk35(pasteurized: true)
    }
}

class SourCreamFactory: Factory {
    func create() -> MilkProduct {
        return SourCream(pasteurized: true, sour: true)
    }
}


enum MilkProducts {
    case Milk35, SourCream
}

class LentaMall {
    func requestMilkProduct(_ type: MilkProducts) -> MilkProduct {
        let milkProduct: MilkProduct
        
        switch type {
            case .Milk35:
                milkProduct = MilkFactory().create()
            case .SourCream:
                milkProduct = SourCreamFactory().create()
        }
        milkProduct.printProductName()
        
        return milkProduct
    }
}

let lenta = LentaMall()
let prod = lenta.requestMilkProduct(.SourCream)
prod.pasteurized
