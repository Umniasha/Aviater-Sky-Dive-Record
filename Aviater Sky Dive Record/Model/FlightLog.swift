import Foundation

class FlightLog : Codable {
    var date: Date
    var preFlight: PreFlight
    var flight: Flight
    var afterFlight: AfterFlight?
    
    init(date: Date, preFlight: PreFlight, flight: Flight, afterFlight: AfterFlight? = nil) {
        self.date = date
        self.preFlight = preFlight
        self.flight = flight
        self.afterFlight = afterFlight
    }
}
