//
//  EpisodeView.swift
//  NetflixClone
//
//  Created by Ragnhild Kjellevold Steinsland on 23/03/2021.
//

import SwiftUI

struct EpisodeView: View {
    //: PROPERTIES
    var episodes: [Episode]
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    //: FUNCTIONS
    
    func getEpisodes(forSeason season: Int) -> [Episode] {
        return episodes.filter( { $0.season == season })
    }
    
    //: BODY
    var body: some View {
        VStack(spacing: 14) {
            //SEASON PICKER
            HStack {
                Button(action: {
                    //ACTION
                    showSeasonPicker = true
                }, label: {
                    Group {
                        Text("Season \(selectedSeason)")
                        
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                })
                
                Spacer()
            }
            
            //EPISODE LIST
            
            ForEach(getEpisodes(forSeason: selectedSeason)) { episode in
                VStack(alignment: .leading) {
                    //HStack with preview image
                    HStack {
                        VideoPreviewView(imageURL: episode.thumbnailURL, videoURL: episode.videoURL)
                            .frame(width: 120, height: 70)
                            .clipped()
                        VStack(alignment: .leading) {
                            Text("\(episode.episodeNumber). \(episode.name)")
                                .font(.system(size: 16))
                            Text("\(episode.length)m")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        Image(systemName: "arrow.down.to.line")
                            .font(.system(size: 20))
                    }
                    
                    //Description
                    Text(episode.description)
                        .font(.system(size: 13))
                        .lineLimit(3)
                }
                .padding()
            }
            
            Spacer()
            
        }
        .foregroundColor(.white)
        .padding(.horizontal, 20)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            EpisodeView(episodes: allExampleEpisodes, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}
