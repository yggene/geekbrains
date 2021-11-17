//
//  NewsHeaderView.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 17.11.2021.
//

import UIKit

class NewsHeaderView: UITableViewHeaderFooterView {
    
    private var avatar = AvatarImage()
    private var nameLabel = UILabel()
    private var dateLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with new: News) {
        
        contentView.addSubview(avatar)
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0),
            avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            avatar.widthAnchor.constraint(equalToConstant: 46.0),
            avatar.heightAnchor.constraint(equalToConstant: 46.0),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 5.0),
            nameLabel.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 5.0),
            
            dateLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 5.0),
            dateLabel.bottomAnchor.constraint(equalTo: avatar.bottomAnchor, constant: -5.0)
            
        ])
        
        contentView.backgroundColor = .cyan
        
        avatar.image = UIImage(named: "3")
        nameLabel.text = "Name label"
        dateLabel.text = new.date.date()
        
    }

}
