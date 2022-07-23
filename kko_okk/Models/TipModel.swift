//
//  TipModel.swift
//  kko_okk
//
//  Created by Geunil Park on 2022/06/01.
//
//
import Foundation

struct TipModel: Identifiable {
    var id: UUID
    var contents: String
}

extension TipModel {
    /*
        TODO: 팁 내용이 너무 긴 건 삭제 필요
        로컬라이징 파일에서 수정하고나면 여기서도 제거해야 해서
        쉽게 확인하려고 10개 단위로 줄바꿈 해놨습니다.
        완료하면 제가 직접 삭제 하겠습니다.
        - RUYHA
    */

    static var tips: [TipModel] {
        [
            TipModel(id: UUID(), contents: "Tip1".localized),
            TipModel(id: UUID(), contents: "Tip2".localized),
            TipModel(id: UUID(), contents: "Tip3".localized),
            TipModel(id: UUID(), contents: "Tip4".localized),
            TipModel(id: UUID(), contents: "Tip5".localized),
            TipModel(id: UUID(), contents: "Tip6".localized),
            TipModel(id: UUID(), contents: "Tip7".localized),
            TipModel(id: UUID(), contents: "Tip8".localized),
            TipModel(id: UUID(), contents: "Tip9".localized),
            TipModel(id: UUID(), contents: "Tip10".localized),

            TipModel(id: UUID(), contents: "Tip11".localized),
            TipModel(id: UUID(), contents: "Tip12".localized),
            TipModel(id: UUID(), contents: "Tip13".localized),
            TipModel(id: UUID(), contents: "Tip14".localized),
            TipModel(id: UUID(), contents: "Tip15".localized),
            TipModel(id: UUID(), contents: "Tip16".localized),
            TipModel(id: UUID(), contents: "Tip17".localized),
            TipModel(id: UUID(), contents: "Tip18".localized),
            TipModel(id: UUID(), contents: "Tip19".localized),
            TipModel(id: UUID(), contents: "Tip20".localized),

//            TipModel(id: UUID(), contents: "Tip21".localized),
//            TipModel(id: UUID(), contents: "Tip22".localized),
//            TipModel(id: UUID(), contents: "Tip23".localized),
//            TipModel(id: UUID(), contents: "Tip24".localized),
//            TipModel(id: UUID(), contents: "Tip25".localized),
//            TipModel(id: UUID(), contents: "Tip26".localized),
//            TipModel(id: UUID(), contents: "Tip27".localized),
//            TipModel(id: UUID(), contents: "Tip28".localized),
//            TipModel(id: UUID(), contents: "Tip29".localized),
//            TipModel(id: UUID(), contents: "Tip30".localized),
//
//            TipModel(id: UUID(), contents: "Tip31".localized),
//            TipModel(id: UUID(), contents: "Tip32".localized),
//            TipModel(id: UUID(), contents: "Tip33".localized),
//            TipModel(id: UUID(), contents: "Tip34".localized),
//            TipModel(id: UUID(), contents: "Tip35".localized),
//            TipModel(id: UUID(), contents: "Tip36".localized),
//            TipModel(id: UUID(), contents: "Tip37".localized),
//            TipModel(id: UUID(), contents: "Tip38".localized),
//            TipModel(id: UUID(), contents: "Tip39".localized),
//            TipModel(id: UUID(), contents: "Tip40".localized),
//
//            TipModel(id: UUID(), contents: "Tip41".localized),
//            TipModel(id: UUID(), contents: "Tip42".localized),
//            TipModel(id: UUID(), contents: "Tip43".localized),
//            TipModel(id: UUID(), contents: "Tip44".localized),
//            TipModel(id: UUID(), contents: "Tip45".localized),
//            TipModel(id: UUID(), contents: "Tip46".localized),
//            TipModel(id: UUID(), contents: "Tip47".localized),
//            TipModel(id: UUID(), contents: "Tip48".localized),
//            TipModel(id: UUID(), contents: "Tip49".localized),
//            TipModel(id: UUID(), contents: "Tip50".localized),
//
//            TipModel(id: UUID(), contents: "Tip51".localized),
//            TipModel(id: UUID(), contents: "Tip52".localized),
//            TipModel(id: UUID(), contents: "Tip53".localized),
//            TipModel(id: UUID(), contents: "Tip54".localized),
//            TipModel(id: UUID(), contents: "Tip55".localized),
//            TipModel(id: UUID(), contents: "Tip56".localized),
//            TipModel(id: UUID(), contents: "Tip57".localized),
//            TipModel(id: UUID(), contents: "Tip58".localized),
//            TipModel(id: UUID(), contents: "Tip59".localized),
//            TipModel(id: UUID(), contents: "Tip60".localized),
//
//            TipModel(id: UUID(), contents: "Tip61".localized),
//            TipModel(id: UUID(), contents: "Tip62".localized),
//            TipModel(id: UUID(), contents: "Tip63".localized),
        ]
    }
}
