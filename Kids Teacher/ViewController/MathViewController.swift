//
//  MathViewController.swift
//  Kids Teacher
//
//  Created by DigiCollect on 23/07/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class MathViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var firstTextfield: UITextField!
    @IBOutlet weak var secondTextfield: UITextField!
    @IBOutlet weak var operationSign: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var equalButton: UIButton!
    
    var selectedOption : Int = 0
    var results = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    func setUI(){
        backButton.addSoftUIEffectForButton()
        equalButton.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        equalButton.layer.borderWidth = 2.0
        equalButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        equalButton.layer.cornerRadius = 20
        operationSign.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        operationSign.layer.borderWidth = 2.0
        operationSign.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        firstTextfield.softUIEffectForView(cornerRadius: 10, themeColor: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
        secondTextfield.softUIEffectForView(cornerRadius: 10, themeColor: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
        equalButton.addSoftUIEffectForButton(cornerRadius: 10, themeColor: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
        
        if selectedOption == 0{
            headerLabel.text = "Addition"
            operationSign.text = "+"
        }else if selectedOption == 1{
            headerLabel.text = "Subtraction"
            operationSign.text = "-"
        }else if selectedOption == 2{
            headerLabel.text = "Multiplication"
            operationSign.text = "*"
        }else if selectedOption == 3{
            headerLabel.text = "Division"
            operationSign.text = "/"
        }
    }
    override func viewWillAppear(_ animated: Bool) {
          setGradientBackground()
          super.viewWillAppear(animated)
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
    @IBAction func equalButtonPressed(_ sender: Any) {
        if firstTextfield.text == "" || secondTextfield.text == ""{
            //print("Fill the box")
            let alert = UIAlertController(title: "All Textfield are not filled", message: "Please Fill the Box", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            let input1 = Int(firstTextfield.text ?? "0")
            let input2 = Int(secondTextfield.text ?? "0")
            if selectedOption == 0{
                results = (input1 ?? 0) + (input2 ?? 0)
                resultLabel.text = String(results)
            }else if selectedOption == 1{
                results = (input1 ?? 0) - (input2 ?? 0)
                resultLabel.text = String(results)
            }else if selectedOption == 2{
                results = (input1 ?? 0) * (input2 ?? 0)
                resultLabel.text = String(results)
            }else if selectedOption == 3{
                results = (input1 ?? 0) / (input2 ?? 0)
                resultLabel.text = String(results)
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

