//
//  HedefOlusturVC.swift
//  ToDoApp
//
//  Created by Pars arge on 9.08.2021.
//

import UIKit

class CreateTargetVC: UIViewController {

 
    @IBOutlet weak var txtGunSayisi: UITextField!
    @IBOutlet weak var btnHedefOlustur: UIButton!
    
    var targetDesc : String!
    var targetTip : TargetTips!
    
    func veriAtama(desc : String , tip : TargetTips){
        self.targetDesc = desc
        self.targetTip = tip
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnToBack(_ sender: UIButton) {
        dismissNew()
    }
    
    @IBAction func btnOlustur(_ sender: UIButton) {
        
        save { (bitis) in
            if bitis{
                print("saved")
                dismiss(animated: true, completion: nil)
            }
            
        }
        
        
    }
    
    func save(completionHandler : (_ finished : Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{return}
        let target = Target(context : managedContext)
        target.targetDesc = targetDesc
        target.targetDay = Int32(txtGunSayisi.text!)!
        target.targetTip = targetTip.rawValue
        target.targetDaySbt = 0
        
        do{
            
            try managedContext.save()
            completionHandler(true)
            
        }catch{
            print(error)
        }
    }
    

}
