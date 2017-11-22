//
//  MorseDecoder.swift
//  MorseLearner
//
//  Created by esirem on 22/11/2017.
//  Copyright © 2017 DelaireCompany. All rights reserved.
//

import Foundation

class MorseDecoder {
    
    let letters = [".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."]
    
    let digits = ["-----", ".----", "..---", "...--", "....-", ".....", "-....", "--...", "---..", "----."]
    
    func getMorse(letter: Character) -> String {
        var index = letter.unicodeScalarCodePoint()
        if(index<65){
            index -= 48 ;
            return digits[index]
        }else{
            index -= 65 ;
            return letters[index]
        }
        
        
    }
}

extension Character
{
    func unicodeScalarCodePoint() -> Int
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return (Int)(scalars[scalars.startIndex].value)
    }
}
