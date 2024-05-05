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
        
        button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        button1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20).isActive = true
//        button2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        button2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        
        let centerX = NSLayoutConstraint(item: button3, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: button3, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: button3, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        
        NSLayoutConstraint.activate([centerX, centerY, height])
        
        button1.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}
