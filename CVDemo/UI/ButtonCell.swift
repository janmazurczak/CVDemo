//
//  ButtonCell.swift
//  CVDemo
//
//  Created by Jan Mazurczak on 02/06/2020.
//  Copyright © 2020 Jan Mazurczak. All rights reserved.
//

import UIKit

class ButtonCell: TextCell {
    
    override func configure() {
        super.configure()
        contentView.backgroundColor = Configuration.current.style.buttonBackgroundColor
        label.textColor = Configuration.current.style.buttonTextColor
    }
    
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = isSelected
                ? Configuration.current.style.selectedButtonBackgroundColor
                : Configuration.current.style.buttonBackgroundColor
        }
    }
    
}
