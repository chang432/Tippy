//
//  SettingsViewController.swift
//  tippy
//
//  Created by Andre Chang on 1/8/19.
//  Copyright © 2019 Andre Chang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var firstEdit: UITextField!
    @IBOutlet var secondEdit: UITextField!
    @IBOutlet var thirdEdit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

        let defaults = UserDefaults.standard
        
        firstEdit.text = String(format:"%.0f", defaults.double(forKey: "one") * 100)
        secondEdit.text = String(format:"%.0f", defaults.double(forKey: "two") * 100)
        thirdEdit.text = String(format:"%.0f", defaults.double(forKey: "three") * 100)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //defaults.set(Double(Int()), forKey: )
    
    @IBAction func goBack(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(Double(firstEdit.text!)!/100.0, forKey: "one")
        defaults.set(Double(secondEdit.text!)!/100.0, forKey: "two")
        defaults.set(Double(thirdEdit.text!)!/100.0, forKey: "three")
        
        navigationController?.popViewController(animated: true)
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
