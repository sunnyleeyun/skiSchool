//
//  Lesson+CoreDataProperties.swift
//  Ski School
//
//  Created by Sunny on 2016/11/3.
//  Copyright © 2016年 devhubs. All rights reserved.
//

import Foundation
import CoreData
 

extension Lesson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lesson> {
        return NSFetchRequest<Lesson>(entityName: "Lesson");
    }

    @NSManaged public var level: String?
    @NSManaged public var sport: String?
    @NSManaged public var instructor: Instructor?
    @NSManaged public var student: NSSet?

}

// MARK: Generated accessors for student
extension Lesson {

    @objc(addStudentObject:)
    @NSManaged public func addToStudent(_ value: Student)

    @objc(removeStudentObject:)
    @NSManaged public func removeFromStudent(_ value: Student)

    @objc(addStudent:)
    @NSManaged public func addToStudent(_ values: NSSet)

    @objc(removeStudent:)
    @NSManaged public func removeFromStudent(_ values: NSSet)

}
