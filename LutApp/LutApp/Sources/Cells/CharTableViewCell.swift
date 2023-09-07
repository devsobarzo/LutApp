//
//  CharTableViewCell.swift
//  LutApp
//
//  Created by Rober on 06/09/23.
//

import UIKit

class CharTableViewCell: UITableViewCell {
    static let id = "CharTableViewCellId"
    
    var logoImage: UIImageView = UIImageView()
    var itemLabel: UILabel = UILabel()
    
   
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
        
        itemLabel.textColor = .systemGreen
        itemLabel.font = .systemFont(ofSize: 16, weight: .regular)
        itemLabel.text = "Char table"
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(logoImage)
        contentView.addSubview(itemLabel)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            logoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            logoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            logoImage.widthAnchor.constraint(equalToConstant: 60),
            logoImage.heightAnchor.constraint(equalToConstant: 60),
            
            itemLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            itemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        
    }
    func setup(text: String, image: UIImage) {
        logoImage.image = image
        logoImage.tintColor = .blue
        logoImage.layer.cornerRadius = 30
        logoImage.clipsToBounds = true

        itemLabel.text = text
    }
}
