//
//  ChallengeDonationViewController.swift
//  Dinosaur
//
//  Created by Myra Lukens on 3/4/17.
//  Copyright © 2017 Myra Lukens. All rights reserved.
//

import UIKit

class ChallengeDonationViewController: UIViewController  {

  @IBOutlet weak var stepper: UIStepper!
  @IBOutlet weak var amount: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    amount.text = String(Int(sender.value))
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
