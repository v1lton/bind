//
//  BarChart.swift
//  bind WatchKit Extension
//
//  Created by Juliano Vaz on 03/06/21.
//

import SwiftUI

struct BarChart: View {
    
    var history: FetchedResults<Record>
    
    @State private var touchLocation: CGFloat = -1
    
    @State var data: [ChartData] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            //Geomety Reader
            GeometryReader { geometry in
                VStack {
                    HStack { //celulas (cada barra)
                        if !(data.isEmpty){
                            ForEach(0..<data.count, id: \.self) { i in
                                BarChartCell(value: normalizedValue(index: i), barColor: data[i].cor, symbolType: data[i].image)
                                    .opacity(barIsTouched(index: i) ? 1 : 0.7)
                                    .scaleEffect(barIsTouched(index: i) ? CGSize(width: 1.05, height: 1) : CGSize(width: 1, height: 1), anchor: .bottom)
                                    .animation(.spring())
                                    .padding(.top)
                            }
                        } 
                    }
                }
                .onAppear{
                    
                    data = []
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/MM"
                    
                    let calendar = NSCalendar.current
                    let now = Date()
                    let components = calendar.dateComponents([.year, .month, .day], from: now)
                    
                    guard let startDate = calendar.date(from: components) else {
                        fatalError("*** Unable to create the start date ***")
                    }
                    let array = [-6,-5,-4,-3,-2,-1,0]
                    
                    for i in array {
                        
                        guard let endDate = calendar.date(byAdding: .day, value: i, to: startDate) else {
                            fatalError("*** Unable to create the end date ***")
                        }
                        let stringDate = dateFormatter.string(from: endDate)
                        print(stringDate)
                        
                        let arrayResult = history.filter {
                            return $0.date == stringDate
                        }
                        
                        if arrayResult.isEmpty {
                            let newCharData = ChartData(value: 0.0, image: "-", cor: "roxo")
                            data.append(newCharData)
                            
                        } else {
                            let time = arrayResult.first!.activityRecord?.doubleTime ?? 0.0
                            let image = arrayResult.first!.image ?? "quadrado"
                            let cor = arrayResult.first!.cor ?? "cinza"
                            let newCharData = ChartData(value: time, image: image, cor: cor)
                            data.append(newCharData)
                            
                        }
                        
                        
                    }
                }
            }
            
        }
        .frame(width: WKInterfaceDevice.current().screenBounds.width, height: WKInterfaceDevice.current().screenBounds.height/3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding()
    }
    
    func normalizedValue(index: Int) -> Double {
        //Esta fun????o atribui um valor de 1 ao valor m??ximo em nosso array e, em seguida, obt??m a propor????o de cada valor restante para o nosso m??ximo.  Portanto, em uma matriz de [30, 50, 100, 75, 60], 100 ser?? retornado como 1, enquanto 30 ser?? retornado como 30/100, 50 ser?? retornado como 50/100 e assim por diante.
        var allValues: [Double]    {
            var values = [Double]()
            for data in data {
                values.append(data.value)
            }
            return values
        }
        guard let max = allValues.max() else {
            return 1
        }
        if max != 0 {
            if data[index].value == 0.0 {
                return 0.1
            } else {
                return Double(data[index].value)/Double(max)
            }
        } else {
            return 0.1
        }
    }
    
    func barIsTouched(index: Int) -> Bool {
        touchLocation > CGFloat(index)/CGFloat(data.count) && touchLocation < CGFloat(index+1)/CGFloat(data.count)
    }
    
}


