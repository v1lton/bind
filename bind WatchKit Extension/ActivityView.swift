//
//  ActivityView.swift
//  bind WatchKit Extension
//
//  Created by Ana Carolina Soares de Melo on 31/05/21.
//

import SwiftUI
import HealthKit

struct ActivityView: View {
    
    // Checar validade das variaveis com o que sera recebido
    @Binding var record: Record
    
    var body: some View {
        VStack {
            StatusModel(record: $record)

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
                                ZStack {
                                    Image(systemName: "house.circle.fill")
                                        .resizable()
                                        .foregroundColor(Color("roxo"))
                                    
                                    Button(
                                    action: {
                                    NotificationCenter.default.post(name: Notification.Name("successToInicialView"), object: nil)
                                    },
                                    label: {
                                    Text("     ")
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color("roxo"))
                                    })
                                }
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
