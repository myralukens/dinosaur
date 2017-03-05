//
//  ThirdViewController.swift
//  Dinosaur
//
//  Created by Myra Lukens on 3/4/17.
//  Copyright © 2017 Myra Lukens. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

  @IBOutlet weak var support: UITextView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      support.font = UIFont(name: "EvelethRegular", size: 17)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "toIntro" {
//      if let tabVC = segue.destination as? TabBarViewController {
//        if let pgVC = this.pageV
//        tabVC.user =
//      }
//    }
//  }

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
