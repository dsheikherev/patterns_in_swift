protocol Chair {
    var title: String { get }
    var numberOfLegs: Int { get }
}

class ClassicWoodenChair: Chair {
    var title: String = "Classic 4 legs wooden chair"
    var numberOfLegs: Int = 4
}

class ModernWithoutLegsChair: Chair {
    var title: String = "Modern chair with no legs"
    var numberOfLegs: Int = 0
}

protocol Table {
    var title: String { get }
    var isWooden: Bool { get }
}

class ClassicWoodenTable: Table {
    var title: String = "Classic wooden table"
    var isWooden: Bool = true
}

class ModernTable: Table {
    var title: String = "Modern non-wooden table"
    var isWooden: Bool = false
}

protocol FurnitureFactory {
    func createChair() -> Chair
    func createTable() -> Table
}

class ClassicWoodenFurnitureFactory: FurnitureFactory {
    func createChair() -> Chair {
        return ClassicWoodenChair()
    }
    
    func createTable() -> Table {
        return ClassicWoodenTable()
    }
}

class ModernFurnitureFactory: FurnitureFactory {
    func createChair() -> Chair {
        return ModernWithoutLegsChair()
    }
    
    func createTable() -> Table {
        return ModernTable()
    }
}

func orderFurniture(factory: FurnitureFactory) {
    print("You ordered:")
    print(factory.createChair().title)
    print(factory.createTable().title)
}

orderFurniture(factory: ClassicWoodenFurnitureFactory())
print("\n")
orderFurniture(factory: ModernFurnitureFactory())
