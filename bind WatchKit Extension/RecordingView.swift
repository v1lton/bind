//
//  RecordingView.swift
//  bind WatchKit Extension
//
//  Created by Wilton Ramos on 31/05/21.
//

import SwiftUI

struct RecordingView: View {
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
                    .frame(maxHeight: geometry.size.height * 0.1)
                
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
                
                
                Spacer()
                    .frame(maxHeight: geometry.size.height * 0.1)
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("toque para finalizar")
                        .font(.system(.footnote, design: .rounded))
                        .font(.system(size: 11))


                }
                .buttonStyle(PlainButtonStyle())
                
            }
            
        }
        
    }
}

struct RecordingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecordingView()
            RecordingView()
                .previewDevice("Apple Watch Series 6 - 40mm")
            RecordingView()
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
