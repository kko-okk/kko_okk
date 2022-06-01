//
//  ChildWishView.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/28.
//

import Foundation
import SwiftUI

struct ChildWishView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var items: FetchedResults<Promise>
    
    var body: some View {
        VStack {
            HStack {
                TextField("아이용", text: .constant(""))
                    .padding(.leading, 10)
                
                Button(action: addItem) {
                    Image(systemName: "plus")
                        .frame(width: 30, height: 30)
                }
            }
            .padding(.trailing, 10)

            Divider()
            Spacer()
            NavigationView {
                List {
                    ForEach(items.filter{$0.subject == "child"}) { item in
                        Text(item.name ?? "Unknown")
                    }
                    .onDelete(perform: deleteItems)
                }
            }
        }
    }
    private func addItem() {
        withAnimation {
            let promise = Promise(context: viewContext)
            promise.id = UUID()
            promise.name = "약속"
            promise.memo = "약속을 만들었다"
            promise.madeTime = Date()
            promise.promised = false
            promise.parentCheck = false
            promise.childCheck = false
            promise.isDone = false
            promise.isRepeat = false
            promise.subject = "child"
            promise.repeatType = ""

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ChildWishView_Previews: PreviewProvider {
    static var previews: some View {
        ChildWishView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Air (5th generation)")
    }
}
