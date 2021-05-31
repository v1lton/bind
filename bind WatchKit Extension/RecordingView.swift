//
//  RecordingView.swift
//  bind WatchKit Extension
//
//  Created by Wilton Ramos on 31/05/21.
//

import SwiftUI
import Combine
import AVFoundation

struct RecordingView: View {
    @ObservedObject var audioRecorder: RecordingViewModel
    @State var isRecording = false
    @State private var animateBigCircle = false
    @State private var animateStroke = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(alignment: .center) {
                
                Text("Conte como foi \n seu dia...")
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                if !isRecording {
                    Button(action: {
                        isRecording.toggle()
                        self.audioRecorder.startRecording()
                    }) {
                        ZStack {
                            Circle()
                                .opacity(0)

                            Circle()
                                .fill(Color.purple)
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            
                            Circle()
                                .fill(Color.purple)
                                .scaleEffect(0.75)
                            
                            Image(systemName: "mic")
                                .font(.system(.title2, design: .rounded))
                                .font(Font.system(.title2).bold())
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                } else {
                    Button(action: {
                        isRecording.toggle()
                        self.audioRecorder.stopRecording()
                    }) {
                        ZStack {
                            Circle()
                                .stroke()
                                .foregroundColor(.purple)
                                .scaleEffect(animateStroke ? 1 : 0.3)
                                .opacity(animateStroke ? 1 : 1)
                                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
                                .onAppear(){
                                    self.animateStroke.toggle()
                                }
                            
                            Circle()
                                .fill(Color.purple)
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                                .scaleEffect(animateBigCircle ? 0.8 : 1.1)
                                .animation(Animation.easeInOut(duration: 0.6).repeatForever(autoreverses: true))
                                .onAppear(){
                                    self.animateBigCircle.toggle()
                                }
                            
                            Circle()
                                .fill(Color.purple)
                                .scaleEffect(0.75)
                            
                            Image(systemName: "mic")
                                .font(.system(.title2, design: .rounded))
                                .font(Font.system(.title2).bold())
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                
                if !isRecording {
                    Button(action: {
                        isRecording.toggle()
                        self.audioRecorder.startRecording()
                    })
                    {
                        Text("toque para gravar")
                            .fontWeight(.light)
                            .font(.system(size: 11))
                    }
                    .buttonStyle(PlainButtonStyle())
                } else {
                    Button(action: {
                        isRecording.toggle()
                        self.audioRecorder.stopRecording()
                    })
                    {
                        Text("toque para finalizar")
                            .fontWeight(.light)
                            .font(.system(size: 11))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        
    }
}

struct RecordingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecordingView(audioRecorder: RecordingViewModel())
                .previewDevice("Apple Watch Series 6 - 44mm")
            RecordingView(audioRecorder: RecordingViewModel())
                .previewDevice("Apple Watch Series 6 - 40mm")
            RecordingView(audioRecorder: RecordingViewModel())
                .previewDevice("Apple Watch Series 6 - 40mm")
        }
    }
}