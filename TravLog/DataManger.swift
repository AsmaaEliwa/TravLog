//
//  DataManger.swift
//  TravLog
//
//  Created by asmaa gamal  on 01/11/2023.
//

import Foundation
import CoreData
import SwiftUI
class DataManger{
    static let shared = DataManger()
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TravLog")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }else{
                print("loaded")
            }
        }
        return container
    }()
    
    func addUser(username:String , email:String , password:String){
        if let entity = NSEntityDescription.entity(forEntityName: "User", in: persistentContainer.viewContext){
            let user = NSManagedObject(entity: entity, insertInto: persistentContainer.viewContext)
            user.setValue(username, forKey: "username")
            user.setValue(password, forKey: "password")
            user.setValue(email, forKey: "email")
            
            do{
                try persistentContainer.viewContext.save()
                print("Sign Up")
            }catch{
                print(error)
            }
            
        }
        
        
    }
    
    func fetchUser(username:String) -> [User]{
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "username == %@" , username)
        do{
            let result = try persistentContainer.viewContext.fetch(request)
            return result
        }catch{
            print(error)
            return []
        }
        
        
        
    }
    
    func addImage(imageUrl: String , date:Date,trip:Trip )-> TripImage?{
        if let entity = NSEntityDescription.entity(forEntityName: "TripImage", in: persistentContainer.viewContext){
            let newImage = NSManagedObject(entity: entity, insertInto: persistentContainer.viewContext)
            newImage.setValue(imageUrl, forKey: "imageUrl")
            newImage.setValue(date, forKey: "date")
            SALocationManager.sharedInstance.getCurrentUserLocation { location in
                if let location = location {
                    print("User location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
                    // Now you can use the user's location in your code.
                    newImage.setValue(location.coordinate.latitude, forKey: "latitude")
                    newImage.setValue(location.coordinate.longitude, forKey: "longitude")
                } else {
                    print("Location not available yet. Waiting for an update...")
                }
            }
            
           
            if let tripImage = newImage as? TripImage {
                trip.addToImages(tripImage)
            }
            do {
                try persistentContainer.viewContext.save()
                print("image saved")
                return newImage as? TripImage
            } catch {
               print(error)
            }
        
        }
        return TripImage()
        
        
    }

    
    func saveTrip(user: User, title: String, details: String, date: Date, images: [UIImage?] , imageUrl:String) async {
        if let entity = NSEntityDescription.entity(forEntityName: "Trip", in: persistentContainer.viewContext) {
            if let newTrip = NSManagedObject(entity: entity, insertInto: persistentContainer.viewContext) as? Trip {
                newTrip.timestamp = Date()
                newTrip.title = title
                newTrip.details = details
                newTrip.date = date
                user.addToTrips(newTrip)
                if !imageUrl.isEmpty{
                    let imageAddress = await try? TImageMode().saveImageToFile(imageUrl)
                    addImage(imageUrl: imageAddress ?? "" , date: date , trip:  newTrip)
                }
                let imagesUrl = TImageMode().saveImagesToFile(images)
                for url in imagesUrl {
                 addImage(imageUrl: url, date: date , trip:  newTrip)
//
                }
                
                do {
                    try persistentContainer.viewContext.save()
                    
                    print("Trip added")
                } catch {
                    print(error)
                }
            }
        }
    }

    
    func deleteTrip(user:User , trip:Trip){
        user.removeFromTrips(trip)
        do {
            try persistentContainer.viewContext.save()
            
            print("Trip Deleted")
        } catch {
            print(error)
        }
        
    }

    
    
}
