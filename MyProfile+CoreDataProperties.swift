//
//  MyProfile+CoreDataProperties.swift
//  weightloss
//
//  Created by waqas ahmed on 24/02/2025.
//
//

import Foundation
import CoreData


extension MyProfile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyProfile> {
        return NSFetchRequest<MyProfile>(entityName: "MyProfile")
    }

    @NSManaged public var currentWeight: String?
    @NSManaged public var gender: String?
    @NSManaged public var height: String?
    @NSManaged public var targetWeight: String?

}

extension MyProfile : Identifiable {

}
