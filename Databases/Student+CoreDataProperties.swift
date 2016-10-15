//
//  Student+CoreDataProperties.swift
//  Databases
//
//  Created by Electronic Armory on 10/15/16.
//  Copyright © 2016 Electronic Armory. All rights reserved.
//

import Foundation
import CoreData
 

extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student");
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var age: Int16
    @NSManaged public var courses: NSSet?

}

// MARK: Generated accessors for courses
extension Student {

    @objc(addCoursesObject:)
    @NSManaged public func addToCourses(_ value: Course)

    @objc(removeCoursesObject:)
    @NSManaged public func removeFromCourses(_ value: Course)

    @objc(addCourses:)
    @NSManaged public func addToCourses(_ values: NSSet)

    @objc(removeCourses:)
    @NSManaged public func removeFromCourses(_ values: NSSet)

}
