//
//  HomeVIew.swift
//  NetflixClone
//
//  Created by Ragnhild Kjellevold Steinsland on 20/03/2021.
//

import SwiftUI

struct HomeVIew: View {
    //: PROPERTIES
    var vm: HomeViewModel = HomeViewModel()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    //: BODY
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            
            ScrollView(showsIndicators: false) {
                // main vstack
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre, showGenreSelection: $showGenreSelection, showTopRowSelection: $showTopRowSelection)
                    
                    TopMoviePreviewView(movie: exampleMovie3)
                        .frame(width: screen.width)
                        .padding(.top, -100)
                        .zIndex(-1)
                        
                    
                    ForEach(vm.allCategories, id: \.self) { category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(vm.getMovie(forCat: category)) { movie in
                                        StandardHomeMovieView(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 20)
                                            .onTapGesture {
                                                movieDetailToShow = movie
                                            }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if movieDetailToShow != nil {
                MovieDetailView(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeVIew_Previews: PreviewProvider {
    static var previews: some View {
        HomeVIew()
    }
}

struct TopRowButtons: View {
    //: PROPERTIES
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    //: BODY
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button(action: {
                    // ACTION
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                
                Spacer()
                
                Button(action: {
                    // ACTION
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                
                Spacer()
                
                Button(action: {
                    // ACTION
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                })
                
                Spacer()
                
                Button(action: {
                    // ACTION
                    topRowSelection = .myList
                }, label: {
                    Text("My List")
                })
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
            
        case .myList, .tvShows, .movies:
            HStack {
                Button(action: {
                    // ACTION
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                
                
                HStack(spacing: 20) {
                    Button(action: {
                        // ACTION
                        showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180), anchor: .center)
                                
                        }
                    })
                    
                    
                    Button(action: {
                        // ACTION
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 12))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    
                    Spacer()
                }
                
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
            
        }
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String {
    case AllGenres
    case Action
    case Comedy
    case Horror
    case Thriller
}
