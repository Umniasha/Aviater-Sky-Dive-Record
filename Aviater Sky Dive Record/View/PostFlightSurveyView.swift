import SwiftUI
import PhotosUI

struct PostFlightSurveyView: View {
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    @EnvironmentObject var flightData : FlightData
    @State private var note: String = ""
    @State private var showPhotosPicker = false
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImagesData: [Data] = []
    @State private var flightOverall : FlightOverall?
    @State private var bodyPosition : BodyPosition?
    let rows = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var body: some View {
        VStack{
            ScrollView(showsIndicators:false){
                HStack{
                    Text("Post-Flight Survey")
                        .font(.custom("Kumbh Sans", size: 20))
                        .foregroundStyle(.white)
                        .bold()
                    Spacer()
                    Button {
                        flightData.createLog()
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 140,height: 40)
                                .foregroundStyle(.black.opacity(0.7))
                            Text("SKIP")
                                .font(.custom("Kumbh Sans", size: 20))
                                .foregroundStyle(.white)
                                .bold()
                        }
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.black)
                    VStack(spacing:30){
                        VStack{
                            HStack{
                                Text("How was the flight overall?")
                                    .font(.custom("Kumbh Sans", size: 17))
                                    .foregroundStyle(.white)
                                    .bold()
                                Spacer()
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                HStack{
                                    Image(systemName:flightOverall == .excellent ?  "square.inset.filled":"square")
                                        .foregroundStyle(.white)
                                    Text("Excellent")
                                        .font(.custom("Kumbh Sans", size: 14))
                                        .foregroundStyle(.white)
                                    Spacer()
                                    Image("Excellent")
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 40)
                            .onTapGesture {
                                flightOverall = .excellent
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                HStack{
                                    Image(systemName:flightOverall == .good ?  "square.inset.filled":"square")
                                        .foregroundStyle(.white)
                                    Text("Good")
                                        .font(.custom("Kumbh Sans", size: 14))
                                        .foregroundStyle(.white)
                                    Spacer()
                                    Image("Good")
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 40)
                            .onTapGesture {
                                flightOverall = .good
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                HStack{
                                    Image(systemName:flightOverall == .average ?  "square.inset.filled":"square")
                                        .foregroundStyle(.white)
                                    Text("Average")
                                        .font(.custom("Kumbh Sans", size: 14))
                                        .foregroundStyle(.white)
                                    Spacer()
                                    Image("Average")
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 40)
                            .onTapGesture {
                                flightOverall = .average
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                HStack{
                                    Image(systemName:flightOverall == .poor ?  "square.inset.filled":"square")
                                        .foregroundStyle(.white)
                                    Text("Poor")
                                        .font(.custom("Kumbh Sans", size: 14))
                                        .foregroundStyle(.white)
                                    Spacer()
                                    Image("Poor")
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 40)
                            .onTapGesture {
                                flightOverall = .poor
                            }
                        }
                        
                        VStack{
                            HStack{
                                Text("How was your body position during \nfreefall?")
                                    .font(.custom("Kumbh Sans", size: 17))
                                    .foregroundStyle(.white)
                                    .bold()
                                    .frame(height: 50)
                                Spacer()
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                HStack{
                                    Image(systemName:bodyPosition == .stable ?  "square.inset.filled":"square")
                                        .foregroundStyle(.white)
                                    Text("Stable")
                                        .font(.custom("Kumbh Sans", size: 14))
                                        .foregroundStyle(.white)
                                    Spacer()
                                    Image("Stable")
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 40)
                            .onTapGesture {
                                bodyPosition = .stable
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                HStack{
                                    Image(systemName:bodyPosition == .slightlyUnstable ?  "square.inset.filled":"square")
                                        .foregroundStyle(.white)
                                    Text("Slightly unstable")
                                        .font(.custom("Kumbh Sans", size: 14))
                                        .foregroundStyle(.white)
                                    Spacer()
                                    Image("Slightly unstable")
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 40)
                            .onTapGesture {
                                bodyPosition = .slightlyUnstable
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                HStack{
                                    Image(systemName:bodyPosition == .unstable ?  "square.inset.filled":"square")
                                        .foregroundStyle(.white)
                                    Text("Unstable")
                                        .font(.custom("Kumbh Sans", size: 14))
                                        .foregroundStyle(.white)
                                    Spacer()
                                    Image("Unstable")
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 40)
                            .onTapGesture {
                                bodyPosition = .unstable
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color(red: 32/255, green: 32/255, blue: 32/255))
                                HStack{
                                    Image(systemName:bodyPosition == .veryUnstuble ?  "square.inset.filled":"square")
                                        .foregroundStyle(.white)
                                    Text("Very unstable")
                                        .font(.custom("Kumbh Sans", size: 14))
                                        .foregroundStyle(.white)
                                    Spacer()
                                    Image("Very unstable")
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 40)
                            .onTapGesture {
                                bodyPosition = .veryUnstuble
                            }
                        }
                       
                        VStack{
                            HStack{
                                Text("Would you like to add any photos?")
                                    .font(.custom("Kumbh Sans", size: 17))
                                    .foregroundStyle(.white)
                                    .bold()
                                Spacer()
                            }
                        if selectedItems.count > 0 {
                            LazyVGrid(columns: rows ){
                                ForEach(selectedImagesData.indices,id: \.self){index in
                                    if let uiImage = UIImage(data: selectedImagesData[index]) {
                                        ZStack{
                                            Image(uiImage: uiImage)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.width*0.4)
                                                .clipped()
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                            HStack{
                                                Spacer()
                                                VStack{
                                                    Button(action: {
                                                        withAnimation(.spring) {
                                                            selectedImagesData.remove(at: index)
                                                            selectedItems.remove(at: index)
                                                        }
                                                    }, label: {
                                                        Image(systemName: "xmark")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 20))
                                                            .padding(10)
                                                            .bold()
                                                    })
                                                    Spacer()
                                                }
                                            }
                                        }
                                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.width*0.4)
                                    }
                                }
                            }
                        }
                        PhotosPicker(
                            selection: $selectedItems,
                            maxSelectionCount: 8,
                            matching: .images,
                            photoLibrary: .shared()) {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(Color(red: 194/255, green: 0, blue: 0))
                                        Text("ADD IMAGE")
                                            .font(.custom("Kumbh Sans", size: 14))
                                            .foregroundStyle(.white)
                                            .bold()
                                }
                                .frame(height: 40)
                            }
                            .onChange(of: selectedItems) { newItems in
                                Task {
                                    var newImagesData: [Data] = []
                                    for item in newItems {
                                        if let data = try? await item.loadTransferable(type: Data.self) {
                                            withAnimation {
                                                newImagesData.append(data)
                                            }
                                        }
                                    }
                                    selectedImagesData = newImagesData
                                }
                            }
                        }
                        
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
                                    TextField("Emotions, feelings...", text: $note,axis: .vertical)
                                        .lineLimit(3...4)
                                        .font(.custom("Kumbh Sans", size: 14))
                                        .foregroundStyle(.white)
                                    
                                    Image(systemName: "pencil")
                                        .foregroundStyle(.white)
                                        .bold()
                                }
                                    .padding()
                            }
                        }
                        
                        Button(action: {
                            if let flightOverall = flightOverall, let bodyPosition = bodyPosition{
                                flightData.afterFlight = AfterFlight(overall: flightOverall, bodyPosition: bodyPosition, images: selectedImagesData, notes:note)
                            }
                            flightData.createLog()
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(flightOverall != nil && bodyPosition != nil  ? Color(red: 194/255, green: 0, blue: 0) : Color(red: 104/255, green: 104/255, blue: 104/255))
                                Text("SAVE TO FLIGHT LOG")
                                    .font(.custom("Kumbh Sans", size: 20))
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        })
                        .frame(height: 70)
                        .disabled(flightOverall == nil || bodyPosition == nil )
                    }
                    .padding()
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white)
                }
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            }
        }
        .padding(.horizontal)
        .background{
            Image("flightBG")
                .resizable()
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
        }
    }
}

#Preview {
    PostFlightSurveyView()
        .environmentObject(FlightData())
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
