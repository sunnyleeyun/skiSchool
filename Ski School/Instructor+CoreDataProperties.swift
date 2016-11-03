//
//  Instructor+CoreDataProperties.swift
//  Ski School
//
//  Created by Sunny on 2016/11/3.
//  Copyright © 2016年 devhubs. All rights reserved.
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
