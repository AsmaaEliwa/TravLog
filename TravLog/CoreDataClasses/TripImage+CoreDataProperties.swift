//
//  TripImage+CoreDataProperties.swift
//  TravLog
//
//  Created by asmaa gamal  on 04/11/2023.
//
//

import Foundation
import CoreData


extension TripImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TripImage> {
        return NSFetchRequest<TripImage>(entityName: "TripImage")
    }

    @NSManaged public var imageUrl: String?
    @NSManaged public var date: Date?
    @NSManaged public var trip: Trip?

}

extension TripImage : Identifiable {

}
