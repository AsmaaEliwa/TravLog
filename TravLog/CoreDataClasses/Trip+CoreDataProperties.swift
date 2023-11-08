//
//  Trip+CoreDataProperties.swift
//  TravLog
//
//  Created by asmaa gamal  on 07/11/2023.
//
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var date: Date?
    @NSManaged public var details: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var title: String?
    @NSManaged public var images: NSSet?
    @NSManaged public var user: User?

}

// MARK: Generated accessors for images
extension Trip {

    @objc(addImagesObject:)
    @NSManaged public func addToImages(_ value: TripImage)

    @objc(removeImagesObject:)
    @NSManaged public func removeFromImages(_ value: TripImage)

    @objc(addImages:)
    @NSManaged public func addToImages(_ values: NSSet)

    @objc(removeImages:)
    @NSManaged public func removeFromImages(_ values: NSSet)

}

extension Trip : Identifiable {

}
