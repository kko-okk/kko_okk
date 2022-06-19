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
        VStack {
            HStack {
                // MARK: - 각 리스트별 색상 표시와 타이틀
                if nowSubject == "parent" {
                    Circle()
                        .foregroundColor(Color.Kkookk.parentPurple)
                        .frame(width: 8, height: 8, alignment: .center)
                        .padding(.leading, 10)
                    Text("부모님이 지켜요!").font(.Kkookk.tableTitle)
                } else if nowSubject == "child" {
                    Circle()
                        .foregroundColor(Color.Kkookk.childGreen)
                        .frame(width: 8, height: 8, alignment: .center)
                        .padding(.leading, 10)
                    Text("아이가 지켜요!").font(.Kkookk.tableTitle)
                } else {
                    Circle()
                        .foregroundColor(.clear)
                        .frame(width: 8, height: 8, alignment: .center)
                    Text("우리 같이 꼬옥 지켜요!").font(.Kkookk.tableTitle)
                        .padding(.leading, 10)
                }

                Circle()
                    .fill(Color.Kkookk.countBadgeGray)
                    .frame(width: 22, height: 22)
                    .overlay(Text("\(fetchRequest.count)")
                        .font(.Kkookk.tableCountBadge))
                    .padding(.leading, 30)
                Spacer()
                Button {
                    isShowingPopover.toggle()
                } label: {
                    ZStack{  // fingertip, + 도형이 배치되는 곳
                        // nowSubject에 따라 이미지 배치
                        if nowSubject == "parent" {
                            Image("parentFingerprint")
                                    .resizable()
                                    .frame(width: 26, height: 30)
                        } else if nowSubject == "child" {
                            Image("childFingerprint")
                                    .resizable()
                                    .frame(width: 26, height: 30)
                        } else {}

                        // foregroundColor() -> 디자인 대로 흰 색으로 변경
                        Image(systemName: "plus")
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                    }
                    
                }
                .popover(isPresented: $isShowingPopover) {
                    nowSubject == "parent" ?
                    AddPromisePopover(subject: .parent, isPresented: $isShowingPopover) :
                    AddPromisePopover(subject: .child, isPresented: $isShowingPopover)
                }
            }
            .padding([.leading, .trailing], 10)
            .padding(.top, 15)

            Divider()

            // MARK: - 리스트
            ScrollView {
                VStack {
                    ForEach(fetchRequest) { item in
                        ButtonForContract(contract: item, nowSubject: nowSubject)
                    }
                    Spacer()
                }
            }
        }
    }

    init(filter: String, formatter: String) {
        _fetchRequest = FetchRequest<Promise>(sortDescriptors: [SortDescriptor(\.isDone, order: .forward), SortDescriptor(\.madeTime, order: .forward)],
                                              predicate: NSPredicate(format: formatter),
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

struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList(filter: "parent", formatter: "subject == 'parent'")
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
    }
}
