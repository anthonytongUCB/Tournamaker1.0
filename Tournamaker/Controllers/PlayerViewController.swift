//
//  PlayerViewController.swift
//  Tournamaker
//
//  Created by Anthony Tong on 4/18/18.
//  Copyright © 2018 Anthony Tong. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var playerArray: [User]?
    
    @IBAction func showPopup(_ sender: UIButton) {
    }
    
    
    @IBOutlet weak var playerTableview: UITableView!
    
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerTableview.dataSource = self
        playerTableview.delegate = self
        // Do any additional setup after loading the view.
        playerTableview.tableFooterView = UIView(frame: CGRect.zero)
        playerArray = Players.players

    }
    
    override func viewWillAppear(_ animated: Bool) {
        playerTableview.reloadData()
        
        // TO DO:
        updateData()
    }
    
    func updateData() {
        playerArray = Players.players
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let array = playerArray {
            return array.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            if (editingStyle == .delete) {
                // handle delete (by removing the data from your array and updating the tableview)
                let user = Players.players.remove(at: indexPath.row)
                Players.playerNames.remove(at: indexPath.row)
                Players.playerNameDict.removeValue(forKey: user.username)
                playerArray?.remove(at: indexPath.row)
                
                playerTableview.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.endUpdates()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // You other cell selected functions here ...
        // then add the below at the end of it.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerTableViewCell
        let user = playerArray?[indexPath.row]
        cell.playerName.text = user?.username
        cell.playerRecord.text = "Record: " + String(describing: (user?.wins)!) + "-" + String(describing: (user?.losses)!)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "createNewPlayer" {
                if let dest = segue.destination as? NewPlayerVC {
                    dest.playerViewController = self
                }
            }
        }
    }
    
}
