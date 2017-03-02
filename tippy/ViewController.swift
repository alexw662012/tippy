//
//  ViewController.swift
//  tippy
//
//  Created by Alex on 3/1/17.
//  Copyright © 2017 Alex Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SeperatorView: UIView!
    @IBOutlet weak var TipControl: UISegmentedControl!
    @IBOutlet weak var BillField: UITextField!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var TipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view did load")
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        let defaultTip = defaults.object(forKey: "default_tips") as? Int
        let defaultTheme = defaults.object(forKey: "default_themes") as? Int
        
        TipControl.selectedSegmentIndex = defaultTip ?? 0
        TipControl.sendActions(for: UIControlEvents.valueChanged)
        
        if(defaultTheme == nil || defaultTheme == 0){
            self.view.backgroundColor = UIColor.white
        }else if(defaultTheme! == 1){
            self.view.backgroundColor = UIColor.gray

        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.SeperatorView.alpha = 0
        print("view did appear")
        UIView.animate(withDuration: 2, animations: {
            self.SeperatorView.alpha = 1
        })
        BillField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentage = [0.15, 0.18, 0.2]
        let bill = Double(BillField.text!) ?? 0
        let tip = bill * tipPercentage[TipControl.selectedSegmentIndex]
        let total = bill + tip
        TipLabel.text = String(format: "$%.2f", tip)
        TotalLabel.text = String(format: "$%.2f", total)
    }
}

