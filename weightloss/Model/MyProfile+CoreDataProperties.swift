//
//  MyProfile+CoreDataProperties.swift
//  weightloss
//
//  Created by waqas ahmed on 21/02/2025.
//
//

import Foundation
import CoreData


extension MyProfile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyProfile> {
        return NSFetchRequest<MyProfile>(entityName: "MyProfile")
    }

    @NSManaged public var currentWeight: Float
    @NSManaged public var gender: String?
    @NSManaged public var height: Float
    @NSManaged public var targetWeight: Float

}

extension MyProfile : Identifiable {

}
