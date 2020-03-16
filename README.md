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

### Step 4. Chat View (Add and Read Data from Firebase, Design and UITableViewCell) 완성 및 Improve User Experience

2020.03.10

<img src = "https://user-images.githubusercontent.com/40762111/76343571-a6c35800-6343-11ea-8f1b-8c098275a831.gif" width = 370>



## 주요 기능

- 회원 가입
- 로그인 및 로그아웃
- 다른 두 계정의 메세지 주고 받기

## 사용한 기술

- AutoLayout, Cocoapods, Swift Package Manager, Firebase(user authentication, registration, sign in and out, database), Navigation Controller, UIAlertController, UITableViewDataSource, UITableViewDelegate, Custom View using .xib files

## 사용한 라이브러리

- [CLTypingLabel](https://github.com/cl7/CLTypingLabel) : Initial screen에서 타이틀에 애니메이션 효과
- [Firebase](https://firebase.google.com/docs/ios/setup?authuser=0): 회원 가입, 사용자 인증, 로그 아웃
- [IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager): 키보드창 관련
- [Baraba](https://github.com/nsoojin/baraba): ChatView에서 얼굴 인식을 통한 화면 scroll

## 배운 점

### Leading / Trailing vs Left / Right

Auto Layout을 설정하면서 warning이 계속 표시되어 찾아보다가 `Respect Language Direction` 체크를 풀어야 한다는 글을 보고 따라했더니 `Leading`과 `Trailing`이 `Left`와 `Right`로 변했다.

`Leading`과 `Trailing`을 단순하게 왼쪽, 오른쪽으로 알고 있었는데 이것은 `Left`와 `Right`의 의미였다. 오른쪽에서 왼쪽으로 읽는 아랍어를 지원한다고 추가하면,  `Leading`은 객체의 왼쪽, `Trailing`은 객체의 오른쪽이 된다. `Left`와 `Right`는 언어에 상관없이 절대적인 방향이다.

Documentation을 보니 `Left`와 `Right`보다 `Leading`과 `Trailing`을 사용하랜다.

> Interpreting Values - https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/AnatomyofaConstraint.html#//apple_ref/doc/uid/TP40010853-CH9-SW1

----

### localizedDescription

Error를 출력할 때, 뒤에 `.localizedDescription`을 붙이면 error에 대해서 사용자가 선택한 언어로 상세한 설명이 나온다.

> localizedDescription - https://developer.apple.com/documentation/uikit/uidocumentbrowsererror/2920006-localizeddescription

----

### UITableViewDataSource

데이터를 관리하고 테이블 뷰에 셀을 제공하는데 사용하는 객체과 관련된 프로토콜. 테이블 내에 section과 row의 수, 각 row의 cell, 섹션의 headers와 footers, 테이블의 인덱스, 기본 데이터를 변경해야 하는 사용자 또는 테이블의 업데이트에 응답과 관련되어 있다.

해당 프로토콜은 `tableView(_:numberOfRowsInSection:)`과 `tableView(_:cellForRowAt:)` 두 가지 메서드를 요구한다.

##### tableView(_:numberOfRowsInSection:)

- Data source에 테이블 뷰의 섹션에 있는 행의 수를 return 하도록 한다. (return 값 Int)

##### tableView(_:cellForRowAt:)

- 테이블 뷰의 특정 위치에 삽입할 셀의 date source를 요청한다. (return 값 cell)
- `dequeueReusableCell(withIdentifier:for:)`
  - 파라미터로 `withIdentifier`와 `for`가 있다.
    - `for`에 `indexPath`가 들어가는데, 인덱스 패스의 설명을 보면 셀의 위치를 지정한다고 한다. 데이터 소스는 셀에 대한 요청이 있을 때, 정보를 받아 이것을 전달하고 이러한 방법은 인덱스 패스를 사용하여 테이블 뷰에서 셀의 위치를 기반으로 추가적인 구성 수행한다.
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

----

### Closure

- 코드 블럭이면서 일급 객체

  - 일급 객체란 전달 인자로 보낼 수 있고, 변수/상수 등으로 저장하거나 전달할 수 있으며, 함수의 반환 값도 될 수 있음.

- 기본 형태

  ```swift
  { (매개 변수들) -> 반환 타입 in
      실행 코드
  }
  ```

- 예시

  - 클로저로 변경

    ```swift
    // 일반 함수 호출
    func backwards(left: String, right: String) -> Bool {
      return left > right
    }
    
    let alphabet: [String] = ["c", "b", "a", "d"]
    let reversed: [String] = alphabet.sorted(by: backwards) // ["d", "c", "b", "a"]
    
    
    // 클로저로 변경
    let reversed: [String]
    reversed = alphabet.sorted(by: { (left: String, right: String) -> Bool in
                                   return left > right}) // ["d", "c", "b", "a"]
    ```

  - 후행 클로저

    ```swift
    // 후행 클로저(Trailing Closure) 사용
    let reversed: [String] = alphabet.sorted() { (left: String, right: String) -> Bool in return left > right }
    
    // sorted(by:) 메서드의 소괄호 생략 가능
    let reversed: [String] = alphabet.sorted { (left: String, right: String) -> Bool in return left > right }
    ```

  - 매개 변수 타입과 반환 타입 생략 가능

    ```Swift
    let reversed: [String] = alphabet.sorted { (left, right) in return left > right }
    ```

  - 축약된 전달 인자 이름 사용 및 return 키워드 생략 가능
    ```swift
    // 축약된 전달 인자 이름 사용
    let reversed: [String] = alphabet.sorted { 
      return $0 > $1
    }
    
    // return 키워드 생략 가능
    let reversed: [String] = alphabet.sorted { $0 > $1 }
    ```

> 참조 - https://academy.realm.io/kr/posts/closure-and-higher-order-functions-of-swift/

----

### UITableView에서 Scroll을 옮기기

<img src="https://user-images.githubusercontent.com/40762111/76417230-dc1d8380-63df-11ea-98d9-c9234b5c9757.jpeg" width=150>

```swift
let indexPath = IndexPath(row: 4, section: 1)
tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
```

`IndexPath`에서 말하는 `row`와 `section`은 위의 사진과 같다. 

이번 프로젝트와 같은 채팅창에서는 `IndexPath`의 `row`는 메세지가 저장되는 array의 `.count-1`을 하여 가장 마지막 메세지가 보이도록 한다. `section`은 따로 구분이 없으므로 0.

`.scrollToRow`에서 `at: .bottom`의 해당 셀의 아래 부분이라는 뜻이다.



