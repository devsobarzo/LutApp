//
//  LogoUIVIew.swift
//  LutApp
//
//  Created by Rober on 06/09/23.
//

import UIKit

class LogoUIView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLogo()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLogo()
    }

    private func setupLogo() {
        let logoView = UIView()
        logoView.backgroundColor = .blue
        logoView.layer.cornerRadius = 20.0

        addSubview(logoView)

        logoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logoView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            logoView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        let logotypeLabel = UILabel()
        logotypeLabel.text = "LutApp"
        logotypeLabel.textColor = .black
        logotypeLabel.font = UIFont.boldSystemFont(ofSize: 16)

        addSubview(logotypeLabel)

        logotypeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logotypeLabel.leadingAnchor.constraint(equalTo: logoView.trailingAnchor, constant: 8),
            logotypeLabel.centerYAnchor.constraint(equalTo: logoView.centerYAnchor)
        ])
    }
}

