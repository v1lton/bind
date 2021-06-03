//
//  HistoryView.swift
//  bind WatchKit Extension
//
//  Created by Jéssica Amaral on 31/05/21.
//

import SwiftUI
import UIKit

struct HistoryView: View {
    @FetchRequest(entity: Record.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Record.date, ascending: false)], animation: .easeIn) var history : FetchedResults<Record>
    
    @State var details = false
    
    var body: some View {
        GeometryReader { screen in
            ScrollView {
                VStack (alignment: .leading, spacing: 10) {
                    Text("Sua Trajetória")
                        .font(.system(size: 19))
                        .fontWeight(.bold)
                    
                    if (history.isEmpty) {
                        Text("Seu histórico ainda está vazio...")
                    } else {
                        ForEach(history, id: \.self) { item in
                            Button(action: {
                                details.toggle()
                            }, label: {
                                HistoryButtonModel(image: item.image!, color: Color(item.cor!), title: item.date!, frame: screen.size)
                            })
                            .buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: $details) {
                                Text(item.date!)
                                    .toolbar(content: {
                                        ToolbarItem(placement: .cancellationAction) {
                                            Button("Close") { self.details.toggle() }
                                        }
                                    })
                            }
                        }
                    }
                }
            }
        }
    }
}

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView(modal: Binding.constant(true))
//    }
//}
