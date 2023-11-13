//
//  VideoDetailsView.swift
//  Pexels
//
//  Created by sangam pokharel on 22/09/2023.
//

import SwiftUI
import AVKit

struct VideoDetailsView: View {
    var player:AVPlayer? = nil
    
    let video:Video
    
    init(video:Video){
        self.video = video
        
        guard let url = URL(string: self.video.videoFiles.last?.link ?? "") else {return}
        self.player = AVPlayer(url: url)
        self.player?.play()
        
        
    }
    
    var body: some View {
        
        VideoPlayer(player: player)
            
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).ignoresSafeArea()
        
    }
}

struct VideoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            VideoDetailsView(video: RawPreviewData.Vidoes.videos.first!)
        }
    }
}
