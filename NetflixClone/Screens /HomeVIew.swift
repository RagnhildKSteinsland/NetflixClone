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
    
    //: BODY
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            
            ScrollView(showsIndicators: false) {
                // main vstack
                LazyVStack {
                    
                    TopRowButtons()
                    
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
                                    }
                                }
                            }
                        }
                    }
                }
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
    var body: some View {
        HStack {
            Button(action: {
                // ACTION
            }, label: {
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            })
            
            Spacer()
            
            Button(action: {
                // ACTION
            }, label: {
                Text("TV Shows")
            })
            
            Spacer()
            
            Button(action: {
                // ACTION
            }, label: {
                Text("Movies")
            })
            
            Spacer()
            
            Button(action: {
                // ACTION
            }, label: {
                Text("My List")
            })
        }
        .padding(.leading, 10)
        .padding(.trailing, 30)
    }
}
