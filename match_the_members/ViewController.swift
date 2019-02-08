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
        
        startButton = UIButton(frame: CGRect(x: view.frame.width / 2 - 60, y: mdbImage.frame.minY/2, width: 120, height: 50))
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.layer.borderWidth = 1.0
        startButton.layer.borderColor = UIColor.black.cgColor
        startButton.layer.cornerRadius = 5.0
        startButton.addTarget(self, action: #selector(startClicked), for: .touchUpInside)
        view.addSubview(startButton)
    }
    
    @objc func startClicked() {
        performSegue(withIdentifier: "start", sender: self)
    }

}

