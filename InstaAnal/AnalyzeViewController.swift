//
//  AnalyzeViewController.swift
//  InstaAnal
//
//  Created by Виталий Волков on 06.05.16.
//  Copyright © 2016 Виталий Волков. All rights reserved.
//

import UIKit
import InstagramKit
import AFNetworking


class AnalyzeViewController: UIViewController {

    @IBOutlet weak var SubscribersWithoutSubscribe: UILabel!
    
    @IBOutlet weak var SubscrebesWithoutSubscriber: UILabel!

    @IBOutlet weak var TotalLikes: UILabel!
    
    @IBOutlet weak var TotalPhotos: UILabel!
    
    @IBOutlet weak var AverageLikes: UILabel!
    
    @IBOutlet weak var AveragePhotoPerWeek: UILabel!
    
    let engine = InstagramEngine()
    
    var Defaults = NSUserDefaults.standardUserDefaults()
    
    
    var totalPosts: Int = 0
    var numTotalLikes: Int = 0
    var avgLikes: Int = 0
    var currentInfo = InstagramPaginationInfo()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetMedia(GetMediaInfo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func GetMediaInfo(allPosts : [InstagramMedia] ) {
        for item in allPosts
        {
        totalPosts+=1
        numTotalLikes += item.likesCount
        Defaults.setValue(item.createdDate, forKey: "DateOfLast")
        Defaults.synchronize()
        UpdateNumbers()
        //print("\(totalPosts)")
        }
        
}

    
    func GetMedia(callback: ([InstagramMedia]) -> ()) -> () {
        
        let userId = Defaults.valueForKey("UserID")
        engine.getMediaForUser(userId as! String,
                               withSuccess:
            {
                media, paginationInfo in
                let m = media as [InstagramMedia]!
                self.currentInfo = paginationInfo
                callback(m);
                

            },
                failure:
            {
                error in print("instagram failed");
                
            })

    }
    
    func UpdateNumbers()  {
        let dateLast: NSDate = Defaults.valueForKey("DateOfLast") as! NSDate
        TotalLikes.text = "\(numTotalLikes)"
        TotalPhotos.text = "\(totalPosts)"
        AverageLikes.text = "\(numTotalLikes/totalPosts)"
        dateLast.
        AveragePhotoPerWeek.text = "\(dateLast)"

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
