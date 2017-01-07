//
//  ViewController.swift
//  TipApplication
//
//  Created by Sam Mendimasa on 1/6/17.
//  Copyright © 2017 Sam Mendimasa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    @IBOutlet weak var splitBillTotal: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        //get index of tip
        let intValue = defaults.integer(forKey: "tip")
        tipControl.selectedSegmentIndex=intValue
        
        //get autoload state
        let saveState = defaults.bool(forKey: "saveState")
        
        if saveState{
            let saveBill = defaults.string(forKey: "bill")
            billTextField.text=saveBill
        
            let tipPercent = defaults.float(forKey: "tipPercent")
            splitSlider.setValue(tipPercent, animated: true)
        }
        updateBill(NSNull.self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateBill(_ sender: Any) {
        
        let splitNum = Int(splitSlider.value)
        let tipPercentages = [0.15, 0.18, 0.2, 0.25]
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = (bill + tip)
        let splitTotal = (bill + tip)/(double_t(splitNum))
        
        tipLabel.text=String (format: "$%.2f", tip)
        totalLabel.text=String (format: "$%.2f", total)
        splitBillTotal.text=String (format: "$%.2f", splitTotal)
        splitLabel.text="\(splitNum)"
        
        // save bill, tip, and tip percent
        defaults.set(billTextField.text, forKey: "bill")
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tip")
        defaults.set(splitSlider.value, forKey: "tipPercent")
        // Force UserDefaults to save.
        defaults.synchronize()
        
       
    }
    @IBAction func updateBill(_ sender: Any) {

        calculateBill(sender)
        
    }
    @IBAction func updateSplitBill(_ sender: Any) {
        calculateBill(sender)
    }

}

