//
//  EnglishAlphabetsViewController.swift
//  Kids Teacher
//
//  Created by DigiCollect on 21/07/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class EnglishAlphabetsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var barTitle: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var alphabetsCollectionView: UICollectionView!
    
    var alphabetsArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var numbersArray = ["1","2","3","4","5","6","7","8","9","0"]
    var daysArray = ["Sunday","Monday","Tuesday","Wednessday","Thursday","Friday","Saturday"]
    var monthsArray = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    var mathArray = ["Addition","Subtraction","Multiplication","Division"]
    var screenStatus = "Alphabet"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        alphabetsCollectionView.delegate = self
        alphabetsCollectionView.dataSource = self
        setUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    func setUI(){
        backButton.addSoftUIEffectForButton()
        numbersArray.removeAll()
               for i in 1...99{
                   numbersArray.append(String(i))
               }
        
        if screenStatus == "Alphabet"{
            barTitle.text = "English Alphabets"
        }else if screenStatus == "Numbers"{
            barTitle.text = "Numbers"
        }else if screenStatus == "Days"{
            barTitle.text = "Days"
        }else if screenStatus == "Months"{
            barTitle.text = "Months"
        }else if screenStatus == "Math"{
            barTitle.text = "Pre Math"
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
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        alphabetsCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if screenStatus == "Alphabet"{
            return alphabetsArray.count
        }else if screenStatus == "Numbers"{
            return numbersArray.count
        }else if screenStatus == "Days"{
            return daysArray.count
        }else if screenStatus == "Months"{
            return monthsArray.count
        }else if screenStatus == "Math"{
            return mathArray.count
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let alphabetCell = alphabetsCollectionView.dequeueReusableCell(withReuseIdentifier: "EnglishAlphabetCollectionViewCell", for: indexPath) as! EnglishAlphabetCollectionViewCell
        if screenStatus == "Alphabet"{
            alphabetCell.alphabetOutlet.text = alphabetsArray[indexPath.row]
        }else if screenStatus == "Numbers"{
            alphabetCell.alphabetOutlet.text = numbersArray[indexPath.row]
            alphabetCell.contentView.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        }else if screenStatus == "Days"{
           alphabetCell.alphabetOutlet.text = daysArray[indexPath.row]
            alphabetCell.contentView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        }else if screenStatus == "Months"{
            alphabetCell.alphabetOutlet.text = monthsArray[indexPath.row]
            alphabetCell.contentView.backgroundColor = #colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 0.7424015411)
        }else if screenStatus == "Math"{
            alphabetCell.alphabetOutlet.text = mathArray[indexPath.row]
            alphabetCell.contentView.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        }
        return alphabetCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if screenStatus == "Alphabet"{
            return CGSize(width: 80 , height: 80)
        }else if screenStatus == "Numbers"{
            return CGSize(width: 100, height: 100)
        }else if screenStatus == "Days" || screenStatus == "Months"{
            return CGSize(width: alphabetsCollectionView.bounds.width - 30, height: 100)
        }else if screenStatus == "Math"{
            return CGSize(width: alphabetsCollectionView.bounds.width - 30, height: 150)
        }else{
            return CGSize(width: 80 , height: 80)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if screenStatus == "Alphabet"{
                let detailsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AlphabetDetailsViewController") as? AlphabetDetailsViewController
            detailsVC?.selectedAlphabetIndex = indexPath.row
                self.navigationController?.pushViewController(detailsVC!, animated: true)
        }else if screenStatus == "Math"{
            let mathVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MathViewController") as? MathViewController
            mathVC?.selectedOption = indexPath.row
                self.navigationController?.pushViewController(mathVC!, animated: true)
        }
    }
}
