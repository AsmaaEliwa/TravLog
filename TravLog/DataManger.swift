//
//  DataManger.swift
//  TravLog
//
//  Created by asmaa gamal  on 01/11/2023.
//

import Foundation
import CoreData
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
    
    
    
    
    
    
    
}
