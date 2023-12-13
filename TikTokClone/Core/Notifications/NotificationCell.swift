//
//  NotificationCell.swift
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

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

extension Bool {
     static var iOS15: Bool {
         guard #available(iOS 15, *) else { return false }
         return true
     }
    
    static var iOS16: Bool {
        guard #available(iOS 16, *) else { return false }
        return true
    }
    
    static var iOS17: Bool {
        guard #available(iOS 17, *) else { return false }
        return true
    }
 }

struct NotificationCell: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundColor(Color(.systemGray6))
            
            HStack {
                Text("usman.saeed")
                    .font(Font.footnote.weight(.semibold)) +
                Text(" commented on one of your posts")
                    .font(Font.footnote) +
                Text(" 1d")
                    .font(Font.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            Image("testImage")
                .resizable()
                .frame(width: 48, height: 48)
                .cornerRadius(6)
                .if(.iOS17, transform: { image in
                    image.clipShape(RoundedRectangle(cornerRadius: 6))
                })
            
            
        }
    }
}

#Preview {
    NotificationCell()
}
