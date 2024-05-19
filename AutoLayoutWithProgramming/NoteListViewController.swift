//
//  NoteListViewController.swift
//  AutoLayoutWithProgramming
//
//  Created by @suonvicheakdev on 5/5/24.
//

import SnapKit
import UIKit

class NoteListViewController: UIViewController {
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "View"
        
        view.addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
//        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        tableView.backgroundColor = .orange
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.top.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(clickAdd))
        
        //register a prototype for displaying table view cell
        tableView.register(NoteTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc func clickAdd() {
//        let viewController = RedViewController()
//        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension NoteListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoteTableViewCell
//        cell.textLabel?.text = "\(indexPath.row)"
//        cell.detailTextLabel?.text = "\(indexPath.row)"
        
        cell.titleLabel.text = "\(indexPath.row)"
        cell.detailLabel.text = "\(indexPath.row)"
        return cell
    }
    
}

extension NoteListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

class SubtitleTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class NoteTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let detailLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        detailLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
//        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
//        
//        detailLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
//        detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
//        detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).offset(20)
            make.bottom.equalTo(contentView).offset(-20)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.trailing.bottom.equalTo(contentView).offset(-20)
        }
    }
    
}
