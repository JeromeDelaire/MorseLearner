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
    
    var timeRemaining = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(timeRemaining)

        var _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        morseLabel.text = MorseDecoder.getRandomMorse()
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
        
        
        
        
        if sender.text!.underestimatedCount > 1 {
            sender.text! = String(describing: sender.text!.last!)
            
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
