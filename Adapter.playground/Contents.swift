protocol BMRImperialCalc {
    func bmr(height: Double, weight: Double, age: Int) -> Int
}

struct BMRCalculator: BMRImperialCalc {
    func bmr(height: Double, weight: Double, age: Int) -> Int {
        return Int(66 + (6.2 * weight) + (12.7 * height) - (6.76 * Double(age)))
    }
}

protocol BMRMetricCalc {
    func metricBMR(height: Double, weight: Double, age: Int) -> String
}

struct BMRCalculatorAdapter: BMRMetricCalc {
    
    private var adaptee: BMRImperialCalc
    
    init(adaptee: BMRImperialCalc) {
        self.adaptee = adaptee
    }
    
    func metricBMR(height: Double, weight: Double, age: Int) -> String {
        let iHeight = height * 3.28084
        let iWeight = weight * 2.20462
        let result = adaptee.bmr(height: iHeight, weight: iWeight, age: age)
        return "BMR is \(result). \(result > 1000 ? "High." : "Low.")"
    }
}

struct Person {
    func checkBMR(calculator: BMRMetricCalc) {
        print(calculator.metricBMR(height: 1.7, weight: 69, age: 32))
    }
}

let person = Person()
person.checkBMR(calculator: BMRCalculatorAdapter(adaptee: BMRCalculator()))
