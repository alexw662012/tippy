//
//  SettingViewController.swift
//  tippy
//
//  Created by Alex on 3/1/17.
//  Copyright © 2017 Alex Wang. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var DefaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func setDefaultTips(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let index = DefaultTipControl.selectedSegmentIndex
        defaults.set(index, forKey: "default_tips")
        defaults.synchronize()
        
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
