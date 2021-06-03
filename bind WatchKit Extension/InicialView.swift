//
//  TelaTeste.swift
//  bind WatchKit Extension
//
//  Created by Juliano Vaz on 31/05/21.
//

import SwiftUI

struct InicialView: View {
    
    @State private var modal = false
    @State private var addRecord = false
    @State private var history = false
    
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
