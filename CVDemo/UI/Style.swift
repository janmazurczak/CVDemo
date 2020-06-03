//
//  Style.swift
//  CVDemo
//
//  Created by Jan Mazurczak on 03/06/2020.
//  Copyright © 2020 Jan Mazurczak. All rights reserved.
//

import UIKit

struct Style {
    let mainBackgroundColor: UIColor
    let tileBackgroundColor: UIColor
    let buttonBackgroundColor: UIColor
    let selectedButtonBackgroundColor: UIColor
    let buttonTextColor: UIColor
    let mainTextColor: UIColor
}

extension Style {
    static var `default`: Style {
        return Style(
            mainBackgroundColor: #colorLiteral(red: 0.6021126761, green: 0.8039215803, blue: 0.8039215803, alpha: 1),
            tileBackgroundColor: #colorLiteral(red: 0.7007042254, green: 0.8626760563, blue: 0.911971831, alpha: 1),
            buttonBackgroundColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),
            selectedButtonBackgroundColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
            buttonTextColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1),
            mainTextColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        )
    }
}
