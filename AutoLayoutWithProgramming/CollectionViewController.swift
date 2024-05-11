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
        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    }

}

extension CollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
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

//UIImagePickerController
