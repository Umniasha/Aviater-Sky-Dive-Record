import SwiftUI

struct FlightModeView: View {
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    @EnvironmentObject var flightData : FlightData
    @State private var name = ""
    @State private var city = ""
    @State private var country = ""
    @State private var jumpType:JumpType? = nil
    
    @State private var isPopUp: Bool = false
    @State private var isFlight: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    HStack{
                        Button {
                            isPopUp = true
                        } label: {
                            Image("homeBtn")
                        }
                        Spacer()
                    }
                    Text("Flight mode")
                        .font(.custom("Kumbh Sans", size: 20))
                        .foregroundStyle(.white)
                        .bold()
                }
                ZStack(alignment:.leading){
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.black)
                    VStack{
                        HStack{
                            Text("Flight name")
                                .font(.custom("Kumbh Sans", size: 17))
                                .bold()
                            Spacer()
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                            HStack{
                                TextField("Name", text: $name)
                                Image(systemName: "pencil")
                                    .bold()
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 40)
                        HStack{
                            Text("\(Text("Jump type").bold()) (Choose one)")
                                .font(.custom("Kumbh Sans", size: 17))
                            Spacer()
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                            HStack{
                                Image(systemName:jumpType == .tandem ?  "square.inset.filled":"square")
                                Text("Tandem")
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 40)
                        .onTapGesture {
                            jumpType = .tandem
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                            HStack{
                                Image(systemName:jumpType == .solo ?  "square.inset.filled":"square")
                                Text("Solo")
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 40)
                        .onTapGesture {
                            jumpType = .solo
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                            HStack{
                                Image(systemName:jumpType == .wingsuit ?  "square.inset.filled":"square")
                                Text("Wingsuit")
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 40)
                        .onTapGesture {
                            jumpType = .wingsuit
                        }
                        
                        HStack{
                            Text("Jump location")
                                .font(.custom("Kumbh Sans", size: 17))
                                .bold()
                            Spacer()
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                            HStack{
                                TextField("City", text: $city)
                                Image(systemName: "pencil")
                                    .bold()
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 40)
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                            HStack{
                                TextField("Country", text: $country)
                                Image(systemName: "pencil")
                                    .bold()
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 40)
                        Button {
                            UIApplication.shared.endEditing()
                            isFlight = true
                            flightData.preFlight = PreFlight(name: name, type: jumpType ?? .solo, country: country, city: city)
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle((name.count>0 && city.count>0 && country.count>0 && jumpType != nil) ? Color(red: 194/255, green: 0, blue: 0):Color(red: 104/255, green: 104/255, blue: 104/255))
                                Text("LET’S FLY!")
                                    .font(.custom("Kumbh Sans", size: 20))
                                    .bold()
                            }
                        }
                        .disabled((name.count==0 || city.count==0 || country.count==0 || jumpType==nil))
                    }
                    .font(.custom("Kumbh Sans", size: 14))
                    .foregroundStyle(.white)
                    .padding()
                }
                .frame(height: 500)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white,lineWidth: 1)
                }
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
                Spacer()
                    .navigationBarHidden(true)
            }
            .padding(.horizontal)
            .background{
                Image("flightModeBG")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
            }
            if isPopUp {
                PopUpFlight(toHome: {
                    flightData.preFlight = nil
                    presentationMode.wrappedValue.dismiss()
                }, stay: {
                    isPopUp = false
                })
            }
            if isFlight {
                FlightView()
            }
        }
    }
}

#Preview {
    FlightModeView()
        .environmentObject(FlightData())
}
