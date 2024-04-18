//
//  DetailView.swift
//  EmojiSearch
//
//  Created by MACBOOK PRO on 17/04/24.
//

import SwiftUI

struct EmojiDetailView: View {
    var emoji: Emoji
    
    @Environment(\.dismiss) var dismiss
    
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
                
                InfoBoxComponent()
                    .padding(.horizontal)
            }
            .ignoresSafeArea()
            .navigationTitle(emoji.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .font(.title)
                    })
                    .tint(.primary)
                })
            })
        }
    }
}

#Preview {
    EmojiDetailView(emoji: EmojiProvider.allEmojis().first!)
}
