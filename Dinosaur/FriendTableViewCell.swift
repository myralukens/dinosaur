//
//  FriendTableViewCell.swift
//  Dinosaur
//
//  Created by Gloria Liu on 3/4/17.
//  Copyright © 2017 Myra Lukens. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

   @IBOutlet weak var name: UILabel!
   @IBOutlet weak var profilePicture: UIImageView!
   
   @IBOutlet weak var score: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  override func setHighlighted(_ highlighted: Bool, animated: Bool) {
    if highlighted {
      self.contentView.backgroundColor = UIColor(red: 133.0/255, green: 81.0/255, blue: 139.0/255, alpha: 1.0)
    } else {
      self.contentView.backgroundColor = UIColor(red: 106.0/255, green: 47.0/255, blue: 139.0/255, alpha: 1.0)
    }
  }
}
