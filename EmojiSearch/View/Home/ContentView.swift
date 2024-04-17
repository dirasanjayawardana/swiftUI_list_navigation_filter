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
    @State private var isRedacted: Bool = true
    
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
                // NavigationLink {
                //     EmojiDetailView(emoji: emoji)
                // } label: {
                //     EmojiRowComponent(emoji: emoji)
                //         .listRowSeparator(.visible)
                // }
                NavigationLink(destination: {
                    EmojiDetailView(emoji: emoji)
                }, label: {
                    if isRedacted {
                        EmojiRowComponent(emoji: emoji)
                            .redacted(reason: .placeholder)
                    } else {
                        EmojiRowComponent(emoji: emoji)
                            .listRowSeparator(.visible)
                    }
                })
            }
            .listStyle(.automatic)
            .navigationTitle("Emoji")
            .onAppear(perform: {
                // setelah 2 detik ubah state isRedected
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    isRedacted = false
                })
            })
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
