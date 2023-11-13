//
//  VideosDataModel.swift
//  Pexels
//
//  Created by sangam pokharel on 22/09/2023.
//


import Foundation

// MARK: - Welcome
struct VideoDataModel: Codable,Hashable {
    let page, perPage, totalResults: Int?
    let url: String?
    let videos: [Video]

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case totalResults = "total_results"
        case url, videos
    }
}

// MARK: - Video
struct Video: Hashable,Identifiable,Codable {
    let id, width, height: Int?
    let url: String?
    let image: String?
    let duration: Int?
    let user: User?
    let videoFiles: [VideoFile]
    let videoPictures: [VideoPicture]

    enum CodingKeys: String, CodingKey {
        case id, width, height, url, image, duration, user
        case videoFiles = "video_files"
        case videoPictures = "video_pictures"
    }
}

// MARK: - User
struct User: Codable,Hashable {
    let id: Int?
    let name: String?
    let url: String?
}

// MARK: - VideoFile
struct VideoFile: Codable,Identifiable,Hashable {
    let id: Int?
    let quality, fileType: String?
    let width, height: Int?
    let link: String?

    enum CodingKeys: String, CodingKey {
        case id, quality
        case fileType = "file_type"
        case width, height, link
    }
}

// MARK: - VideoPicture
struct VideoPicture: Codable,Identifiable,Hashable {
    let id: Int?
    let picture: String?
    let nr: Int?
}

