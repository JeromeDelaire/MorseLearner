//
//  SettingsSaver.swift
//  MorseLearner
//
//  Created by esirem on 13/12/2017.
//  Copyright © 2017 DelaireCompany. All rights reserved.
//

import Foundation

class SettingsSaver : NSObject, NSCoding {
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let gamesTimeURL = DocumentsDirectory.appendingPathComponent("gamesTime")
    
    struct Keys {
        static let gamesTime = "gamestime"
    }
    
    var time = 0
    
    init(_ gamesTime : Int) {
        self.time = gamesTime
    }
    
    func encodeWithCoder(archiver: NSCoder) {
        archiver.encode(time, forKey: Keys.gamesTime)
    }
    
    required init(coder unarchiver: NSCoder) {
        super.init()
        time = unarchiver.decodeObject(forKey: Keys.gamesTime) as! Int
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(time, forKey: Keys.gamesTime)
    }
    
    func saveGamesTime (gamesTime: Int) {
        self.time = gamesTime
        NSKeyedArchiver.archiveRootObject(time, toFile: SettingsSaver.gamesTimeURL.path)
    }
    
    func loadGamesTime() -> Int? {
        let currentGameTime : Int? = NSKeyedUnarchiver.unarchiveObject(withFile: SettingsSaver.gamesTimeURL.path) as? Int
        
        if currentGameTime == nil {
            return 1
        }
        
        else {
            return currentGameTime
        }
    }
}
