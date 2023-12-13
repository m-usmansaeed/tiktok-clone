//
//  FeedViewModel.swift
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

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        fetchPost()
    }
    
    func fetchPost() {
        self.posts = [
            .init(id: UUID().uuidString, videourl: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
            .init(id: UUID().uuidString, videourl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"),
            .init(id: UUID().uuidString, videourl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"),
            .init(id: UUID().uuidString, videourl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"),
            .init(id: UUID().uuidString, videourl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"),
            .init(id: UUID().uuidString, videourl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"),
            .init(id: UUID().uuidString, videourl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"),
            .init(id: UUID().uuidString, videourl: "https://storage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4"),
            .init(id: UUID().uuidString, videourl: "https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4")
        ]
    }
    
}
