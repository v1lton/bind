//
//  BarChartCell.swift
//  bind WatchKit Extension
//
//  Created by Jéssica Amaral on 15/06/21.
//

import SwiftUI

struct BarChartCell: View {
    
    var value: Double
    var barColor: String
    var symbolType: String
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(barColor))
                .scaleEffect(CGSize(width: 0.7, height: value), anchor: .bottom)
            Image(symbolType)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}
