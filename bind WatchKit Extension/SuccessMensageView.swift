//
//  SuccessMensageView.swift
//  bind WatchKit Extension
//
//  Created by Ana Carolina Soares de Melo on 02/06/21.
//

import SwiftUI

struct SuccessMensageView: View {
    var body: some View {
        VStack {
            Text("Sucesso!")
                .multilineTextAlignment(.center)
            Spacer()
            Text("te espero para a próxima")
                .font(.footnote)
                .multilineTextAlignment(.center)
        }
    }
}

struct SuccessMensageView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessMensageView()
            .previewDevice("Apple Watch Series 6 - 44mm")
        SuccessMensageView()
            .previewDevice("Apple Watch Series 6 - 40mm")
        SuccessMensageView()
            .previewDevice("Apple Watch Series 6 - 40mm")
    }
}
