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
            TipModel(id: UUID(), conent: "Tip1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tristique sem a ullamcorper cursus."),
            TipModel(id: UUID(), conent: "Tip2 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tristique sem a ullamcorper cursus."),
            TipModel(id: UUID(), conent: "Tip3 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tristique sem a ullamcorper cursus."),
            TipModel(id: UUID(), conent: "Tip4 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tristique sem a ullamcorper cursus."),
            TipModel(id: UUID(), conent: "Tip5 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tristique sem a ullamcorper cursus."),
            TipModel(id: UUID(), conent: "Tip6 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tristique sem a ullamcorper cursus."),
            TipModel(id: UUID(), conent: "Tip7 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tristique sem a ullamcorper cursus."),
            TipModel(id: UUID(), conent: "Tip8 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tristique sem a ullamcorper cursus."),
            TipModel(id: UUID(), conent: "Tip9 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tristique sem a ullamcorper cursus."),
            TipModel(id: UUID(), conent: "Tip10 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tristique sem a ullamcorper cursus.")
        ]
    }
}
