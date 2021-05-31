//
//  HistoryView.swift
//  bind WatchKit Extension
//
//  Created by Jéssica Amaral on 31/05/21.
//

import SwiftUI

struct HistoryView: View {
    @FetchRequest(entity: Record.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Record.date, ascending: false)], animation: .easeIn) var history : FetchedResults<Record>
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            Text("Sua trajetória")
                .fontWeight(.bold)
                .font(.system(size: 15))
            Button (action: {
                
            }, label: {
                HistoryButtonModel(image: "quadrado", color: Color("cinza"), title: "25/05")
            })
            
            Spacer()
        }
        .padding([.leading, .trailing])
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
