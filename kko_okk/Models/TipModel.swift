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
    var conent: String
}

extension TipModel {
    static var tips: [TipModel] {
        [
            TipModel(id: UUID(), conent: " 약속을 지킨다는건 다른 사람에게 신뢰감을 주는 멋진 일이에요."),
            TipModel(id: UUID(), conent: " 약속을 못 지켰다면, 어떤 부분 때문에 못 지킨건지 되돌아 보는건 어때요?"),
            TipModel(id: UUID(), conent: " 약속은 같이 만드는거에요. 때를 쓰거나 화를 내는건 멋지지 않아요."),
            TipModel(id: UUID(), conent: " 약속을 지키기 어려운 상황이라면 거짓말 보다는 솔직하게 왜 어려운지 말해봐요."),
            TipModel(id: UUID(), conent: " 가끔은 약속한 내용이 아니더라도 서로를 기쁘게 해주는 행동은 해보는건 어떨가요?"),
            TipModel(id: UUID(), conent: " 설마 거짓말로 약속을 지켰다고 하지는 않겠죠..?"),
            TipModel(id: UUID(), conent: " 아이에게 강요한 것은 명령이지 약속이 아니에요. 우리는 약속을 만들고 싶어요."),
            TipModel(id: UUID(), conent: " 우찬아 울어도 돼 사실 산타는 없거든"),
            TipModel(id: UUID(), conent: " 지킬 수 없는 약속 보다는 지킬 수 있는 약속을 바탕으로 만들어봐요."),
            TipModel(id: UUID(), conent: " 약속은 어렵지 않아요. 서로 신뢰와 믿음이 있다면요.")
        ]
    }
}
