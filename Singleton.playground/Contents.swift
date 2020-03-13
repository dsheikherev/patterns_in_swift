final class Singleton {
    
    static let instance = Singleton()
    
    private init() {}
    
    var someValue = 0
    
    func doSomething() {
        print("Val equals \(someValue)")
    }
}

let obj1 = Singleton.instance
obj1.someValue = 1

let obj2 = Singleton.instance
obj2.someValue = 2

obj1.doSomething()
obj2.doSomething()

print(obj1 === obj2)
