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
    static var tips: [TipModel] {
        [
            TipModel(id: UUID(), contents: "약속을 지킨다는건 다른 사람에게 신뢰감을 주는 멋진 일이에요."),
            TipModel(id: UUID(), contents: "약속을 못 지켰다면, 어떤 부분 때문에 못 지킨건지 되돌아 보는건 어때요?"),
            TipModel(id: UUID(), contents: "약속은 같이 만드는거에요. 때를 쓰거나 화를 내는건 멋지지 않아요."),
            TipModel(id: UUID(), contents: "약속을 지키기 어려운 상황이라면 거짓말 보다는 솔직하게 왜 어려운지 말해봐요."),
            TipModel(id: UUID(), contents: "가끔은 약속한 내용이 아니더라도 서로를 기쁘게 해주는 행동은 해보는건 어떨가요?"),
            TipModel(id: UUID(), contents: "설마 거짓말로 약속을 지켰다고 하지는 않겠죠?"),
            TipModel(id: UUID(), contents: "아이에게 강요한 것은 명령이지 약속이 아니에요. 우리는 약속을 만들고 싶어요."),
//            TipModel(id: UUID(), contents: "우찬아 울어도 돼 사실 산타는 없거든"),
            TipModel(id: UUID(), contents: "지킬 수 없는 약속 보다는 지킬 수 있는 약속을 바탕으로 만들어봐요."),
            TipModel(id: UUID(), contents: "약속은 어렵지 않아요. 서로 신뢰와 믿음이 있다면요."),
            TipModel(id: UUID(), contents: "어릴 때의 경험이 나중 발달의 기초가 됩니다. 많은 경험을 하게 해 주세요."),
            TipModel(id: UUID(), contents: "모든 발달에는 단계별로 적절한 과업이 있어요. 시기를 놓치지 않는 것이 중요해요."),
            TipModel(id: UUID(), contents: "피아제(Piaget)에 의하면 아동은 환경과의 상호작용을 통해 능동적으로 인지구조를 구성합니다."),
            TipModel(id: UUID(), contents: "아동은 외부 환경과의 상호작용 속에서 인지 불균형을 경험하고, 이를 통해 인지가 발달합니다."),
            TipModel(id: UUID(), contents: "인지 발달에는 신경계의 성숙이 필요합니다. 무리한 선행학습은 좋지 않아요."),
            TipModel(id: UUID(), contents: "비고츠키(L. Vygotsky)는 언어적 상호작용을 통한 학습을 강조합니다! 대화가 필요해요!"),
            TipModel(id: UUID(), contents: "비고츠키(L. Vygotsky)에 따르면 학습은 유의미한 타인과의 상호작용을 통해 이루어집니다."),
            TipModel(id: UUID(), contents: "비계(Scaffolding)란 학습을 돕기 위해 사용되는 다양한 언어적 수단을 말합니다."),
            TipModel(id: UUID(), contents: "비고츠키(L. Vygotsky)에 따르면 언어의 발달이 인지 발달을 주도적으로 이끕니다."),
            TipModel(id: UUID(), contents: "반복 연습과 숙달은 창의력 신장에 큰 영향을"),
            TipModel(id: UUID(), contents: "메일맨(Meilman)에 따르면 자아정체성이 완성되는 것은 성인이 된 이후입니다."),
            TipModel(id: UUID(), contents: "아이는 자라면서 부모님의 눈치를 보는 단계를 자연히 거칩니다. 걱정하지 마세요."),
            TipModel(id: UUID(), contents: "무엇이 올바른지 아는 것만으로는 부족해요. 올바른 행동이 습관화되어야 합니다."),
            TipModel(id: UUID(), contents: "부모님과 자녀의 인격적 만남은 아동의 정서적 발달에 큰 영향을 미칩니다."),
            TipModel(id: UUID(), contents: "엘킨(D. Elkind)에 의하면 청소년기에는 \"상상적 청중\", 또는 \"개인적 우화\"현상을 경험합니다."),
            TipModel(id: UUID(), contents: "분산지능이론에 따르면 지능이란 주위 환경을 적절히 활용하여 문제를 해결하는 능력입니다."),
            TipModel(id: UUID(), contents: "창의성이란 새로우면서도 사회적으로 가치를 인정받는 산출물을 만들어내는 능력입니다."),
            TipModel(id: UUID(), contents: "창의력과 암기력은 상호 보완적인 능력이에요."),
            TipModel(id: UUID(), contents: "자녀가 의견을 자유롭게 말할 수 있는 분위기는 창의성 발달에 중요한 영향을 미칩니다."),
            TipModel(id: UUID(), contents: "어떤 대상을 보는 즉시 판단하지 않는 습관을 들이는 것이 창의성 발달에 유리해요."),
            TipModel(id: UUID(), contents: "아동은 성인이 아닙니다. 답답하더라도 기다려 주세요!"),
            TipModel(id: UUID(), contents: "습관을 바꾸는 데는 꽤 오랜 시간이 필요합니다. 기다려 주세요!"),
            TipModel(id: UUID(), contents: "위트킨(H. Witkin)에 따르면 사람은 장의존적 또는 장독립적으로 사고합니다. 일장일단이 있지요!"),
            TipModel(id: UUID(), contents: "장의존적 학습자는 이미 구조가 잘 짜여진 자료를 잘 소화합니다. 사회적 민감성이 높죠!"),
            TipModel(id: UUID(), contents: "장독립적 학습자는 비구조화된 자료를 잘 소화합니다. 주관이 뚜렷한 편이죠!"),
            TipModel(id: UUID(), contents: "과제 완수에만 초점을 맞추면 안 돼요. 과정 자체를 즐길 수 있도록 해주세요."),
            TipModel(id: UUID(), contents: "동기는 개체의 선택과 행동의 방향을 제시하고 그 상태를 유지하도록 하는 내적 상태입니다."),
            TipModel(id: UUID(), contents: "가네와 버라이너(Gagne & Berliner)에 따르면 동기는 자동차의 핸들과 엔진에 해당해요."),
            TipModel(id: UUID(), contents: "학습동기는 학습을 통해 후천적으로 형성됩니다."),
            TipModel(id: UUID(), contents: "성취동기는 학습동기와 같이 학습을 통해 후천적으로 형성돼요."),
            TipModel(id: UUID(), contents: "자녀가 어떤 일 자체에 흥미를 갖는다면, 외적 보상을 주지 마세요. 내적 동기가 손상됩니다."),
            TipModel(id: UUID(), contents: "외적 보상은 지금 얼마나 잘 하고 있는지에 대한 정보를 제공하는 것이어야 합니다."),
            TipModel(id: UUID(), contents: "성취동기란 도전적이고 어려운 과제를 성공적으로 수행하려는 욕구를 말해요."),
            TipModel(id: UUID(), contents: "로저스(C. Rogers)에 의하면 모든 사람은 타인으로부터 긍정적 관심이 되어야 합니다!"),
            TipModel(id: UUID(), contents: "실패 경험이 누적되면 학습된 무기력(learned helplessness)을 경험하게 됩니다."),
            TipModel(id: UUID(), contents: "어떤 일에서든 성공 경험을 누적시키는 것이 중요합니다."),
            TipModel(id: UUID(), contents: "사람에게는 자율성(autonomy) 욕구가 있어요. 스스로 선택하고 행동하고 싶어해요."),
            TipModel(id: UUID(), contents: "사람은 다른 사람과의 관계에서 안정성을 느끼고 싶어합니다."),
            TipModel(id: UUID(), contents: "외적 동기에 영향을 받는 단계에서 내적 동기에 영향을 받는 단계로 나아가는 것이 좋아요."),
            TipModel(id: UUID(), contents: "반두라(Bandura)에 의하면 자아효능감이란 자신의 능력에 대한 주관적 판단을 말해요."),
            TipModel(id: UUID(), contents: "반두라(Bandura)에 의하면 자기조절능력은 자신에 대한 관찰, 판단, 결정능력과 관계됩니다."),
            TipModel(id: UUID(), contents: "바움에이스터(R. Baumeister)는 행동의 기준, 동기, 감시, 의지를 자기조절의 요소로 해석합니다."),
            TipModel(id: UUID(), contents: "바움에이스터(R. Baumeister)에 따르면 자기조절은 생성, 평가, 학습의 단계를 거칩니다."),
            TipModel(id: UUID(), contents: "어떤 학습에서 불안을 느끼는 현상을 학습불안이라고 해요."),
            TipModel(id: UUID(), contents: "자녀가 스스로 어떤 과제를 성공적으로 마칠 수 있도록 도와주세요!"),
            TipModel(id: UUID(), contents: "칭찬이나 보상은 저학년 아동에게서, 벌이나 힐책, 조롱의 효과는 고학년 아동에게서 현저히 나타납니다."),
            TipModel(id: UUID(), contents: "칭찬을 할 때는 무엇을 얼마나, 어떻게 잘 하는지 알려주는 것이 좋습니다!"),
            TipModel(id: UUID(), contents: "경쟁은 나쁜 것이 아닙니다! 하지만 지나친 경쟁은 이기적인 아동을 만들 수 있죠."),
            TipModel(id: UUID(), contents: "답이 완전히 주어지지 않은 문제를 제시하고, 스스로 문제를 완전히 해결하도록 유도해 보세요!"),
            TipModel(id: UUID(), contents: "상대방을 믿어준다면 자성예언효과가 상대방을 변화시킬 거에요!"),
            TipModel(id: UUID(), contents: "칙센트미하이(M. Csikszentmihalyi)에 따르면 사람은 잠재능력을 최대한 발휘한다고 느낄 때 몰입(flow)합니다."),
            TipModel(id: UUID(), contents: "근거 없는 기대를 갖지 않도록 주의하시는 것이 좋아요!"),
            TipModel(id: UUID(), contents: "대화를 할 때는 대화의 방법과 의도, 상황에 주의하셔야 합니다."),
            TipModel(id: UUID(), contents: "상대방에게 관심을 가져 주세요. 호손 효과가 그 사람이 더 능력을 발휘하도록 도울 거에요.")
        ]
    }
}
