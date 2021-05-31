//
//  TelaTeste.swift
//  bind WatchKit Extension
//
//  Created by Juliano Vaz on 31/05/21.
//

import SwiftUI

struct InicialView: View {
    
    @State private var modal = false

    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Button(
                action: {
                    self.modal.toggle() //true
            },
                label: {
                    Text("Button")
                    
            }
            )
           
            
            
            .sheet(isPresented: $modal, content: {
                    HumorView(modal:self.$modal)
                })
            
        }
    }
}

struct TelaTeste_Previews: PreviewProvider {
    static var previews: some View {
        InicialView()
    }
}
