//
//  ViewController.swift
//  Project-2
//
//  Created by Mon on 9/1/16.
//  Copyright © 2016 Monsoir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var videoInfos = [VideoInfo(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
                VideoInfo(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
                VideoInfo(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
                VideoInfo(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
                VideoInfo(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
                VideoInfo(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")];
    
    // MARK: Lazy Initialization
    lazy var tableView : UITableView = {
        let view = UITableView(frame: CGRectZero, style: .Plain)
        view.delegate = self;
        view.dataSource = self;
        view.backgroundColor = UIColor.blackColor()
        view.rowHeight = 220
        view.showsVerticalScrollIndicator = false
        view.registerClass(VideoTableViewCell.self, forCellReuseIdentifier: VideoTableViewCell.reuseIdentifier())
        
        return view
    }()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Helpers
    func setupSubviews() -> Void {
        view.addSubview(tableView)
        title = "Videos"
        
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
}

