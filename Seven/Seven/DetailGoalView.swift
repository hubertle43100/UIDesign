//
//  DetailGoalView.swift
//  Seven
//
//  Created by Hubert Le on 8/17/23.
//

import SwiftUI

struct DetailGoalView: View {
    let targetIndices: [Int]
    var stringValue: String
    var arrayValue: [String]
    
    var body: some View {
        // Implement your destination view here, using the passed string and array as needed
        VStack {
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.2))
                .frame(width: 250,height: 6) // Adjust the height of the bar
                .cornerRadius(3) // Adjust the corner radius to make it rounded
                .padding(10)
            Text("\(stringValue)")
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 20)
            
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16)], spacing: 16) {
                    ForEach(Array(arrayValue.enumerated()), id: \.1) { index, data in
                        HStack(alignment: .top, spacing: 8) {
                            Text(data)
                                .font(.body)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(targetIndices[index] == 1 ? Color.green.opacity(0.2) : Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    }
                }
                .padding()
            }.onAppear {
                print("array: \(targetIndices)")
            }
            
            
        }
    }
}

struct DetailGoalView_Previews: PreviewProvider {
    static var previews: some View {
        DetailGoalView(targetIndices: [1,0,0,0,0,1,1],stringValue: "Track spending for the week", arrayValue: ["1: Set up a budget and track spending for the week.", "2: Put $50 into a savings account.", "3: Research ways to reduce monthly expenses.", "4: Make a list of items to purchase with cash only.", "5: Make a list of items to purchase with credit only.", "6: Research ways to increase income.", "7: Make a plan to save 10% of income each month."])
    }
}
