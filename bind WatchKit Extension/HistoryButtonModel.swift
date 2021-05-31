//
//  HistoryButtonModel.swift
//  bind WatchKit Extension
//
//  Created by Jéssica Amaral on 31/05/21.
//

import SwiftUI

struct HistoryButtonModel: View {
    var image: String
    var color: Color
    var title: String
    
    let dateFormatter = DateFormatter().dateFormat
    
    var body: some View {
            HStack (alignment: .center, spacing: 20) {
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20, alignment: .center)
                
               Text(title)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(color)
                
                Spacer()
            }
            .padding(.leading, 15)
    }
}
let date = Date()
let dateForm = DateFormatter()
struct HistoryButtonModel_Previews: PreviewProvider {
    static var previews: some View {
        HistoryButtonModel(image: "quadrado", color: Color("cinza"), title: "24/05")
    }
}
