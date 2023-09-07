//
//  MainTableViewCell.swift
//  LutApp
//
//  Created by Rober on 06/09/23.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    static let id = "MainTableViewCellId"
    
    var logoImage: UIImageView = UIImageView()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        logoImage.contentMode = .scaleAspectFit
        logoImage.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(logoImage)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            logoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            logoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            logoImage.widthAnchor.constraint(equalToConstant: 60),
            logoImage.heightAnchor.constraint(equalToConstant: 60),
            
        ])
        
    }
        func setup(image: UIImage) {
            logoImage.image = image
            logoImage.tintColor = .red
            logoImage.layer.cornerRadius = 30
            logoImage.clipsToBounds = true

        }
}
