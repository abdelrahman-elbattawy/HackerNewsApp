//
//  ContentView.swift
//  H4X0R News
//
//  Created by Aboody on 25/07/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var apiManager = APIManager()
    
    var body: some View {
        NavigationView {
            List(apiManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4X0R NEWS")
        }
        .onAppear {
            apiManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

