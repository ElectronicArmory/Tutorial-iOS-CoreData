//
//  ViewController.swift
//  Databases
//
//  Created by Electronic Armory on 10/15/16.
//  Copyright © 2016 Electronic Armory. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let studentClassName:String = String(describing: Student.self)
        let courseClassName:String  = String(describing: Course.self)
        
        let student:Student = NSEntityDescription.insertNewObject(forEntityName: studentClassName, into: DatabaseController.getContext()) as! Student
        student.firstName = "John"
        student.lastName  = "Smith"
        student.age = 23
        
        let course:Course = NSEntityDescription.insertNewObject(forEntityName: courseClassName, into: DatabaseController.getContext()) as! Course
        course.courseName = "Computer Science 402"
        
        
        student.addToCourses(course)
//        course.addToStudents(student)
        
        DatabaseController.saveContext()
        
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        
        do{
            let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
            print("number of results: \(searchResults.count)")
            
            for result in searchResults as [Student]{
                print("\(result.firstName!) \(result.lastName!) is \(result.age) years old.")
            }
        }
        catch{
            print("Error: \(error)")
        }
        
//        DatabaseController.getContext().delete(student)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

