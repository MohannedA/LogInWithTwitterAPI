//
//  ViewController.swift
//  LoginWithTwitter
//
//  Created by mac on 21/10/1439 AH.
//  Copyright © 1439 mac. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {
    
    //MARK: ...
    @IBOutlet weak var label_username: UILabel!
    @IBOutlet weak var label_name: UILabel!
    @IBOutlet weak var user_image_view: UIImageView!
    
    //var loginButton: TWTRLogInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*loginButton = TWTRLogInButton{ (session , error) in
            if let unwrappedsession = session {
                let client = TWTRAPIClient()
                client.loadUser(withID: unwrappedsession.userID, completion: { (user, error) in
                    self.label_name.text = user?.name
                    self.label_username.text = unwrappedsession.userName
                    
                    let imgURL = user?.profileImageURL
                    let url = URL(string: imgURL!)
                    let data = try? Data (contentsOf: url!)
                    self.user_image_view.image = UIImage(data: data!)
                })
            
            } else {
                print("ERROR")
            }
        }*/
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("signed in as \(String(describing: session?.userName))");
                print("userID \(String(describing: session?.userID))");
                print("authToken \(String(describing: session?.authToken))");
                
            } else {
                print("error: \(String(describing: error?.localizedDescription))");
            }
        })
        
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
        //loginButton.center = view.center
        //view.addSubview(loginButton)
    }


}

