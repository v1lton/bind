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
    @State private var nextView: String? = nil
    
    var body: some View {
        VStack {
            StatusModel(record: $record)

            Spacer()
            
            HStack {
                NavigationLink(destination: RecordingView(audioRecorder: RecordingViewModel()), tag: "toRecord", selection: $nextView) {
                    EmptyView()
                }
                .buttonStyle(PlainButtonStyle())
                NavigationLink(destination:
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
                               tag: "toSuccess", selection: $nextView) {
                    EmptyView()
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    self.nextView = "toRecord"
                }) {
                    Image(systemName:"mic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .font(Font.title.weight(.semibold))
                        .frame(width: 15, height: 15, alignment: .center)
                }
                .foregroundColor(Color("roxo"))
                .background(Color("roxo").opacity(0.14))
                .cornerRadius(25)
                
                Button(action: {
                    self.nextView = "toSuccess"
                }) {
                    Image(systemName:"checkmark")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .font(Font.title.weight(.semibold))
                        .frame(width: 15, height: 15, alignment: .center)
                }
                .foregroundColor(Color("roxo"))
                .background(Color("roxo").opacity(0.14))
                .cornerRadius(25)
            }
        }
    }
}
