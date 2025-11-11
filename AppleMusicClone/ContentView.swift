//
//  ContentView.swift
//  AppleMusicClone
//
//  Created by Aleck David Holly on 2025-11-11.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var expandMiniPlayer: Bool = false
    @Namespace private var animation
    
    var body: some View {
        NativeTabView()
            .tabBarMinimizeBehavior(.onScrollDown)
            .tabViewBottomAccessory {
                MiniPlayer()
                    .matchedTransitionSource(id: "MINIPLAYER", in: animation)
                    .onTapGesture {
                        expandMiniPlayer.toggle()
                    }
            }
            .fullScreenCover(isPresented: $expandMiniPlayer) {
                ScrollView {
                    
                }
                .safeAreaInset(edge: .top, spacing: 0) {
                    VStack(spacing: 10) {
                        Capsule()
                            .fill(.primary.secondary)
                            .frame(width: 35, height: 3)
                        
                        
                        HStack(spacing: 0) {
                            PlayerInfo(size: .init(width: 80, height: 80))
                            
                            Spacer(minLength: 0)
                            
                            Group {
                                Button("", systemImage: "star.circle.fill") {
                                    
                                }
                                
                                Button("", systemImage: "ellipsis.circle.fill") {
                                    
                                }
                            }
                            .font(.title)
                            .foregroundStyle(.primary, .primary.opacity(0.1))
                        }
                        .padding(.horizontal, 15)
                    }
                    .navigationTransition(.zoom(sourceID: "MINIPLAYER", in: animation))
                }
            }
    }
    
    @ViewBuilder
    func NativeTabView() -> some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                NavigationStack {
                    List {
                        
                    }
                    .navigationTitle("Home")
                }
            }
            
            Tab("New", systemImage: "square.grid.2x2.fill") {
                NavigationStack {
                    List {
                        
                    }
                    .navigationTitle("What's New")
                }
            }
            
            Tab("Radio", systemImage: "dot.radiowaves.left.and.right") {
                NavigationStack {
                    List {
                        
                    }
                    .navigationTitle("Radio")
                }
            }
            
            Tab("Library", systemImage: "square.stack.fill") {
                NavigationStack {
                    List {
                        
                    }
                    .navigationTitle("Library")
                }
            }
            
            Tab("Search", systemImage: "magnifyingglass", role: .search) {
                NavigationStack {
                    List {
                        
                    }
                    .navigationTitle("Search")
                    .searchable(text: $searchText, placement: .toolbar, prompt: Text("Search.."))
                }
            }
        }
    }
    
    @ViewBuilder
    func MiniPlayer() -> some View {
        HStack(spacing: 15) {
            ///PlayerInfo(CGSize(width: 30, height: 30))
            PlayerInfo(size: .init(width: 30, height: 30))
            
            Spacer(minLength: 0)
            
            Button {
                
            } label: {
                Image(systemName: "play.fill")
                    .contentShape(.rect)
            }
            
            Button {
                
            } label: {
                Image(systemName: "forward.fill")
                    .contentShape(.rect)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
