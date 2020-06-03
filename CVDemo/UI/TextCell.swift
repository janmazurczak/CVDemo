//
//  TextCell.swift
//  CVDemo
//
//  Created by Jan Mazurczak on 02/06/2020.
//  Copyright © 2020 Jan Mazurczak. All rights reserved.
//

import UIKit

class TextCell: FullWidthAutosizingCell {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = ""
    }
    
    func configure() {
        label.textColor = Configuration.current.style.mainTextColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        contentView.backgroundColor = Configuration.current.style.tileBackgroundColor
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = false
        clipsToBounds = false
        backgroundColor = .clear
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.2
        NSLayoutConstraint.activate(layoutConstraints())
    }
    
    func layoutConstraints() -> [NSLayoutConstraint] {
        return [
            label.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ]
    }
    
}

