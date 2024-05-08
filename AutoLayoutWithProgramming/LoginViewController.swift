//
//  LoginViewController.swift
//  AutoLayoutWithProgramming
//
//  Created by @suonvicheakdev on 5/5/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let mainView = UIView()
    let stackView = UIStackView()
    let stackViewTextField = UIStackView()
    let stackViewButton = UIStackView()
    let imageView = UIImageView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    var bottomConstraint = NSLayoutConstraint()
    let tapGestureRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        view.addGestureRecognizer(tapGestureRecognizer)
        scrollView.addSubview(mainView)
        mainView.backgroundColor = .white
        mainView.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(stackViewTextField)
        stackView.addArrangedSubview(stackViewButton)
        stackViewTextField.addArrangedSubview(usernameTextField)
        stackViewTextField.addArrangedSubview(passwordTextField)
        stackViewButton.addArrangedSubview(loginButton)
        
        navigationItem.title = "Login"
        
        setUpConstraints()

        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //subscribe to event
        tapGestureRecognizer.addTarget(self, action: #selector(tapEndEdit))
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func showKeyboard(notification: Notification){
        guard let size = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        bottomConstraint.constant = size.height
        view.layoutIfNeeded()
    }
    
    @objc func hideKeyboard(){
        bottomConstraint.constant = 0
        view.layoutIfNeeded()
    }
    
    @objc func tapEndEdit(sender: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func loginButtonTapped(sender: UIButton){
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        let viewController = UserViewController()
        
//        NotificationCenter.default.post(name: NSNotification.Name.login, object: [
//            "username": username,
//            "password": password
//        ])
        
        viewController.data = [
            "username": username,
            "password": password
        ]
        
        navigationController?.pushViewController(viewController, animated: true)
        
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    func setUpConstraints(){
        //scroll view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        bottomConstraint = view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        bottomConstraint.isActive = true
        
        //main view
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 0).isActive = true
        mainView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 0).isActive = true
        mainView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: 0).isActive = true
        mainView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: 0).isActive = true
        mainView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, multiplier: 1, constant: 0).isActive = true
        let mainViewHeightConstraint = mainView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor, multiplier: 1, constant: 0)
        mainViewHeightConstraint.priority = .defaultLow
        mainViewHeightConstraint.isActive = true
        
        //stack view
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.contentMode = .scaleToFill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: mainView, attribute: .top, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: mainView, attribute: .leading, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: mainView, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: stackView, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: mainView, attribute: .trailing, relatedBy: .equal, toItem: stackView, attribute: .trailing, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: mainView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: stackView, attribute: .centerY, relatedBy: .equal, toItem: mainView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        //image view
        imageView.image = UIImage(systemName: "apple.terminal")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //stack view for text field container
        stackViewTextField.axis = .vertical
        stackViewTextField.alignment = .fill
        stackViewTextField.distribution = .fill
        stackViewTextField.spacing = 20
        stackViewTextField.contentMode = .scaleToFill
        
        //username text field
        usernameTextField.borderStyle = .roundedRect
//        usernameTextField.layer.cornerRadius = 20
        usernameTextField.placeholder = "Enter username"
   
        //password text field
        passwordTextField.borderStyle = .roundedRect
//        passwordTextField.layer.cornerRadius = 20
        passwordTextField.placeholder = "Enter password"
        passwordTextField.isSecureTextEntry = true
        
        //stack view for button container
        stackViewButton.axis = .vertical
        stackViewButton.alignment = .fill
        stackViewButton.distribution = .fill
        stackViewButton.spacing = 0
        
        //login button
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.layer.cornerRadius = 10
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}

extension NSNotification.Name {
    
    static let login = NSNotification.Name.init("login")
    
}
