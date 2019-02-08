//
//  ViewController.swift
//  match_the_members
//
//  Created by Candace Chiang on 2/7/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mdbImage: UIImageView!
    var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //did it wrong cuz i didn't see project but i don't want to change it!
        let mdb = UIImage(named: "mdb")
        let scale = Float(0.24)
        let width = CGFloat(Float(mdb!.size.width) * scale)
        let height = CGFloat(Float(mdb!.size.height) * scale)
        mdbImage = UIImageView(frame: CGRect(x: 0, y: view.frame.height - height, width: width, height: height))
        mdbImage.image = mdb
        view.addSubview(mdbImage)
    }

}

