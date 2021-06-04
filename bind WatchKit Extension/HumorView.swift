//
//  ContentView.swift
//  bind WatchKit Extension
//
//  Created by Wilton Ramos on 28/05/21.
//

import SwiftUI
import HealthKit

struct HumorView: View {
    
    @FetchRequest(entity: Record.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Record.date, ascending: false)], animation: .easeIn) var history : FetchedResults<Record>
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var context
    
    @Binding var modal: Bool
    @State var humor: String = ""
    @State var cor: String = ""
    @State var image: String = ""
    @State var duration: String = "-"
    @State var bpm: String = "-"
    @State var calories: String = "-"
    @State var formattedDate: String = ""
    @State var newRecord = Record()
    
    let date: Date
    let formatter: DateFormatter
    
    @State var activityView: Bool = false
    
    private let healthStore = HKHealthStore()
    
    init(modal: Binding<Bool>) {
        _modal = modal
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
                        healthKitPermission()
//                        addNewRegister()
                    },
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
                
                Button(
                    action: {
                        humor = "normal"
                        cor = "cinza"
                        image = "quadrado"
                        healthKitPermission()
//                        addNewRegister()
                    },
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
                
                
                Button(
                    action: {
                        humor = "pra baixo"
                        cor = "ciano"
                        image = "triangulo"
                        healthKitPermission()

//                        addNewRegister()
                    },
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
            }
            .frame(width: .infinity , height:  .infinity, alignment: .center)
            .padding()
            
        }
        .sheet(isPresented: $activityView, content: {
            ActivityView(record: $newRecord)
        })
        
    }
    
    //MARK: - GET HEALTH DATA
   
    func healthKitPermission() {
        let heartRate = HKObjectType.quantityType(forIdentifier: .heartRate)!
        let time = HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!
        let calories = HKObjectType.quantityType(forIdentifier: .dietaryEnergyConsumed)!
        let types = Set([heartRate, time, calories])

        healthStore.requestAuthorization(toShare: nil, read: types) {(result, error) in
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
        getTime()
        //getCalories
    }

    func getHeartRateInfos() {
        guard let heartRate = HKSampleType.quantityType(forIdentifier: .heartRate) else {
            print("Não foi possível obter dados de frequência cardíaca")
            return
        }

        let calendar = NSCalendar.current
        let now = Date()
        let components = calendar.dateComponents([.year, .month, .day], from: now)

        guard let startDate = calendar.date(from: components) else {
            fatalError("*** Unable to create the start date ***")
        }

        guard let endDate = calendar.date(byAdding: .day, value: 1, to: startDate) else {
            fatalError("*** Unable to create the end date ***")
        }

        let today = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])

        let query = HKStatisticsQuery(quantityType: heartRate, quantitySamplePredicate: today, options: .discreteAverage) {(_, statistics, _) in
            guard let stats = statistics else {
                print("Não foi possível calcular média de freq. card.")
                addNewRegister()
                return
            }

            let average = stats.averageQuantity()
            let unit = HKUnit(from: "count/min")
            print(average?.doubleValue(for: unit) ?? 0.0)

            DispatchQueue.main.async {
                bpm = NSString(format: "%.2f", average?.doubleValue(for: unit) ?? "-") as String
                addNewRegister()
            }
        }

        healthStore.execute(query)
    }
    
    func getTimeInfos() {
        guard let time = HKObjectType.quantityType(forIdentifier: .appleExerciseTime) else {
            print("Não foi possível obter dados de tempo de atividade")
            return
        }

        let calendar = NSCalendar.current
        let now = Date()
        let components = calendar.dateComponents([.year, .month, .day], from: now)

        guard let startDate = calendar.date(from: components) else {
            fatalError("*** Unable to create the start date ***")
        }

        guard let endDate = calendar.date(byAdding: .day, value: 1, to: startDate) else {
            fatalError("*** Unable to create the end date ***")
        }

        let today = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
        
        
//        let query = HKSampleQuery(sampleType: time, predicate: today, limit: Int(HKObjectQueryNoLimit), sortDescriptors: nil) {
//            query, results, error in
//
//            guard let samples = results as? [HKQuantitySample] else {
//                print("Não foi possível obter dados de tempo de atividade")
//                return
//            }
//
//            for sample in samples {
//               print(sample)
//            }
//
//            // The results come back on an anonymous background queue.
//            // Dispatch to the main queue before modifying the UI.
//
//            DispatchQueue.main.async {
//                // Update the UI here.
//            }
//        }
        
        let query = HKStatisticsQuery(quantityType: time, quantitySamplePredicate: today, options: .cumulativeSum) {(_, statistics, _) in
            guard let stats = statistics else {
                print("Não foi possível calcular média de freq. card.")
//                addNewRegister()
                return
            }

            let sum = stats.sumQuantity()
            let unit = HKUnit(from: "min")
            print(sum?.doubleValue(for: unit) ?? 0.0)

//            DispatchQueue.main.async {
//                bpm = NSString(format: "%.2f", average?.doubleValue(for: unit) ?? "-") as String
//                addNewRegister()
//            }
        }
        healthStore.execute(query)
    }
    
    //MARK: - NEW REGISTER
    
    func addNewRegister(){
        formattedDate = formatter.string(from: date)
        
        if history.first?.date == formattedDate {
            
            history.first?.humor = self.humor
            history.first?.cor = self.cor
            history.first?.image = self.image
            
            history.first?.activityRecord?.bpm = self.bpm
            history.first?.activityRecord?.calories = self.calories
            history.first?.activityRecord?.time = self.duration
            
            newRecord = history.first ?? Record()
            print(newRecord)
            
        } else {
            let newRegister = Record(context: context)
            let newActivity = Activity(context: context)
            
            newRegister.date = formatter.string(from: date)
            
            newRegister.humor = self.humor
            newRegister.cor = self.cor
            newRegister.image = self.image
            
            newActivity.bpm = self.bpm
            newActivity.calories = self.calories
            newActivity.time = self.duration
           
            newRegister.activityRecord = newActivity
            
            newRecord = newRegister
            
        }
        
        do {
            try context.save()
            
            print("saved...")
            
        } catch {
            print(error.localizedDescription)
        }
        
        activityView.toggle()
        
//        presentation.wrappedValue.dismiss()
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
