import Foundation

class AfterFlight:Codable{
    var overall : FlightOverall
    var bodyPosition : BodyPosition
    var images : [Data]
    var notes : String
    
    init(overall: FlightOverall, bodyPosition: BodyPosition, images: [Data], notes: String) {
        self.overall = overall
        self.bodyPosition = bodyPosition
        self.images = images
        self.notes = notes
    }
}
