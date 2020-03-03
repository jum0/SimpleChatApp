# SimpleChatApp-iOS

## 구현 화면

#### Step 1. 기본 UI구성

2020.03.04

<img src="https://user-images.githubusercontent.com/40762111/75804599-93ecd880-5dc3-11ea-9ec8-cff9cf132297.gif" width="200">

## 주요 기능

## 사용한 기술

- AutoLayout

## 사용한 라이브러리

- [CLTypingLabel](https://github.com/cl7/CLTypingLabel) : Initial screen에서 타이틀에 애니메이션 효과

## 배운 점

#### Leading / Trailing vs Left / Right

Auto Layout을 설정하면서 warning이 계속 표시되어 찾아보니, `Respect Language Direction` 체크를 풀라고 했다. 체크를 푸니, `Leading`과 `Trailing`이 `Left`와 `Right`로 변했다.

`Leading`과 `Trailing`을 단순하게 왼쪽, 오른쪽으로 알고 있었는데 이것은 `Left`와 `Right`의 의미였다. 오른쪽에서 왼쪽으로 읽는 아랍어를 지원한다고 추가하면,  `Leading`은 객체의 왼쪽, `Trailing`은 객체의 오른쪽이 된다. `Left`와 `Right`는 언어에 상관없이 절대적인 방향이다.

