//
//  HomeViewModels.swift
//  Pexels
//
//  Created by sangam pokharel on 22/09/2023.
//

import Foundation
import Combine


enum Types:String {
    case Videos
    case Photos
    
}

class HomeViewModel :ObservableObject {
    @Published var allPhotos:[Photo] = []
    @Published var allSearchedVideos:[Video] = []
    
    
    @Published var isLoading:Bool = false
    @Published var search:String = ""
    @Published var debounceText:String = ""
    @Published var selectedType:Types  {
        didSet {
            
            page = 1
            self.allSearchedVideos = []
            self.allPhotos = []
            search = ""
        }
    }
    
    
    @Published var page:Int = 1 {
        didSet {
            if page != 1{
                if selectedType == .Videos{
                    self.getVideos()
                }else{
                    self.getPhotos()
                }
            }
            
            
        }
    }
    
    
    // all subscribers cancellable
    private var photosCancallable: AnyCancellable? = nil
    private var searchCancallable:AnyCancellable? = nil
    private var videoCancellable:AnyCancellable? = nil
    private var searchVideoCancellable:AnyCancellable? = nil
    
    init(){
        
        self.selectedType = .Photos
        
        searchCancallable = $search
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .sink {[weak self] returnedText in
                
                
                
                if !returnedText.isEmpty{
                    self?.debounceText = returnedText
                    self?.page = 1
                    if self?.selectedType == .Videos{
                        // MARK:: call api to search videos
                        self?.getVideos()
                        
                    }else{
                        self?.getPhotos()
                    }
                    
                }else{
                    self?.page = 1
                    self?.allPhotos = []
                    self?.allSearchedVideos = []
                
                }
                
                
                
            }
    }
    
    
    func loadMore(){
        page = page+1
    }
    
    func pullToRefresh(){
        page = 1
    }
    
    
    func getPhotos(){
        
        self.isLoading = self.page == 1
        photosCancallable = HomeService.shared.getAllPhotos(query:self.search,page: self.page, perPage: 20)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Data Operation completed")
                case .failure(let error):
                    print("failed to get data \(error)")
                }
            }, receiveValue: { [weak self] returnedPhotosData in
                if self?.page == 1 {
                    self?.allPhotos = []
                    self?.isLoading = false
                    
                }
                self?.allPhotos.append(contentsOf: returnedPhotosData.photos ?? [])
                self?.photosCancallable?.cancel()
            })
    }
    
    
    func getVideos(){
        searchVideoCancellable = HomeService.shared.searchVideos(page: self.page, perPage: 20, query: debounceText)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Searched API finished")
                case .failure(let error):
                    print("Search api error \(error)")
                }
            } receiveValue: { [weak self] returnedVideoData in
                if self?.page == 1 {
                    self?.allSearchedVideos = []
                    self?.isLoading = false
                    
                }
                self?.allSearchedVideos.append(contentsOf: returnedVideoData.videos)
                self?.searchVideoCancellable?.cancel()
            }
        
    }
    
    //    func getPopularVideos(){
    //        self.isLoading = page == 1
    //        videoCancellable = HomeService.shared.getPopularVideos(page: self.page, perPage: 20)
    //            .sink { complition in
    //                switch complition {
    //                case .finished:
    //                    print("Video data respnded")
    //                case .failure(let error):
    //                    print("error while fetching data \(error.localizedDescription)")
    //                }
    //            } receiveValue: { [weak self] returnedVideo in
    //                self?.allSearchedVideos = []
    //                if self?.page == 1 {
    //                    self?.allPopularVideos = []
    //                    self?.isLoading = false
    //
    //                }
    //                self?.allPopularVideos.append(contentsOf: returnedVideo.videos)
    //                self?.videoCancellable?.cancel()
    //            }
    //
    //    }
    
    
    
    
}
