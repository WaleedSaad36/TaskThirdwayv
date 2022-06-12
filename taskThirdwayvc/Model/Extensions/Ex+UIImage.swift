//
//  Ex+UIImage.swift
//  taskThirdwayvc
//
//  Created by Abdel-rahman Fahmi on 11/06/2022.
//

import Foundation
import UIKit
extension UIImageView{
    func loadImage(with link :String){
        guard let url = URL(string: link) else {return}
        DispatchQueue.global().async { [weak self ] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

