//
//  FullWidthCollectionViewController.swift
//  CVDemo
//
//  Created by Jan Mazurczak on 02/06/2020.
//  Copyright © 2020 Jan Mazurczak. All rights reserved.
//

import UIKit

class FullWidthCollectionViewController: UICollectionViewController {
    
    var spacing: CGFloat { return 20 }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayoutAsAdaptiveVerticalIfChanged(size: view.bounds.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        setupLayoutAsAdaptiveVerticalIfChanged(size: size)
        collectionView?.invalidateLayoutAlongsideTransition(transitionCoordinator: coordinator)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupLayoutAsAdaptiveVerticalIfChanged(size: view.bounds.size)
    }
    
    private var adaptiveLayoutSize: CGSize = .zero
    func setupLayoutAsAdaptiveVerticalIfChanged(size: CGSize) {
        guard adaptiveLayoutSize.width != size.width || adaptiveLayoutSize.height != size.height else {
            return
        }
        flowLayout?.setupAsAdaptiveVertical(spacing: spacing, in: size)
        adaptiveLayoutSize = size
    }
    
}

extension UICollectionViewFlowLayout {
    func setupAsAdaptiveVertical(spacing: CGFloat, in size: CGSize) {
        setupAsStandardVerticalLayout(spacing: spacing, sideMargin: spacing)
        estimatedItemSize = CGSize(width: size.width - 2 * spacing, height: 44)
    }
}

extension UICollectionView {
    func invalidateLayoutAlongsideTransition(transitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
        coordinator.animate(alongsideTransition: { _ in
            self.layoutIfNeeded()
        }, completion: nil)
    }
}

extension UICollectionViewController {
    var flowLayout: UICollectionViewFlowLayout? {
        return collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
    }
}

extension UICollectionViewFlowLayout {
    func setupAsStandardVerticalLayout(spacing: CGFloat = 4.0, sideMargin: CGFloat = 0.0) {
        scrollDirection = .vertical
        minimumInteritemSpacing = spacing
        minimumLineSpacing = spacing
        sectionInset = UIEdgeInsets(top: spacing, left: sideMargin, bottom: spacing, right: sideMargin)
    }
}
