//
//  ProfileHeaderView.swift
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

struct ProfileHeaderView: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                Image("4")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(40)
                    .foregroundColor(Color(.systemGray6))
                
                Text("@usman.saeed")
                    .font(Font.subheadline.weight(.semibold))
                
            }
            
            HStack(spacing: 16) {
                UserStatsView(value: 51, title: "Following")
                UserStatsView(value: 25, title: "Followers")
                UserStatsView(value: 17, title: "Likes")
            }
            
            Button {}
            label: {
                Text("Edit Profile")
                    .font(Font.subheadline.weight(.semibold))
                    .foregroundColor(.black)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemGray6))
                    .cornerRadius(4)

            }
            
            Divider()
            
        }
    }
}

#Preview {
    ProfileHeaderView()
}
