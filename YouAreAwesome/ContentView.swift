//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Cawley, Brayden J on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = "You Are Great!"
    var body: some View {
        VStack {
            Text(messageString)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .fontWeight(.heavy)
                .padding()
            Button("Press Me") {
                //This is the code called when the button is pressed
                messageString = "You Are Awesome!"
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
