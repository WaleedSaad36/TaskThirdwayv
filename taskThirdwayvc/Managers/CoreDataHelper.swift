//
//  CoreDataHelper.swift
//  taskThirdwayvc
//
//  Created by Abdel-rahman Fahmi on 12/06/2022.
//

import UIKit
import CoreData
struct CoreDataHelper{
    private static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static func fetchDataProducts() -> [ProductList]?{
        if let data = try? self.context.fetch(ProductList.fetchRequest()) as? [ProductList]{
            return data
        }else{
        }
        return nil
    }
    
    
    static func saveData(id:Int,image:Data, price:Int, description:String,height:Int, width:Int){
        
        let list = ProductList(context: context)
        list.image = image
        list.price = Int16(price)
        list.descriptionProduct = description
        list.height = Int16(height)
        list.width = Int16(width)
        list.id = Int64(id)
        
        saveContext()
    }
    static func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
}
