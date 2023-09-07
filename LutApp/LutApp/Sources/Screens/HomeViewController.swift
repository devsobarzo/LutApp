//
//  ViewController.swift
//  LutApp
//
//  Created by Rober on 05/09/23.
//

import UIKit

enum CellType {
    case timer
    case startCounter
    case stopCounter
}

class HomeViewController: UIViewController {
    
    private let titleLabel: UILabel = UILabel()
    private let tableView: UITableView = UITableView()
    private let logoImageView: UIImageView = UIImageView()
    
    let personSize = CGSize(width: 50, height: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        view.backgroundColor = .yellow
        setupUI()
        setupLayout()
        
        let customImage = createCustomImage(named: "person", size: personSize)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: customImage,
            style: .plain,
            target: self,
            action: #selector(buttonTappedAction)
        )
    }
    
    func createCustomImage(named imageName: String, size: CGSize) -> UIImage {
            return UIGraphicsImageRenderer(size: size).image { _ in
                UIImage(systemName: imageName)?.draw(in: CGRect(origin: .zero, size: size))
            }
        }
    
    @objc private func buttonTappedAction() {
        let accountVC = AccountViewController()
         self.navigationController?.pushViewController(accountVC, animated: true)
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
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.id)
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.id)
        tableView.register(StopTableViewCell.self, forCellReuseIdentifier: StopTableViewCell.id)
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

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cellTypeForIndexPath(indexPath) {
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
            
        case .stopCounter:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StopTableViewCell.id, for: indexPath) as? StopTableViewCell else {
                fatalError("Could not cast LogoTableViewCell")
            }
            cell.setup(text: "Texto final")
            return cell
        }
    }
}

    func cellTypeForIndexPath(_ indexPath: IndexPath) -> CellType {
        
        if indexPath.row == 4 {
            return .startCounter
        } else if indexPath.row == 5 {
            return .stopCounter
        } else {
            return .timer
        }
}



