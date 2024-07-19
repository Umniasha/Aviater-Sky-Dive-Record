import Foundation

class PreFlight:Codable{
    var name : String
    var type : JumpType
    var country : String
    var city : String
    
    init(name: String, type: JumpType, country: String, city: String) {
        self.name = name
        self.type = type
        self.country = country
        self.city = city
    }
}
