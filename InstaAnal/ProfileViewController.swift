//
//  ProfileViewController.swift
//  InstaAnal
//
//  Created by Виталий Волков on 05.05.16.
//  Copyright © 2016 Виталий Волков. All rights reserved.
//

import UIKit
import InstagramKit
import AFNetworking

class ProfileViewController: UIViewController {

    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var Photo: UIImageView!
    @IBOutlet weak var Subscribes: UILabel!
    @IBOutlet weak var Subscribers: UILabel!
    let user = InstagramUser()
    let engine = InstagramEngine()
    var UserDefaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        engine.getSelfUserDetailsWithSuccess({ (user)  in
            self.UserDefaults.setObject("\(user.Id)", forKey: "UserID")
            self.UserDefaults.synchronize()
            self.Name.text = user.fullName
            self.Subscribes.text = "\(user.followsCount)"
            self.Subscribers.text = "\(user.followedByCount)"
            self.Photo.setImageWithURL(user.profilePictureURL!)
            print(user.description);
            }, failure: { error in
                print("instagram failed");
        })
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
