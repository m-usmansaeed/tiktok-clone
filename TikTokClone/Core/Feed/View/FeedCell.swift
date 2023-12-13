//
//  FeedCell.swift
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
import AVKit

struct FeedCell: View {
    
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    var bottomHeight: CGFloat
    let post: Post
    let player: AVPlayer
    
    init(screenWidth: CGFloat, screenHeight: CGFloat, bottomHeight: CGFloat, post: Post, player: AVPlayer) {
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
        self.bottomHeight = bottomHeight
        self.post = post
        self.player = player
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            

            TikTokVideoPlayer(player: player)
                .frame(width: screenWidth, height: screenHeight)

//            Image("testImage")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: screenWidth, height: screenHeight)
            
            
            VStack {
                Spacer()
                
                HStack(alignment: .bottom) {
                    
                    VStack(alignment: .leading) {
                        Text("usman.saeed")
                        
                        Text("Check this new model of iPhone")
                    }
                    .font(Font.subheadline.weight(.semibold))
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack(spacing: 28 ) {
                        
                        Image("4")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        Button {
                            
                        } label: {
                            VStack {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                .frame(width: 28, height: 28)
                                Text("2")
                                    .font(.caption)
                                    .bold()
                            }
                        }
                        
                        Button {
                            
                        } label: {
                            VStack {
                                Image(systemName: "ellipsis.bubble.fill")
                                    .resizable()
                                .frame(width: 28, height: 28)
                                Text("2")
                                    .font(.caption)
                                    .bold()
                            }

                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 22, height: 28)

                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrowshape.turn.up.right.fill")
                                .resizable()
                                .frame(width: 28, height: 28)

                        }
                    }.foregroundColor(.white)
                }
                .padding(.bottom, bottomHeight + 50)
                
                
            }.padding()
             

        }
        .onTapGesture {
            switch player.timeControlStatus {
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break;
            case .playing:
                player.pause()

            @unknown default:
                break;
            }
        }
        .onAppear {
            player.play()
        }
    }
}

#Preview {
    FeedCell(screenWidth: UIScreen.main.bounds.width,
             screenHeight: UIScreen.main.bounds.height,
             bottomHeight: CGFloat(34), post: Post.samplePost, player: AVPlayer())
        .ignoresSafeArea()
}
