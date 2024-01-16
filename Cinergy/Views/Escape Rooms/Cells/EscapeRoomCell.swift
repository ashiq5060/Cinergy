//
//  EscapeRoomCell.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 13/01/24.
//

import UIKit

class EscapeRoomCell: UICollectionViewCell {
    
    @IBOutlet weak var imgEsacpeRoom: UIImageView!
    @IBOutlet weak var lblRoomName: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            // Set corner radius for the imageView
        imgEsacpeRoom.layer.cornerRadius = 10  // Set your desired corner radius
            
    
    }
    
}


