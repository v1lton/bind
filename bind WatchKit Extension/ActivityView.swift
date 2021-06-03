//
//  ActivityView.swift
//  bind WatchKit Extension
//
//  Created by Ana Carolina Soares de Melo on 31/05/21.
//

import SwiftUI
import HealthKit

struct ActivityView: View {
    
//    @FetchRequest(entity: Record.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Record.date, ascending: false)], animation: .easeIn) var history : FetchedResults<Record>
//    
//    @Environment(\.managedObjectContext) var context
    
    // Checar validade das variaveis com o que sera recebido
    @Binding var duration: String
    @Binding var bpm: String
    @Binding var calories: String
    // @Binding var iconStatus: String
    // @Binding var iconButton: String
    // @Binding var data: Date
    
    private let healthStore = HKHealthStore()
    
    var body: some View {
        VStack {
            StatusModel(duration: $duration, bpm: $bpm, calories: $calories)
            
            Spacer()
            
            HStack {
                Button(action: {}) {
                    Image(systemName:"mic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .font(Font.title.weight(.semibold))
                        .frame(width: 15, height: 15, alignment: .center)
                }
                .foregroundColor(Color("roxo"))
                .background(Color("roxo").opacity(0.14))
                .cornerRadius(25)
                
                Button(action: {}) {
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
        }.onAppear() {
            healthKitPermission()
        }
    }
    
    func healthKitPermission() {
        let heartRate = HKObjectType.quantityType(forIdentifier: .heartRate)!
        let time = HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!
        let calories = HKObjectType.quantityType(forIdentifier: .dietaryEnergyConsumed)!
        let types = Set([heartRate, time, calories])
        
        healthStore.requestAuthorization(toShare: nil, read: types) {
            (result, error) in
            if let error = error {
                print("Não foi possível requisitar autorização \(error)")
                return
            }
            
            guard result else {
                print("Requisição de dados falhou!)")
                return
            }
            
            getData()
        }
    }
    
    func getData() {
        getHeartRateInfos()
    }
    
    func getHeartRateInfos() {
        guard let heartRate = HKSampleType.quantityType(forIdentifier: .heartRate) else {
            print("Não foi possível obter dados de frequência cardíaca")
            return
        }
        
        let predicate: NSPredicate = HKQuery.predicateForObjects(withMetadataKey: HKMetadataKeyHeartRateMotionContext, allowedValues: [2])
        
        let query = HKStatisticsQuery(quantityType: heartRate, quantitySamplePredicate: predicate, options: .discreteAverage) {(_, statistics, _) in
            guard let stats = statistics else {
                print("Não foi possível calcular média de freq. card.")
                return
            }
            
            let average = stats.averageQuantity()
            let unit = HKUnit(from: "count/min")
            print(average?.doubleValue(for: unit))
//            bpm = average?.doubleValue(for: unit)
        }
        
        healthStore.execute(query)
    }
}


struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xxxx"))
            .previewDevice("Apple Watch Series 5 - 44mm")
        ActivityView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xxxx"))
            .previewDevice("Apple Watch Series 6 - 40mm")
        ActivityView(duration: Binding.constant("xx"), bpm: Binding.constant("xx"), calories: Binding.constant("xxxx"))
            .previewDevice("Apple Watch Series 3 - 38mm")
    }
}
