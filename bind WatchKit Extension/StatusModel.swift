//
//  StatusView.swift
//  bind WatchKit Extension
//
//  Created by Ana Carolina Soares de Melo on 01/06/21.
//

import SwiftUI

struct StatusModel: View {
    
    // Checar validade das variaveis com o que sera recebido
    @Binding var duration: String
    @Binding var bpm: String
    @Binding var calories: String
    // adicionar variável para icone do humor
    // @Binding var iconStatus: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(duration)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                Text("horas de \natividade")
                    .font(.footnote)
                    .frame(width: 75, height: 35, alignment: .leading)
            }
            .padding(.leading, 5)
            
            Spacer()
            
            Image("circulo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40, alignment: .center)
                .padding(.trailing, 10)
                .padding(.top, 10)
        }
        
        HStack {
            VStack(alignment: .leading) {
                Text(bpm)
                    .font(.body)
                    .fontWeight(.semibold)
                Text("bpm")
                    .font(.footnote)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text(calories)
                    .font(.body)
                    .fontWeight(.semibold)
                Text("cal")
                    .font(.footnote)
            }
            
        }.padding()
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusModel(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xxxx"))
    }
}
