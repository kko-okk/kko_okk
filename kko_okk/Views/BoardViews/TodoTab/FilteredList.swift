//
//  FilteredList.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/03.
//

// filteredList를 가져다 써주세요.
import SwiftUI
extension Date {
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
}
struct FilteredList: View {
    // CoreData 사용을 위해 viewContext 받아오기
    @Environment(\.managedObjectContext) private var viewContext
    
    // CoreData에 저장된 Promise 값 불러오기
    @FetchRequest(sortDescriptors: [], animation: .default)  // 리스트 추가시 정렬 조건이 추가되는 부분: sortDescriptors: []
    private var fetchRequest: FetchedResults<Promise>
    
    // 부모의 약속인지 아이의 약속인지 구분하기 위한 String. 부모: "parent", 아이: "child"
    private var nowSubject: String = ""
    
    // Popover 띄우고 닫는 용도
    @State private var isShowingPopover: Bool = false
    
    var body: some View {
        ScrollView {
            Text("\(String(fetchRequest.count))") 
            VStack {
                ForEach(fetchRequest) { item in
                    ButtonForContract(contract: item, nowSubject: nowSubject)
                }
                Spacer()
            }
        }
    }
    
    init(filter: String, formatter: String, startDate: Date) {
        _fetchRequest = FetchRequest<Promise>(sortDescriptors: [SortDescriptor(\.isDone, order: .forward), SortDescriptor(\.madeTime, order: .forward)],
                                              predicate: NSPredicate(format: formatter, Calendar.current.startOfDay(for: startDate) as CVarArg, Calendar.current.startOfDay(for: startDate).dayAfter as CVarArg),
                                              animation: .default)
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

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList(filter: "parent", formatter: "subject == 'parent'")
//            .previewInterfaceOrientation(.landscapeLeft)
//            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
//    }
//}
