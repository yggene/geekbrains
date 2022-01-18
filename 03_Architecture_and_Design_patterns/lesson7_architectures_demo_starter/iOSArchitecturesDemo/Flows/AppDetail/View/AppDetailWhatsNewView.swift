//
//  AppDetailWhatsNewView.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Alekseev on 18.01.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class AppDetailWhatsNewView: UIView {

    //MARK: - Subviews
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "What's new"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    lazy var versionPreLabel: UILabel = {
        let label = UILabel()
        label.text = "Version "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var releaseNotesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }
    
    // MARK: - UI
    
    private func setupLayout() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.versionLabel)
        self.addSubview(self.versionPreLabel)
        self.addSubview(self.releaseNotesLabel)
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 20.0),
            
            self.versionPreLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12.0),
            self.versionPreLabel.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor),
            self.versionPreLabel.heightAnchor.constraint(equalToConstant: 18.0),
            
            self.versionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12.0),
            self.versionLabel.leftAnchor.constraint(equalTo: self.versionPreLabel.rightAnchor),
            self.versionLabel.rightAnchor.constraint(equalTo: self.titleLabel.rightAnchor),
            self.versionLabel.heightAnchor.constraint(equalToConstant: 18.0),
            
            self.releaseNotesLabel.topAnchor.constraint(equalTo: self.versionLabel.bottomAnchor, constant: 12.0),
            self.releaseNotesLabel.leftAnchor.constraint(equalTo: self.versionPreLabel.leftAnchor),
            self.releaseNotesLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12.0),
            self.releaseNotesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])
    }

}
