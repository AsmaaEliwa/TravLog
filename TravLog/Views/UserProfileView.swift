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
    @State var  user:User?
    @ObservedObject var tripModel:TripModel = TripModel()
    @State var shouldReload = false
    func reset(){
        tripLabel = ""
        tripdetails = ""
        selectedImage = []
    }
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
            Text("Welcome Back \(storedUsername ?? "")").foregroundColor(.green).font(.system(size: 20 , weight: .medium)).shadow(color: .blue, radius: 10)
            Divider()
            Spacer()
            
            ScrollView {
                VStack(spacing:30){
                    ForEach(Array(tripModel.loggedinuser?.trips as? Set<Trip> ?? []), id: \.self) { trip in
                        //                    Text(trip.details ?? "")
                        TripView( trip: trip , tripModel: tripModel).padding()
                    }
                }
            }
            Spacer()
                .sheet(isPresented: $showAddTripSheet, content: {
                    VStack(spacing:30){
                        Text("New Trip !").foregroundColor(.green).font(.system(size: 25 , weight: .medium)).shadow(color: .blue, radius: 10).padding(.top)
                        Divider()
                        input(label: "Trip Title" , placeholder: "Enter Title", text: $tripLabel)
                        input(label: "Trip Details" , placeholder: "Enter Details", text: $tripdetails)
                      DateInput(label: "Trip Date", placeholder: "Choose the Date", text: $tripDate)
                        ImageInput(label: "Upload Image", selectedImages: $selectedImage).padding(.bottom)
                        Button{
                            TripModel().addTrip(user: tripModel.loggedinuser ?? User(), title: tripLabel, details: tripdetails, date: tripDate, images: selectedImage)
                            showAddTripSheet = false
                            shouldReload.toggle()
                            reset()
                            tripModel.updateUserProfileView()
                        }label: {
                            Label("Save",systemImage: "heart.fill").foregroundColor(.green).shadow(color: .blue, radius: 10)

                        }.padding()
                        Spacer()
                    }.padding()
                })
              
            
        }
//        .onAppear {
//            if isLogIn == true {
//                user = DataManger.shared.fetchUser(username: storedUsername ?? "")[0]
//            }
//        }
     
        }
    }
//}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView( selectedImage: [])
//            .previewDisplayName("User Profile View")
//            .environment(\.colorScheme, .light)
//            .environment(\.sizeCategory, .large)
//    }
//}
