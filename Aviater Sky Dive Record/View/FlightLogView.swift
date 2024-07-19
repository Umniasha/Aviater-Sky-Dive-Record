import SwiftUI

struct FlightLogView: View {
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    @EnvironmentObject var flightData : FlightData
    @State private var flightArray : [FlightLog] = []
    @State private var page : Int = 0
    @State private var isPopUp = false
    
    let rows = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        ZStack{
            VStack{
                ScrollView(showsIndicators:false){
                    ZStack{
                        HStack{
                            Button {
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image("homeBtn")
                            }
                            Spacer()
                        }
                        Text("Flight log")
                            .font(.custom("Kumbh Sans", size: 20))
                            .foregroundStyle(.white)
                            .bold()
                    }
                    ZStack{
                        HStack{
                            Button(action: {
                                if page > 0 {
                                    page-=1
                                }
                            }, label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .opacity(0.7)
                                    Image(systemName: "arrowtriangle.left.fill")
                                        .foregroundStyle(.white)
                                }
                            })
                            .opacity(page <= 0 ? 0.7:1)
                            .disabled(page <= 0)
                            .frame(width: 40,height: 40)
                            Spacer()
                            Button(action: {
                                if page < flightArray.count-1{
                                    page+=1
                                }
                            }, label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .opacity(0.7)
                                    Image(systemName: "arrowtriangle.right.fill")
                                        .foregroundStyle(.white)
                                }
                            })
                            .opacity(page >= flightArray.count-1 ? 0.7:1)
                            .disabled(page >= flightArray.count-1)
                            .frame(width: 40,height: 40)
                        }
                        .foregroundStyle(.black.opacity(0.7))
                        Text(flightArray.count > 0 ? "\(formattedDate(flightArray[page].date))" : "NOT FOUND")
                            .font(.custom("Kumbh Sans", size: 17))
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .padding(.bottom,5)
                    
                    if !flightArray.isEmpty {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.black)
                                VStack(spacing:30){
                                    VStack{
                                        HStack{
                                            Text("Flight name")
                                                .font(.custom("Kumbh Sans", size: 17))
                                                .foregroundStyle(.white)
                                                .bold()
                                            Spacer()
                                        }
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                            HStack{
                                                Text("\(flightArray[page].preFlight.name)")
                                                    .font(.custom("Kumbh Sans", size: 14))
                                                Spacer()
                                                Image(systemName: "pencil")
                                            }
                                            .foregroundStyle(.white)
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 40)
                                    }
                                    
