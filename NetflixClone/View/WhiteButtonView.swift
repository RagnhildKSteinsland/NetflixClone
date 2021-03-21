//
//  WhiteButtonView.swift
//  NetflixClone
//
//  Created by Ragnhild Kjellevold Steinsland on 21/03/2021.
//

import SwiftUI

struct WhiteButtonView: View {
    //: PROPERTIES
    
    var text: String
    var imageName: String
    
    
    
    var action: () -> Void
    
    //: BODY
    var body: some View {
        Button(action: action, label: {
            HStack {
                
                Spacer()
                
                Image(systemName: imageName)
                    .font(.headline)
                
                Text(text)
                    .bold()
                    .font(.system(size: 16))
                
                Spacer()
            }
            .padding(.vertical, 6)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(3.0)
        })
    }
}

struct WhiteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            WhiteButtonView(text: "Play", imageName: "play.fill") {
                //Action
            }
        }
    }
}
