import SwiftUI

struct WelcomView: View {
    var action: ()->Void
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Text("Hey there, skydiver!")
                    .font(.custom("Kumbh Sans", size: 30))
                    .foregroundStyle(.white)
                    .bold()
                Text("\nTrack, log, and analyze your jumps with ease!\nFrom real-time flight data in Flight Mode to detailed jump records in the Flight Log, and comprehensive statistics in Flight Statistics, we're here to enhance every moment of your skydiving experience!\n")
                    .font(.custom("Kumbh Sans", size: 16))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .minimumScaleFactor(0.5)
                Text("Happy flying!")
                    .font(.custom("Kumbh Sans", size: 30))
                    .foregroundStyle(.white)
                    .bold()
                Button(action: {
                    action()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(Color(red: 194/255, green: 0, blue: 0))
                        Text("LAUNCH")
                            .font(.custom("Kumbh Sans", size: 20))
                            .foregroundStyle(.white)
                            .bold()
                    }
                })
                .frame(width: 344,height: 70)
                .padding(.bottom)
            }
            .frame(height: UIScreen.main.bounds.height*0.45)
        }
        .background{
            Image("welcomeBG")
                .resizable()
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    WelcomView(action: {})
}
