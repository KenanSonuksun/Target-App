//
//  UIButtonExtension.swift
//  ToDoApp
//
//  Created by Pars arge on 9.08.2021.
//

import Foundation
import UIKit

extension UIButton{
    
    func selected(){
        self.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    }
    func nonSelected(){
        self.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
}
