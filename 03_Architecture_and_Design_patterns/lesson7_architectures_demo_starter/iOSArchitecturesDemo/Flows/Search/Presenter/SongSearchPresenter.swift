//
//  SongSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Alekseev on 18.01.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

protocol SongSearchViewInput: class {
    
    var searchResults: [ITunesSong] { get set }
    
    func showError(error: Error)
    
    func showNoResults()
    
    func hideNoResults()
    
    func throbber(show: Bool)
}

protocol SongSearchViewOutput: class {
    
    func viewDidSearch(with query: String)
    
    func viewDidSelectSong(_ app: ITunesSong)
}


final class SongSearchPresenter {
    
    weak var viewInput: (UIViewController & SongSearchViewInput)?
    
    private let searchService = ITunesSearchService()
    
    private func requestSongs(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = songs
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
    
//    private func openSongDetails(with song: ITunesSong) {
//        let songDetaillViewController = SongDetailViewController(song: song)
//        self.viewInput?.navigationController?.pushViewController(songDetaillViewController, animated: true)
//    }
}

// MARK: - SearchViewOutput
extension SongSearchPresenter: SongSearchViewOutput {
    
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestSongs(with: query)
    }
    
    func viewDidSelectSong(_ song: ITunesSong) {
//        self.openSongDetails(with: song)
    }
}
