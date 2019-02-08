//
//  MainViewController.swift
//  match_the_members
//
//  Created by Candace Chiang on 2/7/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let length = Constants.names.count
    var imageView: UIImageView!
    var button_1: UIButton!
    var button_2: UIButton!
    var button_3: UIButton!
    var button_4: UIButton!
    var chosen: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var names = getNames()
        chosen = Int(arc4random_uniform(UInt32(4)))
        imageView  =  UIImageView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height / 2))
        imageView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 4 + 50)
        imageView.image = Constants.getImageFor(name: Constants.names[names[chosen]])
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        let button_width = view.frame.width/2 - 40
        let button_height = view.frame.height / 4 - 80
        let margin: CGFloat = 1.0
        
        button_1 = UIButton(frame: CGRect(x: 20, y: view.frame.height / 2 + 75, width: button_width, height: button_height))
        button_1.setTitle(Constants.names[names[0]], for: .normal)
        button_1.setTitleColor(.black, for: .normal)
        button_1.titleLabel?.adjustsFontSizeToFitWidth = true
        button_1.widthAnchor.constraint(equalToConstant: button_1.titleLabel!.intrinsicContentSize.width + margin * 2.0).isActive = true
        button_1.heightAnchor.constraint(equalToConstant: button_1.titleLabel!.intrinsicContentSize.height + margin * 2.0).isActive = true
        button_1.layer.borderWidth = 1.0
        button_1.layer.borderColor = UIColor.black.cgColor
        button_1.layer.cornerRadius = 5.0
        button_1.tag = 0
        button_1.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        view.addSubview(button_1)
        
        button_2 = UIButton(frame: CGRect(x: view.frame.width/2 + 20, y: view.frame.height / 2 + 75, width: button_width, height: button_height))
        button_2.setTitle(Constants.names[names[1]], for: .normal)
        button_2.setTitleColor(.black, for: .normal)
        button_2.titleLabel?.adjustsFontSizeToFitWidth = true
        button_2.widthAnchor.constraint(equalToConstant: button_2.titleLabel!.intrinsicContentSize.width + margin * 2.0).isActive = true
        button_2.heightAnchor.constraint(equalToConstant: button_2.titleLabel!.intrinsicContentSize.height + margin * 2.0).isActive = true
        button_2.layer.borderWidth = 1.0
        button_2.layer.borderColor = UIColor.black.cgColor
        button_2.layer.cornerRadius = 5.0
        button_2.tag = 1
        button_2.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        view.addSubview(button_2)
        
        button_3 = UIButton(frame: CGRect(x: 20, y: button_1.frame.maxY + 10, width: button_width, height: button_height))
        button_3.setTitle(Constants.names[names[2]], for: .normal)
        button_3.setTitleColor(.black, for: .normal)
        button_3.titleLabel?.adjustsFontSizeToFitWidth = true
        button_3.widthAnchor.constraint(equalToConstant: button_3.titleLabel!.intrinsicContentSize.width + margin * 2.0).isActive = true
        button_3.heightAnchor.constraint(equalToConstant: button_3.titleLabel!.intrinsicContentSize.height + margin * 2.0).isActive = true
        button_3.layer.borderWidth = 1.0
        button_3.layer.borderColor = UIColor.black.cgColor
        button_3.layer.cornerRadius = 5.0
        button_3.tag = 2
        button_3.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        view.addSubview(button_3)
        
        button_4 = UIButton(frame: CGRect(x: view.frame.width/2 + 20, y: button_2.frame.maxY + 10, width: button_width, height: button_height))
        button_4.setTitle(Constants.names[names[3]], for: .normal)
        button_4.setTitleColor(.black, for: .normal)
        button_4.titleLabel?.adjustsFontSizeToFitWidth = true
        button_4.widthAnchor.constraint(equalToConstant: button_4.titleLabel!.intrinsicContentSize.width + margin * 2.0).isActive = true
        button_4.heightAnchor.constraint(equalToConstant: button_4.titleLabel!.intrinsicContentSize.height + margin * 2.0).isActive = true
        button_4.layer.borderWidth = 1.0
        button_4.layer.borderColor = UIColor.black.cgColor
        button_4.layer.cornerRadius = 5.0
        button_4.tag = 3
        button_4.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        view.addSubview(button_4)
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func clicked(sender: UIButton) {
        if sender.tag == chosen {
            sender.backgroundColor = UIColor(hexString: "#A9F5A9")
            sender.layer.borderColor = UIColor(hexString: "#04B404").cgColor
            sender.layer.borderWidth = 2.0
        } else {
            sender.backgroundColor = UIColor(hexString: "#F6CECE")
            sender.layer.borderColor = UIColor(hexString: "#FF0000").cgColor
            sender.layer.borderWidth = 2.0
        }
        viewDidLoad()
    }
    
    func getNames() -> [Int] {
        var names: [Int] = []
        var poss: Int
        while names.count < 4 {
            poss = Int(arc4random_uniform(UInt32(length)))
            if !(names.contains(poss)) {
                names.append(poss)
            }
        }
        return names
    }
    
}

