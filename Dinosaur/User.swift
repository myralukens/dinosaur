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
  var amountDonated: Int?
  var challengeAmountPledged: Int?

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


  init(firstName: String, lastName: String, facebookId: String) {
    self.firstName = firstName
    self.lastName = lastName
    self.imageURL = "https://graph.facebook.com/\(facebookId)/picture?type=large"
  }
  func toAnyObject() -> [String : Any] {
    var dictionary = [String : Any]()

    dictionary["email"] = email
    dictionary["firstName"] = firstName
    dictionary["lastName"] = lastName
    dictionary["imageURL"] = imageURL
    dictionary["amountDonated"] = amountDonated
    dictionary["challengeAmountPledged"] = challengeAmountPledged

    if let facebookId = facebookId {
      dictionary["facebookId"] = facebookId
    }

    return dictionary
  }

  func updateFromSnapshot(snapshot: FIRDataSnapshot) {
    if let dictionary = snapshot.value as? [String : AnyObject] {
      self.id = snapshot.key
      if let facebookId = dictionary["facebookId"] as? String {
        self.facebookId = facebookId
      }
      if let email = dictionary["email"] as? String {
        self.email = email
      }
      if let firstName = dictionary["firstName"] as? String {
        self.firstName = firstName
      }
      if let lastName = dictionary["lastName"] as? String {
        self.lastName = lastName
      }
      if let imageURL = dictionary["imageURL"] as? String {
        self.imageURL = imageURL
      }
      if let amountDonated = dictionary["amountDonated"] as? Int {
        self.amountDonated = amountDonated
      }
      if let challengeAmountPledged = dictionary["challengeAmountPledged"] as? Int {
        self.challengeAmountPledged = challengeAmountPledged
      }
    }
  }

}
