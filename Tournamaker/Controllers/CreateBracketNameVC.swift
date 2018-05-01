//
//  CreateBracketNameVC.swift
//  Tournamaker
//
//  Created by Anthony Tong on 4/22/18.
//  Copyright © 2018 Anthony Tong. All rights reserved.
//

import UIKit

class CreateBracketNameVC: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bracketNameTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var createdTournament: Tournament!
    

    @IBOutlet weak var bracketNameTextField: UITextField!
    
    @IBAction func createBracket(_ sender: UIButton) {
        createdTournament.setName(name: (bracketNameTextField?.text)!)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "createNewBracket" {
                if let dest = segue.destination as? CreateBracketVC {
                    dest.bracket = createdTournament
                }
            }
        }
    }
    
    

}
