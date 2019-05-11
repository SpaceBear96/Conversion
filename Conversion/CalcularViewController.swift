//
//  CalcularViewController.swift
//  Conversion
//
//  Created by Cafu Aguilar on 5/10/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit

class CalcularViewController: UIViewController {

    
    @IBOutlet weak var ComboUno: UISegmentedControl!
    @IBOutlet weak var ComboDos: UISegmentedControl!
    @IBOutlet weak var txtValor1: UITextField!
    @IBOutlet weak var txtValor2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calcularConversion(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let historial = Historial(context : context)
        historial.valor1 = txtValor1.text!
        historial.valor2 = txtValor2.text!
        historial.combouno = Int64(ComboUno.selectedSegmentIndex)
        historial.combodos = Int64(ComboDos.selectedSegmentIndex)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
}
