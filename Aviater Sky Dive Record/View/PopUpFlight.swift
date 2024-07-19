import SwiftUI

struct PopUpFlight: View {
    var isDelete : Bool = false
    var toHome:()->Void
    var stay:()->Void
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.black)
                VStack{
                    Text(isDelete ? "Are you sure you want to delete the flight? It cannot be recovered.":"Are you sure you want to exit? Unsaved data will not be saved.")
                        .font(.custom("Kumbh Sans", size: 14))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                   
                    HStack{
                        Button {
                            toHome()
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(red: 104/255, green: 104/255, blue: 104/255))
                                Text(isDelete ? "Yes, delete":"Yes, exit")
                                    .font(.custom("Kumbh Sans", size: 17))
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }

                        Button {
                            stay()
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(red: 194/255, green: 0, blue: 0))
                                Text(isDelete ? "No, keep":"No, stay")
                                    .font(.custom("Kumbh Sans", size: 17))
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }

                    }
                    .frame(height: 40)
                }
                .padding(.horizontal,40)
            }
            .frame(width: 350,height: 150)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.white, lineWidth: 1)
            )
        }
        .background{
            Color(.black)
                .opacity(0.6)
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    PopUpFlight(toHome: {}, stay: {})
}
