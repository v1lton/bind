//
//  BarChart.swift
//  bind WatchKit Extension
//
//  Created by Juliano Vaz on 03/06/21.
//

import SwiftUI

struct BarChart: View {
    
    @State private var touchLocation: CGFloat = -1
    
    var data: [ChartData]
    
    var body: some View {
        VStack(alignment: .leading) {
            //Geomety Reader
            GeometryReader { geometry in
                VStack {
                    HStack { //celulas (cada barra)
                        if !(data.isEmpty){
                            ForEach(0..<data.count, id: \.self) { i in
                                BarChartCell(value: normalizedValue(index: i), barColor: data[i].cor, symbolType: data[i].image)
                                    .opacity(barIsTouched(index: i) ? 1 : 0.7)
                                    .scaleEffect(barIsTouched(index: i) ? CGSize(width: 1.05, height: 1) : CGSize(width: 1, height: 1), anchor: .bottom)
                                    .animation(.spring())
                                    .padding(.top)
                            }
                        }
                    }
                }
            }
            
        }
        .frame(width: WKInterfaceDevice.current().screenBounds.width, height: WKInterfaceDevice.current().screenBounds.height/3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding()
    }
    
    func normalizedValue(index: Int) -> Double {
        //Esta função atribui um valor de 1 ao valor máximo em nosso array e, em seguida, obtém a proporção de cada valor restante para o nosso máximo.  Portanto, em uma matriz de [30, 50, 100, 75, 60], 100 será retornado como 1, enquanto 30 será retornado como 30/100, 50 será retornado como 50/100 e assim por diante.
        var allValues: [Double]    {
            var values = [Double]()
            for data in data {
                values.append(data.value)
            }
            return values
        }
        guard let max = allValues.max() else {
            return 1
        }
        if max != 0 {
            if data[index].value == 0.0 {
                return 0.1
            } else {
                return Double(data[index].value)/Double(max)
            }
        } else {
            return 0.1
        }
    }
    
    func barIsTouched(index: Int) -> Bool {
        touchLocation > CGFloat(index)/CGFloat(data.count) && touchLocation < CGFloat(index+1)/CGFloat(data.count)
    }
    
}


