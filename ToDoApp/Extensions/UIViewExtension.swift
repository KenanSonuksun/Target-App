//
//  UIViewExtension.swift
//  ToDoApp
//
//  Created by Pars arge on 9.08.2021.
//

import Foundation
import UIKit

extension UIView {
    func keybordSetting( ){
        NotificationCenter.default.addObserver(self, selector: #selector(keybordChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keybordChange(_ notification : NSNotification){
        let sure = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        
        let baslangicKlavyeFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey]as!NSValue).cgRectValue
        let bitisKlavyeFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey]as!NSValue).cgRectValue
        
        let farkY = bitisKlavyeFrame.origin.y - baslangicKlavyeFrame.origin.y
        
        UIView.animateKeyframes(withDuration: sure, delay: 0.0, options: UIView.KeyframeAnimationOptions.init(rawValue: curve), animations: {self.frame.origin.y += farkY}, completion: nil)
    }
}
