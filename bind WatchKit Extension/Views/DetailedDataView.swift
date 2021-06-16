//
//  DetailedDataView.swift
//  bind WatchKit Extension
//
//  Created by Ana Carolina Soares de Melo on 01/06/21.
//

import SwiftUI
import AVFoundation


struct DetailedDataView: View {
    
    // Checar validade das variaveis com o que sera recebido
    @Binding var record: Record
    
    @State var audioPlayer = AVPlayer()
    @State var isPlaying: Bool = false
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text(record.date ?? "-")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.leading, 5)
                    .foregroundColor(Color(record.cor ?? "cinza"))
                
                StatusModel(record: $record) //adicionar variável para icone do humor
                if !(record.audiopath == nil) {
                    HStack {
                        Button(action: {
                            audioPlayer.pause()
                            isPlaying = false
                        }) {
                            Image(systemName:"pause")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .font(Font.title.weight(.semibold))
                                .frame(width: 15, height: 15, alignment: .center)
                        }
                        .foregroundColor(Color("roxo"))
                        .background(Color("roxo").opacity(0.14))
                        .cornerRadius(25)
                    
                        Button(action: {
                            if audioPlayer.currentTime() == audioPlayer.currentItem?.duration {
                                audioPlayer.seek(to: CMTime.zero)
                            }
                            audioPlayer.play()
                            isPlaying = true
                        }) {
                            Image(systemName:"play")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .font(Font.title.weight(.semibold))
                                .frame(width: 15, height: 15, alignment: .center)
                        }
                        .foregroundColor(Color("roxo"))
                        .background(Color("roxo").opacity(0.14))
                        .cornerRadius(25)
                    }
                }
            }.padding(.horizontal)
        }
        .onAppear() {
            let url = URL(string: record.audiopath!)
            let audioItem = AVPlayerItem(url: url! as URL)
            audioPlayer = AVPlayer(playerItem: audioItem)
            audioPlayer.actionAtItemEnd = .pause
            audioPlayer.volume = 100
        }
        .onDisappear() {
            audioPlayer.pause()
        }
    }
}
