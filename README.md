# 꼬옥 (kko_okk)
### 우리 가족, 약속을 꼬옥 지켜요!
![kkook](https://user-images.githubusercontent.com/77262576/202895999-ae3246fb-6604-4404-9b75-15a79f8a2d3c.png)


Apple Developer Academy MC2: 꼬옥(kko_okk) (Afternoon Session Team16)


<br>

## Introducing, Kko_okk !
꼬-옥은 부모님과 자녀가 함께 약속을 만들고, 지켜나가는 과정을 돕는 앱입니다.  
부모님과 아이가 꼬-옥을 통해 함께 약속을 만들고 지켜 나감으로써
긍정적 상호작용과 유대관계가 형성되기를,\
아이의 기본 생활 습관과 자아가 좋은 방향으로 형성되기를 바랍니다.

<br>

## Features
- 만들고싶은 약속 등록하기
  - 아이나 부모님 중에 함께 지키고 싶은 약속이 있다면 약속으로 만들고싶은 내용을 등록해주세요
  - 아이가 부모님에게 바라는 약속일 경우, 아이는 자신의 영역에서 원하는 약속을 등록할 수 있습니다.
  - 부모님이 아이에게 바라는 약속일 경우, 부모는 자식의 역역에서 원하는 약속을 등록할 수 있습니다.
- 약속으로 확정짓기
  - 아이와 부모님이 합의 하에 속으로 확정짓고자 하면, 각 영역에 생성된 임시 약속 셀을 동시에 꼬-옥 눌러주세요.
  - 같은 약속 쌍이 아닐 시에 경고 창이 뜹니다.
  - 확정된 약속은 가운데 영역으로 옮겨집니다.
- 약속 이행 여부 체크하기
  - 아이가 약속을 지켰을 때 가운데 영역의 확정 약속에서 약속 이행 여부를 꼬-옥 눌러주세요.
  - 부모님이 약속을 지켰을 때에도 가운데 확정 약속의 약속 이행 여부를 체크해주세요.
  - 아이와 부모님 모두 약속을 지켰을 경우, 약속 셀은 사라집니다.
- 우측 상단의 교육 팁을 통해서 교육 전문가들의 교육 팁을 확인할 수 있습니다.
- 이행률 보기 탭을 통해 우리 가족이 어떤 약속을 지켰는지, 약속을 얼마나 지켰는지 확인할 수 있어요!

## Tech
- SwiftUI
- CoreData

<br>

## App Detail
<img width="674" alt="image" src="https://user-images.githubusercontent.com/77421835/173480884-f8c839a2-30f3-4916-b77c-d75d2a6ede6b.png">

<br>

## File Structure

``` 
kko_okk
├── Extensions
├── Models
│   └── Resources
│       ├── Assets.xcassets
│       ├── Fonts
│       └── KkookkFonts
└── Views
    ├── BoardViews
    │   ├── ReportTab
    │   │   ├── DailyReportView
    │   │   ├── MonthlyReportView
    │   │   ├── WeeklyReportView
    │   │   └── checkPromiseView
    │   ├── SettingViews
    │   └── TodoTab
    │       └── PromisePopoverElements
    ├── HeaderViews
    └── OnBordingViews
        └── OnBoardingButtons
``` 
<br>

## Team Members
[Yeni](https://github.com/yeniful) | [Guell](https://github.com/Valentino1994) | [Raymond](https://github.com/garlicvread) | [Ruyha](https://github.com/RuyHa) | [Ian](https://github.com/LeeSungNo-ian) | [Seodam](https://github.com/seodam-hst)

<br>

## Presentation Script
- [AsyncSwift Seminar 001에서 소개된 Kkookk 프로젝트 영상](https://www.youtube.com/watch?v=DVauRWCogWI&ab_channel=AsyncSwiftKorea)
- [국문 발표 스크립트](https://apple-developer-academy-mc2.notion.site/Flow-221817fa15ff4bd19204b03091c42351)
- [English Script](https://apple-developer-academy-mc2.notion.site/Flow-4f4f02932a80470587ac6162f10dd416)
