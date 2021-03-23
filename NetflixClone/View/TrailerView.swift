//
//  TrailerView.swift
//  NetflixClone
//
//  Created by Ragnhild Kjellevold Steinsland on 23/03/2021.
//

import SwiftUI

struct TrailerView: View {
    //: PROPERTIES
    var trailers: [Trailer]
    
    let screen = UIScreen.main.bounds
    
    //: BODY
    var body: some View {
        VStack {
            ForEach(trailers) { trailer in
                VStack(alignment: .leading) {
                    VideoPreviewView(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                        .frame(maxWidth: screen.width)
                    
                    Text(trailer.name)
                }
                .foregroundColor(.white)
                .padding(.bottom, 10)
                
            }
        }
    }
}

struct TrailerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            TrailerView(trailers: exampleTrailers)
        }
    }
}
