//
//  SettingViewController.swift
//  tippy
//
//  Created by Alex on 3/1/17.
//  Copyright © 2017 Alex Wang. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var DefaultThemeControl: UISegmentedControl!
    @IBOutlet weak var DefaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let defaultTip = defaults.object(forKey: "default_tips") as? Int
        let defaultTheme = defaults.object(forKey: "default_themes") as? Int
        
        DefaultTipControl.selectedSegmentIndex = defaultTip ?? 0
        DefaultThemeControl.selectedSegmentIndex = defaultTheme ?? 0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setDefaultThemes(_ sender: Any) {
        let defaults = UserDefaults.standard
        let index = DefaultThemeControl.selectedSegmentIndex
        defaults.set(index, forKey: "default_themes")
        defaults.synchronize()
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
