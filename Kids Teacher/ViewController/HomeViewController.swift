//
//  HomeViewController.swift
//  Kids Teacher
//
//  Created by DigiCollect on 21/07/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    var homeOptionArray = ["Alphabets","Numbers","Days","Months","Pre Math","Part's of Body"]
    var homeImageIconArray = [#imageLiteral(resourceName: "abc"),#imageLiteral(resourceName: "numbers"),#imageLiteral(resourceName: "days3"),#imageLiteral(resourceName: "months"),#imageLiteral(resourceName: "maths"),#imageLiteral(resourceName: "body")]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        setUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    override func viewDidLayoutSubviews() {
        setGradientBackground()
    }
    
    func setUI(){
        navigationController?.navigationBar.isHidden = true
        detailsButton.addSoftUIEffectForButton()
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
    
    @IBAction func detailsButtonPressed(_ sender: Any) {
        let aboutvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AboutScreenViewController") as? AboutScreenViewController
        self.navigationController?.pushViewController(aboutvc!, animated: true)
    }
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        homeCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeOptionArray.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let homeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        homeCell.optionName.text = homeOptionArray[indexPath.row]
        homeCell.optionBGImage.image = homeImageIconArray[indexPath.row]
        return homeCell
      }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EnglishAlphabetsViewController") as? EnglishAlphabetsViewController
            vc?.screenStatus = "Alphabet"
            self.navigationController?.pushViewController(vc!, animated: true)
        case 1:
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EnglishAlphabetsViewController") as? EnglishAlphabetsViewController
            vc?.screenStatus = "Numbers"
            self.navigationController?.pushViewController(vc!, animated: true)
        case 2:
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EnglishAlphabetsViewController") as? EnglishAlphabetsViewController
            vc?.screenStatus = "Days"
            self.navigationController?.pushViewController(vc!, animated: true)
        case 3:
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EnglishAlphabetsViewController") as? EnglishAlphabetsViewController
            vc?.screenStatus = "Months"
            self.navigationController?.pushViewController(vc!, animated: true)
        case 4:
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EnglishAlphabetsViewController") as? EnglishAlphabetsViewController
            vc?.screenStatus = "Math"
            self.navigationController?.pushViewController(vc!, animated: true)
        case 5:
            let bodyvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AlphabetDetailsViewController") as? AlphabetDetailsViewController
            bodyvc?.navigationStatus = "BodyPart"
            self.navigationController?.pushViewController(bodyvc!, animated: true)
        default:
            print("default")
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: homeCollectionView.bounds.width / 2 - 40 , height: homeCollectionView.bounds.width / 2 - 40)
    }

}
