//
//  TemporaryAddHistory.swift
//  bind WatchKit Extension
//
//  Created by Jéssica Amaral on 01/06/21.
//

import SwiftUI

struct TemporaryAddHistory: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentation
    
    @State var humor = ""
    
    @Binding var modal: Bool
    
    let date: Date
    let formatter: DateFormatter
    
    init(modal: Binding<Bool>) {
        _modal = modal
        date = Date()
        formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
    }
    
    var body: some View {
        VStack {
            TextField("Humor", text: $humor)
            
            Button (action: {
                let newRegister = Record(context: context)
                newRegister.date = formatter.string(from: date)
                newRegister.humor = String(humor.lowercased())
                print(newRegister.humor!)
                if newRegister.humor! == "normal" {
                    newRegister.image = "quadrado"
                    newRegister.cor = "cinza"
                } else if newRegister.humor! == "bem" {
                    newRegister.image = "circulo"
                    newRegister.cor = "verde"
                    print("here")
                    
                } else {
                    newRegister.image = "triangulo"
                    newRegister.cor = "ciano"
                }
                
                do {
                    try context.save()
                    
                    print("saved...")
                    
                } catch {
                    print(error.localizedDescription)
                }
                
                presentation.wrappedValue.dismiss()
                
            }, label: {
                Text("Save")
            })
        }
        
    }
}

struct TemporaryAddHistory_Previews: PreviewProvider {
    static var previews: some View {
        TemporaryAddHistory(modal: Binding.constant(true))
    }
}
