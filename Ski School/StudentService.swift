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
        request.predicate = NSPredicate(format: "sport == %@", selectedSport)
        request.propertiesToFetch = ["name","age","level"]
        
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
}
