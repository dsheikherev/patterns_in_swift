import Foundation

/// MARK: - Prototype pattern implementation that uses clone() method

final class ComplicatedObject {

    private var configuration: Data

    init(url: URL) {
        let manager  = WebManager()
        self.configuration = manager.getData(with: url)
    }

    init(object: ComplicatedObject) {
        self.configuration = object.configuration
    }

    func clone() -> ComplicatedObject {
        return ComplicatedObject(object: self)
    }
}

final class WebManager {

    func getData(with url: URL) -> Data {
        return Data()
    }
}

let object = ComplicatedObject(url: URL(fileURLWithPath: ""))
let clone = object.clone()
print(object === clone)

let anotherObject = object
print(object === anotherObject)

/// MARK: - Another Prototype pattern implementation with NSCopying protocol

class BaseClass: NSCopying, Equatable {
    
    private var baseIntVal: Int = 1
    private var baseStringVal: String = "Val"
    
    required init(intVal: Int = 1, stringVal: String = "Val") {
        self.baseIntVal = intVal
        self.baseStringVal = stringVal
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let prototype = type(of: self).init()
        prototype.baseIntVal = baseIntVal
        prototype.baseStringVal = baseStringVal
        return prototype
    }
    
    static func == (lhs: BaseClass, rhs: BaseClass) -> Bool {
        return lhs.baseIntVal == rhs.baseIntVal && lhs.baseStringVal == rhs.baseStringVal
    }
}

class SubClass: BaseClass {
    
    private var subBoolVal = true
    
    func copy() -> Any {
        return copy(with: nil)
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        guard let prototype = super.copy(with: zone) as? SubClass else {
            return SubClass()
        }
        prototype.subBoolVal = subBoolVal
        return prototype
    }
}

let original = SubClass(intVal: 2, stringVal: "Val2")
let copy = original.copy() as! SubClass
print(original === copy)
