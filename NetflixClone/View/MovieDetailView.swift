//
//  MovieDetailView.swift
//  NetflixClone
//
//  Created by Ragnhild Kjellevold Steinsland on 21/03/2021.
//

import SwiftUI

struct MovieDetailView: View {
    //: PROPERTIES
    
    var movie: Movie
    
    let screen = UIScreen.main.bounds
    
    //: BODY
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        //CLOSE THIS VIEW
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                        
                    })
                }
                .padding(.horizontal, 22)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        StandardHomeMovieView(movie: movie)
                            .frame(width: screen.width / 2.5)
                        
                        MovieInfoSubHeadline(movie: movie)
                        
                        if movie.promotionHeadline != nil {
                            Text(movie.promotionHeadline!)
                                .bold()
                                .font(.headline)
                        }
                        
                        PlayButtonView(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                            // ACTION
                        }
                        
                        //CURRENT EPISODE INFORMATION
                        CurrentEpsiodeInformation(movie: movie)
                        
                        CastInfo(movie: movie)
                        
                        HStack(spacing: 60) {
                            SmallVerticalButtonView(text: "MY LIST", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                                //ACTION
                            }
                            
                            SmallVerticalButtonView(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: true) {
                                //ACTION
                            }
                            
                            SmallVerticalButtonView(text: "Share", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                                //ACTION
                            }
                            
                            Spacer()
                            
                        }
                        .padding(.leading, 20)
                        
                        
                        //CustomTabSwitcherView
                    }

                    .padding(.horizontal, 10)
                }
                
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: exampleMovie4)
    }
}




struct MovieInfoSubHeadline: View {
    var movie: Movie
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
            
            RatingView(rating: movie.rating)
            
            Text(movie.numberOfSeasonsDisplay)
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}

struct CastInfo: View {
    var movie: Movie
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                
                Text("Cast: \(movie.cast)")
                
                Spacer()
                
            }
            HStack {
                
                Text("Creators: \(movie.creators)")
                
                Spacer()
            }
            
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 10)
    }
}

struct CurrentEpsiodeInformation: View {
    var movie: Movie
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                
                Spacer()
            }
            .padding(.vertical, 4)
            HStack {
                Text(movie.episodeDescription)
                    .font(.subheadline)
                
                Spacer()
            }
        }
    }
}
