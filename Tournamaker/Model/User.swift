//
//  User.swift
//  Tournamaker
//
//  Created by Anthony Tong on 4/4/18.
//  Copyright © 2018 Anthony Tong. All rights reserved.
//

import Foundation

class User {

    var username: String!
    var id: String!
    
    var wins: Int!
    var losses: Int!
    var totalGamesPlayed: Int!
    var winRatio: Double!
    
    init(username: String) {
        self.username = username
        self.wins = 0
        self.losses = 0
        self.totalGamesPlayed = 0
        self.winRatio = 0
    }
    
    func loseGame() {
        self.losses = self.losses! + 1
        totalGamesPlayed = totalGamesPlayed + 1
        self.winRatio = Double(wins!) / Double(totalGamesPlayed!)
    }
    
    func winGame() {
        self.wins = self.wins! + 1
        totalGamesPlayed = totalGamesPlayed + 1
        self.winRatio = Double(wins!) / Double(totalGamesPlayed!)
    }
    
    func unloseGame() {
        self.losses = self.losses! - 1
        totalGamesPlayed = totalGamesPlayed - 1
        self.winRatio = Double(wins!) / Double(totalGamesPlayed!)
    }
    
    func unwinGame() {
        self.wins = self.wins! - 1
        totalGamesPlayed = totalGamesPlayed - 1
        self.winRatio = Double(wins!) / Double(totalGamesPlayed!)
    }
    
}
