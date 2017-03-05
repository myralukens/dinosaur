//
//  InitialViewController.swift
//  Dinosaur
//
//  Created by Myra Lukens on 3/4/17.
//  Copyright © 2017 Myra Lukens. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class InitialViewController: UIViewController {
    let authService = AuthService()
    var user : User?
    var alreadyLoggedIn : Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        authService.loginDelegate = self

      if (FBSDKAccessToken.current() != nil) {
        // segue to tab bar controller
        self.authService.authWithFacebook()
        alreadyLoggedIn = true
      }
    }

    @IBAction func logInWithFacebookAction(sender: AnyObject) {
      loginWithFacebook()
    }

    func loginWithFacebook() {
      let facebookLogin = FBSDKLoginManager()
      facebookLogin.logIn(withReadPermissions: ["email", "public_profile", "user_friends"], from: self) {
        facebookResult, facebookError -> Void in
        if facebookError != nil {
          self.onFacebookError()
        } else if facebookResult?.isCancelled == true {
          print("Facebook log in was cancelled.")
          // Do nothing.
        } else {
          self.authService.authWithFacebook()
        }
      }
      alreadyLoggedIn = false
    }

    func onFacebookError() {
      let title = "Authentication Error"
      let message = "An error occured while connecting to Facebook. Please try again."
      let style = UIAlertControllerStyle.alert

      presentAlert(message: message, title: title)
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

  func presentAlert (message: String, title: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))

    self.present(alert, animated: true, completion: nil)
  }

}


// MARK: - FirebaseLoginDelegate
extension InitialViewController: FirebaseLoginDelegate {

  func onLoginError(errorCode: FIRAuthErrorCode) {
    presentAlertForFirebaseError(errorCode: errorCode)
  }

  func presentAlertForFirebaseError(errorCode: FIRAuthErrorCode) {
    var title = ""
    var message = ""
    switch errorCode {
    case .errorCodeEmailAlreadyInUse:
      title = "Email Taken"
      message = "An account with that email address already exists."
    case .errorCodeInvalidEmail:
      title = "Invalid Email"
      message = "Please enter a valid email address."
    case .errorCodeInvalidCredential:
      title = "Invalid Credentials"
      message = "The specified authentication credentials are invalid."
    case .errorCodeWrongPassword:
      title = "Incorrect Password"
      message = "The entered password does not match our records."
    case .errorCodeUserNotFound:
      title = "No Account Found"
      message = "You must login with Facebook if you created your account with Facebook."
    case .errorCodeNetworkError:
      title = "Network Error"
      message = "An error occurred while trying to login"
    default:
      title = "Error"
      message = "There was an error logging in. Please try again."
    }

    presentAlert(message: message, title: title)
  }

  func onLoginSuccess(user: User) {
    self.user = user
    UserService().updateValuesForUser(user: self.user!)

    if alreadyLoggedIn! {
      performSegue(withIdentifier: "toTabBarVC", sender: self)
    } else {
      performSegue(withIdentifier: "toIntro", sender: self)
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toTabBarVC" {
      if let tabBarVC = segue.destination as? TabBarViewController {
        tabBarVC.user = user
        alreadyLoggedIn = nil
      }
    } else if segue.identifier == "toIntro" {
      if let pageVC = segue.destination as? PageViewController {
        pageVC.user = user
        alreadyLoggedIn = nil
      }
    }
  }
}
