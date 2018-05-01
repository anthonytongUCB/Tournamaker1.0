//
//  Players.swift
//  Tournamaker
//
//  Created by Anthony Tong on 4/20/18.
//  Copyright © 2018 Anthony Tong. All rights reserved.
//

import Foundation

class Players {
    
    static var players = [User]()
    
    static var playerNames = [String]()
    
    static var playerNameDict = [String: User]()

    static func addNewPlayer(name: String) {
        //UserDefaults.standard.set(players, forKey: "players")
        //UserDefaults.standard.set(playerNames, forKey: "playerNames")
        //UserDefaults.standard.set(playerNameDict, forKey: "playerNameDict")
        
        //players = UserDefaults.standard.object(forKey: "players") as! [User]
        //playerNames = UserDefaults.standard.object(forKey: "playerNames") as! [String]
        //playerNameDict = UserDefaults.standard.object(forKey: "playerNameDict") as! [String : User]

        let newPlayer = User(username: name)
        players.insert(newPlayer, at: 0)
        playerNames.insert(name, at: 0)
        playerNameDict[name] = newPlayer
        //UserDefaults.standard.set(players, forKey: "players")
        //UserDefaults.standard.set(playerNames, forKey: "playerNames")
        //UserDefaults.standard.set(playerNameDict, forKey: "playerNameDict")
    }
}
