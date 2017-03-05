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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
