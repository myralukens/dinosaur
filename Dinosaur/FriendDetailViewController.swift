//
//  FriendDetailViewController.swift
//  Dinosaur
//
//  Created by Gloria Liu on 3/4/17.
//  Copyright © 2017 Myra Lukens. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

   var friend: User?
   
   var photo: UIImage?

   var score: Int = 0
   
   @IBOutlet weak var textView: UITextView!

   @IBOutlet weak var imageView: UIImageView!
   
   @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      var msg = (friend?.firstName)! + " " + (friend?.lastName)!

      nameLabel.text = msg
      scoreLabel.text = "Donated " + String(score) + " times this week!"
      
      if let imageView = imageView {
         imageView.clipsToBounds = true
         imageView.contentMode = UIViewContentMode.scaleAspectFill
         imageView.layer.cornerRadius = imageView.frame.size.width / 2
      }
      
      imageView.image = photo

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

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "previousChallenge", for: indexPath) as! ProfilePreviousChallengesTableViewCell

    if indexPath.row == 0 {
      cell.name.text = "Go to Starbucks"
      cell.amount.text = "2"
    } else if indexPath.row == 1 {
      cell.name.text = "Grab a drink"
      cell.amount.text = "1"
    } else if indexPath.row == 2 {
      cell.name.text = "Watch Netflix"
      cell.amount.text = "0"
    } else {
      cell.name.text = "Eat dessert"
      cell.amount.text = "4"
    }

    return cell
  }



  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    return
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
    var cell = tableView.cellForRow(at: indexPath as IndexPath)
    cell?.backgroundColor = UIColor.blue
  }

  func tableView(_ tableView: UITableView, didUnHighlightRowAt indexPath: IndexPath) {
    var cell = tableView.cellForRow(at: indexPath)
    cell?.backgroundColor = UIColor(red: 106.0/255, green: 47.0/255, blue: 139.0/255, alpha: 1.0)
  }

}
