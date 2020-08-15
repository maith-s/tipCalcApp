//
//  ViewController.swift
//  tip
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var totalView: UIView!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!

    @IBOutlet weak var tipLabel: UILabel!
    let defaults = UserDefaults.standard
      
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.billField.becomeFirstResponder()
    
        self.totalView.alpha = 0
        self.tipView.alpha = 0
        self.billView.alpha = 0.7
        self.billView.frame.size.height -= 820
        self.billView.center.y = 360
      
       
        // self.totalView.center.y = 360
        
    }
        
        override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "myTip")
        calcTip()
    }

    @IBAction func onTap(_ sender: Any) {
        self.billView.frame.size.height -= 400
        self.billView.center.y = 211
       //  view.endEditing(true)
}

    @IBAction func billChanged(_ sender: Any) {
        
        if billField.text == "" {
            UIView.animate(withDuration: 0.4,
                animations: {
//                    self.totalView.alpha = 0
//                    self.tipView.alpha = 0
//                    self.billView.frame.size.height -= 820
//                    //self.billView.center.y = 370
                   self.billField.becomeFirstResponder()
                    
                        self.totalView.alpha = 0
                        self.tipView.alpha = 0
                        self.billView.alpha = 1
                        //self.billView.frame.size.height -= 820
                        //self.billView.center.y = 360
                }
            )
        } else {
            UIView.animate(withDuration: 0.3, animations: {
               // self.billField.becomeFirstResponder()
                self.totalView.alpha = 0.8
                self.tipView.alpha = 0.8
                // self.billView.frame.size.height -= 400
                self.billView.alpha = 0.6
                self.totalView.center.y = 657
                self.tipView.center.y = 384
            })

    }
    }
    
    @IBAction func calculateTip(_ sender: Any) {
         calcTip()
    }
    
    
    private func calcTip() {
        let bill = Double(billField.text!) ?? 0
        
        let tipPercentages = [0.1,0.15,0.19]
        
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal          // Set defaults to the formatter that are common for showing decimal numbers
        numberFormatter.usesGroupingSeparator = true    // Enabled separator
        numberFormatter.groupingSeparator = ","         // Set the separator to "," (e.g. 1000000 = 1,000,000)
        numberFormatter.groupingSize = 3                // Set the digits between each separator
        numberFormatter.minimumFractionDigits = 2
        let myDouble = total
        
        let formattedTotal = numberFormatter.string(for: myDouble)
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = "$" + formattedTotal!
    }
}

