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
                
                Text("Como voce se sentiu hoje?")
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .frame(width: 120, alignment: .center)
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Bem")
                })
                Button(action: {}, label: {
                    Text("Normal")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Para baixo")
                })
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
