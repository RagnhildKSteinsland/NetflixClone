//
//  GlobalHelpers.swift
//  NetflixClone
//
//  Created by Ragnhild Kjellevold Steinsland on 21/03/2021.
//

import Foundation
import SwiftUI

let exampleMovie1 = Movie(id: UUID().uuidString, name: "DARK", thumbnailURL: URL(string: "https://picsum.photos/200/300")!, categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 1)
let exampleMovie2 = Movie(id: UUID().uuidString, name: "Travelers", thumbnailURL: URL(string: "https://picsum.photos/200/300/")!, categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 2)
let exampleMovie3 = Movie(id: UUID().uuidString, name: "Comunity", thumbnailURL: URL(string: "https://picsum.photos/200/301")!, categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 3)
let exampleMovie4 = Movie(id: UUID().uuidString, name: "Alone", thumbnailURL: URL(string: "https://picsum.photos/200/302")!, categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 4)
let exampleMovie5 = Movie(id: UUID().uuidString, name: "Hanibal", thumbnailURL: URL(string: "https://picsum.photos/200/303")!, categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 5)
let exampleMovie6 = Movie(id: UUID().uuidString, name: "After life", thumbnailURL: URL(string: "https://picsum.photos/200/304")!, categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeasons: 6)

let exampleMovies: [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]

extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(95)]),
        startPoint: .top,
        endPoint: .bottom
    )

}
