//
//  RedViewController.swift
//  AutoLayoutWithProgramming
//
//  Created by @suonvicheakdev on 5/5/24.
//

import UIKit

class RedViewController: UIViewController {
    
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    
    var portraitConstraints = [NSLayoutConstraint]()
    var landScape1Constraints = [NSLayoutConstraint]()
    var landScape2Constraints = [NSLayoutConstraint]()
    var ipadConstraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        button1.setTitle("Button 1", for: .normal)
        button2.setTitle("Button 2", for: .normal)
        button3.setTitle("Button 3", for: .normal)
        button1.backgroundColor = .blue
        button2.backgroundColor = .blue
        button3.backgroundColor = .blue
        
        //enable setting the constraints
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
//        button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
//        button1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
//        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20).isActive = true
//        //for trialing and bottom
//   button2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
//        button2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
//        
//        let centerX = NSLayoutConstraint(item: button3, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0)
//        let centerY = NSLayoutConstraint(item: button3, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0)
//        let width = NSLayoutConstraint(item: button3, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
//        let height = NSLayoutConstraint(item: button3, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 35)
//        
//        NSLayoutConstraint.activate([centerX, centerY, width, height])
//        
//        button1.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        button1.heightAnchor.constraint(equalToConstant: 35).isActive = true
//        button2.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        button2.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        navigationItem.title = "Red View Controller"
        
        portraitConstraints = [
            NSLayoutConstraint(item: button1, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: button1, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: button2, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: button2, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: view.safeAreaLayoutGuide, attribute: .bottom, relatedBy: .equal, toItem: button3, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: button3, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0)
        ]
        
        //for Regular-Compact
        landScape1Constraints = [
            NSLayoutConstraint(item: button1, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: view.safeAreaLayoutGuide, attribute: .trailing, relatedBy: .equal, toItem: button1, attribute: .trailing, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: button2, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: button2, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: view.safeAreaLayoutGuide, attribute: .bottom, relatedBy: .equal, toItem: button3, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: button3, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading , multiplier: 1, constant: 20)
        ]
        
        landScape2Constraints = [
            NSLayoutConstraint(item: button1, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: button1, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: button2, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: button2, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: view.safeAreaLayoutGuide, attribute: .trailing, relatedBy: .equal, toItem: button3, attribute: .trailing, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: button3, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0)
        ]
        
        activateConstraints()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard let previousTraitCollection = previousTraitCollection else { return }
        
        //disable
        if previousTraitCollection.verticalSizeClass == .regular &&
            previousTraitCollection.horizontalSizeClass == .compact {
            //portrait
            NSLayoutConstraint.deactivate(portraitConstraints)
        } else if previousTraitCollection.verticalSizeClass == .compact &&
            previousTraitCollection.horizontalSizeClass == .regular {
            //lanscape iphone 15 pro max
            NSLayoutConstraint.deactivate(landScape1Constraints)
        } else if previousTraitCollection.verticalSizeClass == .compact &&
            previousTraitCollection.horizontalSizeClass == .compact {
            //lanscape iphone 15
            NSLayoutConstraint.deactivate(landScape2Constraints)
        } else {
            //ipad
            NSLayoutConstraint.deactivate(ipadConstraints)
        }
        
        activateConstraints()
    }
    
    func activateConstraints(){
        //current constraint collection
        
        //activate
        if traitCollection.verticalSizeClass == .regular &&
            traitCollection.horizontalSizeClass == .compact {
            //portrait
            NSLayoutConstraint.activate(portraitConstraints)
        } else if traitCollection.verticalSizeClass == .compact &&
            traitCollection.horizontalSizeClass == .regular {
            //lanscape iphone 15 pro max
            NSLayoutConstraint.activate(landScape1Constraints)
            
        } else if traitCollection.verticalSizeClass == .compact &&
            traitCollection.horizontalSizeClass == .compact {
            //lanscape iphone 15
            NSLayoutConstraint.activate(landScape2Constraints)
        } else {
            //ipad
            NSLayoutConstraint.activate(ipadConstraints)
        }
    }
    
}
