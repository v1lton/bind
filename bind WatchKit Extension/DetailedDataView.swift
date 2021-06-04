//
//  DetailedDataView.swift
//  bind WatchKit Extension
//
//  Created by Ana Carolina Soares de Melo on 01/06/21.
//

import SwiftUI

struct DetailedDataView: View {
    
    // Checar validade das variaveis com o que sera recebido
    @Binding var record: Record
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text(record.date ?? "-")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.leading, 5)
                    .foregroundColor(Color(record.cor ?? "cinza"))
                
                StatusModel(record: $record) //adicionar variável para icone do humor
                
                Button(action: {}) {
                    Image(systemName:"play")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .font(Font.title.weight(.semibold))
                        .frame(width: 15, height: 15, alignment: .center)
                }
                .foregroundColor(Color("roxo"))
                .background(Color("roxo").opacity(0.14))
                .cornerRadius(25)
                
            }.padding(.horizontal)
        }
    }
}
