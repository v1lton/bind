//
//  TelaTeste.swift
//  bind WatchKit Extension
//
//  Created by Juliano Vaz on 31/05/21.
//

import SwiftUI

struct InicialView: View {
    @FetchRequest(entity: Record.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Record.date, ascending: false)], animation: .easeIn) var history : FetchedResults<Record>
    
    @Environment(\.managedObjectContext) var contex
    
//    let chartDataSet = [
//        ChartData( value: 240.32, image: "quadrado", cor: "cinza"),
//        ChartData( value: 200.32, image: "triangulo", cor: "ciano"),
//        ChartData( value: 260.32, image: "quadrado", cor: "cinza"),
//        ChartData( value: 350.32, image: "circulo", cor: "verde"),
//        ChartData( value: 210.32, image: "triangulo", cor: "ciano"),
//        ChartData( value: 300.32, image: "circulo", cor: "verde")
//
//    ]
    var chartDataSet: [ChartData] = []
    
    init() {
        var count = 0
        
        if !history.isEmpty {
            for register in history {
                if count < 7 {
                    let time = register.activityRecord?.doubleTime ?? 0.0
                    let image = register.image ?? "quadrado"
                    let cor = register.cor ?? "cinza"
                    let newCharData = ChartData(value: time, image: image, cor: cor)
                    chartDataSet.append(newCharData)
                    
                    count = count + 1
                } else {
                    break
                }
            }
            
            if count < 7 {
                let i = 7 - history.count
                let newCharData = ChartData(value: 0.0, image: "-", cor: "roxo")
                for _ in 0..<i {
                    chartDataSet.append(newCharData)
                }
            }
        } else {
            let newCharData = ChartData(value: 0.0, image: "-", cor: "roxo")
            for _ in 0..<7 {
                chartDataSet.append(newCharData)
            }
        }
    }
    
    var body: some View {
        VStack{
            
            Text("Últimos 7 dias")
                .font(.system(size: 10))
                .foregroundColor(.white)
                .frame(width: WKInterfaceDevice.current().screenBounds.width, alignment: .leading)
                .padding(.leading,  WKInterfaceDevice.current().screenBounds.width*0.1)
                .padding(.top,  WKInterfaceDevice.current().screenBounds.width*0.1)
                
            NavigationLink(
                destination: HistoryView(),
                label: {
                    BarChart(data: chartDataSet)
                })
                .buttonStyle(PlainButtonStyle())
    
            Spacer()
            
            NavigationLink(
                destination:  HumorView(),
                label: {
                    Text("Registrar")
                })
            
                 
        }

    }
}

struct TelaTeste_Previews: PreviewProvider {
    static var previews: some View {
        InicialView()
    }
}
