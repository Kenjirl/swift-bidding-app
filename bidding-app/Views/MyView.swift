//
//  ItemView.swift
//  Bidding App
//
//  Created by I Gusti Ngurah Bagus Ferry Mahayudha on 21/04/26.
//

import SwiftUI
import Charts

struct MyView: View {
    
    @State private var store = MockData()
    @State private var searchText = ""
    @State private var sortOrder: SortType = .alphabetical_asc
    @State private var isShowingAddSheet = false
    
    enum SortType {
        case alphabetical_asc, alphabetical_desc,
             price_asc, price_desc
    }

    // Computed property to handle both Searching and Sorting
    var filteredItems: [BidItemModel] {
        var items = store.allItems
        
        // Handle Search
        if !searchText.isEmpty {
            items = items.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
        
        // Handle Sort
        switch sortOrder {
            
            case .alphabetical_asc:
                return items.sorted { $0.name < $1.name }
            
            case .alphabetical_desc:
                return items.sorted { $0.name > $1.name }
            
            case .price_asc:
                // Sorting by the last bid price, falling back to open price
                return items.sorted {
                    ($0.history.last?.price ?? $0.bidOpenPrice) < ($1.history.last?.price ?? $1.bidOpenPrice)
            }
            
            case .price_desc:
                // Sorting by the last bid price, falling back to open price
                return items.sorted {
                    ($0.history.last?.price ?? $0.bidOpenPrice) > ($1.history.last?.price ?? $1.bidOpenPrice)
            }
        }
    }
    
    // MARK: Special section for toolbar
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                Color.white.ignoresSafeArea()
                
                // Use the filteredItems instead of store.allItems
                List(filteredItems) { item in
                    rowView(for: item)
                }
                .listStyle(.plain)
                .navigationTitle("Sneakers")
            }
            .navigationTitle("My Items")
            // 1. Search Tool
            .searchable(text: $searchText, prompt: "Search sneakers")
            // 2. Toolbar Menu
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Menu {
                        
                        Section ("Alphabet Sorting") {
                            
                            Button(action: { sortOrder = .alphabetical_asc }) {
                                Label("By Alphabet (A-Z)", systemImage: "textformat")
                            }
                            
                            Button(action: { sortOrder = .alphabetical_desc }) {
                                Label("By Alphabet (Z-A)", systemImage: "textformat")
                            }
                            
                        }
                        
                        Section ("Price Sorting") {
                            
                            Button(action: { sortOrder = .price_asc }) {
                                Label("By Lowest to Highest", systemImage: "dollarsign.circle")
                            }
                            
                            Button(action: { sortOrder = .price_desc }) {
                                Label("By Highest to Lowest", systemImage: "dollarsign.circle")
                            }
                            
                        }
                        
                        
                    }
                    label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        isShowingAddSheet = true
                    }
                    label: {
                        Image(systemName: "plus")
                    }
                    
                }
                
            }
            .sheet(isPresented: $isShowingAddSheet) {
                AddBidItemSheet(store: store)
            }
            
        }
        
    }
    
    // MARK: Here is the section where we can customize the content
    // MARK: Extracted row view to keep the body clean
    @ViewBuilder
    func rowView(for item: BidItemModel) -> some View {
        
        let chartData_2 = prepareChartData(for: item)
        let dateString = item.bidClosesAt.formatted(date: .long, time: .omitted)
        
        NavigationStack {
            
            NavigationLink {
                BidItemDetailView(item: item)
            }
            label: {
                
                VStack(alignment: .leading) {
                    
                    if (chartData_2.last?.count ?? 0) > 2 {
                        Text("ON TRENDS!")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                    }
                    
                    HStack {
                        
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.gray.opacity(0.1))
                            .frame(width: 50, height: 50)
                            .overlay(Text("👟"))
                        
                        Text(item.name)
                            .font(.headline)
                        
                        Spacer()
                        
                        Chart(chartData_2) { data in
                            
                            AreaMark(
                                x: .value("Day", data.date, unit: .day),
                                y: .value("Count", data.count)
                            )
                            .foregroundStyle(.blue.opacity(0.1))
                            .interpolationMethod(.catmullRom)
                            
                            LineMark(
                                x: .value("Day", data.date, unit: .day),
                                y: .value("Count", data.count)
                            )
                            .foregroundStyle(.blue)
                            .interpolationMethod(.catmullRom)
                            
                        }
                        .frame(width: 80, height: 40)
                        .chartXAxis(.hidden)
                        .chartYAxis(.hidden)
                        
                        Text(item.history.last?.price.toCompactString() ?? item.bidOpenPrice.toCompactString())
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        
                    }
                    
                    Text("Ends: \(dateString)")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
                
            }
            
            
        }
        
    }
    
    // MARK: To prepare the chart data
    private func prepareChartData(for item: BidItemModel) -> [ChartData] {
        
        // 1. Group the existing history as you did before
        let grouped = Dictionary(grouping: item.history) {
            Calendar.current.startOfDay(for: $0.createdAt)
        }
        
        // 2. Find the start and end dates of your history
        // If no history, return empty
        guard let firstDate = item.history.map({ $0.createdAt }).min(),
              let lastDate = item.history.map({ $0.createdAt }).max() else {
            return []
        }
        
        let start = Calendar.current.startOfDay(for: firstDate)
        let end = Calendar.current.startOfDay(for: lastDate)
        
        var allDays: [ChartData] = []
        var currentDay = start
        
        // 3. Loop through every day from start to end
        while currentDay <= end {
            // If we have data for this day, use the count. Otherwise, use 0.
            let count = grouped[currentDay]?.count ?? 0
            allDays.append(ChartData(date: currentDay, count: count))
            
            // Advance to the next day
            if let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: currentDay) {
                currentDay = nextDay
            } else {
                break
            }
        }
        
        return allDays
    }

}

