//
//  EnglishAlphabetCollectionViewCell.swift
//  Kids Teacher
//
//  Created by DigiCollect on 21/07/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class EnglishAlphabetCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var alphabetOutlet: UILabel!
    
    override func awakeFromNib() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .brown
    }
}
