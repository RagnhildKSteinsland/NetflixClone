//
//  VideoPreviewView.swift
//  NetflixClone
//
//  Created by Ragnhild Kjellevold Steinsland on 23/03/2021.
//

import SwiftUI
import KingfisherSwiftUI

struct VideoPreviewView: View {
    //: PROPERTIES
    var imageURL: URL
    var videoURL: URL
    
    @State private var showingVideoPlayer = false
    
    //:BODY
    var body: some View {
        ZStack {
            KFImage(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Button (action: {
                //ACTION
                showingVideoPlayer = true
            }, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            })
            .sheet(isPresented: $showingVideoPlayer, content: {
                SwiftUIVideoView(url: videoURL)
            })
        }
    }
}

struct VideoPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewView(imageURL: exampleImageURL, videoURL: exampleMovieURL)
    }
}
