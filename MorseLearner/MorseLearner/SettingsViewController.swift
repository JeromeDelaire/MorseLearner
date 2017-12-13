//
//  SettingsViewController.swift
//  MorseLearner
//
//  Created by esirem on 04/12/2017.
//  Copyright © 2017 DelaireCompany. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var oneMinuteSwitch: UISwitch!
    @IBOutlet weak var twoMinutesSwitch: UISwitch!
    @IBOutlet weak var threeMinutesSwitch: UISwitch!
    
    var settingsSaver = SettingsSaver(1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(settingsSaver.loadGamesTime()==2) {
            oneMinuteSwitch.setOn(false, animated: true)
            twoMinutesSwitch.setOn(true, animated: true)
        }
        
        else if settingsSaver.loadGamesTime()==3 {
            oneMinuteSwitch.setOn(false, animated: true)
            threeMinutesSwitch.setOn(true, animated: true)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func oneMinute(_ sender: UISwitch) {
        
        settingsSaver.saveGamesTime(gamesTime: 1)
        
        if sender.isOn {
            twoMinutesSwitch.setOn(false, animated: true)
            threeMinutesSwitch.setOn(false, animated: true)
        }
        
        else {
            if (!twoMinutesSwitch.isOn && !threeMinutesSwitch.isOn) {
                sender.setOn(true, animated: true)
            }
        }
    }
    
    @IBAction func twoMinutes(_ sender: UISwitch) {
        
        settingsSaver.saveGamesTime(gamesTime: 2)
        
        if sender.isOn {
            oneMinuteSwitch.setOn(false, animated: true)
            threeMinutesSwitch.setOn(false, animated: true)
        }
            
        else {
            if (!oneMinuteSwitch.isOn && !threeMinutesSwitch.isOn) {
                sender.setOn(true, animated: true)
            }
        }
    }
    
    @IBAction func threeMinutes(_ sender: UISwitch) {
        
        settingsSaver.saveGamesTime(gamesTime: 3)
        
        if sender.isOn {
            twoMinutesSwitch.setOn(false, animated: true)
            oneMinuteSwitch.setOn(false, animated: true)
        }
            
        else {
            if (!twoMinutesSwitch.isOn && !oneMinuteSwitch.isOn) {
                sender.setOn(true, animated: true)
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
