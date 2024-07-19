import SwiftUI

@main
struct Aviater_Sky_Dive_RecordApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(FlightData())
        }
    }
}
