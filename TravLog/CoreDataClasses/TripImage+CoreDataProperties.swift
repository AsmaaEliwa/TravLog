//
//  TripImage+CoreDataProperties.swift
//  TravLog
//
//  Created by asmaa gamal  on 07/11/2023.
//
//

import Foundation
import CoreData


extension TripImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TripImage> {
        return NSFetchRequest<TripImage>(entityName: "TripImage")
    }

    @NSManaged public var date: Date?
    @NSManaged public var imageUrl: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var trip: Trip?

}

extension TripImage : Identifiable {

}
