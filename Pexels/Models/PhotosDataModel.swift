//
//  PhotosDataModel.swift
//  Pexels
//
//  Created by sangam pokharel on 22/09/2023.
//

import Foundation

// MARK: - Welcome
struct PhotosDataModel: Codable {
    let totalResults, page, perPage: Int?
    let photos: [Photo]?
    let nextPage: String?

    enum CodingKeys: String, CodingKey {
        case totalResults = "total_results"
        case page
        case perPage = "per_page"
        case photos
        case nextPage = "next_page"
    }
}

// MARK: - Photo
struct Photo: Codable,Identifiable {
   
    let id = UUID().uuidString
    let width, height: Int?
    let url: String?
    let photographer: String?
    let photographerURL: String?
    let photographerID: Int?
    let avgColor: String?
    let src: Src?
    let liked: Bool?
    let alt: String?
    
    

    enum CodingKeys: String, CodingKey {
        case width, height, url, photographer
        case photographerURL = "photographer_url"
        case photographerID = "photographer_id"
        case avgColor = "avg_color"
        case src, liked, alt
    }
    
  
}

// MARK: - Src
struct Src: Codable {
    let original, large2X, large, medium: String?
    let small, portrait, landscape, tiny: String?

    enum CodingKeys: String, CodingKey {
        case original
        case large2X = "large2x"
        case large, medium, small, portrait, landscape, tiny
    }
}
