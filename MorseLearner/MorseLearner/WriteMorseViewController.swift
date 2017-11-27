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
    
    var timeRemaining = 60
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(timeRemaining)
        letterLabel.text = randomString()
        var _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shortMorseButtonAction(_ sender: UIButton) {
        morseResultLabel.text! += "."
        
        if(morseResultLabel.text!==MorseDecoder.getMorse(letter: letterLabel.text!)){
            
            letterLabel.text = randomString()
            morseResultLabel.text = ""
            score += 1
            scoreLabel.text = "Score : \(score)"
            
        }
    }
    
    @IBAction func longMorseButtonAction(_ sender: UIButton) {
        morseResultLabel.text! += "-"

        if(morseResultLabel.text!==MorseDecoder.getMorse(letter: letterLabel.text!)){
            
            letterLabel.text = randomString()
            morseResultLabel.text = ""
            score += 1
            scoreLabel.text = "Score : \(score)"
            
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
    
    func randomString() -> String {
        
        let letters : NSString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        let rand = arc4random_uniform(len)
        var nextChar = letters.character(at: Int(rand))
        randomString += NSString(characters: &nextChar, length: 1) as String
        
        return randomString
    }

}
