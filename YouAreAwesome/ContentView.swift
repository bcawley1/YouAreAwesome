//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Cawley, Brayden J on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .padding()
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("You Are Awesome!")
                .font(.largeTitle)
                .foregroundColor(.blue)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
