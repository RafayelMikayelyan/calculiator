//
//  customButton.swift
//  newVersionOfCalculiator
//
//  Created by Rafayel on 06.09.23.
//

import UIKit

class CustomButton: UIButton {
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        // harc xia es 2.2 ov chisht ashxatum voch te 2 ov sa dem e matemin
        layer.cornerRadius = layer.frame.height / 2.2
        
    }
}
