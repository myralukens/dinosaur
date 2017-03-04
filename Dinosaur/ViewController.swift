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

  override func viewDidLoad() {
    super.viewDidLoad()
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

