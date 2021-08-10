//
//  UIViewControllerExtension.swift
//  ToDoApp
//
//  Created by Pars arge on 9.08.2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentNew(_ viewControllerToPresent : UIViewController){
        let transition = CATransition()
        transition.duration = 0.6
        transition.type = .push
        transition.subtype = .fromRight
        self.view.window?.layer.add(transition,forKey: "presentAnimation")
        present(viewControllerToPresent, animated: false, completion: nil)
    }
   func presentNewVersion2(_ viewControllerToPresent : UIViewController){
        let transition = CATransition()
        transition.duration = 0.6
        transition.type = .push
        transition.subtype = .fromRight
        guard let sunulanVC = presentedViewController else{return}
    sunulanVC.dismiss(animated: false){
        self.view.window?.layer.add(transition, forKey: "presentAnimation2")
        self.present(viewControllerToPresent, animated: false, completion: nil)
    }
        
    }
    func dismissNew(){
        let transition = CATransition()
        transition.duration = 0.6
        transition.type = .push
        transition.subtype = .fromLeft
        self.view.window?.layer.add(transition,forKey: "dismissAnimation")
        dismiss(animated: false, completion: nil)
    }
    
    
}
