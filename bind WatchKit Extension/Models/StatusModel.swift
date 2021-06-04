//
//  StatusView.swift
//  bind WatchKit Extension
//
//  Created by Ana Carolina Soares de Melo on 01/06/21.
//

import SwiftUI

struct StatusModel: View {
    @Binding var record: Record
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(record.activityRecord?.time ?? "-")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                Text("mins de \natividade")
                    .font(.footnote)
                    .frame(width: 75, height: 40, alignment: .leading)
            }
            .padding(.leading, 5)
            
            Spacer()
          
            Image(record.image ?? "quadrado")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40, alignment: .center)
                .padding(.trailing, 10)
                .padding(.top, 10)
        }
        
        VStack(alignment: .leading) {
            Text(record.activityRecord?.bpm ?? "-")
                .font(.body)
                .fontWeight(.semibold)
            Text("bpm")
                .font(.footnote)
        }
        .padding(.leading, 5)
        .padding(.bottom, 5)
//        HStack {
//            VStack(alignment: .leading) {
//                Text(record.activityRecord?.bpm ?? "-")
//                    .font(.body)
//                    .fontWeight(.semibold)
//                Text("bpm")
//                    .font(.footnote)
//            }
//
//            Spacer()
//
//            VStack(alignment: .leading) {
//                Text(record.activityRecord?.calories ?? "-")
//                    .font(.body)
//                    .fontWeight(.semibold)
//                Text("cal")
//                    .font(.footnote)
//            }
//
//        }.padding()
    }
}

//struct StatusView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatusModel(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xxxx"))
//    }
//}
