//
//  FriendDetailViewController.swift
//  Dinosaur
//
//  Created by Gloria Liu on 3/4/17.
//  Copyright © 2017 Myra Lukens. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

   var friend: User?
   
   var photo: UIImage?

   var score: Int = 0
   
   @IBOutlet weak var textView: UITextView!
   @IBOutlet weak var imageView: UIImageView!
   
   @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      var msg = (friend?.firstName)! + " " + (friend?.lastName)! + " has donated "
//      name.text = msg + String(score) + " times this week!"
      
      textView.text = msg + String(score) + " times this week!"
      
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

}
