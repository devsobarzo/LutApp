//
//  ItemTableViewCell.swift
//  LutApp
//
//  Created by Rober on 06/09/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    static let id = "ItemTableViewCell"

    var startImage: UIImageView = UIImageView()
    var stopImage: UIImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        startImage.contentMode = .scaleAspectFit
        startImage.translatesAutoresizingMaskIntoConstraints = false

        stopImage.contentMode = .scaleAspectFit
        stopImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(startImage)
        contentView.addSubview(stopImage)
        
        NSLayoutConstraint.activate([
            startImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            startImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            startImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -300),
            startImage.widthAnchor.constraint(equalToConstant: 50),
            startImage.heightAnchor.constraint(equalToConstant: 50),
            
            stopImage.topAnchor.constraint(equalTo: startImage.bottomAnchor, constant: 10),
            stopImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -300),
            stopImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            stopImage.widthAnchor.constraint(equalToConstant: 50),
            stopImage.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    func setupBotons(startImage: UIImage, stopImage: UIImage) {
        self.startImage.image = startImage
        self.startImage.tintColor = .blue
        self.startImage.clipsToBounds = true
        
        self.stopImage.image = stopImage
        self.stopImage.tintColor = .blue
        self.stopImage.clipsToBounds = true
        

    }
}
