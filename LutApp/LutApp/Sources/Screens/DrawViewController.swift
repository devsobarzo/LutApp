//
//  DrawViewController.swift
//  LutApp
//
//  Created by Rober on 06/09/23.
//

import UIKit

enum CellTypes {
    case characterTest
    case canvas
}

class DrawViewController: UIViewController {

    private let titleLabel: UILabel = UILabel()
    private let tableView: UITableView = UITableView()
    private let logoImageView: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        setupUI()
        setupLayout()
    }
    private func setupUI(){
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "logo")
        logoImageView.tintColor = .red
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "LutApp"
        titleLabel.textColor = .blue
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharTableViewCell.self, forCellReuseIdentifier: CharTableViewCell.id)
        tableView.register(CanvasTableViewCell.self, forCellReuseIdentifier: CanvasTableViewCell.id)
    
    }
    
    private func setupLayout() {
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 60),
            logoImageView.heightAnchor.constraint(equalToConstant: 60),
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: -10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10)
            
        
        ])
    }
}


extension DrawViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension DrawViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cellTypeForIndexPath(indexPath) {
            
        case .characterTest:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CharTableViewCell.id, for: indexPath) as? CharTableViewCell else {
                fatalError("Could not cast MainTableViewCell")
            }
            cell.setup(text: "Escrever um character", image: UIImage(systemName: "pencil.line")!)
            return cell
            
        case .canvas:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CanvasTableViewCell.id, for: indexPath) as? CanvasTableViewCell else {
                fatalError("Could not cast LogoTableViewCell")
            }
            cell.setup(text: "Desenhe o character que está vendo: ")
            return cell
        }
    }

    func cellTypeForIndexPath(_ indexPath: IndexPath) -> CellTypes {
        if indexPath.row == 1 {
            return .characterTest
        } else {
            return .canvas
        }
    }

    
}



