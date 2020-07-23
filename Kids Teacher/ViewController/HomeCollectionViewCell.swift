//
//  HomeCollectionViewCell.swift
//  Kids Teacher
//
//  Created by DigiCollect on 21/07/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var optionBGImage: UIImageView!
    @IBOutlet weak var optionName: UILabel!
    
    override func awakeFromNib() {
        optionBGImage.layer.cornerRadius = 20
    }
}
