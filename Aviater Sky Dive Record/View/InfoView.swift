import SwiftUI

struct InfoView: View {
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack{
            ScrollView(showsIndicators:false){
                ZStack{
                    HStack{
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image("homeBtn")
                        }

                        Spacer()
                    }
                    Text("Info")
                        .font(.custom("Kumbh Sans", size: 20))
                        .foregroundStyle(.white)
                        .bold()
                }
                Image("infoinfo")
            }
            .navigationBarHidden(true)
        }
        .padding(.horizontal)
        .background{
            Image("flightModeBG")
                .resizable()
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    InfoView()
}
