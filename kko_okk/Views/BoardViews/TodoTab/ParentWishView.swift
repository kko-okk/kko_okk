//
//  ParentWishView.swift
//  kko_okk
//
//  Created by Kim, Che-Pill on 2022/05/28.
//

import Foundation
import SwiftUI

struct ParentWishView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var items: FetchedResults<Promise>
    
    var body: some View {
        VStack {
            HStack {
                TextField("부모용", text: .constant(""))
                    .padding(.leading, 10)

                Button(action: addItem) {
//                 Circle()
//                     .fill(Color.gray.opacity(0.4))
//                     .frame(width: 20, height: 20)
//                     .overlay(
//                         Text("1")
//                             .font(.system(size: 10))
//                     )
                
//                 Spacer()
//                     .frame(width: 50, height: 30)

//                 Button(action: {
//                     print("Add button tapped")
//                 }) {
                    Image(systemName: "plus")
                        .frame(width: 30, height: 30)
                }
            }
            .padding(.trailing, 10)

            Divider()

            Spacer()
            // 약속이 안된 것
            FilteredList(filter: "parent", formatter: "promised == FALSE")
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
            promise.subject = "parent"
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
        print(offsets)
        withAnimation {
            for index in offsets {
                let item = items[index]
                viewContext.delete(item)
                break
            }
//            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ParentWishView_Previews: PreviewProvider {
    static var previews: some View {
        ParentWishView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Air (5th generation)")
    }
}
