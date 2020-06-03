//
//  FullWidthAutosizingCell.swift
//  CVDemo
//
//  Created by Jan Mazurczak on 02/06/2020.
//  Copyright © 2020 Jan Mazurczak. All rights reserved.
//

import UIKit

class FullWidthAutosizingCell: UICollectionViewCell {
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size, withHorizontalFittingPriority: UILayoutPriority.required, verticalFittingPriority: UILayoutPriority.defaultLow)
        
        let result = super.preferredLayoutAttributesFitting(layoutAttributes)
        result.size = CGSize(width: layoutAttributes.size.width, height: size.height)
        
        return result
    }
}
