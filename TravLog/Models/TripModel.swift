//
//  TripModel.swift
//  TravLog
//
//  Created by asmaa gamal  on 04/11/2023.
//

import Foundation
import SwiftUI
import CoreData
class TripModel: ObservableObject{
    @AppStorage("username") var storedUsername:String?
    @Published var loggedinuser: User?
    
    init() {
        var users = DataManger.shared.fetchUser(username: storedUsername ?? "")
        if !users.isEmpty {
            loggedinuser = users[0]
        }
    }
    func addTrip(user: User, title: String, details: String, date: Date, images: [UIImage?] , imageUrl: String) async{
        await DataManger.shared.saveTrip(user: user, title: title, details: details, date: date, images: images , imageUrl: imageUrl)
        loggedinuser = DataManger.shared.fetchUser(username: storedUsername ?? "")[0]
    }
    
    func deleteTrip(user:User , trip:Trip){
        DataManger.shared.deleteTrip(user:user , trip:trip)
        loggedinuser = DataManger.shared.fetchUser(username: storedUsername ?? "")[0]
    }
    func updateUserProfileView() {
        objectWillChange.send()
    }

}
