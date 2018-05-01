//
//  CreateBracketVC.swift
//  Tournamaker
//
//  Created by Anthony Tong on 4/22/18.
//  Copyright © 2018 Anthony Tong. All rights reserved.
//

import UIKit

class CreateBracketVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var isSearching = false
    
    var bracket: Tournament!
    
    var bracketPlayers: [String]!

    @IBOutlet weak var searchPlayersTableView: UITableView!
    
    @IBOutlet weak var playerSearchBar: UISearchBar!
    
    @IBOutlet weak var bracketPlayersTableView: UITableView!
    
    @IBAction func addPlayerToBracket(_ sender: UIButton) {
        if Players.playerNames.contains(playerSearchBar.text!) {
            bracketPlayers.append(playerSearchBar.text!)
            playerSearchBar.text = ""
            searchPlayersTableView.isHidden = true
            view.endEditing(true)
            bracketPlayersTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if tableView == bracketPlayersTableView {
            if (editingStyle == UITableViewCellEditingStyle.delete) {
                // handle delete (by removing the data from your array and updating the tableview)
                if (editingStyle == .delete) {
                    // handle delete (by removing the data from your array and updating the tableview)
                    bracketPlayers?.remove(at: indexPath.row)
                    
                    tableView.beginUpdates()
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                    tableView.endUpdates()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if tableView == bracketPlayersTableView {
            return .delete
        }
        return .none
    }
    
    var filteredData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchPlayersTableView.delegate = self
        searchPlayersTableView.dataSource = self
        bracketPlayersTableView.delegate = self
        bracketPlayersTableView.dataSource = self
        playerSearchBar.delegate = self
        playerSearchBar.returnKeyType = UIReturnKeyType.done
//        searchPlayersTableView.tableFooterView = UIView(frame: CGRect.zero)
        bracketPlayersTableView.tableFooterView = UIView(frame: CGRect.zero)

        searchPlayersTableView.isHidden = true
        bracketPlayers = [String]()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // You other cell selected functions here ...
        // then add the below at the end of it.
        if tableView == searchPlayersTableView {
            playerSearchBar.text = filteredData[indexPath.row]
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backToBrackets(_ sender: UIButton) {
        if bracketPlayers.count == 4 {
            Brackets.addNewTournament(newTournament: bracket)
            performSegue(withIdentifier: "unwindToBracketCollectionVC", sender: self)
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == searchPlayersTableView {
            if isSearching {
                return filteredData.count
            }
            return Players.playerNames.count
        } else {
            if let players = bracketPlayers {
                return players.count
            }
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == searchPlayersTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addPlayerCell", for: indexPath) as! AddPlayerCell
            
            let text: String!
            
            if isSearching {
                text = filteredData[indexPath.row]
            } else {
                text = ""
            }
            
            cell.playerName.text = text!
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addedPlayerCell", for: indexPath) as! AddedPlayerCell
            cell.playerName.text = bracketPlayers[indexPath.row]
            return cell
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if playerSearchBar.text == nil || playerSearchBar.text == "" {
            isSearching = false
            searchPlayersTableView.isHidden = true
            searchPlayersTableView.reloadData()
        } else {
            isSearching = true
            filteredData = Players.playerNames.filter({$0.contains(searchBar.text!)})
            
            if filteredData.count > 0 {
                searchPlayersTableView.isHidden = false
            }
            else {
                searchPlayersTableView.isHidden = true
            }
            searchPlayersTableView.reloadData()
        }
    }

    
    @IBAction func addTournament(_ sender: UIButton) {
        if bracketPlayers.count != 4 {
            let alertController = UIAlertController(title: "Please Enter 4 Players", message: "", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "close", style: .default) {
                (action:UIAlertAction) in
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            for name in bracketPlayers {
                bracket.addPlayer(player: Players.playerNameDict[name]!)
            }
        }
    }
    
}
