import SwiftUI

struct EndFlightView: View {
    var time : Double
    var action:()->Void
    var body: some View {
        VStack{
            VStack{
                Text("Time spent in flight:")
                    .font(.custom("Kumbh Sans", size: 20))
                Text("\(String(format: "%.2f", time))")
                    .font(.custom("Kumbh Sans", size: 65))
                Text("sec")
                    .font(.custom("Kumbh Sans", size: 25))
            }
            .foregroundStyle(.white)
            .bold()
            .padding(.top,200)
            Spacer()
            Button(action: {
                action()
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(Color(red: 194/255, green: 0, blue: 0))
                    Text("CONTINUE")
                        .font(.custom("Kumbh Sans", size: 17))
                        .foregroundStyle(.white)
                        .bold()
                }
            })
            .frame(width: 140,height: 40)
            .padding(.bottom,50)
        }
        .background{
            Image("endFlightBG")
                .resizable()
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    EndFlightView(time: 100.00, action: {})
}
