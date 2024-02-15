//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Cawley, Brayden J on 1/12/24.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var imageNum = 0
    @State private var lastImageNum = -1
    let maxImageNum=9
    let messages = ["You Are Awesome!", "You Are Amazing!", "You Are Fantastic!", "Fabulous, Thats You!"]
    @State private var messageNum = 0
    @State private var lastMessageNum = -1
    @State private var soundNumber = -1
    @State private var lastSoundNumber = -1
    @State var audioPlayer: AVAudioPlayer!
    @State private var soundIsOn = true
    
    var body: some View {
        VStack {
            Text(messages[messageNum])
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.pink)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .animation(.easeInOut(duration: 0.15), value: messageNum)
            Spacer()
            Image("image\(imageNum)")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .shadow(radius: 10)
                .animation(.easeInOut(duration: 0.15), value: imageNum)
            Spacer()
            
            HStack {
                Text("Sound On:")
                
                Toggle("Sound", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) { _ in
                        if (audioPlayer != nil && audioPlayer.isPlaying){
                            audioPlayer.stop()
                        }
                    }
                
                Spacer()
                
                Button("Awesome") {
                    //This is the code called when the button is pressed
                    lastImageNum = imageNum
                    imageNum = nonRepeatingRandom(lastNumber: lastImageNum, upperBound: 9)
                    
                    lastMessageNum = messageNum
                    messageNum = nonRepeatingRandom(lastNumber: lastMessageNum, upperBound: messages.count-1)
                    
                    lastSoundNumber = soundNumber
                    soundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: 5)
                    if(soundIsOn){
                        playSound(soundName: "sound\(soundNumber)")
                    }
                    
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .tint(.accentColor)
        }
        .padding()
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int{
        var num = -1
        repeat{
            num = Int.random(in: 0...upperBound)
        } while num == lastNumber
        return num
    }
    
    func playSound(soundName: String){
        guard let soundFile = NSDataAsset(name: soundName) else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch{
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
