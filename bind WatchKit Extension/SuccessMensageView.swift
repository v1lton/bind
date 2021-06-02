//
//  SuccessMensageView.swift
//  bind WatchKit Extension
//
//  Created by Ana Carolina Soares de Melo on 02/06/21.
//

import SwiftUI

struct SuccessMensageView: View {
    
    @State private var scale: CGFloat = 1
    
    var body: some View {
        VStack {
    
            HStack {
                
                Image("circulo").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.07, height: WKInterfaceDevice.current().screenBounds.height*0.07, alignment: .center)
                    .offset(CGSize(width: 3.0, height: 10.0))
                    .padding()
                
                Image("triangulo").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.09, height: WKInterfaceDevice.current().screenBounds.height*0.09, alignment: .center)
                    .rotationEffect(.degrees(33))
                    .offset(CGSize(width: 2.0, height: -5.0))
                    .padding()
                    .scaleEffect(scale)
                    .animation(.linear(duration: 1))
                
                
                Image("quadrado").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.06, height: WKInterfaceDevice.current().screenBounds.height*0.06, alignment: .center)
                    .rotationEffect(.degrees(30))
                    .offset(CGSize(width: 10.0, height: -9.0))
                    .padding()
                    
                
                Image("triangulo").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.09, height: WKInterfaceDevice.current().screenBounds.height*0.09, alignment: .center)
                    .rotationEffect(.degrees(65))
                    .offset(CGSize(width: 15.0, height: 0))
                    .padding()
                
                Image("circulo").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.07, height: WKInterfaceDevice.current().screenBounds.height*0.07, alignment: .center)
                    .offset(CGSize(width: 0, height: 35.0))
                    .padding()
                    
                
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
                
                Image("circulo").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.07, height: WKInterfaceDevice.current().screenBounds.height*0.07, alignment: .center)
                    .offset(CGSize(width: -7.0, height: 5.0))
                    .padding()
                
                Image("triangulo").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.09, height: WKInterfaceDevice.current().screenBounds.height*0.09, alignment: .center)
                    .rotationEffect(.degrees(-45))
                    .offset(CGSize(width: -2.0, height: 5.0))
                    .padding()
                
                Image("quadrado").resizable().aspectRatio(contentMode: .fill)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.065, height: WKInterfaceDevice.current().screenBounds.height*0.065, alignment: .center)
                    .rotationEffect(.degrees(-30))
                    .padding()
            }
            
            Spacer()
            
            Text("até a próxima")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.top)
        }
    }
}

struct SuccessMensageView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessMensageView()
            .previewDevice("Apple Watch Series 6 - 44mm")
        SuccessMensageView()
            .previewDevice("Apple Watch Series 6 - 40mm")
        SuccessMensageView()
            .previewDevice("Apple Watch Series 6 - 40mm")
    }
}
