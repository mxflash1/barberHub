import SwiftUI

struct CalendarScreen: View {
    private let daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"]
    private let days = Array(1...30)
    private let selectedDay = 16

    var body: some View {
        ZStack {
            AppTheme.background.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Calendar")
                        .font(.system(size: 44, weight: .black, design: .monospaced))
                        .foregroundColor(AppTheme.primaryText)
                        .padding(.top, 6)

                    Text("April 2024")
                        .font(.system(size: 24, weight: .bold, design: .monospaced))
                        .foregroundColor(AppTheme.accent)

                    HStack {
                        ForEach(daysOfWeek, id: \.self) { d in
                            Text(d)
                                .font(.system(size: 18, weight: .bold, design: .monospaced))
                                .foregroundColor(AppTheme.primaryText)
                                .frame(maxWidth: .infinity)
                        }
                    }

                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 7), spacing: 0) {
                        ForEach(days, id: \.self) { day in
                            ZStack {
                                Rectangle().stroke(AppTheme.panel, lineWidth: 1).frame(height: 44)
                                if day == selectedDay {
                                    Rectangle().fill(AppTheme.warning).frame(height: 44).opacity(0.6)
                                }
                                Text("\(day)")
                                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                                    .foregroundColor(AppTheme.primaryText)
                            }
                        }
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Tuesday, April 16")
                            .font(.system(size: 26, weight: .bold, design: .monospaced))
                            .foregroundColor(AppTheme.primaryText)
                        Text("9:00 AM  Diego Ramirez")
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                            .foregroundColor(AppTheme.primaryText)
                        Text("11:30 AM  Eric Wong")
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                            .foregroundColor(AppTheme.primaryText)
                    }
                    .padding(.top, 10)
                }
                .padding(24)
            }
        }
    }
}

#Preview {
    CalendarScreen()
} 