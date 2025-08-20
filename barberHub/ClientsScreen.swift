import SwiftUI

struct ClientsScreen: View {
    @State private var clients: [Client] = [
        .init(name: "Alex"), .init(name: "Jordan"), .init(name: "Michael"), .init(name: "Ryan"), .init(name: "Tyler")
    ]
    @State private var showingAdd = false
    @State private var expanded: Set<UUID> = []

    var body: some View {
        ZStack {
            AppTheme.background.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(AppTheme.accent.opacity(0.25))
                        .frame(width: 48, height: 48)
                        .overlay(Image(systemName: "person.crop.square").foregroundColor(AppTheme.accent))
                    Text("CLIENTS")
                        .font(.system(size: 36, weight: .black, design: .monospaced))
                        .foregroundColor(AppTheme.accent)
                    Spacer()
                    EditButton().foregroundColor(AppTheme.primaryText)
                }
                .padding(.top, 10)

                List {
                    ForEach(clients) { client in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text(client.name)
                                    .font(.system(size: 28, weight: .bold, design: .monospaced))
                                    .foregroundColor(AppTheme.primaryText)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .rotationEffect(.degrees(expanded.contains(client.id) ? 90 : 0))
                                    .foregroundColor(AppTheme.primaryText.opacity(0.8))
                            }
                            .contentShape(Rectangle())
                            .onTapGesture { toggleExpanded(client) }

                            if expanded.contains(client.id) {
                                VStack(alignment: .leading, spacing: 8) {
                                    if !client.phone.isEmpty {
                                        Text("Phone: \(client.phone)")
                                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                                            .foregroundColor(AppTheme.primaryText)
                                    }
                                    if !client.notes.isEmpty {
                                        Text(client.notes)
                                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                                            .foregroundColor(AppTheme.primaryText)
                                    }
                                    HStack(spacing: 12) {
                                        photoView(title: "Before", image: client.beforePhoto)
                                        photoView(title: "After", image: client.afterPhoto)
                                    }
                                }
                                .padding(10)
                                .background(AppTheme.panel)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                            }
                        }
                        .listRowBackground(AppTheme.background)
                    }
                    .onDelete(perform: deleteClients)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)

                Button(action: { showingAdd = true }, label: {
                    Text("ADD CLIENT").textCase(.uppercase)
                })
                .buttonStyle(RetroPrimaryButton())
            }
            .padding(24)
        }
        .sheet(isPresented: $showingAdd) {
            AddClientScreen { newClient in
                clients.append(newClient)
            }
        }
    }

    private func deleteClients(at offsets: IndexSet) {
        clients.remove(atOffsets: offsets)
    }

    private func toggleExpanded(_ client: Client) {
        if expanded.contains(client.id) { expanded.remove(client.id) } else { expanded.insert(client.id) }
    }

    private func photoView(title: String, image: UIImage?) -> some View {
        VStack(alignment: .center, spacing: 6) {
            ZStack {
                Rectangle().fill(AppTheme.panel).frame(width: 90, height: 90)
                if let ui = image { Image(uiImage: ui).resizable().scaledToFill().frame(width: 90, height: 90).clipped() }
            }
            Text(title)
                .font(.system(size: 12, weight: .bold, design: .monospaced))
                .foregroundColor(AppTheme.primaryText.opacity(0.8))
        }
    }
}

#Preview { ClientsScreen() } 