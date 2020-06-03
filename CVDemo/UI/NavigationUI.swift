//
//  NavigationUI.swift
//  CVDemo
//
//  Created by Jan Mazurczak on 03/06/2020.
//  Copyright © 2020 Jan Mazurczak. All rights reserved.
//

import UIKit

class NavigationUI: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.backgroundColor = .clear
        navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = Configuration.current.style.mainTextColor
    }
}
