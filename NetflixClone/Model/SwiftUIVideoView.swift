//
//  SwiftUIVideoView.swift
//  NetflixClone
//
//  Created by Ragnhild Kjellevold Steinsland on 23/03/2021.
//

import SwiftUI
import AVKit

struct SwiftUIVideoView: View {
    //: PROPERTIES
    var url: URL
    
    private var player: AVPlayer {
        AVPlayer(url: url)
    }
    
    //: BODY
    var body: some View {
        VideoPlayer(player: player)
    }
}

struct SwiftUIVideoView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIVideoView(url: exampleMovieURL)
    }
}
