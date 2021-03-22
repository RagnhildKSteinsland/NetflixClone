//
//  TopMoviePreviewView.swift
//  NetflixClone
//
//  Created by Ragnhild Kjellevold Steinsland on 21/03/2021.
//

import SwiftUI
import KingfisherSwiftUI

struct TopMoviePreviewView: View {
    //: PROPERTIES
    var movie: Movie
    
    //: FUNCTIONS
    
    func isCategoryLast(_ cat: String) -> Bool {
        let catCount = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: cat) {
            if index + 1 != catCount {
                return false
            }
        }
        
        return true
    }
    
    //: BODY
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                Spacer()
                
                HStack {
                    ForEach(movie.categories, id: \.self) { category in
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if !isCategoryLast(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                            
                        }
                    }
                }

                HStack {
                    
                    Spacer()
                    
                    SmallVerticalButtonView(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                        //Action
                    }
                    
                    Spacer()
                    
                    PlayButtonView(text: "Play", imageName: "play.fill") {
                        //Action
                    }
                    .frame(width: 120)
                    
                    Spacer()
                    
                    SmallVerticalButtonView(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true) {
                        //Action
                    }
                    
                    Spacer()
                }
            }
            .background(
                LinearGradient.blackOpacityGradient
                    .padding(.top, 250)
            )
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreviewView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreviewView(movie: exampleMovie6)
    }
}
