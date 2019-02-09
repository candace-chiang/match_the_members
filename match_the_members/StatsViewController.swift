//
//  statsViewController.swift
//  match_the_members
//
//  Created by Candace Chiang on 2/8/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    var streak: Int!
    var last: [String]!
    
    var streakLabel: UILabel!
    var lastLabel: UILabel!
    var mdbImage: UIImageView!
    var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //mdb :^)
        let mdb = UIImage(named: "mdb_stats")
        let scale = Float(0.24)
        let width = CGFloat(Float(mdb!.size.width) * scale)
        let height = CGFloat(Float(mdb!.size.height) * scale)
        mdbImage = UIImageView(frame: CGRect(x: 0, y: view.frame.height - height, width: width, height: height))
        mdbImage.image = mdb
        view.addSubview(mdbImage)
        
        //info on streaks
        streakLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height * 1/3))
        streakLabel.center = CGPoint(x: view.frame.width/2, y: view.frame.height * 1/5)
        streakLabel.text = "Your current streak is \(streak!)!\n\n...doesn't look too good...maybe you should play some more!"
        streakLabel.textAlignment = .center
        streakLabel.lineBreakMode = .byWordWrapping
        streakLabel.numberOfLines = 0
        view.addSubview(streakLabel)
        
        //info on last 3 answers
        lastLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height * 1/3))
        lastLabel.center = CGPoint(x: view.frame.width/2, y: view.frame.height * 3/8)
        lastLabel.text = "Your current results are:\n" + last.joined(separator: ", ")
        lastLabel.textAlignment = .center
        lastLabel.lineBreakMode = .byWordWrapping
        lastLabel.numberOfLines = 0
        view.addSubview(lastLabel)
        
        //play my game
        backButton = UIButton(frame: CGRect(x: view.frame.width * 2/3, y: view.frame.height *  3/4, width: view.frame.width/4, height: view.frame.height/10))
        backButton.setTitle("Play :0", for: .normal)
        let margin: CGFloat = 2.0
        backButton.setTitleColor(.black, for: .normal)
        backButton.titleLabel?.adjustsFontSizeToFitWidth = true
        backButton.widthAnchor.constraint(equalToConstant: backButton.titleLabel!.intrinsicContentSize.width + margin * 2.0).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: backButton.titleLabel!.intrinsicContentSize.height + margin * 2.0).isActive = true
        backButton.layer.borderWidth = 2.0
        backButton.backgroundColor = UIColor(hexString: "#A9F5A9")
        backButton.layer.borderColor = UIColor(hexString: "#04B404").cgColor
        backButton.layer.cornerRadius = 10.0
        backButton.addTarget(self, action: #selector(back_clicked), for: .touchUpInside)
        view.addSubview(backButton)
    
    }
    
    @objc func back_clicked() {
        self.dismiss(animated: true, completion: nil)
    }
}

