//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Gustavo Minatti on 21/05/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var resultBMI: UILabel!
    @IBOutlet weak var adviceResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultBMI.text = bmiValue
        adviceResult.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func recalculate(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    



}
