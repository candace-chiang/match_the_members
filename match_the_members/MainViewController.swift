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
    var yes : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yes = UILabel(frame: CGRect(x: 10, y: 10, width: view.frame.width, height: 50))
        yes.text = "YES"
        yes.textAlignment = .center
        view.addSubview(yes)
        
        // Do any additional setup after loading the view.
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

