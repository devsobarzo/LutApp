//
//  NameAppUIView.swift
//  LutApp
//
//  Created by Rober on 13/09/23.
//

import UIKit

class NameAppUIView: UIView {

    lazy var nameAppLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.text = "LutApp"
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
        
        addSubview(nameAppLabel)
        
        NSLayoutConstraint.activate([
            nameAppLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            nameAppLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameAppLabel.widthAnchor.constraint(equalToConstant: 60),
            nameAppLabel.heightAnchor.constraint(equalToConstant: 60),
        ])
        
    }
}
