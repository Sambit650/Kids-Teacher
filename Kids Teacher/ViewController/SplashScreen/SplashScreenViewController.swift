//
//  SplashScreenViewController.swift
//  Kids Teacher
//
//  Created by DigiCollect on 22/07/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var kidsButton: UIButton!
    @IBOutlet weak var logoimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setGradientBackground()
       setUI()
    }
    override func viewWillAppear(_ animated: Bool) {
           setGradientBackground()
           super.viewWillAppear(animated)

    }
    func setUI(){
        kidsButton.addSoftUIEffectForButton(cornerRadius: 10, themeColor: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
        logoimage.layer.cornerRadius = 20
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                   let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                   let dashboardController = mainStoryboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
                   dashboardController.modalPresentationStyle = .fullScreen
                   self.present(dashboardController, animated: true, completion: nil)
               }
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

}
