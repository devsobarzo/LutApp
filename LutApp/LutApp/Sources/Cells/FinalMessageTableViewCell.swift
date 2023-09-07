//
//  FinalMessageTableViewCell.swift
//  LutApp
//
//  Created by Rober on 06/09/23.
//

import UIKit

class FinalMessageTableViewCell: UITableViewCell {
    static let id = "FinalMessageTableViewCellId"
    
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
        itemLabel.textColor = .systemRed
        itemLabel.font = .systemFont(ofSize: 30, weight: .bold)
        itemLabel.textAlignment = .center
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(itemLabel)

        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            itemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5)

        ])
    }
    
    func setup(text: String) {
        itemLabel.text = text
    }
}
