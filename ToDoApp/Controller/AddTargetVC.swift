//
//  HedefEkleVC.swift
//  ToDoApp
//
//  Created by Pars arge on 9.08.2021.
//

import UIKit

class AddTargetVC: UIViewController,UITextViewDelegate {
    
    @IBOutlet weak var txtField: UITextView!
    @IBOutlet weak var btnShort: UIButton!
    @IBOutlet weak var btnMedium: UIButton!
    @IBOutlet weak var btnLong: UIButton!
    @IBOutlet weak var btnContinue: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        txtField.delegate = self
        btnContinue.keybordSetting()
    }
    var targetTip : TargetTips = .MediumTerm
    
    
    @IBAction func clickToBack(_ sender: Any) {
        
        dismissNew()
        
    }
    
    
    @IBAction func clickKisa(_ sender: UIButton) {
        targetTip = TargetTips.ShortTerm
        btnMedium.nonSelected()
        btnLong.nonSelected()
        btnShort.selected()
        
    }
    @IBAction func clickOrta(_ sender: UIButton) {
        targetTip = TargetTips.MediumTerm
        btnMedium.selected()
        btnLong.nonSelected()
        btnShort.nonSelected()
    }
    @IBAction func clickUzun(_ sender: UIButton) {
        targetTip = TargetTips.LongTerm
        btnMedium.nonSelected()
        btnLong.selected()
        btnShort.nonSelected()
    }
    @IBAction func clickIleri(_ sender: UIButton) {
        
        if txtField.text != "" && txtField.text != "Please enter that you want to plan" {
        guard let createTargetVC = storyboard?.instantiateViewController(identifier: "hedefOlusturVC") as? CreateTargetVC else {
            return
        }
            createTargetVC.veriAtama(desc: txtField.text, tip: targetTip)
            presentingViewController?.presentNewVersion2(createTargetVC)
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        txtField.text = ""
        txtField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
