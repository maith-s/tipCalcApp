//
//  SettingsViewController.swift
//  tip
//
//

import UIKit

class SettingsViewController: UIViewController {
    
let defaults = UserDefaults.standard
    
    @IBOutlet weak var BView: UIView!
    
    @IBOutlet weak var defaultTipValue: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
    }
    
    @IBAction func tipChange(_ sender: Any) {
        let selectedIndex = defaultTipValue.selectedSegmentIndex
        
        defaults.set(selectedIndex, forKey: "myTip")
        
        defaults.synchronize()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defaultTipValue.selectedSegmentIndex = defaults.integer(forKey: "myTip")
               
           
    }

    /*// MARK: - Navigation

    
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
