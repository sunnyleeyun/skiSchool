//
//  StudentService.swift
//  Ski School
//
//  Created by Andi Setiyadi on 9/3/16.
//  Copyright © 2016 devhubs. All rights reserved.
//

import Foundation
import CoreData

class StudentService {
    static func getStudents(selectedSport: String, managedObjectContext: NSManagedObjectContext) -> [Student] {
        let request: NSFetchRequest<Student> = Student.fetchRequest()
        request.predicate = NSPredicate(format: "lesson.sport == %@", selectedSport)
        request.propertiesToFetch = ["name","age"]
        
        do {
            let students = try managedObjectContext.fetch(request)
            return students
        }
        catch {
            fatalError()
        }
    }
    
    static func saveStudent(studentData: [String: AnyObject], managedObjectContext: NSManagedObjectContext) {
        
    }
    
    static func new(managedObjectContext: NSManagedObjectContext) -> Student {
        let student = Student(context: managedObjectContext)
        let lesson = Lesson(context: managedObjectContext)
        let instructor = Instructor(context: managedObjectContext)
        
        lesson.instructor = instructor
        student.lesson = lesson
        
        return student
    }
}
