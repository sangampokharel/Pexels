//
//  ContentView.swift
//  Pexels
//
//  Created by sangam pokharel on 21/09/2023.
//

import SwiftUI
import Lottie


struct HomeView: View {
    
    @StateObject private var homeViewModel = HomeViewModel()
    let columns = [GridItem(.flexible(),spacing: 20),GridItem(.flexible(),spacing: 20)]
    
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "AccentColor") ?? .gray]
        
    }
    var body: some View {
        
        VStack {
            // search
            Search
            if homeViewModel.isLoading {
                ProgressView()
            }
            
            if homeViewModel.allPhotos.isEmpty && homeViewModel.allSearchedVideos.isEmpty {
                Spacer()
                LottieView(animation: .named("search_animation.json", animationCache: .none)).play().looping()
                    .frame(width: 200, height: 200)
                Text("Search for Nature,Ocean,Tiger ...")
                    .font(.body)
                    .foregroundColor(Color.Theme.AccentColor)
                    .fontWeight(.semibold)
                    .padding(.bottom,130)
                Spacer()
                
            }else{
                ScrollView(showsIndicators:false) {
                    LazyVGrid(columns: columns, spacing: 20,  content: {
                        if homeViewModel.selectedType == .Photos{
                            ForEach(homeViewModel.allPhotos){  photos in
                                ItemImageView(photos: photos).task{
                                    if photos.id == homeViewModel.allPhotos.last?.id {
                                        homeViewModel.loadMore()
                                    }
                                }
                                .frame(height: 250)
                                .clipped()
                                .cornerRadius(10)
                                .shadow(color: Color.Theme.AccentColor, radius: 5)
                                .padding(2)
                            }
                        }else{
                            ForEach(homeViewModel.allSearchedVideos){  video in
                                NavigationLink(value: video) {
                                    ItemVideoView(video: video)
                                }.task{
                                    if video.id == homeViewModel.allSearchedVideos.last?.id {
                                        homeViewModel.loadMore()
                                    }
                                }
                                
                                
                                
                                
                            }
                        }
                        
                        
                    })
                }
            }
            
            
            
        }
        
        .padding()
        .refreshable {
            homeViewModel.pullToRefresh()
        }
        .navigationTitle("Pexels")
        .foregroundColor(Color.Theme.AccentColor)
        .navigationDestination(for: Video.self) { video in
            VideoDetailsView(video: video)
        }
        
    }
    
    
    private var Search: some View {
        return    HStack{
            Menu(content: {
                Button {
                    homeViewModel.selectedType = .Photos
                } label: {
                    Label(
                        title: { Text("Photos").foregroundColor(Color.Theme.AccentColor) },
                        icon: { Image(systemName: "photo") }
                    ).foregroundColor(Color.Theme.AccentColor)
                }
                
                Button {
                    homeViewModel.selectedType = .Videos
                } label: {
                    Label(
                        title: { Text("Videos") },
                        icon: { Image(systemName: "video") }
                    )
                }
            }, label: {
                Label(
                    title: { Text(homeViewModel.selectedType.rawValue) },
                    icon: { Image(systemName: homeViewModel.selectedType == .Photos ? "photo" : "video") }
                )
            })
            
            Divider().frame(height: 30)
            
            TextField("e.g: Nature,Tiger,Ocean,Pears...", text: $homeViewModel.search)
                .keyboardType(.alphabet)
            Image(systemName: homeViewModel.search.isEmpty ? "magnifyingglass" : "xmark.circle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.Theme.AccentColor)
                .frame(width: 20,height: 20).onTapGesture {
                    if !homeViewModel.search.isEmpty {
                        homeViewModel.search = ""
                    }
                }
            
            
            
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .overlay(alignment:.bottomLeading) {}
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
                .foregroundColor(Color.Theme.AccentColor)
        }
    }
}
