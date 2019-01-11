//
//  ViewController.swift
//  tippy
//
//  Created by Andre Chang on 1/7/19.
//  Copyright © 2019 Andre Chang. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var billField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        defaults.set(0.18, forKey: "one")
        defaults.set(0.2, forKey: "two")
        defaults.set(0.25, forKey: "three")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        
        let one = defaults.double(forKey: "one")
        let two = defaults.double(forKey: "two")
        let three = defaults.double(forKey: "three")
        
        //let tipPercentages = [0.18, 0.2, 0.25]
        
        let oneStr:String = String(format:"%.0f", one * 100)
        let twoStr:String = String(format:"%.0f", two * 100)
        let threeStr:String = String(format:"%.0f", three * 100)
        
        tipControl.setTitle(oneStr+"%", forSegmentAt: 0)
        tipControl.setTitle(twoStr+"%", forSegmentAt: 1)
        tipControl.setTitle(threeStr+"%", forSegmentAt: 2)
        
        let tipPercentages = [one, two, three]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        self.reloadInputViews()
        
        let defaults = UserDefaults.standard
        
        let one = defaults.double(forKey: "one")
        let two = defaults.double(forKey: "two")
        let three = defaults.double(forKey: "three")
        
        //let tipPercentages = [0.18, 0.2, 0.25]
        let tipPercentages = [one, two, three]
        
        let oneStr = String(format:"%.0f", one * 100)
        let twoStr:String = String(format:"%.0f", two * 100)
        let threeStr:String = String(format:"%.0f", three * 100)

        tipControl.setTitle(oneStr+"%", forSegmentAt: 0)
        tipControl.setTitle(twoStr+"%", forSegmentAt: 1)
        tipControl.setTitle(threeStr+"%", forSegmentAt: 2)
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

