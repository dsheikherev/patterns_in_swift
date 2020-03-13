protocol Observable {
    
    func addObserver(_ observer: Observer)
    func deleteObserver(_ observer: Observer)
    func notifyObservers()
}

protocol Observer {
    
    var id: String { get set }
    func update(property: String, value: Any?)
}

final class CentralBankOfRU: Observable {
    
    var usdRubExch: Double? {
        didSet {
            notifyObservers()
        }
    }
    
    private var observers = [Observer]()
    
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    func deleteObserver(_ observer: Observer) {
        guard let index = observers.enumerated().first(where: { $0.element.id == observer.id })?.offset else { return }
        
        observers.remove(at: index)
    }
    
    func notifyObservers() {
        observers.forEach { $0.update(property: "USD/RUB", value: usdRubExch) }
    }
}

final class ExchangeOffice: Observer {
    var id: String
    
    func update(property: String, value: Any?) {
        guard let val = value as? Double else { return }
        
        print("\(id) exchanges \(property) at \(val + 5)")
    }
    
    init(_ id: String) {
        self.id = id
    }
}

let cb = CentralBankOfRU()

let sberExchange = ExchangeOffice("SberOffice")
let tenkoffExchange = ExchangeOffice("Tenkoff")

cb.addObserver(sberExchange)
cb.addObserver(tenkoffExchange)

cb.usdRubExch = 65.1
cb.usdRubExch = 70.2

cb.deleteObserver(tenkoffExchange)

cb.usdRubExch = 71.0
