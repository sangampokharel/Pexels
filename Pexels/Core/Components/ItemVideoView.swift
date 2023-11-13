//
//  ItemVideoView.swift
//  Pexels
//
//  Created by sangam pokharel on 22/09/2023.
//

import SwiftUI
import Kingfisher
struct ItemVideoView: View {
    let video:Video
    var body: some View {
        
        KFImage(URL(string: video.image ?? ""))
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
          
           
            .overlay {
                Image(systemName: "play.circle.fill").resizable().scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundStyle(Color.white,Color.gray.opacity(0.8))
            }.overlay(alignment: .bottomLeading){
                Text(video.user?.name ?? "")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                    .background(Color.black.gradient.opacity(0.4))
                    .cornerRadius(10)
                
                
                
                
            }.shadow(color:Color.Theme.AccentColor, radius: 10)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        
        
    }
}

struct ItemVideoView_Previews: PreviewProvider {
    static var previews: some View {
        ItemVideoView(video: RawPreviewData.Vidoes.videos.first!)
            .padding()
    }
}
