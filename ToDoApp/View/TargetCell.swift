//
//  HedefCell.swift
//  ToDoApp
//
//  Created by Pars arge on 6.08.2021.
//

import UIKit

class TargetCell: UITableViewCell {

    @IBOutlet weak var lblTargetDescription: UILabel!
    @IBOutlet weak var lblTargetTip: UILabel!
    @IBOutlet weak var lblTargetDay: UILabel!
    
    func goruntuAyarlama(target : Hedef){
        lblTargetDescription.text = target.hedefAciklama
        lblTargetTip.text = target.hedefTip
        lblTargetDay.text = String(target.hedefSayi)
    }
}
