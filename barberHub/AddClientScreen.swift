import SwiftUI
import PhotosUI

struct AddClientScreen: View {
    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var notes: String = ""

    @State private var beforeSelection: PhotosPickerItem?
    @State private var afterSelection: PhotosPickerItem?

    @State private var beforeImage: UIImage?
    @State private var afterImage: UIImage?

    let onSave: (Client) -> Void

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Group {
                        TextField("Name", text: $name)
                            .textFieldStyle(.roundedBorder)
                        TextField("Phone", text: $phone)
                            .textFieldStyle(.roundedBorder)
                        TextField("Notes", text: $notes, axis: .vertical)
                            .textFieldStyle(.roundedBorder)
                    }

                    HStack(spacing: 16) {
                        VStack {
                            ZStack {
                                Rectangle().fill(AppTheme.panel).frame(width: 140, height: 140)
                                if let img = beforeImage { Image(uiImage: img).resizable().scaledToFill().frame(width: 140, height: 140).clipped() }
                                Text("Before").foregroundColor(AppTheme.primaryText).opacity(beforeImage == nil ? 0.8 : 0)
                            }
                            PhotosPicker(selection: $beforeSelection, matching: .images) {
                                Text("Pick Before")
                                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                                    .foregroundColor(AppTheme.accent)
                            }
                        }
                        VStack {
                            ZStack {
                                Rectangle().fill(AppTheme.panel).frame(width: 140, height: 140)
                                if let img = afterImage { Image(uiImage: img).resizable().scaledToFill().frame(width: 140, height: 140).clipped() }
                                Text("After").foregroundColor(AppTheme.primaryText).opacity(afterImage == nil ? 0.8 : 0)
                            }
                            PhotosPicker(selection: $afterSelection, matching: .images) {
                                Text("Pick After")
                                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                                    .foregroundColor(AppTheme.accent)
                            }
                        }
                    }

                    Button(action: saveClient) {
                        Text("Save Client").textCase(.uppercase)
                    }
                    .buttonStyle(RetroPrimaryButton())
                    .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding(16)
            }
            .background(AppTheme.background)
            .navigationTitle("Add Client")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
        .task(id: beforeSelection) {
            if let img = await loadImage(from: beforeSelection) { beforeImage = img }
        }
        .task(id: afterSelection) {
            if let img = await loadImage(from: afterSelection) { afterImage = img }
        }
    }

    private func saveClient() {
        var client = Client(name: name, phone: phone, notes: notes)
        client.beforePhoto = beforeImage
        client.afterPhoto = afterImage
        onSave(client)
        dismiss()
    }

    private func loadImage(from item: PhotosPickerItem?) async -> UIImage? {
        guard let item else { return nil }
        if let data = try? await item.loadTransferable(type: Data.self), let image = UIImage(data: data) {
            return image
        }
        return nil
    }
}

#Preview {
    AddClientScreen { _ in }
} 