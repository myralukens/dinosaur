//
//  FriendsViewController.swift
//  Dinosaur
//
//  Created by Gloria Liu on 3/4/17.
//  Copyright © 2017 Myra Lukens. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


   @IBOutlet weak var tableView: UITableView!
   
   var friends = [User(firstName: "Gloria", lastName: "Liu", facebookId: ""), User(firstName: "Alexa", lastName: "Kuechle", facebookId: ""), User(firstName: "Sonja", lastName: "Johnson-Yu", facebookId: "")]
  

   var photos = [#imageLiteral(resourceName: "glo"),#imageLiteral(resourceName: "alexa"),#imageLiteral(resourceName: "sonja")]
   
   var scores = [5, 3, 2]
   
   

   
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.tableView.rowHeight = 100
      self.tableView.backgroundColor = UIColor(red: 106.0/255, green: 47.0/255, blue: 139.0/255, alpha: 1.0)
      
      
      //async load for photo
      DispatchQueue.main.async(execute: {() -> Void in
         self.tableView.reloadData()
      })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

      let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell

      let friend = friends[indexPath.row];
      
      cell.name.text = friend.firstName! + " " + friend.lastName!

      
      if let imageView = cell.profilePicture {
         cell.profilePicture!.clipsToBounds = true
         cell.profilePicture!.contentMode = UIViewContentMode.scaleAspectFill
         cell.profilePicture!.layer.cornerRadius = imageView.frame.size.width / 2
      }
      cell.score.text = String(scores[indexPath.row])
      
      cell.profilePicture.image = photos[indexPath.row]
      
      return cell
   }
   

   
   public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      print(" the count is " + String(friends.count))
      return friends.count
   }

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      return
   }
   
   func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
      
      let destVC = segue.destination as! FriendDetailViewController
      
      let selectedRow = self.tableView.indexPathForSelectedRow?.row
      
      destVC.friend = friends[selectedRow!]
      destVC.photo = photos[selectedRow!]
      destVC.score = scores[selectedRow!]
    }
   
   @IBAction func unwind(unwindSegue: UIStoryboardSegue) {

   }
   
   


}
