//
//  AlphabetDetailsViewController.swift
//  Kids Teacher
//
//  Created by DigiCollect on 21/07/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class AlphabetDetailsViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var alphabetImage: UIImageView!
    @IBOutlet weak var barTitle: UILabel!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var selectedAlphabetIndex : Int?
    var navigationStatus = ""
    var bodyPartImageIndex : Int = 0
    var alphabetImagesArray = ["a","b","c","d","e","f","g","h","i","j","k","L","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    var bodypartImageArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21"]
    override func viewDidLoad() {
        super.viewDidLoad()
  
        setUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        backButton.addSoftUIEffectForButton()
        prevButton.addSoftUIEffectForButton()
        nextButton.addSoftUIEffectForButton()
    }

    func setUI(){
        backButton.addSoftUIEffectForButton()
        prevButton.addSoftUIEffectForButton()
        nextButton.addSoftUIEffectForButton()
        prevButton.layer.cornerRadius = 10
        nextButton.layer.cornerRadius = 10
        if navigationStatus == "BodyPart"{
            alphabetImage.image = UIImage(named: bodypartImageArray[bodyPartImageIndex])
        }else {
            alphabetImage.image = UIImage(named: alphabetImagesArray[selectedAlphabetIndex!])
        }
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if navigationStatus == "BodyPart"{
            if bodyPartImageIndex == 20{
                alphabetImage.image = UIImage(named: bodypartImageArray[bodyPartImageIndex])
            }else{
                bodyPartImageIndex = bodyPartImageIndex + 1
                alphabetImage.image = UIImage(named: bodypartImageArray[bodyPartImageIndex])
            }
        }else{
            if selectedAlphabetIndex == 25{
                       alphabetImage.image = UIImage(named: alphabetImagesArray[selectedAlphabetIndex!])
                   }else{
                       selectedAlphabetIndex = selectedAlphabetIndex! + 1
                       alphabetImage.image = UIImage(named: alphabetImagesArray[selectedAlphabetIndex!])
                   }
        }
    }
    
    @IBAction func prevButtonPressed(_ sender: Any) {
        if navigationStatus == "BodyPart"{
          if bodyPartImageIndex == 0{
                 alphabetImage.image = UIImage(named: bodypartImageArray[bodyPartImageIndex])
             }else{
                 bodyPartImageIndex = bodyPartImageIndex - 1
                 alphabetImage.image = UIImage(named: bodypartImageArray[bodyPartImageIndex])
             }
        }else{
            if selectedAlphabetIndex == 0{
                      alphabetImage.image = UIImage(named: alphabetImagesArray[selectedAlphabetIndex!])
                  }else{
                      selectedAlphabetIndex = selectedAlphabetIndex! - 1
                      alphabetImage.image = UIImage(named: alphabetImagesArray[selectedAlphabetIndex!])
                  }
        }
    }
}
