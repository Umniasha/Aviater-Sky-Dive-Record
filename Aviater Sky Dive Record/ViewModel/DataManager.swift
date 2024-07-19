import Foundation

class DataManager{
    static let shared = DataManager()
    
    var isFirstStart: (Bool, Bool) {
        get {
            if let values = UserDefaults.standard.array(forKey: "isFirstStart") as? [Bool], values.count == 2 {
                return (values[0], values[1])
            } else {
                return (true, true)
            }
        }
        set {
            UserDefaults.standard.set([newValue.0, newValue.1], forKey: "isFirstStart")
        }
    }

    
    var flightArray: [FlightLog] {
            get {
                if let data = UserDefaults.standard.data(forKey: "FlightLog") {
                    let decoder = JSONDecoder()
                    return (try? decoder.decode([FlightLog].self, from: data)) ?? []
                }
                return []
            }
            set {
                let encoder = JSONEncoder()
                if let data = try? encoder.encode(newValue) {
                    UserDefaults.standard.set(data, forKey: "FlightLog")
                }
            }
        }
    private init(){
        if UserDefaults.standard.object(forKey: "FlightLog") == nil {
                isFirstStart = (true,true)
        }
    }
}
