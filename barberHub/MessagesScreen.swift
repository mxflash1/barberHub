import SwiftUI

struct MessagesScreen: View {
    struct Message: Identifiable {
        let id = UUID()
        let sender: String
        let time: String
        let text: String
    }

    private let messages: [Message] = [
        .init(sender: "Diego Ramirez", time: "9:02 AM", text: "Running late 5 min, on my way."),
        .init(sender: "Eric Wong", time: "9:05 AM", text: "Can we move to 12:00?")
    ]

    var body: some View {
        ZStack {
            AppTheme.background.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 16) {
                Text("Messages")
                    .font(.system(size: 44, weight: .black, design: .monospaced))
                    .foregroundColor(AppTheme.primaryText)
                    .padding(.top, 6)

                Text("Tuesday, April 16")
                    .font(.system(size: 24, weight: .bold, design: .monospaced))
                    .foregroundColor(AppTheme.accent)

                VStack(spacing: 12) {
                    ForEach(messages) { msg in
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text(msg.sender)
                                    .font(.system(size: 22, weight: .bold, design: .monospaced))
                                    .foregroundColor(AppTheme.accent)
                                Spacer()
                                Text(msg.time)
                                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                                    .foregroundColor(AppTheme.primaryText.opacity(0.8))
                            }
                            Text(msg.text)
                                .font(.system(size: 22, weight: .bold, design: .monospaced))
                                .foregroundColor(AppTheme.primaryText)
                        }
                        .retroCard()
                    }
                }

                Spacer()

                HStack {
                    Text("Type a message…")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                        .foregroundColor(AppTheme.primaryText.opacity(0.6))
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(AppTheme.panel, lineWidth: 1))

                    Image(systemName: "paperplane.fill")
                        .foregroundColor(AppTheme.primaryText)
                        .padding(10)
                        .background(AppTheme.panel)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
            }
            .padding(24)
        }
    }
}

#Preview {
    MessagesScreen()
} 