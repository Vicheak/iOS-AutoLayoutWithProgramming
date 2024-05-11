//
//  TestViewController.swift
//  AutoLayoutWithProgramming
//
//  Created by @suonvicheakdev on 11/5/24.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var toggleModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func toggleModeSwitchTapped(_ sender: UISwitch) {
        print("toggle : \(sender.isOn) \(toggleModeSwitch.isOn)")
    }
    
}
