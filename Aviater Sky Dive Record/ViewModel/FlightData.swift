import Foundation

class FlightData: ObservableObject{
    let dataManager = DataManager.shared
    init(){
        self.flightArray = dataManager.flightArray
        self.isFirstStart = dataManager.isFirstStart
    }
    @Published var flightArray: [FlightLog] {
            didSet {
                dataManager.flightArray = flightArray
            }
        }
    @Published var isFirstStart:(Bool,Bool) {
        didSet {
            dataManager.isFirstStart = isFirstStart
        }
    }

    @Published var preFlight : PreFlight?
    @Published var flight : Flight?
    @Published var afterFlight : AfterFlight?
    
    func createLog(){
        if let preFlight = preFlight, let flight = flight {
            flightArray.append(FlightLog(date: Date(), preFlight: preFlight, flight: flight, afterFlight: afterFlight))
        }
        preFlight = nil
        flight = nil
        afterFlight = nil
    }
    
    func createStatistic()->[String]{
        var totatalHeight : Int = 0
        var averageHeight : Int {
            return flightArray.isEmpty ? 0 : totatalHeight/flightArray.count
        }
        var maxHeight : Int = 0
        var minHeight : Int = 0
        var totalTime : Int = 0
        var averageTime : Int {
            return flightArray.isEmpty ? 0 : totalTime/flightArray.count
        }
        var maxTime : Int = 0
        var minTime : Int = 0
        var totalSpeed : Int = 0
        var averageSpeed : Int {
            return flightArray.isEmpty ? 0 : totalSpeed/flightArray.count
        }
        var maxSpeed : Int = 0
        var minSpeed : Int = 0
        
        if !flightArray.isEmpty{
            for flight in flightArray {
                totatalHeight += flight.flight.height
                if maxHeight < flight.flight.height {
                    maxHeight = flight.flight.height
                }
                if minHeight > flight.flight.height {
                    minHeight = flight.flight.height
                }
                totalTime += Int(flight.flight.time)
                if maxTime < Int(flight.flight.time) {
                    maxTime = Int(flight.flight.time)
                }
                if minTime > Int(flight.flight.time) || minTime == 0{
                    minTime = Int(flight.flight.time)
                }
                totalSpeed += flight.flight.speed
                if minSpeed > Int(flight.flight.speed) || minTime == 0{
                    minSpeed = Int(flight.flight.speed)
                }
                if maxSpeed < Int(flight.flight.maxSpeed) {
                    maxSpeed = Int(flight.flight.maxSpeed)
                }
            }
        }
        let array : [String] = ["\(totatalHeight) m",
                                "\(averageHeight) m",
                                "\(maxHeight) m",
                                "\(minHeight) m",
                                "\(totalTime) sec",
                                "\(averageTime) sec",
                                "\(maxTime) sec",
                                "\(minTime) sec",
                                "\(averageSpeed) km/h",
                                "\(maxSpeed) km/h",
                                "\(minSpeed) km/h"]
        return array
    }
}
