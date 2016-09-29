//
//  ContentViewController.swift
//  ThumbGridDemo
//
//  Created by Michael Eaton on 9/25/16.
//  Copyright © 2016 Michael Eaton. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var playerVC: UIView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var titleText: UILabel!
    
    var showItem: ContentItem = ContentItem.init()
    var contentPlayerController = AVPlayerViewController()
    var contentPlayer: AVPlayer?
    let layer = AVPlayerLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionText.text = showItem.description
        titleText.text = showItem.descriptionTitle
        
        let urlPathString:String? = NSBundle.mainBundle().pathForResource(showItem.video, ofType: "mov")
        if let urlPath = urlPathString {
            let movieUrl = NSURL.fileURLWithPath(urlPath)
            contentPlayer = AVPlayer(URL: movieUrl)
            contentPlayerController.player = contentPlayer
            contentPlayer!.play()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeBtnTapped(sender: AnyObject) {
        contentPlayer?.pause()
        self.view.willRemoveSubview(contentPlayerController.view)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if "embedPlayer" == segue.identifier {
            contentPlayerController = segue.destinationViewController as! AVPlayerViewController
        }
        
    }

}
