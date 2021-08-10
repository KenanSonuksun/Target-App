//
//  ViewController.swift
//  ToDoApp
//
//  Created by Pars arge on 6.08.2021.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class TargetList: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var  hedeflerDizisi : [Hedef] = []
    var counter : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        

    }
    func verileriYukle(){
        self.verileriGetir{ (complete) in
            if complete {
                if hedeflerDizisi.count >= 1{
                    tableView.isHidden = false
                }else{
                    tableView.isHidden = true
                }
                
            }
        }
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        verileriYukle()
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    

    @IBAction func clickedToAdd(_ sender: UIButton) {
        guard let hedefEkleVC = storyboard?.instantiateViewController(identifier: "HedefEkleVC") else {
            return
        }
        print("clicked to add")
        presentNew(hedefEkleVC)
    }
    
}

extension TargetList : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hedeflerDizisi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "hedefCell") as? HedefCell else{
            return UITableViewCell()
        }
        
        let gosterilecekHedef = hedeflerDizisi[indexPath.row]
        
        cell.goruntuAyarlama(target: gosterilecekHedef)
        return cell
    }
}

extension TargetList{
    func verileriGetir(completionHandler : ( _ complete: Bool) ->()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        let fetchRequest = NSFetchRequest<Hedef>(entityName: "Hedef")
        
        do{
            hedeflerDizisi = try managedContext.fetch(fetchRequest)
        completionHandler(true)
        }catch{
            debugPrint(error.localizedDescription)
        }
    
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
            managedContext.delete(hedeflerDizisi[indexPath.row])
            
            do{
                try managedContext.save()
                self.hedeflerDizisi.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
                
                print("Veriler silindi")
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
    }
    
}
