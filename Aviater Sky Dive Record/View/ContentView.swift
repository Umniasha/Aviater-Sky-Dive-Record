import SwiftUI

struct ContentView: View {
    @EnvironmentObject var flightData : FlightData
    var body: some View {
        ZStack{
            MenuView()
            if flightData.isFirstStart.1 {
                DisclaimerView(action: {
                    withAnimation {
                        flightData.isFirstStart.1 = false
                    }
                })
            }
            if flightData.isFirstStart.0 {
                WelcomView(action: {
                    withAnimation {
                        flightData.isFirstStart.0 = false
                    }
                })
            }
            
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(FlightData())
}
