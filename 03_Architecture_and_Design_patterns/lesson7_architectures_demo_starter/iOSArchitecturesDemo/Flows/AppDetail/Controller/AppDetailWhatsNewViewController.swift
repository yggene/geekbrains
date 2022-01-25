//
//  AppDetailWhatsNewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Alekseev on 18.01.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppDetailWhatsNewViewController: UIViewController {

    // MARK: - Properties
    
    private let app: ITunesApp
    
    private var appDetailWhatsNewViewController: AppDetailWhatsNewView {
        return self.view as! AppDetailWhatsNewView
    }
    
    // MARK: - Init
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailWhatsNewView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    // MARK: - Private
    
    private func fillData() {
        self.appDetailWhatsNewViewController.versionLabel.text = app.version
        self.appDetailWhatsNewViewController.releaseNotesLabel.text = app.releaseNotes
        self.appDetailWhatsNewViewController.currentVersionReleaseDateLabel.text = String.iTunesDateFormattedDateOnly(app.currentVersionReleaseDate!)
    }
}
