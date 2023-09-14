//
//  Source.swift
//  LutApp
//
//  Created by Rober on 13/09/23.
//

import UIKit

enum HeaderViewString: String {
    case backButton = "voltar"
    case bellButton = "notificacao"
}

enum HeaderType {
    case navigation
    case indication
}

protocol HeaderViewProtocol: AnyObject {
    func actionBackButton()
    func actionBellButton()
}

class HeaderView: UIView {
    
    private weak var delegate: HeaderViewProtocol?
    
    public func delegate(delegate: HeaderViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: HeaderViewString.backButton.rawValue ), for: .normal)
        button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var bellButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named:  HeaderViewString.bellButton.rawValue ), for: .normal)
        button.addTarget(self, action: #selector(self.tappedBellButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        self.addSubView()
        self.configConstraints()
    }
    
    public func headerState(headerType: HeaderType, title: String) {
        titleLabel.text = title
        switch headerType {
        case .navigation:
            backButton.isHidden = false
        case .indication:
            backButton.isHidden = true
        }
    }
    
    private func addSubView() {
        self.addSubview(backButton)
        self.addSubview(titleLabel)
        self.addSubview(bellButton)
    }
    
    @objc private func tappedBackButton() {
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedBellButton() {
        self.delegate?.actionBellButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.backButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            self.backButton.heightAnchor.constraint(equalToConstant: 20),
            self.backButton.widthAnchor.constraint(equalToConstant: 20),
            
            self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.bellButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.bellButton.heightAnchor.constraint(equalToConstant: 25),
            self.bellButton.widthAnchor.constraint(equalToConstant: 20),
            self.bellButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
