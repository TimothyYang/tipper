//
//  ViewController.swift
//  Tipper
//
//  Created by Timothy Yang on 2/27/17.
//  Copyright © 2017 Timothy Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tips: UIImageView!
    var tip = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let defaultTip = defaults.integer(forKey: "default_tip")
        print("got index: \(defaultTip)")
        
        if defaultTip < 3 {
            tipControl.selectedSegmentIndex = defaultTip
        }
        calculateTipHelper()
        setRandomTip()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
  
    @IBAction func calculateTip(_ sender: AnyObject) {
        calculateTipHelper()
    }
    
    func calculateTipHelper() {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func changeImage(_ sender: Any) {
        setRandomTip()
    }
    
    func setRandomTip() {
        var newTip = Int(arc4random_uniform(20) + 1)
        if (newTip == tip) {
            newTip += 1
        }
        tips.image = UIImage(named: "tip_\(newTip)")
        tip = newTip
    }
}

