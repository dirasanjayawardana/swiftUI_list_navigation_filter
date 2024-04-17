//
//  ContentView.swift
//  EmojiSearch
//
//  Created by MACBOOK PRO on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    var emojis: [Emoji] = EmojiProvider.allEmojis()
    
    @State private var searchInput: String = ""
    
    var emojiSearchResult: [Emoji] {
        // menjaankan code setelahnya ketika kondisi di guard terpenuhi, jika tidak akan eksekusi else di guard
        guard !searchInput.isEmpty else {
            return emojis
        }
        return emojis.filter { emoji in
            emoji.name.lowercased().contains(searchInput.lowercased())
        }
    }
    
    var body: some View {
        NavigationStack {
            List(emojiSearchResult) { emoji in
                EmojiRowComponent(emoji: emoji)
                    .listRowSeparator(.visible)
            }
            .listStyle(.automatic)
            .navigationTitle("Emoji")
            .searchable(
                text: $searchInput,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "What emoji's that you're looking for"
            )
            .overlay {
                if emojiSearchResult.isEmpty {
                    ContentUnavailableView.search(text: searchInput)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
