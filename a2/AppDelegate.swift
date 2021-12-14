//
//  AppDelegate.swift
//  a2
//
//  Created by Matthew Beerens on 19/10/21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    // store student
    func storeStudent(fName: String, lName: String, gender: String, age: Int, address: String, course: String, studentId: Int)
    {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Student", in: context)
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        transc.setValue(fName, forKey: "fName")
        transc.setValue(lName, forKey: "lName")
        transc.setValue(age, forKey: "age")
        transc.setValue(gender, forKey: "gender")
        transc.setValue(address, forKey: "address")
        transc.setValue(course, forKey: "course")
        transc.setValue(studentId, forKey: "studentId")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("could not save \(error), \(error.userInfo)")
        } catch { }
    }
    
    // get Students
    func getStudents() -> [[String]]
    {
        var students = [[String]]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            let searchResults = try getContext().fetch(fetchRequest)
            for trans in searchResults as [NSManagedObject]
            {
                let studentId = String(trans.value(forKey: "studentId") as! Int)
                let fName = trans.value(forKey: "fName")
                let lName = trans.value(forKey: "lName")
                let gender = trans.value(forKey: "gender")
                let age = String(trans.value(forKey: "age") as! Int)
                let course = trans.value(forKey: "course")
                let address = trans.value(forKey: "address")
                
                var student = [String]()
                student.append(studentId)
                student.append(fName as! String)
                student.append(lName as! String)
                student.append(gender as! String)
                student.append(age)
                student.append(course as! String)
                student.append(address as! String)
                students.append(student)
            }
        } catch {
            print("error with request: \(error)")
        }
        return students
    }
    
    // delete student
    func removeStudent(id : String)
    {
        let context = getContext()
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        let predicate = NSPredicate(format: "studentId == %@", id as CVarArg)
        deleteFetch.predicate = predicate
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("error \(error)")
        }
    }
    
    // update student
    func updateStudent(fName: String, lName: String, age: Int, gender: String, address: String, course: String, id: String)
    {
        let context = getContext()
        
        let entity = NSEntityDescription.entity(forEntityName: "Student", in: context)
        
        let request = NSFetchRequest<NSFetchRequestResult>()
        request.entity = entity
        
        let predicate = NSPredicate(format: "studentId == %@", id as CVarArg)
        
        request.predicate = predicate
                
        do {
            let results = try context.fetch(request)
            let studentUpdate = results[0] as! NSManagedObject
            studentUpdate.setValue(fName, forKey: "fName")
            studentUpdate.setValue(lName, forKey: "lName")
            studentUpdate.setValue(gender, forKey: "gender")
            studentUpdate.setValue(address, forKey: "address")
            studentUpdate.setValue(age, forKey: "age")
            studentUpdate.setValue(course, forKey: "course")
            do {
                try context.save()
            } catch let error as NSError {
                print("could not save \(error)")
            }
        } catch let error as NSError {
            print("could not save \(error), \(error.userInfo)")
        } catch { }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "a2")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

