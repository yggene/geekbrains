//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Alekseev on 19.01.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
    let track: String
    let artist: String?
    let collection: String?
    let artwork: String?
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(track: model.trackName,
                             artist: model.artistName,
                             collection: model.collectionName,
                             artwork: model.artwork
        )
    }
}
