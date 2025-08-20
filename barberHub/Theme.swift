import SwiftUI

enum AppTheme {
    static let background = Color(red: 0.07, green: 0.08, blue: 0.07)
    static let panel = Color(red: 0.12, green: 0.13, blue: 0.12)
    static let primaryText = Color(red: 0.87, green: 0.85, blue: 0.74)
    static let accent = Color(red: 0.36, green: 0.54, blue: 0.43)
    static let accentDark = Color(red: 0.22, green: 0.33, blue: 0.27)
    static let warning = Color(red: 0.52, green: 0.15, blue: 0.15)

    static func pixelFont(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        Font.system(size: size, weight: weight, design: .monospaced)
    }
}

struct RetroPrimaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppTheme.pixelFont(size: 22, weight: .bold))
            .foregroundColor(AppTheme.primaryText)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity)
            .background(AppTheme.accent)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(AppTheme.accentDark, lineWidth: 6)
                    .padding(2)
            )
            .opacity(configuration.isPressed ? 0.85 : 1)
    }
}

extension View {
    func retroListRow() -> some View {
        self
            .padding(.vertical, 6)
            .overlay(
                Rectangle()
                    .fill(AppTheme.panel)
                    .frame(height: 1), alignment: .bottom
            )
    }

    func retroCard() -> some View {
        self
            .padding(12)
            .background(AppTheme.panel)
            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black.opacity(0.6), lineWidth: 1))
    }
} 