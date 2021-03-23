//
//  TrailerModel.swift
//  NetflixClone
//
//  Created by Ragnhild Kjellevold Steinsland on 23/03/2021.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
