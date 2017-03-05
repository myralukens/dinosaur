//
//  ViewController.swift
//  Dinosaur
//
//  Created by Myra Lukens on 3/4/17.
//  Copyright © 2017 Myra Lukens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var countMeInButton: UIButton!

  @IBOutlet weak var progress: UIProgressView!
  @IBOutlet weak var donateButton: UIButton!
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var storyTextView: UITextView!

  @IBOutlet weak var daysLeftDynamic: UILabel!
  @IBOutlet weak var daysLeftStatic: UILabel!

  @IBOutlet weak var challengeProgress: UILabel!

  @IBOutlet weak var storyOfWeek: UITextView!
  @IBOutlet weak var challengeOfWeek: UITextView!
  override func viewDidLoad() {
    super.viewDidLoad()

    storyOfWeek.font = UIFont(name: "EvelethCleanThin", size: 16)

    storyOfWeek.clipsToBounds = true
    storyOfWeek.layer.cornerRadius = 10.0
    storyOfWeek.layer.borderColor = UIColor.white.cgColor
    storyOfWeek.layer.borderWidth = 1.0

    challengeOfWeek.font = UIFont(name: "EvelethCleanThin", size: 16)

    challengeOfWeek.clipsToBounds = true
    challengeOfWeek.layer.cornerRadius = 10.0
    challengeOfWeek.layer.borderColor = UIColor.white.cgColor
    challengeOfWeek.layer.borderWidth = 1.0

    daysLeftStatic.font = UIFont(name: "EvelethCleanThin", size: 16)
    daysLeftDynamic.font = UIFont(name: "EvelethCleanThin", size: 16)

    donateButton.isHidden = true
    daysLeftStatic.isHidden = true
    daysLeftDynamic.isHidden = true
    progress.isHidden = true
    challengeProgress.isHidden = true
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func prepareFromDonation(forUnwind segue: UIStoryboardSegue) {
    // unwind from donation screen
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toDonated" {
      if let donatedVC = segue.destination as? DonatedViewController {
        if let tabBarVC = self.tabBarController as? TabBarViewController {
          if let user = tabBarVC.user {
            user.amountDonated = user.amountDonated! + user.challengeAmountPledged!
            let intAmt = Int(user.amountDonated!)
            donatedVC.amount = String(intAmt)
          }
        }
      }
    }
  }

  @IBAction func prepare(forUnwind segue: UIStoryboardSegue) {
    donateButton.isHidden = false
    countMeInButton.isHidden = true
    daysLeftStatic.isHidden = false
    daysLeftDynamic.isHidden = false
    progress.isHidden = false
    daysLeftDynamic.text = "5"
    challengeProgress.isHidden = false

    //set progress to 0/5 days initially
    progress.setProgress(0, animated: true)
  }
}

