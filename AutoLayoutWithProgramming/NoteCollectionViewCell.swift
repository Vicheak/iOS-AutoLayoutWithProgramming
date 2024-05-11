//
//  NoteCollectionViewCell.swift
//  AutoLayoutWithProgramming
//
//  Created by @suonvicheakdev on 11/5/24.
//

import UIKit

class NoteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    //used with interface builder
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("cell rendering")
    }
    
    //with programmatic ui
    override init(frame: CGRect) {
        super.init(frame: frame)
//        print("frame rendering")
    }
    
    //before reuse, can set up the properties
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = "1"
        detailLabel.text = "1"
        print("reusing cell render")
    }
    
}
