//
//  LogoUIVIew.swift
//  LutApp
//
//  Created by Rober on 06/09/23.
//

import UIKit

class LogoUIView: UIView {
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.layer.cornerRadius = 20.0
        image.tintColor = .green
        image.contentMode = .scaleAspectFit
        return image
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

        NSLayoutConstraint.activate([
            
            logoImage.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            logoImage.widthAnchor.constraint(equalToConstant: 60),
            logoImage.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
}

