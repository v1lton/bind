//
//  ContentView.swift
//  bind WatchKit Extension
//
//  Created by Wilton Ramos on 28/05/21.
//

import SwiftUI

struct HumorView: View {
    
    @Binding var modal: Bool
    
    var body: some View {
        ScrollView{
            
            VStack{
                
                Text("Como você se sentiu hoje?")
                    .fontWeight(.semibold)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.7, alignment: .center)
                
                
                Button(
                    action: {
                    
                },
                       label: {
                    HStack{
                        Image("circulo").resizable().aspectRatio(contentMode: .fill)
                            .frame(width: WKInterfaceDevice.current().screenBounds.width*0.07, height: WKInterfaceDevice.current().screenBounds.height*0.07, alignment: .center)
                        Text("Bem")
                            .padding(.leading, 20)
                    }
                    .padding(.leading, -30)
                })
                .foregroundColor(Color("verde"))
                .background(Color("verde").opacity(0.14))
                .cornerRadius(25)
                
                Button(action: {}, label: {
                    HStack{
                        Image("quadrado").resizable().aspectRatio(contentMode: .fill)
                            .frame(width: WKInterfaceDevice.current().screenBounds.width*0.07, height: WKInterfaceDevice.current().screenBounds.height*0.07, alignment: .center)
                        Text("Normal")
                            .padding(.leading, 20)
                    }
                    .padding(.leading, -15)
                })
                .foregroundColor(Color("cinza"))
                .background(Color("cinza").opacity(0.14))
                .cornerRadius(25)
                
                
                Button(
                    action: {
                    
                },
                    label: {
                    HStack{
                        Image("triangulo").resizable().aspectRatio(contentMode: .fill)
                            .frame(width: WKInterfaceDevice.current().screenBounds.width*0.1, height: WKInterfaceDevice.current().screenBounds.height*0.11, alignment: .center)
                            .padding(.leading, WKInterfaceDevice.current().screenBounds.width*0.15)
                        Text("Para baixo")
                            .padding(.leading, WKInterfaceDevice.current().screenBounds.width*0.09)
                    }
                    .padding(.leading, -WKInterfaceDevice.current().screenBounds.width*0.13)
                })
                
                .foregroundColor(Color("ciano"))
                .background(Color("ciano").opacity(0.15))
                .cornerRadius(25)
            }
            .frame(width: .infinity , height:  .infinity, alignment: .center)
            .padding()

        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HumorView(modal: .constant(true))
            .previewDevice("Apple Watch Series 5 - 44mm")
        HumorView(modal: .constant(true))
            .previewDevice("Apple Watch Series 6 - 40mm")
        HumorView(modal: .constant(true))
            .previewDevice("Apple Watch Series 3 - 38mm")
    }
}
