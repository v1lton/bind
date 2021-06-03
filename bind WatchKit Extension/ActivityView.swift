//
//  ActivityView.swift
//  bind WatchKit Extension
//
//  Created by Ana Carolina Soares de Melo on 31/05/21.
//

import SwiftUI

struct ActivityView: View {
    
    // Checar validade das variaveis com o que sera recebido
    @Binding var duration: String
    @Binding var bpm: String
    @Binding var calories: String

    var body: some View {
        VStack {
            
            StatusModel(duration: $duration, bpm: $bpm, calories: $calories) //adicionar variável para icone do humor
            
            Spacer()
            
            HStack {
                NavigationLink(
                    destination: RecordingView(audioRecorder: RecordingViewModel()),
                    label: {
                        Image(systemName:"mic")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .font(Font.title.weight(.semibold))
                            .frame(width: 15, height: 15, alignment: .center)
                    })
                    .frame(width: 80, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("roxo"))
                    .background(Color("roxo").opacity(0.14))
                    .cornerRadius(25)
                    .buttonStyle(PlainButtonStyle())
                


                
                NavigationLink(
                    destination:
                        SuccessMessageView()
                        .navigationBarBackButtonHidden(true)
                        .toolbar(content: {
                            ToolbarItem(placement: .cancellationAction) {
                                Button(
                                    action: {
                                        NotificationCenter.default.post(name: Notification.Name("successToInicialView"), object: nil)
                                    },
                                    label: {
                                        Text("Início")
                                            .foregroundColor(Color("AccentColor"))
                                    })
                            }
                        }),
                    label: {
                        Image(systemName:"checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .font(Font.title.weight(.semibold))
                            .frame(width: 15, height: 15, alignment: .center)
                    })
                    .frame(width: 80, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("roxo"))
                    .background(Color("roxo").opacity(0.14))
                    .cornerRadius(25)
                    .buttonStyle(PlainButtonStyle())
            }
        }
    }
}


//struct ActivityView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xxxx"), modalHumorToActivy: .constant(true))
//            .previewDevice("Apple Watch Series 5 - 44mm")
//        ActivityView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xxxx"), modalHumorToActivy: .constant(true))
//            .previewDevice("Apple Watch Series 6 - 40mm")
//        ActivityView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xxxx"), modalHumorToActivy: .constant(true))
//            .previewDevice("Apple Watch Series 3 - 38mm")
//    }
//}
