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
    @FetchRequest(sortDescriptors: [], animation: .default)
    private var fetchRequest: FetchedResults<Promise>
    
    // 부모의 약속인지 아이의 약속인지 구분하기 위한 String. 부모: "parent", 아이: "child"
    private var nowSubject: String = ""
    
    // Popover 띄우고 닫는 용도
    @State private var isShowingPopover: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
    //            Text(nowSubject)
    //            List {
    //                ForEach(fetchRequest) { item in
    //                    PromiseCell(promise: item)
    //                }
    //                .onDelete(perform: deleteItems)
    //            }
    //            // 회색 영역(버튼 추가 영역)에 코더 라운드 추가
    //            .cornerRadius(15)
    //            ButtonForContract(isParent: (nowSubject == "parent") ? true : false)

                // 원래 리스트로 추가되던 부분. + 버튼을 눌러서 임시 약속(wish)을 만들었을 때 버튼(ButtonForContract)이 추가되도록 변경
                // ForEach 문 내에서 fetchRequest가 있는 경우 VStack 내에 ButtonForContract 뷰가 추가되도록 하였음.
                // 이때 nowSubject를 기준으로 버튼의 색상이 변경되어 출력되도록 ButtonForContract() 내에 nowSubject: nowSubject 를 추가함.
                // 이때 nowSubject는 부모의 약속인지 아이의 약속인지 구분하기 위한 String. 부모: "parent", 아이: "child"
                ForEach(fetchRequest) { item in
                    // 조건문은 합의된 계약인지 아닌지에 따라 뷰에 추가해야 한다고 생각했음.
                    // 그래서 item.promised가 true일 때 nowSubject가 contract 인 경우 ContractView에 추가하고
                    // false일 때 ParentWishView와 ChildWishView에 추가하도록 하였음.
                    // 이 조건문은 사실 좀 뭔가 잘못된 듯한 느낌적인 느낌이 있어서 다시 보기는 해야 함. 하지만 오늘은 피곤하니까 잘래!
                    if (item.promised == true) {
                        if (nowSubject == "contract") {
                            ButtonForContract(nowSubject: nowSubject)
                        }
                    } else {
                        if (nowSubject != "contract") {
                            ButtonForContract(nowSubject: nowSubject)
                        }
                    }
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
