//
//  Instructor+CoreDataProperties.swift
//  Ski School
//
//  Created by Andi Setiyadi on 9/19/16.
//  Copyright © 2016 devhubs. All rights reserved.
//

import Foundation
import CoreData

extension Instructor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Instructor> {
        return NSFetchRequest<Instructor>(entityName: "Instructor");
    }

    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var lesson: Lesson?

}
