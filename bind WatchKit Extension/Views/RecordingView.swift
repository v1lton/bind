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
    @FetchRequest(entity: Record.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Record.date, ascending: true)], animation: .easeIn) var history : FetchedResults<Record>
    
    @ObservedObject var audioRecorder: RecordingViewModel
    @State var isRecording = false
    @State private var animateBigCircle = false
    @State private var animateStroke = false
    @State var successView: String? = nil
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(alignment: .center) {
                
                NavigationLink(destination:
                                SuccessMessageView()
                                .navigationBarBackButtonHidden(true)
                                .toolbar(content: {
                                    ToolbarItem(placement: .cancellationAction) {
                                        ZStack {
                                            Image(systemName: "house.circle.fill")
                                                .resizable()
                                                .foregroundColor(Color("roxo"))
                                            
                                            Button(
                                            action: {
                                            NotificationCenter.default.post(name: Notification.Name("successToInicialView"), object: nil)
                                            },
                                            label: {
                                            Text("     ")
                                                .fontWeight(.bold)
                                                .font(.system(size: 15))
                                                .foregroundColor(Color("roxo"))
                                            })
                                        }
                                    }
                                }),
                               tag: "toSuccess",
                               selection: $successView) {
                    EmptyView()
                }
                .buttonStyle(PlainButtonStyle())
                
                Text("Conte como foi \n seu dia...")
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                if !isRecording {
                    Button(action: {
                        self.audioRecorder.startRecording()
                        isRecording.toggle()
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
                        self.audioRecorder.stopRecording(record: history.last!)
                        isRecording.toggle()
                        successView = "toSuccess"
                    },
                    label: {
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
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                if !isRecording {
                    Button(
                        action: {
                            isRecording.toggle()
                            self.audioRecorder.startRecording()
                    },
                        label: {
                            Text("toque para gravar")
                                .fontWeight(.light)
                                .font(.system(size: 11))
                                .padding(.top, -10)
                    })
                    .buttonStyle(PlainButtonStyle())
                } else {
                    Button(
                        action: {
                            self.audioRecorder.stopRecording(record: history.last!)
                            isRecording.toggle()
                            successView = "toSuccess"
                    },
                        label: {
                            Text("toque para finalizar")
                                .fontWeight(.light)
                                .font(.system(size: 11))
                        })
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
}
