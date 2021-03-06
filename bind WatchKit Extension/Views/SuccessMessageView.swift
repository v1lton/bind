//
//  SuccessMensageView.swift
//  bind WatchKit Extension
//
//  Created by Ana Carolina Soares de Melo on 02/06/21.
//

import SwiftUI

struct SuccessMessageView: View {
    
    @State private var scale: CGFloat = 1
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
    
            HStack {
                
                Image("circulo").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.07, height: WKInterfaceDevice.current().screenBounds.height*0.07, alignment: .center)
                    .offset(CGSize(width: 3.0, height: 10.0))
                    .padding()
                    .scaleEffect(isAnimated ? 1 : 0.7)
                    .opacity(isAnimated ? 1 : 0.2)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    .onAppear(){
                        self.isAnimated.toggle()
                    }
                
                Image("triangulo").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.09, height: WKInterfaceDevice.current().screenBounds.height*0.09, alignment: .center)
                    .rotationEffect(.degrees(33))
                    .offset(CGSize(width: 2.0, height: -5.0))
                    .padding()
                    .scaleEffect(isAnimated ? 0.7 : 1)
                    .opacity(isAnimated ? 0.2 : 1)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                
                Image("quadrado").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.06, height: WKInterfaceDevice.current().screenBounds.height*0.06, alignment: .center)
                    .rotationEffect(.degrees(30))
                    .offset(CGSize(width: 10.0, height: -9.0))
                    .padding()
                    .scaleEffect(isAnimated ? 1 : 0.7)
                    .opacity(isAnimated ? 1 : 0.2)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    
                
                Image("circulo").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.09, height: WKInterfaceDevice.current().screenBounds.height*0.09, alignment: .center)
                    .rotationEffect(.degrees(65))
                    .offset(CGSize(width: 15.0, height: 0))
                    .padding()
                    .scaleEffect(isAnimated ? 0.7 : 1)
                    .opacity(isAnimated ? 0.2 : 1)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                
                Image("triangulo").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.07, height: WKInterfaceDevice.current().screenBounds.height*0.07, alignment: .center)
                    .offset(CGSize(width: 0, height: 35.0))
                    .padding()
                    .scaleEffect(isAnimated ? 1 : 0.7)
                    .opacity(isAnimated ? 1 : 0.2)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    
                
            }

                
                Text("Muito bem!")
                    .font(.title3)

                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            
            HStack {
                
                Image("quadrado").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.06, height: WKInterfaceDevice.current().screenBounds.height*0.06 , alignment: .center)
                    .rotationEffect(.degrees(30))
                    .offset(CGSize(width: -10.0, height: -8.0))
                    .padding()
                    .scaleEffect(isAnimated ? 0.7 : 1)
                    .opacity(isAnimated ? 0.2 : 1)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                
                Image("circulo").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.07, height: WKInterfaceDevice.current().screenBounds.height*0.07, alignment: .center)
                    .offset(CGSize(width: -7.0, height: 5.0))
                    .padding()
                    .scaleEffect(isAnimated ? 1 : 0.7)
                    .opacity(isAnimated ? 1 : 0.2)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                
                Image("triangulo").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.09, height: WKInterfaceDevice.current().screenBounds.height*0.09, alignment: .center)
                    .rotationEffect(.degrees(-45))
                    .offset(CGSize(width: -2.0, height: 5.0))
                    .padding()
                    .scaleEffect(isAnimated ? 0.7 : 1)
                    .opacity(isAnimated ? 0.2 : 1)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                
                Image("quadrado").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.065, height: WKInterfaceDevice.current().screenBounds.height*0.065, alignment: .center)
                    .rotationEffect(.degrees(-30))
                    .padding()
                    .scaleEffect(isAnimated ? 1 : 0.7)
                    .opacity(isAnimated ? 1 : 0.2)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
            }
            
            Spacer()
            
            Text("at?? a pr??xima")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.top)
        }
    }
}

struct SuccessMensageView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessMessageView()
            .previewDevice("Apple Watch Series 6 - 44mm")
        SuccessMessageView()
            .previewDevice("Apple Watch Series 6 - 40mm")
        SuccessMessageView()
            .previewDevice("Apple Watch Series 6 - 40mm")
    }
}
