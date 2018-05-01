//
//  Tournament.swift
//  Tournamaker
//
//  Created by Anthony Tong on 4/18/18.
//  Copyright © 2018 Anthony Tong. All rights reserved.
//

import Foundation

class Tournament {

    var players: [User]!
    
    var tournamentName: String!
    
    var oneFourWinner: String!
    var twoThreeWinner: String!
    var finalWinner: String!
    
    init() {
        players = [User]()
    }
    
    func setName(name: String) {
        tournamentName = name
    }
    
    func addPlayer(player: User) {
        players.append(player)
    }
    
    
    
}
