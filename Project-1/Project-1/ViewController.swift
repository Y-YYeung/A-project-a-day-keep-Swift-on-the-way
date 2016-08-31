//
//  ViewController.swift
//  Project-1
//
//  Created by Mon on 8/31/16.
//  Copyright © 2016 Monsoir. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataSource = ["我唱得不够动人你别皱眉",
                      "我愿意和你约定至死",
                      "我只想嬉戏唱游到下世纪",
                      "请你别嫌我将这煽情奉献给你"];
    
    var fontNames = ["Menlo-Regular",
                     "Helvetica-Bold",
                     "PingFangSC-Thin"]
    
    var selectedFontNameIndex = 0
    
    // MARK: Lazy Initialization
    lazy var tableView: UITableView = {
        var view = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor.whiteColor()
        return view
    }()
    
    lazy var btnChange: UIButton = {
        var view = UIButton(type: UIButtonType.System)
        view.setTitle("Change Font", forState:.Normal);
        view.addTarget(self, action: #selector(btnAction), forControlEvents: .TouchUpInside)
        view.backgroundColor = UIColor.yellowColor()
        return view
    }()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupSubviews()
        
        for family in UIFont.familyNames() {
            for font in UIFont.fontNamesForFamilyName(family) {
                print(font)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Helpers
    func setupSubviews() {
        view.backgroundColor = UIColor.whiteColor()
        title = "淘汰－陈奕迅";
        
        view.addSubview(tableView)
        view.addSubview(btnChange)
        
        tableView.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(btnChange.snp_top)
        }
        
        btnChange.snp_makeConstraints { (make) in
            make.bottom.equalTo(view)
            make.size.equalTo(CGSizeMake(100, 50))
            make.centerX.equalTo(view)
        }
    }
    
    func btnAction() -> Void {
        selectedFontNameIndex = (selectedFontNameIndex + 1) % fontNames.count
        tableView.reloadData()
    }
    
    // MARK: UITableViewDelegate and DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // static variable in swift.
        struct CellInfo {static var cellID = "cellID"}
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellInfo.cellID);
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: CellInfo.cellID);
        }
        
        cell!.textLabel?.text = dataSource[indexPath.row];
        cell!.textLabel?.font = UIFont(name: fontNames[selectedFontNameIndex], size: 18)
        
        return cell!;
    }

}

