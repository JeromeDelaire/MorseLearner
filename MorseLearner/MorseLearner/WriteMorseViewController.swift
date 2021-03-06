//
//  WriteMorseViewController.swift
//  MorseLearner
//
//  Created by esirem on 22/11/2017.
//  Copyright © 2017 DelaireCompany. All rights reserved.
//

import UIKit

class WriteMorseViewController: UIViewController {
    
    @IBOutlet weak var morseResultLabel: UILabel!
    @IBOutlet weak var letterLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var maxScoreLabel: UILabel!
    
    var score = 0
    var maxScore : MaxScore?
    var settingsSaver = SettingsSaver(1)
    var timeRemaining = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maxScore = MaxScore(settingsSaver.loadGamesTime()!)
        timeRemaining = settingsSaver.loadGamesTime()! * 60
        timeLabel.text = String(timeRemaining)
        letterLabel.text = MorseDecoder.randomLetter()
        var _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        maxScoreLabel.text = "Record : \(maxScore!.loadWriteScore()!)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shortMorseButtonAction(_ sender: UIButton) {
        morseResultLabel.text! += "E"
        
        if(convertMorseResult(morse: morseResultLabel.text!)==MorseDecoder.getMorse(letter: letterLabel.text!)){
            
            letterLabel.text = MorseDecoder.randomLetter()
            morseResultLabel.text = ""
            score += 1
            scoreLabel.text = "Score : \(score)"
            
            if(score>maxScore!.loadWriteScore()!) {
                maxScore!.writeScore = score
                maxScore!.saveWriteScore()
                maxScoreLabel.text = "Record : \(score)"
            }
            
        }
    }
    
    @IBAction func longMorseButtonAction(_ sender: UIButton) {
        morseResultLabel.text! += "T"

        if(convertMorseResult(morse: morseResultLabel.text!)==MorseDecoder.getMorse(letter: letterLabel.text!)){
            
            letterLabel.text = MorseDecoder.randomLetter()
            morseResultLabel.text = ""
            score += 1
            scoreLabel.text = "Score : \(score)"
            
            if(score>maxScore!.loadWriteScore()!) {
                maxScore!.writeScore = score
                maxScore!.saveWriteScore()
                maxScoreLabel.text = "Record : \(score)"
            }
        }
    }
    
    @IBAction func removeButtonAction(_ sender: UIButton) {
        if(morseResultLabel.text!.underestimatedCount>0) {
            morseResultLabel!.text?.removeLast()
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

    @objc func update() {
        timeRemaining -= 1
        
        if(timeRemaining==0){
            self.dismiss(animated: true, completion: {});
        }
        
        else{
           timeLabel.text = String(timeRemaining)
        }
        
    }
    
    func convertMorseResult(morse: String) -> String {
        var temp = ""
        for i in 0...morse.count-1 {
            let index = morse.index(morse.startIndex, offsetBy: i)
  
            if morse[index] == "E" {
                temp += "."
            }
            
            else if morse[index] == "T" {
                temp += "-"
            }
        }
        
        return temp
    }
}
