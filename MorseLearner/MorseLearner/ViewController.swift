//
//  ViewController.swift
//  MorseLearner
//
//  Created by esirem on 21/11/2017.
//  Copyright © 2017 DelaireCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var writeMaxScoreLabel: UILabel!
    @IBOutlet weak var readMaxScoreLabel: UILabel!
    
    var maxScore : MaxScore?
    var settingsSaver = SettingsSaver(1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maxScore = MaxScore(settingsSaver.loadGamesTime()!)
        
        writeMaxScoreLabel.text = "Record : \(maxScore!.loadWriteScore()!)"
        readMaxScoreLabel.text = "Record : \(maxScore!.loadReadScore()!)"
        // any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancel(sender: UIStoryboardSegue) {
        
    }

    override func viewDidAppear(_ animated: Bool) {
        maxScore = MaxScore(settingsSaver.loadGamesTime()!)
        writeMaxScoreLabel.text = "Record : \(maxScore!.loadWriteScore()!)"
        readMaxScoreLabel.text = "Record : \(maxScore!.loadReadScore()!)"
       
    }

}

