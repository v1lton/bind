//
//  ContentView.swift
//  bind WatchKit Extension
//
//  Created by Wilton Ramos on 28/05/21.
//

import SwiftUI

struct HumorView: View {
    
    @Binding var modal: Bool
    
    var body: some View {
        ScrollView{
            
            VStack{
                
                Text("Como você se sentiu hoje?")
                    .fontWeight(.semibold)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .frame(width: 120, alignment: .center)
                
                
                Button(
                    action: {
                    
                },
                       label: {
                    HStack{
                        Image("circulo").resizable().aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20, alignment: .center)
                        Text("Bem")
                            .padding(.leading, 20)
                    }
                    .padding(.leading, -30)
                })
                .foregroundColor(Color("verde"))
                .background(Color("verde").opacity(0.14))
                .cornerRadius(25)
                
                Button(action: {}, label: {
                    HStack{
                        Image("quadrado").resizable().aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("Normal")
                            .padding(.leading, 20)
                    }
                    .padding(.leading, -15)
                })
                .foregroundColor(Color("cinza"))
                .background(Color("cinza").opacity(0.14))
                .cornerRadius(25)
                
                
                Button(
                    action: {
                    
                },
                    label: {
                    HStack{
                        Image("triangulo").resizable().aspectRatio(contentMode: .fill)
                            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.leading, 25)
                        Text("Para baixo")
                            .padding(.leading, 15)
                    }
                    .padding(.leading, -15)
                })
                
                .foregroundColor(Color("ciano"))
                .background(Color("ciano").opacity(0.15))
                .cornerRadius(25)
            }
            .frame(width: .infinity , height:  .infinity, alignment: .center)
            .padding()

        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HumorView(modal: .constant(true))
            .previewDevice("Apple Watch Series 5 - 44mm")
        HumorView(modal: .constant(true))
            .previewDevice("Apple Watch Series 6 - 40mm")
        HumorView(modal: .constant(true))
            .previewDevice("Apple Watch Series 3 - 38mm")
    }
}
