//
//  ActivityView.swift
//  bind WatchKit Extension
//
//  Created by Ana Carolina Soares de Melo on 31/05/21.
//

import SwiftUI

struct ActivityView: View {
    
    // Checar validade das variaveis com o que sera recebido
    @Binding var duration: String
    @Binding var bpm: String
    @Binding var calories: String
    // @Binding var iconStatus: String
    // @Binding var iconButton: String
    // @Binding var data: Date
    
    var body: some View {
        VStack {
            
            StatusModel(duration: $duration, bpm: $bpm, calories: $calories)
            
            Spacer()
            
            HStack {
                Button(action: {}) {
                    Image(systemName:"mic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .font(Font.title.weight(.semibold))
                        .frame(width: 15, height: 15, alignment: .center)
                }
                .foregroundColor(Color("roxo"))
                .background(Color("roxo").opacity(0.14))
                .cornerRadius(25)
                
                Button(action: {}) {
                    Image(systemName:"checkmark")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .font(Font.title.weight(.semibold))
                        .frame(width: 15, height: 15, alignment: .center)
                }
                .foregroundColor(Color("roxo"))
                .background(Color("roxo").opacity(0.14))
                .cornerRadius(25)
            }
        }
    }
}


struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xxxx"))
            .previewDevice("Apple Watch Series 5 - 44mm")
        ActivityView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xxxx"))
            .previewDevice("Apple Watch Series 6 - 40mm")
        ActivityView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xxxx"))
            .previewDevice("Apple Watch Series 3 - 38mm")
    }
}
