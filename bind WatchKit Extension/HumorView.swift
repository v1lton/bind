//
//  ContentView.swift
//  bind WatchKit Extension
//
//  Created by Wilton Ramos on 28/05/21.
//

import SwiftUI

struct HumorView: View {
    
    @FetchRequest(entity: Record.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Record.date, ascending: false)], animation: .easeIn) var history : FetchedResults<Record>
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var context
    
    @State var humor: String = ""
    @State var cor: String = ""
    @State var image: String = ""
    
    let date: Date
    let formatter: DateFormatter
    
    init() {
        date = Date()
        formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
    }
    
    var body: some View {
        ScrollView{
            
            VStack{
                
                Text("Como você se sentiu hoje?")
                    .fontWeight(.semibold)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width*0.7, alignment: .center)
                
                Button(
                    action: {
                        humor = "bem"
                        cor = "verde"
                        image = "circulo"
                        addNewRegister()
                    },
                    label: {
                        NavigationLink(
                            destination:  ActivityView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xx")),
                            label: {
                                
                                HStack{
                                    Image("circulo").resizable().aspectRatio(contentMode: .fill)
                                        .frame(width: WKInterfaceDevice.current().screenBounds.width*0.07, height: WKInterfaceDevice.current().screenBounds.height*0.07, alignment: .center)
                                    Text("Bem")
                                        .padding(.leading, 20)
                                }
                                .padding(.leading, -30)
                            })
                        .foregroundColor(Color("verde"))
                        .background(Color("verde").opacity(0.14))
                        .cornerRadius(25)
                    })   .buttonStyle(PlainButtonStyle())
                
                Button(
                    action: {
                        humor = "normal"
                        cor = "cinza"
                        image = "quadrado"
                        addNewRegister()
                    },
                    label: {
                        NavigationLink(
                            destination: ActivityView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xx")),
                            label: {
                                HStack{
                                    Image("quadrado").resizable().aspectRatio(contentMode: .fill)
                                        .frame(width: WKInterfaceDevice.current().screenBounds.width*0.07, height: WKInterfaceDevice.current().screenBounds.height*0.07, alignment: .center)
                                    Text("Normal")
                                        .padding(.leading, 20)
                                }
                                .padding(.leading, -15)
                            })
                            .foregroundColor(Color("cinza"))
                            .background(Color("cinza").opacity(0.14))
                            .cornerRadius(25)
                    }) .buttonStyle(PlainButtonStyle())
                
                
                Button(
                    action: {
                        humor = "pra baixo"
                        cor = "ciano"
                        image = "triangulo"
                        addNewRegister()
                    },
                    label: {
                        NavigationLink(
                            destination: ActivityView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xx")),
                            label: {
                                HStack{
                                    Image("triangulo").resizable().aspectRatio(contentMode: .fill)
                                        .frame(width: WKInterfaceDevice.current().screenBounds.width*0.1, height: WKInterfaceDevice.current().screenBounds.height*0.11, alignment: .center)
                                        .padding(.leading, WKInterfaceDevice.current().screenBounds.width*0.15)
                                    Text("Para baixo")
                                        .padding(.leading, WKInterfaceDevice.current().screenBounds.width*0.09)
                                }
                                .padding(.leading, -WKInterfaceDevice.current().screenBounds.width*0.13)
                            })
                            
                            .foregroundColor(Color("ciano"))
                            .background(Color("ciano").opacity(0.15))
                            .cornerRadius(25)
                            }) .buttonStyle(PlainButtonStyle())
            }
            .frame(width: .infinity , height:  .infinity, alignment: .center)
            .padding()
            
        }
        
    }
    
    func addNewRegister(){
        if history.first?.date == formatter.string(from: date) {
            history.first?.humor = self.humor
            history.first?.cor = self.cor
            history.first?.image = self.image
        } else {
            let newRegister = Record(context: context)
            newRegister.date = formatter.string(from: date)
            
            newRegister.humor = self.humor
            newRegister.cor = self.cor
            newRegister.image = self.image
        }
        
        do {
            try context.save()
            
            print("saved...")
            
        } catch {
            print(error.localizedDescription)
        }
        
//        presentation.wrappedValue.dismiss() //aqui achei
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HumorView(modal: .constant(true))
//            .previewDevice("Apple Watch Series 5 - 44mm")
//        HumorView(modal: .constant(true))
//            .previewDevice("Apple Watch Series 6 - 40mm")
//        HumorView(modal: .constant(true))
//            .previewDevice("Apple Watch Series 3 - 38mm")
//    }
//}
