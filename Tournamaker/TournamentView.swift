//
//  TournamentView.swift
//  Tournamaker
//
//  Created by Anthony Tong on 4/4/18.
//  Copyright © 2018 Anthony Tong. All rights reserved.
//

import UIKit

class TournamentView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let rect = UIBezierPath(roundedRect: CGRect(x: 150, y: 150, width: 100, height: 100), cornerRadius: 5.0)
        UIColor.green.set()
        rect.fill()
    }
    

}
