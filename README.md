# SimpleChatApp-iOS

## 구현 화면

#### Step 1. 기본 UI구성

2020.03.03

<img src="https://user-images.githubusercontent.com/40762111/75804599-93ecd880-5dc3-11ea-9ec8-cff9cf132297.gif" width="200">

#### Step 2. Register View Firebase 연결

2020.03.04

<img src="https://user-images.githubusercontent.com/40762111/75897064-53e92c80-5e7b-11ea-9629-22a2af517544.gif" width="200">

## 주요 기능

## 사용한 기술

- AutoLayout, Cocoapods, Firebase(user authentication, registration), UIAlertController

## 사용한 라이브러리

- [CLTypingLabel](https://github.com/cl7/CLTypingLabel) : Initial screen에서 타이틀에 애니메이션 효과
- [Firebase](https://firebase.google.com/docs/ios/setup?authuser=0): 회원 가입, 사용자 인증

## 배운 점

#### Leading / Trailing vs Left / Right

Auto Layout을 설정하면서 warning이 계속 표시되어 찾아보다가 `Respect Language Direction` 체크를 풀어야 한다는 글을 보고 따라했더니 `Leading`과 `Trailing`이 `Left`와 `Right`로 변했다.

`Leading`과 `Trailing`을 단순하게 왼쪽, 오른쪽으로 알고 있었는데 이것은 `Left`와 `Right`의 의미였다. 오른쪽에서 왼쪽으로 읽는 아랍어를 지원한다고 추가하면,  `Leading`은 객체의 왼쪽, `Trailing`은 객체의 오른쪽이 된다. `Left`와 `Right`는 언어에 상관없이 절대적인 방향이다.

Documentation을 보니 `Left`와 `Right`보다 `Leading`과 `Trailing`을 사용하랜다.

>  https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/AnatomyofaConstraint.html#//apple_ref/doc/uid/TP40010853-CH9-SW1



#### localizedDescription

Error를 출력할 때, 뒤에 `.localizedDescription`을 붙이면 error에 대해서 사용자가 선택한 언어로 상세한 설명이 나온다.

> https://developer.apple.com/documentation/uikit/uidocumentbrowsererror/2920006-localizeddescription

####  Closure



