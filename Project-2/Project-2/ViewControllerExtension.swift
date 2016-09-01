//
//  ViewControllerExtension.swift
//  Project-2
//
//  Created by Mon on 9/2/16.
//  Copyright © 2016 Monsoir. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

extension ViewController: UITableViewDelegate, UITableViewDataSource, VideoTableViewCellDelegate {
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoInfos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(VideoTableViewCell.reuseIdentifier(), forIndexPath: indexPath) as! VideoTableViewCell
        
        let videoInfo = videoInfos[indexPath.row]
        cell.ivScreenShot.image = UIImage.init(named: videoInfo.image)
        cell.lbTitle.text = videoInfo.title
        cell.lbSource.text = videoInfo.source
        cell.delegate = self
        
        return cell
        
    }
    
    
    // MARK: VideoTableViewCellDelegate
    func playButtonDidPress(sender: VideoTableViewCell) {
        
        let videoPath = NSBundle.mainBundle().pathForResource("emoji zone", ofType: ".mp4")
        let player = AVPlayer(URL: NSURL(fileURLWithPath: videoPath!))
        let playerController = AVPlayerViewController()
        playerController.player = player
        
        self.presentViewController(playerController, animated: true) {
            playerController.player?.play()
        }
    }
}