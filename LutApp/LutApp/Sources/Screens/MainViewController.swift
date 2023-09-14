//
//  MainViewController.swift
//  LutApp
//
//  Created by Rober on 13/09/23.
//

import UIKit

enum CellsType {
    case timer
    case startCounter
    case finalMessage
}

class MainViewController: UIViewController {
    
    let logoUIView = LogoUIView()
    let nameAppUIView = NameAppUIView()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.id)
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.id)
        tableView.register(FinalMessageTableViewCell.self, forCellReuseIdentifier: FinalMessageTableViewCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupUI()
    }
}


extension MainViewController {
    private func setupUI(){
        
        logoUIView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        nameAppUIView.frame = CGRect(x: 30, y: -10, width: 60, height: 60)
        
        self.view.addSubview(logoUIView)
        self.view.addSubview(nameAppUIView)
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: logoUIView.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 5)
        ])
    }
    
}


extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cellsTypeForIndexPath(indexPath) {
        case .timer:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.id, for: indexPath) as? MainTableViewCell else {
                fatalError("Could not cast MainTableViewCell")
            }
            cell.setup(image: UIImage(systemName: "clock")!)
            return cell
            
        case .startCounter:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.id, for: indexPath) as? ItemTableViewCell else {
                fatalError("Could not cast LogoTableViewCell")
            }
            cell.setupBotons(startImage: UIImage(systemName: "play")!, stopImage: UIImage(systemName: "stop")!)
            return cell
            
        case .finalMessage:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FinalMessageTableViewCell.id, for: indexPath) as? FinalMessageTableViewCell else {
                fatalError("Could not cast LogoTableViewCell")
            }
            cell.setup(text: "Bom Treino, galera!!")
            return cell
        }
    }
}

    func cellsTypeForIndexPath(_ indexPath: IndexPath) -> CellsType {
        
        if indexPath.row == 3 {
            return .startCounter
        } else if indexPath.row == 4 {
            return .finalMessage
        } else {
            return .timer
        }
}



