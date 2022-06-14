//
//  FilteredList.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/03.
//

// filteredList를 가져다 써주세요.
import SwiftUI

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
            VStack {
                ForEach(fetchRequest) { item in
                    ButtonForContract(contract: item, nowSubject: nowSubject)
                }
                Spacer()
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

struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList(filter: "parent", formatter: "subject == 'parent'")
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
    }
}
