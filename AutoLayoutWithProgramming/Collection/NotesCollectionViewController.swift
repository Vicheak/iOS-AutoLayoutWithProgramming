//
//  NotesCollectionViewController.swift
//  AutoLayoutWithProgramming
//
//  Created by @suonvicheakdev on 12/5/24.
//

import UIKit

struct Note {
    let id: UUID
    let title: String
    let detail: String
    
    init(id: UUID, title: String, detail: String) {
        self.id = id
        self.title = title
        self.detail = detail
    }
    
    init(title: String, detail: String) {
        self.id = UUID()
        self.title = title
        self.detail = detail
    }
}

class NotesCollectionViewController: UIViewController {
    
    var notes = [Note(title: "title", detail: "detail"),
                 Note(title: "title", detail: "detail"),
                 Note(title: "title", detail: "detail"),
                 Note(title: "title", detail: "detail"),
                 Note(title: "title", detail: "detail"),
                 Note(title: "title", detail: "detail"),
                 Note(title: "title", detail: "detail"),
                 Note(title: "title", detail: "detail"),]

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveNote), name: NSNotification.Name.saveData, object: nil)
    }
    
    @objc func rightBarButtonTapped(sender: UIBarButtonItem){
        let viewController = CreateNoteCollectionViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func saveNote(notification: Notification){
        guard let note = notification.object as? Note else { return }
        notes.append(note)
        //collectionView.reloadData()
        collectionView.insertItems(at: [IndexPath(row: notes.count - 1, section: 0)])
    }

}

extension NotesCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NotesCollectionViewCell
        cell.backgroundColor = .systemOrange
        cell.titleLabel.text = notes[indexPath.row].title
        cell.detailLabel.text = notes[indexPath.row].detail
        return cell
    }
    
}


extension NotesCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = CreateNoteCollectionViewController()
        viewController.note = notes[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
