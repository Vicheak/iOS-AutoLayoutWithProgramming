//
//  CreateNoteViewController.swift
//  AutoLayoutWithProgramming
//
//  Created by @suonvicheakdev on 11/5/24.
//

import UIKit

class CreateNoteViewController: UIViewController {
    
    let navigationBar = UINavigationBar()
    let titleTextField = UITextField()
    let detailTextView = UITextView()
    let saveButton = UIButton()
    var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .white
        
        navigationItem.title = "Create New Note"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
        
        setUpViews();
        
        titleTextField.delegate = self
        detailTextView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func rightBarButtonTapped(sender: UIBarButtonItem){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "CollectionViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showKeyboard(notification: Notification){
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        bottomConstraint.constant = keyboardFrame.height * (-1)
        view.layoutIfNeeded()
    }
    
    @objc func hideKeyboard(){
        bottomConstraint.constant = 0
        view.layoutIfNeeded()
    }
    
    func setUpViews(){
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        view.addSubview(navigationBar)
        
        let navigationItem = UINavigationItem(title: "Test Navbar")
        navigationBar.setItems([navigationItem], animated: true)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: navigationBar, attribute: .left, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: navigationBar, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: navigationBar, attribute: .right, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 0)
        ]);

        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        bottomConstraint = NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
            bottomConstraint,
            NSLayoutConstraint(item: scrollView, attribute: .left, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: scrollView, attribute: .right, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 0)
        ])
        
        let mainView = UIView()
        scrollView.addSubview(mainView)
        
        mainView.backgroundColor = .systemOrange
        mainView.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = NSLayoutConstraint(item: mainView, attribute: .height, relatedBy: .equal, toItem: scrollView.frameLayoutGuide, attribute: .height, multiplier: 1, constant: 0)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: mainView, attribute: .top, relatedBy: .equal, toItem: scrollView.contentLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: mainView, attribute: .left, relatedBy: .equal, toItem: scrollView.contentLayoutGuide, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: mainView, attribute: .bottom, relatedBy: .equal, toItem: scrollView.contentLayoutGuide , attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: mainView, attribute: .right, relatedBy: .equal, toItem: scrollView.contentLayoutGuide, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: mainView, attribute: .width, relatedBy: .equal, toItem: scrollView.frameLayoutGuide, attribute: .width, multiplier: 1, constant: 0)
        ])
        
        mainView.addSubview(titleTextField)
        
        titleTextField.placeholder = "Enter note title"
        titleTextField.font = UIFont(name: "HelveticaNeue", size: 17)
        titleTextField.borderStyle = .roundedRect
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: titleTextField, attribute: .top, relatedBy: .equal, toItem: mainView, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: titleTextField, attribute: .left, relatedBy: .equal, toItem: mainView, attribute: .left, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: titleTextField, attribute: .right , relatedBy: .equal, toItem: mainView, attribute: .right, multiplier: 1, constant: -20)
        ])
        
        mainView.addSubview(detailTextView)
        
        detailTextView.text = "Enter node detail"
        detailTextView.font = UIFont(name: "HelveticaNeue", size: 17)
        detailTextView.textColor = .lightGray
        detailTextView.backgroundColor = .white
        detailTextView.layer.borderWidth = 0.4
        detailTextView.layer.borderColor = UIColor.lightGray.cgColor
        detailTextView.layer.cornerRadius = 5
        detailTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: detailTextView, attribute: .top, relatedBy: .equal, toItem: titleTextField, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: detailTextView, attribute: .left, relatedBy: .equal, toItem: mainView, attribute: .left, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: detailTextView, attribute: .right, relatedBy: .equal, toItem: mainView, attribute: .right, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: detailTextView, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        ])
        
        mainView.addSubview(saveButton)
        
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = 5
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: saveButton, attribute: .top, relatedBy: .equal, toItem: detailTextView, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: saveButton, attribute: .bottom, relatedBy: .equal, toItem: mainView, attribute: .bottom , multiplier: 1, constant: -20),
            NSLayoutConstraint(item: saveButton, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0)
        ])
        
        let tapGuesture = UITapGestureRecognizer()
        mainView.addGestureRecognizer(tapGuesture)
        
        tapGuesture.addTarget(self, action: #selector(viewEndEdit))
    }
    
    @objc func viewEndEdit(sender: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
}

extension CreateNoteViewController: UITextFieldDelegate, UITextViewDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleTextField {
            detailTextView.becomeFirstResponder()
        }
        return true
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if detailTextView.text == "Enter node detail" {
            detailTextView.text = ""
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if detailTextView.text == "" {
            detailTextView.text = "Enter node detail"
        }
    }
    
}
