//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Timothy Yang on 2/28/17.
//  Copyright © 2017 Timothy Yang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipValue: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let defaultTip = defaults.integer(forKey: "default_tip")
        print("got index: \(defaultTip)")

        if defaultTip < 3 {
            defaultTipValue.selectedSegmentIndex = defaultTip
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        print("storing index: \(defaultTipValue.selectedSegmentIndex)")
        defaults.set(defaultTipValue.selectedSegmentIndex, forKey: "default_tip")
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
