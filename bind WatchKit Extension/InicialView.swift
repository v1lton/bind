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
                
            
            Button(
                action: {
                    self.history.toggle() //true
                },
                label: {
                    BarChart(data: chartDataSet)
                }
            )
            .buttonStyle(PlainButtonStyle()) //colocar o button transparente, mostrando só o gráfico
            .sheet(isPresented: $history, content: {
                HistoryView(modal: self.$history)
                    .toolbar(content: {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Close") { self.history.toggle()
                            }
                        }
                    })
                })
           
            
            Spacer()
            Button(
                action: {
                    self.modal.toggle() //true
                },
                label: {
                    Text("Registrar")
                }
            )
            .sheet(isPresented: $modal, content: {
                HumorView(modal:self.$modal)
            })
                 
        }

    }
}

struct TelaTeste_Previews: PreviewProvider {
    static var previews: some View {
        InicialView()
    }
}
