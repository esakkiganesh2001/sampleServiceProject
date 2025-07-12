//
//  CustomSearchBar.swift
//  sampleServiceProject
//
//  Created by Esakki Ganesh iOS on 12/07/25.
//

import SwiftUI

struct CustomSearchBar: View {
    
    @Binding var searchText: String
    
    var micTapped: () -> Void = {}
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.gray)
            TextField("Search", text: $searchText)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            Button(action: {
                micTapped()
            }) {
                Image(systemName: "mic.fill")
                    .foregroundColor(.gray)
            }
        }
        .padding(13)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
