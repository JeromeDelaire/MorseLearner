//
//  ReadMorseViewController.swift
//  MorseLearner
//
//  Created by esirem on 27/11/2017.
//  Copyright © 2017 DelaireCompany. All rights reserved.
//

import UIKit

class ReadMorseViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var morseLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var maxScoreLabel: UILabel!
    
    var timeRemaining = 60
    var score = 0
    var maxScore: MaxScore?
    var settingsSaver = SettingsSaver(1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maxScore = MaxScore(settingsSaver.loadGamesTime()!)
        
        timeLabel.text = String(timeRemaining)
        timeRemaining = settingsSaver.loadGamesTime()! * 60

        var _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        morseLabel.text = MorseDecoder.randomLetter()
        scoreLabel.text! = "Score : \(score)"
        maxScoreLabel.text = "Record : \(maxScore!.loadReadScore()!)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func update() {
        timeRemaining -= 1
        
        if(timeRemaining==0){
            self.dismiss(animated: true, completion: {})
        }
            
        else{
            timeLabel.text = String(timeRemaining)
        }
        
    }

    
    @IBAction func responseChanged(_ sender: UITextField) {
        
        if sender.text!.count > 1 {
            sender.text! = String(describing: sender.text!.last!)
        }
        
        if sender.text!.count == 1 {
            if(sender.text!.uppercased()==morseLabel.text!){
                morseLabel.text! = MorseDecoder.randomLetter()
                score += 1
                scoreLabel.text! = "Score : \(score)"
                sender.text! = ""
                
                if(score>maxScore!.loadReadScore()!){
                    maxScore!.readScore = score
                    maxScore!.saveReadScore()
                    maxScoreLabel.text = "Record : \(score)"
                }
            }
            
            else {
                if(score>0) {
                    score -= 1
                }
                scoreLabel.text! = "Score : \(score)"
                
            }
        }

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
