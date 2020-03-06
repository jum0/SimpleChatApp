# SimpleChatApp-iOS

## 구현 화면

### Step 1. 기본 UI구성

2020.03.03

<img src="https://user-images.githubusercontent.com/40762111/75804599-93ecd880-5dc3-11ea-9ec8-cff9cf132297.gif" width="200">

### Step 2. Register View Firebase 연동

2020.03.04

<img src="https://user-images.githubusercontent.com/40762111/75897064-53e92c80-5e7b-11ea-9629-22a2af517544.gif" width="200">



### Step 3. Login View, Chat View Firebase 연동 및 UITableViewDataSource, UITableViewDelegate

2020.03.06

<img src="https://user-images.githubusercontent.com/40762111/76091723-73aa5d00-6001-11ea-83e6-45d6b573f343.gif" width="200">

## 주요 기능

## 사용한 기술

- AutoLayout, Cocoapods, Firebase(user authentication, registration, sign in and out), UIAlertController, UITableViewDataSource, UITableViewDelegate

## 사용한 라이브러리

- [CLTypingLabel](https://github.com/cl7/CLTypingLabel) : Initial screen에서 타이틀에 애니메이션 효과
- [Firebase](https://firebase.google.com/docs/ios/setup?authuser=0): 회원 가입, 사용자 인증, 로그 아웃

## 배운 점

### Leading / Trailing vs Left / Right

Auto Layout을 설정하면서 warning이 계속 표시되어 찾아보다가 `Respect Language Direction` 체크를 풀어야 한다는 글을 보고 따라했더니 `Leading`과 `Trailing`이 `Left`와 `Right`로 변했다.

`Leading`과 `Trailing`을 단순하게 왼쪽, 오른쪽으로 알고 있었는데 이것은 `Left`와 `Right`의 의미였다. 오른쪽에서 왼쪽으로 읽는 아랍어를 지원한다고 추가하면,  `Leading`은 객체의 왼쪽, `Trailing`은 객체의 오른쪽이 된다. `Left`와 `Right`는 언어에 상관없이 절대적인 방향이다.

Documentation을 보니 `Left`와 `Right`보다 `Leading`과 `Trailing`을 사용하랜다.

> Interpreting Values - https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/AnatomyofaConstraint.html#//apple_ref/doc/uid/TP40010853-CH9-SW1



### localizedDescription

Error를 출력할 때, 뒤에 `.localizedDescription`을 붙이면 error에 대해서 사용자가 선택한 언어로 상세한 설명이 나온다.

> localizedDescription - https://developer.apple.com/documentation/uikit/uidocumentbrowsererror/2920006-localizeddescription



### UITableViewDataSource

데이터를 관리하고 테이블 뷰에 셀을 제공하는데 사용하는 객체과 관련된 프로토콜. 테이블 내에 section과 row의 수, 각 row의 cell, 섹션의 headers와 footers, 테이블의 인덱스, 기본 데이터를 변경해야 하는 사용자 또는 테이블의 업데이트에 응답과 관련되어 있다.

해당 프로토콜은 `tableView(_:numberOfRowsInSection:)`과 `tableView(_:cellForRowAt:)` 두 가지 메서드를 요구한다.

##### tableView(_:numberOfRowsInSection:)

- Data source에 테이블 뷰의 섹션에 있는 행의 수를 return 하도록 한다. (return 값 Int)

##### tableView(_:cellForRowAt:)

- 테이블 뷰의 특정 위치에 삽입할 셀의 date source를 요청한다. (return 값 cell)
- `dequeueReusableCell(withIdentifier:for:)`
  - 파라미터로 `withIdentifier`와 `for`가 있다.
    - `for`에 `indexPath`가 들어가는데, 인덱스 패스의 설명을 보면 셀의 위치를 지정한다고 한다. 데이터 소스는 셀에 대한 요청이 있을 때, 정보를 받아 이것을 전달하고 이러한 방법은 인덱스 패스를 사용하여 테이블 뷰에서 셀의 위치를 기반으로 추가적인 구성 수행한다고 한다.
  - 메모리를 절약하기 위해서 사용한다.
    - 테이블 뷰를 스크롤 할 때, 데이터 소스를 기반으로 셀의 내용이 바뀌게 되는데, 화면에 밖으로 밀려난 셀들은 reuse pool에 들어가게 되고 `dequeueReusableCell(withIdentifier:for:)`을 호출하면 테이블 셀에 의해서 다시 반환된다고 한다.

Step3.에서 `message.count`가 3이므로 `cellForRowAt` 3번 실행

그 외에도, swipe를 통해 셀을 삭제하는 `tableView(_:commit:forRowAt:)`도 있다.

> UITableViewDataSource - https://developer.apple.com/documentation/uikit/uitableviewdatasource
>
> `tableView(_:commit:forRowAt:)` reference https://dev-dream-world.tistory.com/49 
>
> `dequeueReusableCell(withIdentifier:for:)` - https://developer.apple.com/documentation/uikit/uitableview/1614878-dequeuereusablecell
>
> `dequeueReusableCell(withIdentifier:for:)` reference - https://zeddios.tistory.com/55



### Closure

### UITableViewDelegate - didSelectRowAt

나중에 메세지 많이 해놓고 오픈 소스 사용해보기 그 nsoojin님?





