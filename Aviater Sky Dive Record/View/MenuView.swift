import SwiftUI

struct MenuView: View {
    @StateObject private var locationManager = LocationManager()
    @EnvironmentObject var flightData : FlightData
    let height = UIScreen.main.bounds.height/UIScreen.main.bounds.width >= 2 ? UIScreen.main.bounds.height*0.42:UIScreen.main.bounds.height*0.45
    let statisticArray : [String] = [
        "Total height of all jumps:",
        "Average height:",
        "Maximum height:",
        "Minimum height:",
        "Total flight time:",
        "Average time:",
        "Maximum flight time:",
        "Minimum flight time:",
        "Average speed:",
        "Maximum speed:",
        "Minimum speed:"]
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    HStack{
                        NavigationLink {
                            InfoView()
                        } label: {
                            Image("InfoBtn")
                        }
                        Spacer()
                        NavigationLink {
                            FlightLogView()
                        } label: {
                            Image("flightLog")
                        }

                    }
                    ZStack{
                        Image("menuFrame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        HStack{
                            Text("\(Text("Flight Mode").bold().font(.custom("Kumbh Sans", size: 20)))\nStart your flight and discover\nreal-time information about your journey!")
                                .font(.custom("Kumbh Sans", size: 13))
                                .foregroundStyle(.white)
                                .lineSpacing(2)
                            Spacer()
                            NavigationLink {
                                FlightModeView()
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(Color(red: 194/255, green: 0, blue: 0))
                                        .frame(width: 90,height: 90)
                                    Image(systemName: "arrow.right")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 40))
                                        .bold()
                                }
                            }

                        }
                        .padding(18)
                    }
                    .frame(height: 120)
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color(red: 194/255, green: 0, blue: 0))
                        VStack{
                            Text("Current altitude above sea level:")
                                .font(.custom("Kumbh Sans", size: 13))
                                .foregroundStyle(.white)
                                .bold()
                            Text("\(String(format:"%.0f", locationManager.altitude)) m")
                                .font(.custom("Kumbh Sans", size: 25))
                                .foregroundStyle(.white)
                                .bold()
                        }
                    }
                    .frame(width: 280,height: 70)
                    
                }
                .frame(height:height)
                Spacer()
                Text("Flight Statistics")
                    .font(.custom("Kumbh Sans", size: 20))
                    .foregroundStyle(.white)
                    .bold()
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                    VStack(spacing:0){
                        ForEach(statisticArray.indices, id: \.self){i in
                            HStack{
                                Text(statisticArray[i])
                                Spacer()
                                HStack{
                                    
                                    Text("\(flightData.createStatistic()[i])")
                                        .lineLimit(1)
                                    Spacer()
                                }
                                    .frame(width: 80)
                            }
                            .font(.custom("Kumbh Sans", size: 13))
                            .foregroundStyle(.white)
                            .minimumScaleFactor(0.5)
                            .bold()
                            .padding(.horizontal)
                            .frame(height: height/CGFloat(statisticArray.count))
                            .background(i%2 == 1 ? Color(red: 32/255, green: 32/255, blue: 32/255):.black)
                        }
                    }
                    
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white, lineWidth: 1)
                )
                .frame(height:UIScreen.main.bounds.height/UIScreen.main.bounds.width >= 2 ? UIScreen.main.bounds.height*0.42:UIScreen.main.bounds.height*0.45)
                .padding(.top,5)
                .padding(.bottom,UIScreen.main.bounds.height/UIScreen.main.bounds.width >= 2 ? 0:5)
            }
            .padding(.horizontal)
            .background{
                Image("welcomeBG")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    MenuView()
        .environmentObject(FlightData())
}
