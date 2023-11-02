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
    @State var selectedImage: UIImage?
    @State var tripDate: Date = Date()
  
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
            Text("Welcome Back \(storedUsername ?? "")").foregroundColor(.green).font(.system(size: 30 , weight: .medium)).shadow(color: .blue, radius: 10)
            Divider()
            Spacer()
            
//            List {
//                ForEach(Array(user?.trips as? Set<Trip> ?? []), id: \.self) { trip in
//                    Text(trip.title ?? "")
//                }
//            }
            
                .sheet(isPresented: $showAddTripSheet, content: {
                    VStack(spacing:30){
                        input(label: "Trip Title" , placeholder: "Enter Title", text: $tripLabel)
                        input(label: "Trip Details" , placeholder: "Enter Details", text: $tripdetails)
                      DateInput(label: "Trip Date", placeholder: "Choose the Date", text: $tripDate)
                        ImageInput(label: "Upload Image", selectedImage: $selectedImage)
                        Button{
                            
                        }label: {
                            Label("Save",systemImage: "heart.fill").foregroundColor(.green).shadow(color: .blue, radius: 10)
                        }
                    }.padding()
                })
            
            
        }
       
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
            .previewDisplayName("User Profile View")
            .environment(\.colorScheme, .light)
            .environment(\.sizeCategory, .large)
    }
}
