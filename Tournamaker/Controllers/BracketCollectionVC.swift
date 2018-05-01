//
//  BracketCollectionVC.swift
//  Tournamaker
//
//  Created by Anthony Tong on 4/22/18.
//  Copyright © 2018 Anthony Tong. All rights reserved.
//

import UIKit

class BracketCollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    @IBOutlet weak var bracketsCollectionView: UICollectionView!
    
    
    var newBracket: Tournament!
    
    var bracketArray: [Tournament]?
    
    var selectedBracket: Tournament!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bracketsCollectionView.dataSource = self
        bracketsCollectionView.delegate = self
//        let ssb = Tournament()
//        let bp = Tournament()
//        let db = Tournament()
//        ssb.setName(name: "Super Smash Bros.")
//        bp.setName(name: "Beer Pong")
//        db.setName(name: "Dodgeball")
//        Brackets.addNewTournament(newTournament: ssb)
//        Brackets.addNewTournament(newTournament: bp)
//        Brackets.addNewTournament(newTournament: db)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Brackets.tournaments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bracketCell", for: indexPath) as! BracketCollectionViewCell
        cell.bracketNameLabel.text = Brackets.tournaments[indexPath.row].tournamentName!
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // You other cell selected functions here ...
        // then add the below at the end of it.
        selectedBracket = Brackets.tournaments[indexPath.row]
        bracketsCollectionView.deselectItem(at: indexPath, animated: true)
        performSegue(withIdentifier: "segueToBracket", sender: bracketsCollectionView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "segueToBracketName" {
                if let dest = segue.destination as? CreateBracketNameVC {
                    newBracket = Tournament()
                    dest.createdTournament = newBracket
                }
            }
            if identifier == "segueToBracket" {
                if let dest = segue.destination as? BracketVC {
                    dest.bracket = selectedBracket
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bracketsCollectionView.reloadData()
        // TO DO:
        updateData()
    }
    
    func updateData() {
        bracketArray = Brackets.tournaments
    }
    
    @IBAction func unwindToBracketCollectionVC(segue:UIStoryboardSegue) {
        
    }
    
    

}
