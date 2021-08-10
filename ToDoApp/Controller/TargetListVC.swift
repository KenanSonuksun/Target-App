//
//  ViewController.swift
//  ToDoApp
//
//  Created by Pars arge on 6.08.2021.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class TargetListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var  arrayOfTargets : [Target] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        

    }
    func loadData(){
        self.getData{ (complete) in
            if complete {
                if arrayOfTargets.count >= 1{
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
        loadData()
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    @IBAction func clickedToAdd(_ sender: UIButton) {
        guard let hedefEkleVC = storyboard?.instantiateViewController(identifier: "HedefEkleVC") else {
            return
        }
        print("clicked to add")
        presentNew(hedefEkleVC)
    }
    
}

extension TargetListVC : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfTargets.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "hedefCell") as? TargetCell else{
            return UITableViewCell()
        }
        
        let target = arrayOfTargets[indexPath.row]
        
        cell.goruntuAyarlama(target: target)
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
            managedContext.delete(arrayOfTargets[indexPath.row])
            
            do{
                try managedContext.save()
                self.arrayOfTargets.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
                
                print("Datas are removed")
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
    }
}

extension TargetListVC{
    func getData(completionHandler : ( _ complete: Bool) ->()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        let fetchRequest = NSFetchRequest<Target>(entityName: "Target")
        
        do{
            arrayOfTargets = try managedContext.fetch(fetchRequest)
        completionHandler(true)
        }catch{
            debugPrint(error.localizedDescription)
        }
    
    }
    
}
