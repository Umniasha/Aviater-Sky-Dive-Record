import Foundation

class Flight:Codable{
    var height : Int
    var time : Double
    var speed : Int
    var maxSpeed : Int
    var minSpeed : Int
    
    init(height: Int, time: Double, speed: Int, maxSpeed: Int, minSpeed: Int) {
        self.height = height
        self.time = time
        self.speed = speed
        self.maxSpeed = maxSpeed
        self.minSpeed = minSpeed
    }
}
