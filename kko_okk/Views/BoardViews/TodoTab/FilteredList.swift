//
//  FilteredList.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/03.
//

// filteredList를 가져다 써주세요.
import SwiftUI

struct FilteredList: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [], animation: .default)
    private var fetchRequest: FetchedResults<Promise>
    private var nowSubject: String = ""
    var body: some View {
        VStack {
            Text(nowSubject)
            List {
                ForEach(fetchRequest) { item in
                    HStack {
                        Text(item.name ?? "Unknown")
                        
                        Spacer()
                        
                        Image(systemName: "ellipsis")
                    }
                }
                .onDelete(perform: deleteItems)
            }
        }
    }
    
    init(filter: String, formatter: String) {
        _fetchRequest = FetchRequest<Promise>(sortDescriptors: [], predicate: NSPredicate(format: formatter))
        nowSubject = filter
    }
    
    private func deleteItems(offsets: IndexSet) {
        print(offsets)
        withAnimation {
            offsets.map { fetchRequest[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
