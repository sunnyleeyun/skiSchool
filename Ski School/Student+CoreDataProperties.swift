//
//  Student+CoreDataProperties.swift
//  Ski School
//
//  Created by Sunny on 2016/11/3.
//  Copyright © 2016年 devhubs. All rights reserved.
//

import Foundation
import CoreData
 
//
extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student");
    }

    @NSManaged public var age: Int16
    @NSManaged public var name: String?
    @NSManaged public var parentContact: String?
    @NSManaged public var parentName: String?
    @NSManaged public var lesson: Lesson?

}
