//
//  ItemImageView.swift
//  Pexels
//
//  Created by sangam pokharel on 21/09/2023.
//

import SwiftUI
import Kingfisher
struct ItemImageView: View {
    let photos:Photo
    
    var body: some View {
        GeometryReader { proxy in
            KFImage(URL(string: photos.src?.portrait ?? ""))
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity)
                .overlay(alignment: .bottomLeading) {
                    
                    Text(photos.photographer ?? "")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame( maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(Color.black.gradient.opacity(0.7))
                       
                    
                    
                }
               
                
        }
      
           
          
        
        
        
    }
}

struct ItemImageView_Previews: PreviewProvider {
    static var previews: some View {
        ItemImageView(photos: (RawPreviewData.Photos.photos?.first)!).padding()
    }
}
