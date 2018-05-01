//
//  BracketVC.swift
//  Tournamaker
//
//  Created by Anthony Tong on 4/26/18.
//  Copyright © 2018 Anthony Tong. All rights reserved.
//

import UIKit

class BracketVC: UIViewController {

    var bracket: Tournament!
    
    var oneFour = false
    var twoThree = false
    var finals = false
    
    @IBOutlet weak var FirstSeedName: UIButton!
    
    @IBAction func FirstSeedPressed(_ sender: UIButton) {
        if !oneFour {
            AFinalist.setTitle(FirstSeedName.titleLabel?.text, for: .normal)
            Players.playerNameDict[(FirstSeedName.titleLabel?.text)!]?.winGame()
            Players.playerNameDict[(FourthSeedName.titleLabel?.text)!]?.loseGame()
            oneFour = true
            bracket.oneFourWinner = FirstSeedName.titleLabel?.text
        }
    }
    
    @IBOutlet weak var SecondSeedName: UIButton!
    
    @IBAction func SecondSeedPressed(_ sender: UIButton) {
        if !twoThree {
            BFinalist.setTitle(SecondSeedName.titleLabel?.text, for: .normal)
            Players.playerNameDict[(SecondSeedName.titleLabel?.text)!]?.winGame()
            Players.playerNameDict[(ThirdSeedName.titleLabel?.text)!]?.loseGame()
            twoThree = true
            bracket.twoThreeWinner = SecondSeedName.titleLabel?.text

        }
    }
    
    @IBOutlet weak var ThirdSeedName: UIButton!
    
    @IBAction func ThirdSeedPressed(_ sender: UIButton) {
        if !twoThree {
            BFinalist.setTitle(ThirdSeedName.titleLabel?.text, for: .normal)
            Players.playerNameDict[(ThirdSeedName.titleLabel?.text)!]?.winGame()
            Players.playerNameDict[(SecondSeedName.titleLabel?.text)!]?.loseGame()
            twoThree = true
            bracket.twoThreeWinner = ThirdSeedName.titleLabel?.text
        }
    }
    
    @IBOutlet weak var FourthSeedName: UIButton!
    
    @IBAction func FourthPressed(_ sender: UIButton) {
        if !oneFour {
            AFinalist.setTitle(FourthSeedName.titleLabel?.text, for: .normal)
            Players.playerNameDict[(FourthSeedName.titleLabel?.text)!]?.winGame()
            Players.playerNameDict[(FirstSeedName.titleLabel?.text)!]?.loseGame()
            oneFour = true
            bracket.oneFourWinner = FourthSeedName.titleLabel?.text

        }
    }
    
    @IBOutlet weak var AFinalist: UIButton!
    
    @IBAction func AFinalistWin(_ sender: UIButton) {
        if oneFour && twoThree && !finals {
            Winner.setTitle(AFinalist.titleLabel?.text, for: .normal)
            Players.playerNameDict[(AFinalist.titleLabel?.text)!]?.winGame()
            Players.playerNameDict[(BFinalist.titleLabel?.text)!]?.loseGame()
            finals = true
            bracket.finalWinner = AFinalist.titleLabel?.text
        }
    }
    
    @IBOutlet weak var BFinalist: UIButton!
    
    @IBAction func BFinalistWin(_ sender: UIButton) {
        if oneFour && twoThree && !finals {
            Winner.setTitle(BFinalist.titleLabel?.text, for: .normal)
            Players.playerNameDict[(BFinalist.titleLabel?.text)!]?.winGame()
            Players.playerNameDict[(AFinalist.titleLabel?.text)!]?.loseGame()
            finals = true
            bracket.finalWinner = BFinalist.titleLabel?.text
        }
    }
    
    @IBOutlet weak var Winner: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBracket()
        // Do any additional setup after loading the view.
    }
    
    func setupBracket() {
        FirstSeedName.setTitle(bracket.players[0].username, for: .normal)
        SecondSeedName.setTitle(bracket.players[1].username, for: .normal)
        ThirdSeedName.setTitle(bracket.players[2].username, for: .normal)
        FourthSeedName.setTitle(bracket.players[3].username, for: .normal)
        if let round1Winner = bracket.oneFourWinner {
            AFinalist.setTitle(round1Winner, for: .normal)
            oneFour = true
        }
        if let round2Winner = bracket.twoThreeWinner {
            BFinalist.setTitle(round2Winner, for: .normal)
            twoThree = true
        }
        if let round3Winner = bracket.finalWinner {
            Winner.setTitle(round3Winner, for: .normal)
            finals = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
