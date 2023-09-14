//
//  AccountIconUIView.swift
//  LutApp
//
//  Created by Rober on 13/09/23.
//

import UIKit

class AccountIconUIView: UIView {

    lazy var accountIconUIImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
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
        
        addSubview(accountIconUIImageView)

        NSLayoutConstraint.activate([
            
            accountIconUIImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            accountIconUIImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            accountIconUIImageView.widthAnchor.constraint(equalToConstant: 60),
            accountIconUIImageView.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
}
