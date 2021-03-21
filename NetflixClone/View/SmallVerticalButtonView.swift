//
//  SmallVerticalButtonView.swift
//  NetflixClone
//
//  Created by Ragnhild Kjellevold Steinsland on 21/03/2021.
//

import SwiftUI

struct SmallVerticalButtonView: View {
    //: PROPERTIES
    var text: String
    
    var isOnImage: String
    var isOffImage: String
    
    var isOn: Bool
    
    var imageName: String {
        if isOn {
            return isOnImage
        } else {
            return isOffImage
        }
    }
    
    
    
    
    var action: () -> Void
    
    
    //: BODY
    var body: some View {
        Button(action: {
            
        }, label: {
            VStack {
                Image(systemName: imageName)
                    .foregroundColor(.white)
                
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    .bold()
            }
        })
    }
}

struct SmallVerticalButtonView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SmallVerticalButtonView(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                
                print("Tapped")
            }
        }
    }
}
