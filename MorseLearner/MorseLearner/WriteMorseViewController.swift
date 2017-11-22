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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Button actions
    @IBAction func backButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func shortMorseButtonAction(_ sender: UIButton) {
        morseResultLabel.text! += "."
        let test = MorseDecoder()
        if(morseResultLabel.text!==test.getMorse(letter: (letterLabel.text?.first)!)){
            print("ok")
        }
    }
    
    @IBAction func longMorseButtonAction(_ sender: UIButton) {
        morseResultLabel.text! += "-"
        let test = MorseDecoder()
        if(morseResultLabel.text!==test.getMorse(letter: (letterLabel.text?.first)!)){
            print("ok")
        }
    }
    
    @IBAction func removeButtonAction(_ sender: UIButton) {
        morseResultLabel!.text?.removeLast()
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
