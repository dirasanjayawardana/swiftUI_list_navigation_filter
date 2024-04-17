//
//  DetailView.swift
//  EmojiSearch
//
//  Created by MACBOOK PRO on 17/04/24.
//

import SwiftUI

struct EmojiDetailView: View {
    var emoji: Emoji
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                HeaderDetailComponent(emoji: emoji)
                
                HStack {
                    VStack(alignment: .leading, spacing: 24, content: {
                        Text("Emoji name: \(emoji.name)")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text(emoji.description)
                    })
                    Spacer()
                }
                .padding()
            }
            .ignoresSafeArea()
            .navigationTitle(emoji.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EmojiDetailView(emoji: EmojiProvider.allEmojis().first!)
}
