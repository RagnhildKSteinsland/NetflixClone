//
//  HomeViewModel.swift
//  NetflixClone
//
//  Created by Ragnhild Kjellevold Steinsland on 21/03/2021.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    // String == category
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        movies.keys.map({ String($0) })
    }
    
    public func getMovie(forCat cat: String) -> [Movie] {
        return movies[cat] ?? []
    }
    
    init() {
        setUpMovies()
    }
    
    func setUpMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Realeases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Sci-Fi"] = exampleMovies.shuffled()
        movies["Rom-Com"] = exampleMovies.shuffled()
    }
}
