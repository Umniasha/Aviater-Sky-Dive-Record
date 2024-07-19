import SwiftUI

struct FlightView: View {
    @StateObject private var locationManager = LocationManager()
    @EnvironmentObject var flightData : FlightData
    @State private var startAltitude:Double?
    @State private var flightTime:Double = 0
    @State private var timer : Timer?
    @State private var isEndFlight:Bool = false
    @State private var isPostFlight:Bool = false
    @State private var maxSpeed : Int = 0
    @State private var minSpeed : Int = 0
    
    var body: some View {
        ZStack{
            VStack{
                Text("Flight mode")
                    .font(.custom("Kumbh Sans", size: 20))
                    .foregroundStyle(.white)
                    .bold()
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.black)
                    Text("Сurrent altitude:\n\(Text("\(String(format:"%.0f", locationManager.altitude)) m").font(.custom("Kumbh Sans", size: 20)).bold())")
                        .font(.custom("Kumbh Sans", size: 17))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                }
                .frame(height: 90)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white, lineWidth: 1)
                )
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                    Text("Speed:\n\(Text("\(String(format:"%.0f", locationManager.speed)) km/h").font(.custom("Kumbh Sans", size: 20)).bold())")
                        .font(.custom("Kumbh Sans", size: 17))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                }
                .frame(height: 90)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white, lineWidth: 1)
                )
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                    Text("Flight time:\n\(Text("\(String(format:"%.2f", flightTime)) sec").font(.custom("Kumbh Sans", size: 20)).bold())")
                        .font(.custom("Kumbh Sans", size: 17))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                }
                .frame(height: 90)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white, lineWidth: 1)
                )
                Button {
                    timer?.invalidate()
                    flightData.flight = Flight(height: Int(startAltitude ?? 0), time: flightTime, speed: Int((startAltitude ?? 0)/flightTime),maxSpeed: maxSpeed,minSpeed: minSpeed)
                    isEndFlight = true
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(Color(red: 194/255, green: 0, blue: 0))
                        Text("FINISH FLIGHT")
                            .font(.custom("Kumbh Sans", size: 17))
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .frame(height: 70)
                }

                Spacer()
            }
            .padding(.horizontal)
            .background{
                Image("flightBG")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            }
            .onChange(of: locationManager.speed) { newValue in
                if Int(newValue) > maxSpeed {
                    maxSpeed = Int(newValue)
                }
            }
            if isEndFlight{
                EndFlightView(time: flightTime, action: {
                    isEndFlight = false
                    isPostFlight = true
                })
            }
            if isPostFlight{
                PostFlightSurveyView()
            }
        }
        .onAppear{
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
                self.flightTime += 0.01
            })
        }
        .onChange(of: locationManager.altitude) { newValue in
            if newValue > startAltitude ?? 0 {
                startAltitude = newValue
            }
        }
        .onDisappear{
            timer?.invalidate()
        }
    }
}

#Preview {
    FlightView()
        .environmentObject(FlightData())
}
