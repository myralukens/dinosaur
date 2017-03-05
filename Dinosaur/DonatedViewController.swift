//
//  ViewController.swift
//  Dinosaur
//
//  Created by Myra Lukens on 3/4/17.
//  Copyright © 2017 Myra Lukens. All rights reserved.
//

import UIKit

class DonatedViewController: UIViewController {
  @IBOutlet weak var amountDonated: UILabel!
  var amount : String?

  override func viewDidLoad() {
    super.viewDidLoad()
    amountDonated.text = amount

    // Do any additional setup after loading the view, typically from a nib.
    _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.dismissView), userInfo: nil, repeats: true);
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func dismissView() {
    self.performSegue(withIdentifier: "prepareFromDonationForUnwind", sender: self)
  }

}

