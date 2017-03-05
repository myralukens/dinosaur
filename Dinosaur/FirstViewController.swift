//
//  FirstViewController.swift
//  Dinosaur
//
//  Created by Myra Lukens on 3/4/17.
//  Copyright © 2017 Myra Lukens. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  @IBOutlet weak var info: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toTabBarVC" {
      if let tabBarVC = segue.destination as? TabBarViewController {
        if let pgVC = self.parent as? PageViewController {
          tabBarVC.user = pgVC.user
        }
      }
    }
  }

}
