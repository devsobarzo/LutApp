//
//  HomeViewController.swift
//  LutApp
//
//  Created by Rober on 05/09/23.
//

import UIKit

enum CellType {
    case timer
    case startCounter
    case finalMessage
}

class HomeViewController: UIViewController {
    
    private let stackView: UIStackView = UIStackView()
    private let logoImageView: UIImageView = UIImageView()
    private let iniTitleLabel: UILabel = UILabel()
    private let endTitleLabel: UILabel = UILabel()
    private let tableView: UITableView = UITableView()
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
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "logo")
        logoImageView.tintColor = .red
        logoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        iniTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        iniTitleLabel.text = "Lut"
        iniTitleLabel.textColor = .blue
        endTitleLabel.textAlignment = .left
        iniTitleLabel.font = .monospacedDigitSystemFont(ofSize: 30, weight: .bold)
        
        endTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        endTitleLabel.text = "App"
        endTitleLabel.textColor = .systemRed
        endTitleLabel.textAlignment = .left
        endTitleLabel.font = .italicSystemFont(ofSize: 20)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.id)
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.id)
        tableView.register(FinalMessageTableViewCell.self, forCellReuseIdentifier: FinalMessageTableViewCell.id)
    }
    
    private func setupLayout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(iniTitleLabel)
        stackView.addArrangedSubview(endTitleLabel)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250),
            
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 5)
            
        
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
        return 5
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
            
        case .finalMessage:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FinalMessageTableViewCell.id, for: indexPath) as? FinalMessageTableViewCell else {
                fatalError("Could not cast LogoTableViewCell")
            }
            cell.setup(text: "Bom Treino, galera!!")
            return cell
        }
    }
}

    func cellTypeForIndexPath(_ indexPath: IndexPath) -> CellType {
        
        if indexPath.row == 3 {
            return .startCounter
        } else if indexPath.row == 4 {
            return .finalMessage
        } else {
            return .timer
        }
}



