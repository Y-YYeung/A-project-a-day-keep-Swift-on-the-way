//
//  VideoTableViewCell.swift
//  Project-2
//
//  Created by Mon on 9/1/16.
//  Copyright © 2016 Monsoir. All rights reserved.
//

import UIKit
import SnapKit

struct VideoInfo {
    let image: String
    let title: String
    let source: String
}

// : class 否则，编译器不通过
///*@objc*/ protocol VideoTableViewCellDelegate : class {
//    /*optional*/ func playButtonDidPress(sender: VideoTableViewCell) -> Void
//}

protocol VideoTableViewCellDelegate : NSObjectProtocol {
    func playButtonDidPress(sender: VideoTableViewCell) -> Void
}

class VideoTableViewCell: UITableViewCell {
    
    weak var delegate: VideoTableViewCellDelegate?
    
    // MARK: Lazy Initialization
    lazy var ivScreenShot: UIImageView = {
        var view = UIImageView()
        return view
    }()
    
    lazy var lbTitle: UILabel = {
        var view = UILabel()
        return view
    }()
    
    lazy var lbSource: UILabel = {
        var view = UILabel()
        return view
    }()
    
    lazy var btnPlay: UIButton = {
        var view = UIButton(type: .System)
        view.setBackgroundImage(UIImage.init(named: "imgPlay"), forState: .Normal)
        view.addTarget(self, action: #selector(actionPlay), forControlEvents: .TouchUpInside)
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Class methods
    override class func requiresConstraintBasedLayout() -> Bool {
        return true
    }
    
    class func reuseIdentifier() -> String {
        return NSStringFromClass(self)
    }
    
    // MARK: Helpers
    
    private func setupSubviews() -> Void {
        contentView.addSubview(ivScreenShot)
        contentView.addSubview(btnPlay)
        contentView.addSubview(lbTitle)
        contentView.addSubview(lbSource)
    }
    
    override func updateConstraints() {
        contentView.snp_makeConstraints { (make) in
            make.edges.equalTo(self);
        }
        
        ivScreenShot.snp_makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
        
        btnPlay.snp_makeConstraints { (make) in
            make.center.equalTo(contentView)
        }
        
        lbTitle.snp_makeConstraints { (make) in
            make.centerX.equalTo(contentView)
            make.top.equalTo(btnPlay.snp_bottom).offset(13);
        }
        
        lbSource.snp_makeConstraints { (make) in
            make.centerX.equalTo(contentView)
            make.top.equalTo(lbTitle.snp_bottom).offset(4)
            make.height.equalTo(14)
            make.bottom.equalTo(contentView).offset(-1)
        }
        
        super.updateConstraints()
    }
    
    func actionPlay() -> Void {
        delegate?.playButtonDidPress(self)
        
//        if ((delegate?.playButtonDidPress) != nil) {
//            delegate?.playButtonDidPress!(self)
//        }
    }

}
