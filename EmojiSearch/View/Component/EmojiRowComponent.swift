//
//  EmojiRowComponent.swift
//  EmojiSearch
//
//  Created by MACBOOK PRO on 17/04/24.
//

import SwiftUI

struct EmojiRowComponent: View {
    var emoji: Emoji
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Text(emoji.emoji)
                .font(.largeTitle)
                .padding()
                .frame(minWidth: 80, minHeight: 80)
                .background(RandomColor.bgView())
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(emoji.name)
                    .font(.system(.headline, design: .rounded))
                Text(emoji.description)
                    .font(.system(.subheadline, design: .rounded))
                    .lineLimit(3, reservesSpace: false)
            }
        }
    }
}

#Preview {
    EmojiRowComponent(emoji: EmojiProvider.allEmojis().first!)
        .padding()
}
