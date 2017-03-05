//
//  ProfileViewController.swift
//  Dinosaur
//
//  Created by Myra Lukens on 3/4/17.
//  Copyright © 2017 Myra Lukens. All rights reserved.
//

import UIKit
import AFNetworking
import FBSDKLoginKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseInstanceID

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  var user: User?
  @IBOutlet weak var imageView: UIImageView?
  @IBOutlet weak var userFirstName: UILabel!
  @IBOutlet weak var userLastName: UILabel!
  @IBOutlet weak var amountDonated: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  override func viewWillAppear(_ animated: Bool) {
    if let tabBarVC = self.tabBarController as? TabBarViewController {
      user = tabBarVC.user
    }
    setUpProfile()
  }

  @IBAction func logOutAction(sender: AnyObject) {
    FBSDKAccessToken.setCurrent(nil)

    if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate {
      let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
      if let vc = storyboard.instantiateInitialViewController() as? InitialViewController {
        do {
          try FIRAuth.auth()?.signOut()
        } catch {
          print("Error signing out")
        }
        appDelegate.window?.rootViewController = vc
      }
    }
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  func setUpProfile() {
    if let imageView = imageView {
      imageView.clipsToBounds = true
      imageView.contentMode = UIViewContentMode.scaleAspectFill
      imageView.layer.cornerRadius = imageView.frame.size.width / 2
    }

    var name = ""
    if let firstName = user?.firstName {
      if let lastName = user?.lastName {
        name = "\(firstName) \(lastName)"
      }
    }
    userFirstName.text = user?.firstName
    userLastName.text = user?.lastName

    let defaultImage = UIImage(named: "empty_profile")
    if let url = user?.imageURL {
      if let imageURL = NSURL(string: url) {
        if let placeholder = defaultImage {
          imageView?.setImageWith(imageURL as URL, placeholderImage: placeholder)
        }
      } else {
        imageView?.image = defaultImage
      }
    } else {
      imageView?.image = defaultImage
    }

    if let amount = user?.amountDonated {
        amountDonated.text = "$" + String(amount)
    } else {
      amountDonated.text = "$0"
    }
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
      cell.amount.text = "$10"
    } else if indexPath.row == 1 {
      cell.name.text = "Grab a drink"
      cell.amount.text = "$5"
    } else if indexPath.row == 2 {
      cell.name.text = "Watch Netflix"
      cell.amount.text = "$2"
    } else {
      cell.name.text = "Eat dessert"
      cell.amount.text = "$5"
    }

    cell.backgroundColor = UIColor(red: 106.0/255, green: 47.0/255, blue: 139.0/255, alpha: 1.0)

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


}
