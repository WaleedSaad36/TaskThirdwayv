//
//  ProductListCell.swift
//  taskThirdwayvc
//
//  Created by Abdel-rahman Fahmi on 11/06/2022.
//

import UIKit

class ProductListCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configrationCell(data:ProductListResponse){
        
        self.image.loadImage(with: data.image.url )
        print("imageData \(data.image.url)")
        self.descriptionLbl.text = data.productDescription
        self.priceLbl.text = String(data.price)
    }
    

}
