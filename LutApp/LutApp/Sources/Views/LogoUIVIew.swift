//
//  LogoUIVIew.swift
//  LutApp
//
//  Created by Rober on 06/09/23.
//

import UIKit

enum TypeView {
    case dois
    case imagem
    case label
}

class LogoUIView: UIView {
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.layer.cornerRadius = 20.0
        image.tintColor = .green
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .red
        return image
    }()
    
    lazy var nameAppLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "LutApp"
        label.backgroundColor = .blue
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        
        addSubview(logoImage)
        addSubview(nameAppLabel)
        
        NSLayoutConstraint.activate([
            
            logoImage.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            logoImage.widthAnchor.constraint(equalToConstant: 60),
            logoImage.heightAnchor.constraint(equalToConstant: 60),
            
            nameAppLabel.topAnchor.constraint(equalTo: logoImage.topAnchor),
            nameAppLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 2),
            nameAppLabel.widthAnchor.constraint(equalToConstant: 60),
            nameAppLabel.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    public func headerState(headerType: TypeView) {
        switch headerType {
        case .dois:
            logoImage.isHidden = false
            nameAppLabel.isHidden = false
        case .imagem:
            logoImage.isHidden = false
            nameAppLabel.isHidden = true
        case .label:
            logoImage.isHidden = true
            nameAppLabel.isHidden = false
            
        }
    }
}

