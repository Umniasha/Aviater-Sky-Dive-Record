import SwiftUI

struct DisclaimerView: View {
    var action:()->Void
    var body: some View {
        VStack(spacing:5){
            Text("Disclaimer")
                .font(.custom("Kumbh Sans", size: 35))
                .foregroundStyle(.white)
                .bold()
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.black)
                VStack{
                    Text("Our application is merely a tool; data may differ from reality. Please use the application wisely and cautiously.")
                        .font(.custom("Kumbh Sans", size: 14))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,23)
                        .padding(.top)
                    Button {
                        action()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color(red: 194/255, green: 0, blue: 0))
                                .padding()
                            Text("Got it, I'll proceed with caution")
                                .font(.custom("Kumbh Sans", size: 15))
                                .foregroundStyle(.white)
                                .textCase(.uppercase)
                                .bold()
                        }
                    }

                }
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
    DisclaimerView(action: {})
}
