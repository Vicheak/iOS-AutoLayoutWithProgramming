//
//  CollectionViewController.swift
//  AutoLayoutWithProgramming
//
//  Created by @suonvicheakdev on 11/5/24.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
//        collectionView.showsVerticalScrollIndicator = false
        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        //trigger a layout update
        collectionView?.collectionViewLayout.invalidateLayout()
    }

}

extension CollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NoteCollectionViewCell
        cell.backgroundColor = .systemOrange
        if indexPath.row < 300 {
            cell.titleLabel.text = "\(indexPath.item)"
            cell.detailLabel.text = "\(indexPath.section)"
        }
        return cell
    }
    
}

extension CollectionViewController: UICollectionViewDelegate {
    
//    @available(iOS 13.0, *)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2) {
            cell?.contentView.backgroundColor = .systemGreen
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                cell?.contentView.backgroundColor = .systemOrange
            }
        }
    }
    
//    @discardableResult (discard the return value of a function)
//    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
//        
//    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            if indexPath.item > 10 {
                return nil
            }
            let refreshAction = UIAction(title: "Refresh", image: UIImage(systemName: "arrow.clockwise.circle")) { (action) in
                print("refreshAction")
            }
            let yes = UIAction(title: "Yes", image: UIImage(systemName: "checkmark.seal.fill")) { (action) in
                print("Yes")
            }
            let no = UIAction(title: "No", image: UIImage(systemName: "xmark.app")) { (action) in
                print("No")
            }
            let delete = UIMenu(title: "Delete", image: UIImage(systemName: "trash.square"), options: .destructive, children: [yes, no])
            return UIMenu(title: "test", children: [refreshAction, delete])
        }
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let size = (width - 20)/4 - 10
//        print("width = \(width), size = \(size)")
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}

//UIImagePickerController
