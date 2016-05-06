//
//  LoginViewController.swift
//  InstaAnal
//
//  Created by Виталий Волков on 05.05.16.
//  Copyright © 2016 Виталий Волков. All rights reserved.
//

import UIKit
import InstagramKit

class LoginViewController: UIViewController, UIWebViewDelegate {
    let engine = InstagramEngine.sharedEngine()
    @IBOutlet weak var web: UIWebView!
    
    
    
    
    @IBAction func DoneButton(sender: AnyObject) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        web.scrollView.bounces = false
        let scope: InstagramKitLoginScope = [InstagramKitLoginScope.Basic, InstagramKitLoginScope.Comments, InstagramKitLoginScope.Likes, InstagramKitLoginScope.Relationships]
        let url = engine.authorizationURLForScope(scope)
        
        
        web.loadRequest(NSURLRequest(URL: url))
        web.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if (engine.isSessionValid())
        {
            
        }
        else
        {
            
        }
        return true
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
