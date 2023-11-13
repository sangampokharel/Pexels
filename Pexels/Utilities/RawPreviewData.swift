//
//  RawPreviewData.swift
//  Pexels
//
//  Created by sangam pokharel on 22/09/2023.
//

import Foundation



class RawPreviewData {
    static let Photos:PhotosDataModel =  PhotosDataModel(totalResults: 10000, page: 1, perPage: 10, photos: [
        Photo(
            width: 3066,
            height: 3968,
            url: "https://www.pexels.com/photo/trees-during-day-3573351/",
            photographer: "Lukas Rodriguez",
            photographerURL: "https://www.pexels.com/@lukas-rodriguez-1845331",
            photographerID: 1845331,
            avgColor: "#374824",
            src: Src(
                original: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png",
                large2X: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                large: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=650&w=940",
                medium: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=130",
                small: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&h=130",
                portrait:  "https://static-videos.pexels.com/videos/1093662/pictures/preview-0.jpg",
                landscape: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
                tiny: "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"),
            liked: false,
            alt:  "Brown Rocks During Golden Hour")
    ], nextPage: "https://api.pexels.com/v1/search/?page=2&per_page=1&query=nature")
    
    

    static let Vidoes:VideoDataModel = VideoDataModel(
        page: 1,
        perPage: 10,
        totalResults: 1000,
        url: "https://www.pexels.com/video/water-crashing-over-the-rocks-1093662/",
        videos: [
            Video(
                id: 1093662,
                width: 1920,
                height: 1080,
                url: "https://www.pexels.com/video/water-crashing-over-the-rocks-1093662/",
                image:  "https://images.pexels.com/videos/1093662/free-video-1093662.jpg?fit=crop&w=400&h=630&auto=compress&cs=tinysrgb",
                duration: 8,
                user: User(id: 417939, name: "Peter Fowler", url:  "https://www.pexels.com/@peter-fowler-417939"),
                videoFiles: [
                    VideoFile(
                        id: 37101,
                        quality: "hd",
                        fileType: "video/mp4",
                        width: 1280,
                        height: 720,
                        link: "https://player.vimeo.com/external/269971860.hd.mp4?s=eae965838585cc8342bb5d5253d06a52b2415570&profile_id=174&oauth2_token_id=57447761")
                ],
                videoPictures: [
                    VideoPicture(id: 79696, picture: "https://static-videos.pexels.com/videos/1093662/pictures/preview-0.jpg", nr: 0)
                ]
                
            ),
            
            Video(
                id: 1093663,
                width: 1920,
                height: 1080,
                url: "https://www.pexels.com/video/water-crashing-over-the-rocks-1093662/",
                image:  "https://images.pexels.com/videos/1093662/free-video-1093662.jpg?fit=crop&w=400&h=630&auto=compress&cs=tinysrgb",
                duration: 8,
                user: User(id: 417939, name: "Peter Fowler", url:  "https://www.pexels.com/@peter-fowler-417939"),
                videoFiles: [
                    VideoFile(
                        id: 37101,
                        quality: "hd",
                        fileType: "video/mp4",
                        width: 1280,
                        height: 720,
                        link: "https://player.vimeo.com/external/269971860.hd.mp4?s=eae965838585cc8342bb5d5253d06a52b2415570&profile_id=174&oauth2_token_id=57447761")
                ],
                videoPictures: [
                    VideoPicture(id: 79696, picture: "https://static-videos.pexels.com/videos/1093662/pictures/preview-0.jpg", nr: 0)
                ]
                
            ),
            
            Video(
                id: 1093664,
                width: 1920,
                height: 1080,
                url: "https://www.pexels.com/video/water-crashing-over-the-rocks-1093662/",
                image:  "https://images.pexels.com/videos/1093662/free-video-1093662.jpg?fit=crop&w=400&h=630&auto=compress&cs=tinysrgb",
                duration: 8,
                user: User(id: 417939, name: "Peter Fowler", url:  "https://www.pexels.com/@peter-fowler-417939"),
                videoFiles: [
                    VideoFile(
                        id: 37101,
                        quality: "hd",
                        fileType: "video/mp4",
                        width: 1280,
                        height: 720,
                        link: "https://player.vimeo.com/external/269971860.hd.mp4?s=eae965838585cc8342bb5d5253d06a52b2415570&profile_id=174&oauth2_token_id=57447761")
                ],
                videoPictures: [
                    VideoPicture(id: 79696, picture: "https://static-videos.pexels.com/videos/1093662/pictures/preview-0.jpg", nr: 0)
                ]
                
            ),
        ]
        
    )
    
}
