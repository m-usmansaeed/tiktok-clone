//
//  MainTabView.swift
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

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            FeedView().tabItem {
                Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                    .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                Text("Home")
            }
            .onAppear { selectedTab = 0 }
            .tag(0)
            
            ExploreView().tabItem {
                Image(systemName: selectedTab == 1 ? "person.2.fill" : "person.2")
                    .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)

                Text("Friends")
            }
            .onAppear { selectedTab = 1 }
            .tag(1)
            
            Text("Feed").tabItem {
                Image(systemName: "plus")
            }
            .onAppear { selectedTab = 2 }
            .tag(2)
            
            NotificationsView().tabItem {
                Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                    .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                Text("Inbox")
            }
            .onAppear { selectedTab = 3 }
            .tag(3)
            
            CurrentUserProfileView().tabItem {
                Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                    .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                Text("Profile")
            }
            .onAppear { selectedTab = 4 }
            .tag(4)
            
        }.tint(.black)
    }
}

#Preview {
    MainTabView()
}
