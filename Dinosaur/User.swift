//
//  User.swift
//  Dinosaur
//
//  Created by Myra Lukens on 3/4/17.
//  Copyright © 2017 Myra Lukens. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class User {
  var id: String?
  var facebookId: String?
  var email: String?
  var firstName: String?
  var lastName: String?
  var imageURL: String?

  init(fromUser user: FIRUser) {
    for profile in user.providerData {
      facebookId = profile.uid
      imageURL = "https://graph.facebook.com/\(facebookId!)/picture?type=large"
      email = profile.email

      if let components = profile.displayName?.components(separatedBy: " ") {
        firstName = components.first
        lastName = components.last
      }
    }
    
  }

  func toAnyObject() -> [String : Any] {
    var dictionary = [String : Any]()

    dictionary["email"] = email
    dictionary["firstName"] = firstName
    dictionary["lastName"] = lastName
    dictionary["imageURL"] = imageURL

    if let facebookId = facebookId {
      dictionary["facebookId"] = facebookId
    }

    return dictionary
  }

}
