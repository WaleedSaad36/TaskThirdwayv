//
//  EX+UIViewController.swift
//  taskThirdwayvc
//
//  Created by Abdel-rahman Fahmi on 12/06/2022.
//

import Foundation
import UIKit
extension UIViewController {
    func convertURLImageToData(urls:String) -> Data{
        let imageURL = URL(string: urls)!
        guard  let imageData = try? Data(contentsOf: imageURL) else {return Data()}
        //let image = UIImage(data: imageData)
        return imageData
    }
}
