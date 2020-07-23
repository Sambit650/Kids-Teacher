//
//  NeumophismUI.swift
//  Kids Teacher
//
//  Created by DigiCollect on 21/07/20.
//  Copyright © 2020 sambit. All rights reserved.
//

import UIKit

extension UIButton {
    
    override open var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                 setState()
            } else {
                 resetState()
            }
        }
    }
    
    override open var isEnabled: Bool {
        didSet{
            if isEnabled == false {
                setState()
            } else {
                resetState()
            }
        }
    }
    
    func setState(){
        self.layer.shadowOffset = CGSize(width: -2, height: -2)
        self.layer.sublayers?[0].shadowOffset = CGSize(width: 2, height: 2)
        self.contentEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 0, right: 0)
    }
    
    func resetState(){
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.sublayers?[0].shadowOffset = CGSize(width: -2, height: -2)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 2)
    }
    
    public func addSoftUIEffectForButton(cornerRadius: CGFloat = 15.0, themeColor: UIColor = UIColor(red: 241/255, green: 243/255, blue: 246/255, alpha: 1.0)) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize( width: 2, height: 2)
        self.layer.shadowColor = UIColor(red: 4/255, green: 43/255, blue: 181/255, alpha: 1.0).cgColor//UIColor(red: 223/255, green: 228/255, blue: 238/255, alpha: 1.0).cgColor
        
        let shadowLayer = CAShapeLayer()
        shadowLayer.frame = bounds
        shadowLayer.backgroundColor = themeColor.cgColor
        shadowLayer.shadowColor = UIColor(red: 4/255, green: 43/255, blue: 181/255, alpha: 1.0).cgColor//UIColor.white.cgColor
        shadowLayer.cornerRadius = cornerRadius
        shadowLayer.shadowOffset = CGSize(width: -2.0, height: -2.0)
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = 2
        self.layer.insertSublayer(shadowLayer, below: self.imageView?.layer)
    }
}

extension UIView{
   
   public func softUIEffectForView(cornerRadius: CGFloat = 5.0, themeColor: UIColor = UIColor(red: 241/255, green: 243/255, blue: 246/255, alpha: 1.0)) {
    self.layer.cornerRadius = cornerRadius
    self.layer.masksToBounds = false
    self.layer.shadowRadius = 2
    self.layer.shadowOpacity = 1
    self.layer.shadowOffset = CGSize( width: 2, height: 2)
    self.layer.shadowColor = UIColor(named: "#042bb5")?.cgColor
    
    let shadowLayer = CAShapeLayer()
    shadowLayer.frame = bounds
    shadowLayer.backgroundColor = themeColor.cgColor
    shadowLayer.shadowColor = UIColor(red: 2/255, green: 22/255, blue: 90/255, alpha: 0.48).cgColor
    shadowLayer.cornerRadius = cornerRadius
    shadowLayer.shadowOffset = CGSize(width: -2.0, height: -2.0)
    shadowLayer.shadowOpacity = 1
    shadowLayer.shadowRadius = 2
    self.layer.insertSublayer(shadowLayer, at: 0)
    }
}

extension UIView{
   
    public func customSoftUIEffect(cornerRadius: CGFloat = 5.0, themeColor: UIColor = UIColor(red: 241/255, green: 243/255, blue: 246/255, alpha: 1.0),topShadow : UIColor = UIColor(red: 2/255, green: 22/255, blue: 90/255, alpha: 1.0) ,bottmSadow : UIColor = UIColor(red: 2/255, green: 22/255, blue: 90/255, alpha: 0.48) ) {
    self.layer.cornerRadius = cornerRadius
    self.layer.masksToBounds = false
    self.layer.shadowRadius = 2
    self.layer.shadowOpacity = 1
    self.layer.shadowOffset = CGSize( width: 2, height: 2)
    self.layer.shadowColor = bottmSadow.cgColor
    
    let shadowLayer = CAShapeLayer()
    shadowLayer.frame = bounds
    shadowLayer.backgroundColor = themeColor.cgColor
    shadowLayer.shadowColor = topShadow.cgColor
    shadowLayer.cornerRadius = cornerRadius
    shadowLayer.shadowOffset = CGSize(width: -2.0, height: -2.0)
    shadowLayer.shadowOpacity = 1
    shadowLayer.shadowRadius = 2
    self.layer.insertSublayer(shadowLayer, at: 0)
    }
}
