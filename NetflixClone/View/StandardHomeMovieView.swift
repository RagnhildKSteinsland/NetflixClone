//
//  StandardHomeMovieView.swift
//  NetflixClone
//
//  Created by Ragnhild Kjellevold Steinsland on 20/03/2021.
//

import SwiftUI
import KingfisherSwiftUI

struct StandardHomeMovieView: View {
    //: PROPERTIES
    var movie: Movie
    
    //: BODY
    var body: some View {
        KFImage(movie.thumbnailURL)
            .resizable()
            .scaledToFill()
    }
}

struct StandardHomeMovieView_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovieView(movie: exampleMovie1)
            .frame(width: 200, height: 300)
    }
}