                                    VStack{
                                        HStack{
                                            Text("Jump type")
                                                .font(.custom("Kumbh Sans", size: 17))
                                                .foregroundStyle(.white)
                                                .bold()
                                            Spacer()
                                        }
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                            HStack{
                                                Text("\(flightArray[page].preFlight.type)")
                                                    .font(.custom("Kumbh Sans", size: 14))
                                                    .foregroundStyle(.white)
                                                Spacer()
                                            }
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 40)
                                    }
                                    
                                    VStack{
                                        HStack{
                                            Text("Jump location")
                                                .font(.custom("Kumbh Sans", size: 17))
                                                .foregroundStyle(.white)
                                                .bold()
                                            Spacer()
                                        }
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                            HStack{
                                                Text("\(flightArray[page].preFlight.city)")
                                                    .font(.custom("Kumbh Sans", size: 14))
                                                    .foregroundStyle(.white)
                                                Spacer()
                                            }
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 40)
                                        
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                            HStack{
                                                Text("\(flightArray[page].preFlight.country)")
                                                    .font(.custom("Kumbh Sans", size: 14))
                                                    .foregroundStyle(.white)
                                                Spacer()
                                            }
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 40)

                                    }
                                    
                                    if flightArray[page].afterFlight == nil{
                                        
                                    }else {
                                        VStack{
                                            HStack{
                                                Text("The flight overall was...")
                                                    .font(.custom("Kumbh Sans", size: 17))
                                                    .foregroundStyle(.white)
                                                    .bold()
                                                Spacer()
                                            }
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                                HStack{
                                                    Text("\(flightArray[page].afterFlight?.overall.rawValue ?? "")")
                                                        .font(.custom("Kumbh Sans", size: 14))
                                                        .foregroundStyle(.white)
                                                    Spacer()
                                                    Image(flightArray[page].afterFlight!.overall.rawValue)
                                                }
                                                .padding(.horizontal)
                                            }
                                            .frame(height: 40)
                                        }
                                        
                                        VStack{
                                            HStack{
                                                Text("Your body position during freefall\nwas...")
                                                    .font(.custom("Kumbh Sans", size: 17))
                                                    .foregroundStyle(.white)
                                                    .frame(height: 50)
                                                    .bold()
                                                Spacer()
                                            }
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                                HStack{
                                                    Text("\(flightArray[page].afterFlight?.bodyPosition.rawValue ?? "")")
                                                        .font(.custom("Kumbh Sans", size: 14))
                                                        .foregroundStyle(.white)
                                                    Spacer()
                                                    Image(flightArray[page].afterFlight!.bodyPosition.rawValue)
                                                }
                                                .padding(.horizontal)
                                            }
                                            .frame(height: 40)
                                        }
                                        
                                        
                                        VStack{
                                            HStack{
                                                Text("Photos")
                                                    .font(.custom("Kumbh Sans", size: 17))
                                                    .foregroundStyle(.white)
                                                    .bold()
                                                Spacer()
                                            }
                                            if !flightArray[page].afterFlight!.images.isEmpty {
                                            LazyVGrid(columns: rows ){
                                                ForEach(flightArray[page].afterFlight!.images.indices,id: \.self){index in
                                                    if let uiImage = UIImage(data: flightArray[page].afterFlight!.images[index]) {
                                                        ZStack{
                                                            Image(uiImage: uiImage)
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.width*0.4)
                                                                .clipped()
                                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        }
                                                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.width*0.4)
                                                    }
                                                }
                                            }
                                        }
                                        }
                                        if flightArray[page].afterFlight!.notes.count>0 {
                                            VStack{
                                                HStack{
                                                    Text("Personal Notes:")
                                                        .font(.custom("Kumbh Sans", size: 17))
                                                        .foregroundStyle(.white)
                                                        .bold()
                                                    Spacer()
                                                }
                                                
                                                
                                                ZStack{
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                                    HStack(alignment: .top){
                                                        Text("\(flightArray[page].afterFlight!.notes)")
                                                            .font(.custom("Kumbh Sans", size: 14))
                                                            .foregroundStyle(.white)
                                                            .bold()
                                                        Spacer()
                                                    }
                                                    .padding()
                                                }
                                            }
                                        }
                                    }
                                    
                                    Button(action: {
                                        isPopUp = true
                                    }, label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle( Color(red: 194/255, green: 0, blue: 0) )
                                            Text("DELETE")
                                                .font(.custom("Kumbh Sans", size: 20))
                                                .foregroundStyle(.white)
                                                .bold()
                                        }
                                    })
                                    .frame(height: 70)
                                }
                                .padding()
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.white)
                        }

                    }
                }
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
                PopUpFlight(isDelete: true) {
                    withAnimation(.spring) {
                        if page == flightArray.count-1 {
                            page -= 1
                            flightArray.remove(at: page+1)
                        } else {
                            flightArray.remove(at: page)
                        }
                        flightData.flightArray = flightArray
                    }
                    isPopUp = false
                } stay: {
                    isPopUp = false
                }

            }
        }
        .onAppear{
            flightArray = flightData.flightArray
            page = flightArray.count-1
        }
    }
    func formattedDate(_ date: Date) -> String {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "dd.MM.yyyy"
          return dateFormatter.string(from: date)
      }
}

#Preview {
    FlightLogView()
        .environmentObject(FlightData())
}
