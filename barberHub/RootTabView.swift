import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            CalendarScreen()
                .tabItem { Label("Calendar", systemImage: "calendar") }
            ClientsScreen()
                .tabItem { Label("Clients", systemImage: "person.3") }
            MessagesScreen()
                .tabItem { Label("Messages", systemImage: "bubble.left.and.bubble.right") }
        }
        .tint(AppTheme.accent)
    }
}

#Preview {
    RootTabView()
} 
