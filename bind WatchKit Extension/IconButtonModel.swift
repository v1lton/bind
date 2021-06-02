//
//  IconButtonModel.swift
//  bind WatchKit Extension
//
//  Created by Ana Carolina Soares de Melo on 01/06/21.
//

import SwiftUI

struct IconButtonModel: View {
    
    @Binding var iconButton: String
    
    var body: some View {
        Button(action: {}) {
            Image(systemName: iconButton)
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

struct IconButtonModel_Previews: PreviewProvider {
    static var previews: some View {
        IconButtonModel(iconButton: Binding.constant(""))
    }
}