struct AddBidItemSheet: View {
    @Environment(\.dismiss) var dismiss
    var store: MockData // Reference to the shared store
    
    @State private var name = ""
    @State private var price = ""
    @State private var description = ""
    @State private var closeDate = Date()
    
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
                    DatePicker("Bid Closes At", selection: $closeDate, displayedComponents: .date)
                }
                
                Button("Add Item") {
                    let newPrice = Decimal(string: price) ?? 0
                    let newItem = BidItemModel(
                        name: name,
                        description: description,
                        imageUrl: "shoes",
                        bidOpenPrice: newPrice,
                        bidOpensAt: Date(),
                        bidClosesAt: closeDate,
                        history: [
                            BidHistoryModel(name: "SneakerHead_Budi",   price: 2_650_000,  createdAt: .daysAgo(7, hour: 9,  minute: 15)),
                            BidHistoryModel(name: "KickCollector_Andi", price: 2_900_000,  createdAt: .daysAgo(7, hour: 14, minute: 42)),
                            BidHistoryModel(name: "RareFinds_Dewi",     price: 3_050_000,  createdAt: .daysAgo(6, hour: 8,  minute: 5)),
                            BidHistoryModel(name: "SneakerHead_Budi",   price: 3_400_000,  createdAt: .daysAgo(6, hour: 20, minute: 30)),
                            BidHistoryModel(name: "HypeKick_Fajar",     price: 3_550_000,  createdAt: .daysAgo(5, hour: 11, minute: 18)),
                            BidHistoryModel(name: "KickCollector_Andi", price: 3_800_000,  createdAt: .daysAgo(5, hour: 23, minute: 55)),
                            BidHistoryModel(name: "SneakerVault_Tono",  price: 3_950_000,  createdAt: .daysAgo(4, hour: 7,  minute: 40)),
                            BidHistoryModel(name: "RareFinds_Dewi",     price: 4_300_000,  createdAt: .daysAgo(4, hour: 16, minute: 22)),
                            BidHistoryModel(name: "SneakerHead_Budi",   price: 4_450_000,  createdAt: .daysAgo(3, hour: 10, minute: 5)),
                            BidHistoryModel(name: "HypeKick_Fajar",     price: 4_750_000,  createdAt: .daysAgo(3, hour: 19, minute: 48)),
                            BidHistoryModel(name: "KickCollector_Andi", price: 4_900_000,  createdAt: .daysAgo(2, hour: 8,  minute: 33)),
                            BidHistoryModel(name: "YeezyFan_Riko",      price: 5_200_000,  createdAt: .daysAgo(2, hour: 15, minute: 10)),
                            BidHistoryModel(name: "SneakerVault_Tono",  price: 5_250_000,  createdAt: .daysAgo(1, hour: 9,  minute: 27)),
                            BidHistoryModel(name: "RareFinds_Dewi",     price: 5_600_000,  createdAt: .daysAgo(1, hour: 18, minute: 3)),
                            BidHistoryModel(name: "SneakerHead_Budi",   price: 5_750_000,  createdAt: .daysAgo(0, hour: 7,  minute: 44)),
                        ]
                    )
                    
                    // This updates the shared @Observable store
                    store.allItems.append(newItem)
                    dismiss()
                }
                .disabled(name.isEmpty || price.isEmpty)
                
            }
            .navigationTitle("New Auction")
            .toolbar {
                Button("Cancel") { dismiss() }
            }
        }
    }
}

#Preview {
    MyView()
}
