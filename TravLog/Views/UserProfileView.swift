//
//  UserProfileView.swift
//  TravLog
//
//  Created by asmaa gamal  on 02/11/2023.
//

import SwiftUI

struct UserProfileView: View {
    @AppStorage("username") var storedUsername:String?
    @AppStorage("isLogIn") var isLogIn:Bool?
    @State var showAddTripSheet = false
    @State var tripLabel = ""
    @State var tripdetails = ""
    @State var tripImageURL = ""
    @State var selectedImage: [UIImage?]
    @State var tripDate: Date = Date()
    @State var user : User?
  
    var body: some View {
        VStack{
            HStack{
                LogOutBtn()
                Spacer()
                Button{
                    showAddTripSheet = true
                }label: {
                    Label("Add Trip",systemImage: "plus")
                }
               
            }.padding()
            Text("Welcome Back \(storedUsername ?? "")").foregroundColor(.green).font(.system(size: 25 , weight: .medium)).shadow(color: .blue, radius: 10)
            Divider()
            Spacer()
            
            List {
                ForEach(Array(user?.trips as? Set<Trip> ?? []), id: \.self) { trip in
                    Text(trip.details ?? "")
                }
            }
            
                .sheet(isPresented: $showAddTripSheet, content: {
                    VStack(spacing:30){
                        Text("New Trip !").foregroundColor(.green).font(.system(size: 25 , weight: .medium)).shadow(color: .blue, radius: 10).padding(.top)
                        Divider()
                        input(label: "Trip Title" , placeholder: "Enter Title", text: $tripLabel)
                        input(label: "Trip Details" , placeholder: "Enter Details", text: $tripdetails)
                      DateInput(label: "Trip Date", placeholder: "Choose the Date", text: $tripDate)
                        ImageInput(label: "Upload Image", selectedImages: $selectedImage).padding(.bottom)
                        Button{
                            
                        }label: {
                            Label("Save",systemImage: "heart.fill").foregroundColor(.green).shadow(color: .blue, radius: 10)

                        }.padding()
                        Spacer()
                    }.padding()
                })
            
            
        }.onAppear {
            user =   DataManger.shared.fetchUser(username: storedUsername ?? "")[0]
            
        }
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView( selectedImage: [])
//            .previewDisplayName("User Profile View")
//            .environment(\.colorScheme, .light)
//            .environment(\.sizeCategory, .large)
//    }
//}
