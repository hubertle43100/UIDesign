//
//  DateHeaderView.swift
//  Seven
//
//  Created by Hubert Le on 9/11/23.
//

import SwiftUI

struct DateHeaderView: View {
    let dateFormatter = DateFormatter()
    let alternatingColors: [Color] = [Color("Teal"),Color("Brick"),Color("Teal"),Color("Brick"),Color("Brick"),Color("Brick"),Color("Brick")]
    @Binding var selectedDayIndex: Int
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 450, height: 2)  // Adjust the width and height as needed
                .foregroundColor(.white)
            Group {
                Text("Need")
                    .font(.system(size: 32, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 50)
                Text("This Week")
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                GeometryReader { geometry in
                    HStack(spacing: 10) {
                        ForEach(0..<7) { index in
                            VStack {
                                ZStack {
                                    Circle()
                                        .frame(width: 32, height: 32) // Adjust size as needed
                                        .foregroundColor(alternatingColors[index % alternatingColors.count])
                                    Button("\(self.getDate(for: index))") {
                                        dayChoosen(index: index)
                                    }
                                    .foregroundColor(Color("Coal"))
                                    .font(.system(size: 16, weight: .semibold, design: .default))
                                }
                            }
                        }
                    }
                }
            }.offset(x: 35)
        }.frame(width: 450, height: 200)
            .background(Color("Coal"))
    }
    func getDayAbbreviation(for index: Int) -> String {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: Date())
        let adjustedIndex = (index + calendar.component(.weekday, from: startOfDay) - 1) % 7
        let weekdays = calendar.veryShortWeekdaySymbols
        return weekdays[adjustedIndex]
    }
    func getDate(for index: Int) -> String {
        let date = Calendar.current.date(byAdding: .day, value: index, to: Date()) ?? Date()
        dateFormatter.dateFormat = "dd" // Format to get the numeric date (e.g., 01, 02, 03)
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    func dayChoosen(index: Int) {
        selectedDayIndex = index
    }
}
