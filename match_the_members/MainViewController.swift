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
    var timer: Timer!
    var seconds = 5
    
    var imageView: UIImageView!
    var funView: UIImageView!
    var button_1: UIButton!
    var button_2: UIButton!
    var button_3: UIButton!
    var button_4: UIButton!
    var statsButton: UIButton!
    var pauseButton: UIButton!
    var scoreLabel: UILabel!
    var timerLabel: UILabel!
    
    var names: [Int] = []
    var chosen: Int = -1
    
    var score: Int = 0
    var streak: Int = 0
    var curr_streak: Int = 0
    var last: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        names = get_names()
        chosen = Int(arc4random_uniform(UInt32(4)))
        imageView  =  UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 20, height: view.frame.height / 2))
        imageView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 4 + 50)
        imageView.image = Constants.getImageFor(name: Constants.names[names[chosen]])
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        funView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/3))
        funView.center = CGPoint(x: view.frame.width/2, y: view.frame.height/4 + 50)
        funView.image = nil
        funView.backgroundColor = UIColor(white: 1, alpha: 0.0)
        funView.contentMode = .scaleAspectFit
        view.addSubview(funView)
        
        timerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        timerLabel.center = CGPoint(x: view.frame.width/2, y: (imageView.frame.minY + 15)/2)
        timerLabel.textAlignment = .center
        timerLabel.text = "Loser! You have \(seconds) seconds remaining!!"
        run_timer()
        view.addSubview(timerLabel)
        
        let button_width = view.frame.width/2 - 35
        let button_height = view.frame.height / 4 - 80
        
        button_1 = UIButton(frame: CGRect(x: 20, y: view.frame.height / 2 + 75, width: button_width, height: button_height))
        button_1.setTitle(Constants.names[names[0]], for: .normal)
        make_button(button_1)
        button_1.tag = 0
        view.addSubview(button_1)
        
        button_2 = UIButton(frame: CGRect(x: view.frame.width/2 + 15, y: view.frame.height / 2 + 75, width: button_width, height: button_height))
        button_2.setTitle(Constants.names[names[1]], for: .normal)
        make_button(button_2)
        button_2.tag = 1
        view.addSubview(button_2)
        
        button_3 = UIButton(frame: CGRect(x: 20, y: button_1.frame.maxY + 10, width: button_width, height: button_height))
        button_3.setTitle(Constants.names[names[2]], for: .normal)
        make_button(button_3)
        button_3.tag = 2
        view.addSubview(button_3)
        
        button_4 = UIButton(frame: CGRect(x: view.frame.width/2 + 15, y: button_2.frame.maxY + 10, width: button_width, height: button_height))
        button_4.setTitle(Constants.names[names[3]], for: .normal)
        make_button(button_4)
        button_4.tag = 3
        view.addSubview(button_4)
        
        scoreLabel = UILabel(frame: CGRect(x: view.frame.width/10, y: button_4.frame.maxY + 15, width: view.frame.width/4, height: view.frame.height/15))
        scoreLabel.text = "Score: \(score)"
        scoreLabel.textAlignment = .center
        view.addSubview(scoreLabel)
        
        statsButton = UIButton(frame: CGRect(x: view.frame.width * 2/3, y: button_4.frame.maxY + 15, width: view.frame.width/4, height: view.frame.height/15))
        statsButton.setTitle("Stats!", for: .normal)
        general_button(statsButton)
        statsButton.layer.cornerRadius = 10.0
        statsButton.addTarget(self, action: #selector(stats_clicked), for: .touchUpInside)
        view.addSubview(statsButton)
        
        pauseButton = UIButton(frame: CGRect(x: view.frame.width * 2/5, y: button_4.frame.maxY + 15, width: view.frame.width/4, height: view.frame.height/15))
        pauseButton.setTitle("Stats!", for: .normal)
        general_button(pauseButton)
        pauseButton.layer.cornerRadius = 10.0
        pauseButton.addTarget(self, action: #selector(pause_clicked), for: .touchUpInside)
        view.addSubview(pauseButton)
        
        // Do any additional setup after loading the view.
    }
    
    func make_button(_ button: UIButton) {
        general_button(button)
        button.addTarget(self, action: #selector(clicked), for: .touchUpInside)
    }
    
    func general_button(_ button: UIButton) {
        let margin: CGFloat = 2.0
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.widthAnchor.constraint(equalToConstant: button.titleLabel!.intrinsicContentSize.width + margin * 2.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: button.titleLabel!.intrinsicContentSize.height + margin * 2.0).isActive = true
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5.0
    }
    
    func run_timer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update_timer), userInfo: nil, repeats: false)
    }
    
    @ objc func update_timer() {
        seconds -= 1
        if seconds == 0 {
            timer.invalidate()
            funView.image = UIImage(named: "mad")
            timerLabel.text = "RIP WHO U? BOARD REVIEW! (:"
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(reselect), userInfo: nil, repeats: false)
        } else {
            timerLabel.text = "Loser! You have \(seconds) seconds remaining!!"
            run_timer()
        }
    }
    
    func reset(_ button: UIButton) {
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    @objc func clicked(sender: UIButton) {
        timer.invalidate()
        var new = ""
        if sender.tag == chosen {
            sender.backgroundColor = UIColor(hexString: "#A9F5A9")
            sender.layer.borderColor = UIColor(hexString: "#04B404").cgColor
            score += 1
            curr_streak += 1
            streak = max(streak, curr_streak)
            new = "Woohoo"
            scoreLabel.text = "Score: \(score)"
            timerLabel.text = "Wow teach me how to network!"
            funView.image = UIImage(named: "happy")
        } else {
            sender.backgroundColor = UIColor(hexString: "#F6CECE")
            sender.layer.borderColor = UIColor(hexString: "#FF0000").cgColor
            curr_streak = 0
            new = "Uh oh"
            timerLabel.text = "RIP WHO U? BOARD REVIEW! (:"
            funView.image = UIImage(named: "mad")
        }
        sender.layer.borderWidth = 2.0
        if last.count < 3 {
            last.append(new)
        } else {
            last.remove(at: 0)
            last.append(new)
        }
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(reselect), userInfo: nil, repeats: false)
    }
    
    @objc func reselect() {
        seconds = 5
        names = get_names()
        chosen = Int(arc4random_uniform(UInt32(4)))
        timerLabel.text = "Loser! You have \(seconds) seconds remaining!!"
        imageView.image = Constants.getImageFor(name: Constants.names[names[chosen]])
        funView.image = nil
        button_1.setTitle(Constants.names[names[0]], for: .normal)
        reset(button_1)
        button_2.setTitle(Constants.names[names[1]], for: .normal)
        reset(button_2)
        button_3.setTitle(Constants.names[names[2]], for: .normal)
        reset(button_3)
        button_4.setTitle(Constants.names[names[3]], for: .normal)
        reset(button_4)
        run_timer()
    }
    
    func get_names() -> [Int] {
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
    
    @objc func stats_clicked() {
        timer.invalidate()
        performSegue(withIdentifier: "toStats", sender: self)
    }
    
    @objc func pause_clicked() {
        timer.invalidate()
        performSegue(withIdentifier: "pause", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
                case "toStats":
                    let statsVC = segue.destination as! StatsViewController
                    statsVC.streak = streak
                    statsVC.last = last
                    break
                case "pause":
                    break
                }
        }
    }
    
}

