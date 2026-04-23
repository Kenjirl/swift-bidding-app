//
//  ItemView.swift
//  Bidding App
//
//  Created by I Gusti Ngurah Bagus Ferry Mahayudha on 21/04/26.
//

import SwiftUI
import PhotosUI

struct MyView: View {
    @Binding var items: [BidItemModel]

    var body: some View {
        CommonItemListView(title: "My Items", items: $items)
    }
}

struct AddBidItemSheet: View {
    @Environment(\.dismiss) var dismiss
    @Binding var items: [BidItemModel]
    
    var user = BidItemData.user
    
    @State private var name = ""
    @State private var price = ""
    @State private var description = ""
    @State private var closeDate = Date()
    
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    
    func submitItem() {
        let newPrice = Decimal(string: price) ?? 0
        let newItem = BidItemModel(
            name: name,
            description: description,
            imageUrl: selectedImage,
            bidder: user,
            bidOpenPrice: newPrice,
            bidOpensAt: Date(),
            bidClosesAt: closeDate,
            history: []
        )
        
        items.append(newItem)
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section("Sneaker Details") {
                    TextField("Sneaker Name", text: $name)
                    TextField("Opening Price", text: $price)
                        .keyboardType(.decimalPad)
                    TextField("Sneakers Description:", text: $description)
                }
                
                Section("Timeline") {
                    DatePicker("Bid Closes At", selection: $closeDate)
                }
                
                Section("Add Image") {
                    PhotosPicker(selection: $selectedPhoto, matching: .images) {
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(8)
                        }
                        Label("Pilih Gambar", systemImage: "photo")
                            .padding(.vertical)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .onChange(of: selectedPhoto) {
                        Task {
                            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data) {
                                selectedImage = uiImage
                            }
                        }
                    }
                }            }
            .navigationTitle("New Auction")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .tint(.primary)
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        submitItem()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .disabled(name.isEmpty || price.isEmpty)
                    .tint(.blue)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var items = BidItemData.bidItems
    AddBidItemSheet(items: $items)
}
