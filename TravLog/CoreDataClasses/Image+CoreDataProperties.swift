//
//  Image+CoreDataProperties.swift
//  TravLog
//
//  Created by asmaa gamal  on 03/11/2023.
//
//

import Foundation
import CoreData


extension TImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TImage> {
        return NSFetchRequest<TImage>(entityName: "TImage")
    }

    @NSManaged public var imageUrl: String?
    @NSManaged public var date: Date?
    @NSManaged public var trip: Trip?

}

extension TImage : Identifiable {

}
