//
//  ProductList+CoreDataProperties.swift
//  taskThirdwayvc
//
//  Created by Abdel-rahman Fahmi on 12/06/2022.
//
//

import Foundation
import CoreData


extension ProductList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductList> {
        return NSFetchRequest<ProductList>(entityName: "ProductList")
    }

    @NSManaged public var descriptionProduct: String?
    @NSManaged public var height: Int16
    @NSManaged public var id: Int64
    @NSManaged public var image: Data?
    @NSManaged public var price: Int16
    @NSManaged public var width: Int16

}

extension ProductList : Identifiable {

}
