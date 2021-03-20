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
        return movies.keys.map({ String($0) })
    }
    
    init() {
        setUpMovies()
    }
    
    func setUpMovies() {
        movies["Trending now"] = [exampleMovie1]
    }
}
