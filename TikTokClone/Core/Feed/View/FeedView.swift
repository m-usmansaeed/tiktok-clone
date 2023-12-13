//
//  FeedView.swift
//  TikTokClone
//  Copyright (c) Muhammad Usman Saeed
//
//  Using xCode 12.3, Swift 5.0
//  Running on macOS 14.1
//  Created on 13/12/2023
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import SwiftUI
import UIKit
import AVKit

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var offset = CGFloat.zero
    @State private var player: AVPlayer = AVPlayer()


    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let bottomHeight = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }?.safeAreaInsets.bottom ?? 0

    @State var safeAreaInsets: EdgeInsets = .init()

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(screenWidth: screenWidth, screenHeight: screenHeight, bottomHeight: bottomHeight, post: post, player: player).id(post.id)
                }
            }.background(GeometryReader { proxy -> Color in
                DispatchQueue.main.async {
                    offset = -proxy.frame(in: .named("scroll")).origin.y
                    print("offset >> \(offset)")
                    playVideoOnChangeOfScrollPosition(offset:offset)
                    
                    
                }
                return Color.clear
            })
        }
        .coordinateSpace(name: "scroll")
        .onAppear {
            UIScrollView.appearance().isPagingEnabled = true
        }
        .ignoresSafeArea()
        
    }
    
    func playVideoOnChangeOfScrollPosition(offset: CGFloat) {
        if ((offset/screenHeight) - floor(offset/screenHeight)).isInteger {
            player.replaceCurrentItem(with: nil)
            let idx = Int(abs(offset/screenHeight))
            
            let post = viewModel.posts[idx]
            let playerItem = AVPlayerItem(url: URL(string: post.videourl)!)
            player.replaceCurrentItem(with: playerItem)
        }
    }
    
}

#Preview {
    FeedView()
}
