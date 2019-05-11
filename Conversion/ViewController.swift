//
//  ViewController.swift
//  Conversiion
//
//  Created by Cafu Aguilar on 5/10/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var historial:[Historial] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historial.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let hist = historial[indexPath.row]
        var val = 0
        if hist.combouno == 0  {
            if hist.combodos == 1{
                cell.backgroundColor = UIColor.red
                val = Int(hist.valor1)*1760
                cell.textLabel?.text = "De mi a yd".val
            } else if hist.combodos == 2{
                cell.backgroundColor = UIColor.red
                val = Int(hist.valor1)*1.60934
                cell.textLabel?.text = "De mi a km".val
            }
        }
        if hist.combouno == 1  {
            if hist.combodos == 0{
                cell.backgroundColor = UIColor.red
                val = Int(hist.valor1)*1760
                cell.textLabel?.text = "De mi a yd".val
            } else if hist.combodos == 2{
                cell.backgroundColor = UIColor.red
                val = Int(hist.valor1)*1.60934
                cell.textLabel?.text = "De mi a km".val
            }
        }
        if hist.combouno == 2  {
            if hist.combodos == 1{
                cell.backgroundColor = UIColor.red
                val = Int(hist.valor1)*1760
                cell.textLabel?.text = "De mi a yd".val
            } else if hist.combodos == 0{
                cell.backgroundColor = UIColor.red
                val = Int(hist.valor1)*1.60934
                cell.textLabel?.text = "De mi a km".val
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func obtenerHistorial(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            historial = try context.fetch(Historial.fetchRequest()) as! [Historial]
        }catch{
            print("Error")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerHistorial()
        tableView.reloadData()
    }

}

