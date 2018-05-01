//
//  NewPlayerVC.swift
//  Tournamaker
//
//  Created by Anthony Tong on 4/20/18.
//  Copyright © 2018 Anthony Tong. All rights reserved.
//

import UIKit

class NewPlayerVC: UIViewController, UITextFieldDelegate {
    
    var playerViewController: PlayerViewController?

    @IBOutlet weak var NameTextField: UITextField!
    
    @IBAction func addPlayer(_ sender: UIButton) {
        Players.addNewPlayer(name: (NameTextField?.text)!)
        playerViewController?.updateData()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.NameTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}
