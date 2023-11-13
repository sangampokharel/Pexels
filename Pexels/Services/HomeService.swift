//
//  HomeService.swift
//  Pexels
//
//  Created by sangam pokharel on 21/09/2023.
//  https://www.pexels.com/_next/data/EjzicDnsG-_-h6qMttXpz/en-US/home.json

// "https://api.pexels.com/videos/popular?per_page=1"
import Foundation
import Combine


final class HomeService {
    
    static let shared = HomeService()
    
    func getAllPhotos(query:String,page:Int,perPage:Int) -> AnyPublisher<PhotosDataModel, Error>{
        guard let url = URL(string: "https://api.pexels.com/v1/search?query=\(query)&page\(page)&per_page=\(perPage)") else { fatalError("Invalid url") }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("eVTaUybTHmosoodebXWn09RaYPs1txG5w14EhYSeVQ9dzXino7rHbUTV", forHTTPHeaderField: "Authorization")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ (output) in
                return output.data
            })
            .receive(on: DispatchQueue.main)
            .decode(type: PhotosDataModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        
        
    }
    
    func getPopularVideos(page:Int,perPage:Int) -> AnyPublisher<VideoDataModel,Error>{
        guard let url = URL(string: "https://api.pexels.com/videos/popular?page=\(page)?per_page=\(perPage)") else { fatalError("Invalid URL")}
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("eVTaUybTHmosoodebXWn09RaYPs1txG5w14EhYSeVQ9dzXino7rHbUTV", forHTTPHeaderField: "Authorization")
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ (output)->Data in
                return output.data
            })
            .decode(type: VideoDataModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func searchVideos(page:Int, perPage:Int, query:String) -> AnyPublisher<VideoDataModel,Error>{
        guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(query)&page=\(page)&per_page=\(perPage)&orientation=portrait") else { fatalError("Invalid URL") }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("eVTaUybTHmosoodebXWn09RaYPs1txG5w14EhYSeVQ9dzXino7rHbUTV", forHTTPHeaderField: "Authorization")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ output -> Data in
                return output.data
            })
            .decode(type: VideoDataModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
        
    }
    
}
