//
//  MaxScore.swift
//  MorseLearner
//
//  Created by esirem on 04/12/2017.
//  Copyright © 2017 DelaireCompany. All rights reserved.
//

import Foundation

class MaxScore : NSObject, NSCoding {
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static var ReadScoreURL = DocumentsDirectory.appendingPathComponent("read1Score")
    static var WriteScoreURL = DocumentsDirectory.appendingPathComponent("write1Score")
    
    struct Keys {
        static let writeMaxScore = "writemaxscore"
        static let readMaxScore = "readmaxscore"
    }
    
    var writeScore : Int?
    var readScore : Int?
    
    init(_ gamesTime : Int) {
        
        if gamesTime==1 {
            MaxScore.ReadScoreURL = MaxScore.DocumentsDirectory.appendingPathComponent("read1Score")
            MaxScore.WriteScoreURL = MaxScore.DocumentsDirectory.appendingPathComponent("write1Score")
        }
        
        else if(gamesTime==2){
            MaxScore.ReadScoreURL = MaxScore.DocumentsDirectory.appendingPathComponent("read2Score")
            MaxScore.WriteScoreURL = MaxScore.DocumentsDirectory.appendingPathComponent("write2Score")
        }
        
        else if gamesTime==3 {
            MaxScore.ReadScoreURL = MaxScore.DocumentsDirectory.appendingPathComponent("read3Score")
            MaxScore.WriteScoreURL = MaxScore.DocumentsDirectory.appendingPathComponent("write3Score")
        }
    }
    
    func encodeWithCoder(archiver: NSCoder) {
        archiver.encode(writeScore, forKey: Keys.writeMaxScore)
        archiver.encode(readScore, forKey: Keys.readMaxScore)
    }
    
    required init(coder unarchiver: NSCoder) {
        super.init()
        writeScore = unarchiver.decodeObject(forKey: Keys.writeMaxScore) as? Int
        readScore = unarchiver.decodeObject(forKey: Keys.readMaxScore) as? Int
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(writeScore, forKey: Keys.writeMaxScore)
        aCoder.encode(readScore, forKey: Keys.readMaxScore)
    }
    
    func saveReadScore() {
        NSKeyedArchiver.archiveRootObject(readScore!, toFile: MaxScore.ReadScoreURL.path)
    }
    
    func saveWriteScore() {
        NSKeyedArchiver.archiveRootObject(writeScore!, toFile: MaxScore.WriteScoreURL.path)
    }
    
    func loadReadScore() -> Int? {
        let currentMaxScore : Int? = NSKeyedUnarchiver.unarchiveObject(withFile: MaxScore.ReadScoreURL.path) as? Int
        
        if currentMaxScore == nil {
            return 0
        }
        
        else {
            return currentMaxScore
        }
    }
    
    func loadWriteScore() -> Int? {
        let currentMaxScore : Int? = NSKeyedUnarchiver.unarchiveObject(withFile: MaxScore.WriteScoreURL.path) as? Int
        
        if currentMaxScore == nil {
            return 0
        }
            
        else {
            return currentMaxScore
        }
    }
}
