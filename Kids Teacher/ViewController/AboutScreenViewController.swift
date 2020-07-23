//
//  AboutScreenViewController.swift
//  Kids Teacher
//
//  Created by DigiCollect on 22/07/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class AboutScreenViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    override func viewWillAppear(_ animated: Bool) {
           setGradientBackground()
           super.viewWillAppear(animated)
    }
    
    func setUI(){
        backButton.addSoftUIEffectForButton()
        myImage.layer.cornerRadius = myImage.bounds.width / 2
    }
    
    //for gradient Color
    func setGradientBackground() {
        let colorTop =  UIColor(red: 31.0/255.0, green: 28.0/255.0, blue: 44.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 146.0/255.0, green: 141.0/255.0, blue: 171.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
