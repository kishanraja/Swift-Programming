//
//  AnimatedFloatCircleButton.swift
//  AnimatedFloatCircleButton
//
//  Created by Kishan Raja on 06/04/19.
//

import Foundation
import UIKit

class CircleMenu : UIView {
    private var viewFrame : CGRect!
    var mainButton : UIButton = UIButton()
    var btnOne : UIButton = UIButton()
    var btnTwo : UIButton = UIButton()
    var btnThree : UIButton = UIButton()
    
    override func awakeFromNib() {
        self.viewFrame = self.frame
        self.createMainButton()
        self.createMenuButton()
    }
    
    private func createMainButton(){
        mainButton.frame = CGRect(x: (viewFrame.size.width / 2) - 15, y: viewFrame.size.height - 30, width: 30, height: 30)
        mainButton.layer.cornerRadius = mainButton.frame.size.height / 2
        mainButton.contentEdgeInsets = UIEdgeInsets(top: -2, left: 0, bottom: 0, right: 0)
        mainButton.backgroundColor = UIColor.black
        //        mainButton.setTitle("-", for: .selected)
        mainButton.addTarget(self, action: #selector(mainButtonTapped(_:)), for: .touchUpInside)
        mainButton.setTitle("+", for: .normal)
        self.addSubview(mainButton)
    }
    
    private func createMenuButton(){
        btnOne.frame = mainButton.frame
        btnTwo.frame = mainButton.frame
        btnThree.frame = mainButton.frame
        
        btnOne.backgroundColor = UIColor.yellow
        btnTwo.backgroundColor = UIColor.yellow
        btnThree.backgroundColor = UIColor.yellow
        
        btnOne.setTitleColor(UIColor.black, for: .normal)
        btnTwo.setTitleColor(UIColor.black, for: .normal)
        btnThree.setTitleColor(UIColor.black, for: .normal)
        
        btnOne.setTitle("1", for: .normal)
        btnTwo.setTitle("2", for: .normal)
        btnThree.setTitle("3", for: .normal)
        
        btnOne.isHidden = true
        btnTwo.isHidden = true
        btnThree.isHidden = true
        
        btnOne.addTarget(self, action: #selector(btnOneTapped(_:)), for: .touchUpInside)
        btnTwo.addTarget(self, action: #selector(btnTwoTapped(_:)), for: .touchUpInside)
        btnThree.addTarget(self, action: #selector(btnThreeTapped(_:)), for: .touchUpInside)
        
        self.addSubview(btnOne)
        self.addSubview(btnTwo)
        self.addSubview(btnThree)
    }
    
    private func animateButton(){
        if !mainButton.isSelected {
            mainButton.isSelected = true
            btnOne.isHidden = false
            btnTwo.isHidden = false
            btnThree.isHidden = false
            UIView.animate(withDuration: 0.5) {
                self.mainButton.transform = CGAffineTransform(rotationAngle: -0.8)
                let singleBtnWidth = (self.viewFrame.size.width - 20) / 3
                self.btnOne.frame = CGRect(x: 0, y: 0, width: singleBtnWidth, height: 30)
                self.btnTwo.frame = CGRect(x: self.btnOne.frame.origin.x + singleBtnWidth + 10 , y: 0, width: singleBtnWidth, height: 30)
                self.btnThree.frame = CGRect(x: self.btnTwo.frame.origin.x + singleBtnWidth + 10, y: 0, width: singleBtnWidth, height: 30)
            }
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.mainButton.transform = CGAffineTransform.identity
                self.btnOne.frame = self.mainButton.frame
                self.btnTwo.frame = self.mainButton.frame
                self.btnThree.frame = self.mainButton.frame
            }) { (true) in
                self.btnOne.isHidden = true
                self.btnTwo.isHidden = true
                self.btnThree.isHidden = true
                self.mainButton.isSelected = false
            }
        }
    }
    
    @objc func mainButtonTapped(_ sender : UIButton){
        self.animateButton()
    }
    @objc func btnOneTapped(_ sender : UIButton){
        
    }
    @objc func btnTwoTapped(_ sender : UIButton){
        
    }
    @objc func btnThreeTapped(_ sender : UIButton){
        
    }
}
