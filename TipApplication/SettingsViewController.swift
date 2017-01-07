//
//  SettingsViewController.swift
//  TipApplication
//
//  Created by Sam Mendimasa on 1/6/17.
//  Copyright © 2017 Sam Mendimasa. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "tip")
        print(intValue)
        
        tipControl.selectedSegmentIndex=intValue
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setDaultTip(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        
        // Set an Integer value for some key.
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tip")
        
        // Force UserDefaults to save.
        defaults.synchronize()
    }

    @IBAction func onExit(_ sender: Any) {
        exit(0)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
