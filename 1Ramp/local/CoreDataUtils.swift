//
//  CoreDataUtils.swift
//  1Ramp
//
//  Created by Ankit Kumar on 28/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
import CoreData

class CoreDataUtils{
    private let USER_ENTITY: String = "UserEntity"
    
    //Return managed context for accessting core data
    private func getManagedContext() -> NSManagedObjectContext{
        return AppDelegate.sharedInstance().persistentContainer.viewContext
    }
    
    /*
     Insert a new row with key:value
     */
    private func insertNewValue(forKey: String, value: Any){
        let context = getManagedContext()
        let entity = NSEntityDescription.entity(forEntityName: USER_ENTITY, in: context)
        let row = NSManagedObject(entity: entity!, insertInto: context)
        row.setValue(value, forKey: forKey)
        do{
            try context.save()
        }catch let saveException{
            print(saveException)
        }
    }
    
    /*
     Checks for the existing row, insert if no row exists else update the value
     */
    func udpateOrInsertNewValue(forKey: String, value: Any){
        let context = getManagedContext()
        let row = getRow()
        if row != nil{
            //update the value
            do{
                row?.setValue(value, forKey: forKey)
                try context.save()
            }catch let err{
                print("error: \(err)")
            }
        }else{
            //insert new row
            insertNewValue(forKey: forKey, value: value)
        }
    }
  
    /*
     Return value of a given key
     */
    func getValue(forKey: String) -> Any?{
        if let row = getRow(){
            return row.value(forKey: forKey)
        }
        return nil
    }
    
    /*
     Returns first row or nil (if no row exists)
     */
    private func getRow() -> NSManagedObject?{
        let managedContext = getManagedContext()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: USER_ENTITY)
        do{
            let records = try managedContext.fetch(fetchRequest)
            if records.count>0 {
                return records[0]
            }
        }catch let err{
            print(err)
        }
        return nil
    }
    
    //delete
    func deleteRow(){
        let context = getManagedContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: USER_ENTITY)
        fetchRequest.returnsObjectsAsFaults = false
        do
        {
            let results = try context.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                context.delete(managedObjectData)
                try context.save()
            }
        } catch let error as NSError {
            print("Deleted all my data in myEntity error : \(error) \(error.userInfo)")
        }
    }
}
