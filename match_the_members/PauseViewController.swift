//
//  PauseViewController.swift
//  match_the_members
//
//  Created by Candace Chiang on 2/8/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class PauseViewController: UIViewController {
    
    var imageView: UIImageView!
    var playButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //the troll image :^)
        imageView  =  UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 2/3, height: view.frame.height * 2/3))
        imageView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height * 2/5)
        imageView.image = UIImage(named: "troll")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        //go back to the main game!
        playButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/4, height: view.frame.height/15))
        playButton.center = CGPoint(x: view.frame.width/2, y: view.frame.height * 3/4)
        playButton.setTitle("Play :0", for: .normal)
        let margin: CGFloat = 2.0
        playButton.setTitleColor(.black, for: .normal)
        playButton.titleLabel?.adjustsFontSizeToFitWidth = true
        playButton.widthAnchor.constraint(equalToConstant: playButton.titleLabel!.intrinsicContentSize.width + margin * 2.0).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: playButton.titleLabel!.intrinsicContentSize.height + margin * 2.0).isActive = true
        playButton.layer.borderWidth = 2.0
        playButton.backgroundColor = UIColor(hexString: "#A9F5A9")
        playButton.layer.borderColor = UIColor(hexString: "#04B404").cgColor
        playButton.layer.cornerRadius = 10.0
        playButton.addTarget(self, action: #selector(back_clicked), for: .touchUpInside)
        view.addSubview(playButton)

        // Do any additional setup after loading the view.
    }
    
    @objc func back_clicked() {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
