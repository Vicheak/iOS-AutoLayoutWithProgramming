//
//  UserViewController.swift
//  AutoLayoutWithProgramming
//
//  Created by @suonvicheakdev on 8/5/24.
//

import UIKit

class UserViewController: UIViewController {
    
    let stackView = UIStackView()
    let welcomeLabel = UILabel()
    let usernameLabel = UILabel()
    
    var data: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.addArrangedSubview(welcomeLabel)
        stackView.addArrangedSubview(usernameLabel)
        
        navigationItem.title = "Welcome"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action:#selector(popViewController))
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        welcomeLabel.text = "Welcome : "
        welcomeLabel.contentMode = .left
        welcomeLabel.setContentHuggingPriority(UILayoutPriority(1000), for: .horizontal)
        
        usernameLabel.text = data["username"]
        usernameLabel.contentMode = .left
        
        NotificationCenter.default.addObserver(self, selector: #selector(setUsernameLabel), name: NSNotification.Name.login, object: nil)
    }
    
    @objc func popViewController(sender: UIBarButtonItem){
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func setUsernameLabel(notification: Notification){
        guard let data = notification.object as? [String: String] else { return }
        usernameLabel.text = data["username"]
    }
    
}
