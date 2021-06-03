//
//  DetailedDataView.swift
//  bind WatchKit Extension
//
//  Created by Ana Carolina Soares de Melo on 01/06/21.
//

import SwiftUI

struct DetailedDataView: View {
    
    // Checar validade das variaveis com o que sera recebido
    @Binding var duration: String
    @Binding var bpm: String
    @Binding var calories: String
    @Binding var data: String
    @Binding var cor: Color
    //@Binding var iconStatus: String
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text(data)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.leading, 5)
                    .foregroundColor(cor)
                
                StatusModel(duration: $duration, bpm: $bpm, calories: $calories).padding(.top, -5) //adicionar variável para icone do humor
                
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

struct DetailedDataView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedDataView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xxxx"), data: Binding.constant("XX/XX"), cor: Binding.constant(Color("cinza")))
            .previewDevice("Apple Watch Series 5 - 44mm")
        DetailedDataView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xxxx"), data: Binding.constant("XX/XX"), cor: Binding.constant(Color("cinza")))
            .previewDevice("Apple Watch Series 6 - 40mm")
        DetailedDataView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xxxx"), data: Binding.constant("XX/XX"), cor: Binding.constant(Color("cinza")))
            .previewDevice("Apple Watch Series 3 - 38mm")
    }
}
