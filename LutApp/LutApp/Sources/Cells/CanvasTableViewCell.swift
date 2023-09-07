//
//  CanvasTableViewCell.swift
//  LutApp
//
//  Created by Rober on 06/09/23.
//

import UIKit

class CanvasTableViewCell: UITableViewCell {
    static let id = "CanvasTableViewCellId"
    
    var itemLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        itemLabel.textColor = .systemGreen
        itemLabel.font = .systemFont(ofSize: 16, weight: .regular)
        itemLabel.text = "Canvas table"
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(itemLabel)

        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            itemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
    }
    
    func setup(text: String) {
        itemLabel.text = text
    }
    
}
