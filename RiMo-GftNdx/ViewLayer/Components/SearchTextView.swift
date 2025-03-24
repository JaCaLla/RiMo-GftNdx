//
//  SearchTextView.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 23/3/25.
//

import SwiftUI

struct SearchTextView: View {
    @Binding var searchText: String
    @FocusState private var isFocused: Bool
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading)
                TextField("filter_placeholder", text: $searchText)
                    .focused($isFocused)
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                }
            }
            .frame(height: 35)
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.gray, lineWidth: 1)
            )
            if isFocused {
                Button(action: {
                    searchText = ""
                    isFocused = false
                }) {
                    Text("cancel")
                        .foregroundColor(.gray)
                }
                .transition(.opacity)
            }
        }
        .padding(.horizontal)
        .font(Typography.body.font)
    }
}

#Preview {
    SearchTextView(searchText: .constant("Placeholder"))
}
