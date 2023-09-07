//
//  LogoUIVIew.swift
//  LutApp
//
//  Created by Rober on 06/09/23.
//

import UIKit

class LogoUIView: UIView {

    var logoImage: UIImageView = UIImageView()
    var logoLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLogo()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLogo()
    }

    private func setupLogo() {
        logoImage.backgroundColor = .blue
        logoImage.layer.cornerRadius = 20.0
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        logoLabel.text = "LutApp"
        logoLabel.textColor = .black
        logoLabel.font = UIFont.boldSystemFont(ofSize: 16)
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(logoImage)
        addSubview(logoLabel)
        
        NSLayoutConstraint.activate([
            
            logoImage.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 60),
            logoImage.heightAnchor.constraint(equalToConstant: 60),
            
            logoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            logoLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: -10),
            logoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            logoLabel.heightAnchor.constraint(equalToConstant: 40),
            logoLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

