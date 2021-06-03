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
        VStack (alignment: .leading){
            
            BarChart(title: "Monthly Sales", legend: "EUR", barColor: .blue, data: chartDataSet)
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
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
            
//            Button(
//                action: {
//                    self.addRecord.toggle() //true
//                },
//                label: {
//                    Text("Registrar")
//                }
//            )
//            .sheet(isPresented: $addRecord, content: {
//                TemporaryAddHistory(modal: self.$addRecord)
//            })
            
//            Button(
//                action: {
//                    self.history.toggle() //true
//                },
//                label: {
//                    Text("Histórico")
//                }
//            )
//            .sheet(isPresented: $history, content: {
//                HistoryView(modal: self.$history)
//                    .toolbar(content: {
//                        ToolbarItem(placement: .cancellationAction) {
//                            Button("Close") { self.history.toggle()
//                            }
//                        }
//                    })
//            })
        }
    }
}

struct TelaTeste_Previews: PreviewProvider {
    static var previews: some View {
        InicialView()
    }
}
