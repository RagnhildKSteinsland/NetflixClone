//
//  MoreLikeThisView.swift
//  NetflixClone
//
//  Created by Ragnhild Kjellevold Steinsland on 23/03/2021.
//

import SwiftUI

struct MoreLikeThisView: View {
    //: PROPERTIES
    var movies: [Movie]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    //: BODY
    var body: some View {
        LazyVGrid(columns: columns){
            ForEach(0..<movies.count) { index in
                StandardHomeMovieView(movie: movies[index])
            }
        }
    }
}

struct MoreLikeThisView_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThisView(movies: exampleMovies)
    }
}
