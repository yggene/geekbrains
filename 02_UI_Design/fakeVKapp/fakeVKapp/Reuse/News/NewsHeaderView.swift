//
//  NewsHeaderView.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 17.11.2021.
//

import UIKit

class NewsHeaderView: UITableViewHeaderFooterView {
    
    var avatar = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 46.0, height: 46.0))
    var nameLabel = UILabel()
    private var dateLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with news: News) {
        
        contentView.addSubview(avatar)
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            avatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            avatar.widthAnchor.constraint(equalToConstant: 46.0),
            avatar.heightAnchor.constraint(equalToConstant: 46.0),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10.0),
            nameLabel.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 5.0),
            
            dateLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10.0),
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2.0)
            
        ])
        
        // avatar styles with dummy image
        avatar.contentMode = UIView.ContentMode.scaleAspectFill
        avatar.layer.borderColor = UIColor.darkGray.cgColor
        avatar.layer.borderWidth = 0.1
        avatar.layer.cornerRadius = avatar.frame.height / 2
        avatar.clipsToBounds = true
        avatar.image = UIImage(named: "3")
        
        // name label styles with dummy text
        nameLabel.font = UIFont.systemFont(ofSize: 17.0)
        nameLabel.text = "No Name"
        
        // date label styles
        dateLabel.font = UIFont.systemFont(ofSize: 10.0)
        dateLabel.textColor = .lightGray
        dateLabel.text = news.date.date()
        
    }
}
