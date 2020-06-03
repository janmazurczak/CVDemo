//
//  BlockUI.swift
//  CVDemo
//
//  Created by Jan Mazurczak on 02/06/2020.
//  Copyright © 2020 Jan Mazurczak. All rights reserved.
//

import UIKit
import SafariServices
import StoreKit
import MessageUI

class BlockUI: FullWidthCollectionViewController {
    
    private var block: CVBlock?
    private var items: [CVBranch] { return block?.items ?? [] }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flowLayout?.headerReferenceSize = CGSize(width: 320, height: 75)
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = Configuration.current.style.mainBackgroundColor
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.register(TextCell.self, forCellWithReuseIdentifier: "text")
        collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: "button")
    }
    
    func deselectAll() {
        for selected in collectionView.indexPathsForSelectedItems ?? [] {
            collectionView.deselectItem(at: selected, animated: true)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! Header
        header.label.text = block?.title ?? ""
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .cellIdentifier(for: item), for: indexPath) as! TextCell
        cell.label.text = item.displayText
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        switch item {
        case .block(let block):
            guard let blockUI = Configuration.current.makePresenter() as? (UIViewController & Presenter) else { return }
            blockUI.present(block)
            navigationController?.pushViewController(blockUI, animated: true)
        case .text:
            break
        case .link(let link):
            let vc = SFSafariViewController(url: link.url)
            vc.delegate = self
            present(vc, animated: true, completion: nil)
        case .mail(let mail):
            guard MFMailComposeViewController.canSendMail() else { return }
            let vc = MFMailComposeViewController()
            vc.setToRecipients([mail.mail])
            vc.setSubject(mail.subject)
            vc.mailComposeDelegate = self
            present(vc, animated: true, completion: nil)
        case .appStoreLink(let item):
            let vc = SKStoreProductViewController()
            vc.delegate = self
            vc.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier : item.itemID]) { _, _ in }
            present(vc, animated: true, completion: nil)
        }
    }
    
}

extension String {
    static func cellIdentifier(for item: CVBranch) -> String {
        switch item {
        case .text: return "text"
        case .block, .link, .mail, .appStoreLink: return "button"
        }
    }
}

extension BlockUI: Presenter {
    func present(_ block: CVBlock) {
        self.block = block
        collectionView?.reloadData()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: block.title, style: .plain, target: nil, action: nil)
    }
}

extension BlockUI: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true) { [weak self] in
            self?.deselectAll()
        }
    }
}

extension BlockUI: SKStoreProductViewControllerDelegate {
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        dismiss(animated: true) { [weak self] in
            self?.deselectAll()
        }
    }
}

extension BlockUI: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true) { [weak self] in
            self?.deselectAll()
        }
    }
}
