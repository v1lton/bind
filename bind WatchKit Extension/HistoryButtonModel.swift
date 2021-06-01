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
    var frame: CGSize
    
    var body: some View {
        HStack (alignment: .center, spacing: 15) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 18, height: 18, alignment: .center)
                .padding(.leading, 15)
            
            Text(title)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(color)
            
            Spacer()
        }
        .frame(width: frame.width, height: frame.height * 0.3, alignment: .center)
        .background(color.opacity(0.14))
        .cornerRadius(25)
    }
}


let date = Date()
let dateForm = DateFormatter()

//struct HistoryButtonModel_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryButtonModel(image: "quadrado", color: Color("cinza"), title: "24/05", screen: self.)
//    }
//}
