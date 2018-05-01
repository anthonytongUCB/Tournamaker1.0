//
//  Brackets.swift
//  Tournamaker
//
//  Created by Anthony Tong on 4/22/18.
//  Copyright © 2018 Anthony Tong. All rights reserved.
//

import Foundation

class Brackets {
    
    static var tournaments = [Tournament]()
    
    static func addNewTournament(newTournament: Tournament) {
        tournaments.insert(newTournament, at: 0)
    }
    
    
}
