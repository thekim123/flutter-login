# flutter_login

### 1. 의존성 추가하기
- [pub.dev](pub.dev) 에 접속한다.
- flutter svg를 검색하면 flutter_svg라이브러리를 클릭하고 아래의 순서대로 의존성을 복사한다.
![image](https://user-images.githubusercontent.com/105403857/212537821-ec8b89da-348d-4d98-89b8-f236e175c527.png)

- 복사한 후에 pubspec.yaml의 dependencies 부분에 아래와 같이 붙여넣는다.
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_svg: ^0.22.0
```
- pub get 을 누르고, dependency를 불러오면 끝!
---
### 2. routes 적용하기
```dart
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/home" : (context) => HomePage()
      },
    );
  }
```

- initialRoute 에 입력한 문자열에 따라 페이지가 변하게 된다.


![img.png](img.png)
- home으로 설정

![img_1.png](img_1.png)
- /login으로 설정

### 3. Text 추가 후 클래스로 추출하기
- ListView를 Column으로 바꾼 후에 Text를 추가하였다.
- Column위에서 ctrl+w를 누르고 마우스 우클릭 - refactor - extract Flutter Widget 을 선택한다.
- 추출되는 클래스를 Logo.dart에 옮긴다.
- 이렇게 하면 재사용하기에 용이하다.

### 4. TextFormField 디자인하기
- 컴포넌트 디렉토리에 custom_text_form_field 다트 파일을 만든다.
- login_page의 Column에 CustomTextFormField를 추가한다.
- CustomTextFormField에 위에 들어갈 Text위젯과 TextFormField 위젯을 추가한다.
- TextFormField에는 enabledBorder와 focusedBorder속성을 추가한다.
- ![img_2.png](img_2.png)
```dart
class CustomTextFormField extends StatelessWidget {
    final String text;
    
    const CustomTextFormField({required this.text});
```
- 추상화를 하기 위해 필드를 추가하고 생성자를 만든다.

### 5. TextButton 테마 적용 - styleFrom
- main.dart에 아래와 같은 코드를 입력한다.
```dart
theme: ThemeData(
    textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
          backgroundColor: Colors.black,
          primary: Colors.white,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          ),
          minimumSize: Size(400, 60),
        ),
    ),
), 
```
- .style을 이용할 수도 있지만 styleFrom을 이용하면 훨씬 적은 코드로 테마를 적용할 수 있다.
- primary는 프로젝트의 대표 색상이다.

### 6. Form 위젯 유효성 검사
- CustomTextFormField 부분을 Column으로 감싸고 이것을 위젯으로 추출한다.
- custom_form.dart 파일을 만들고 추출한 위젯을 옮긴다.
- custom_text_form_fiels에 유효성 검사를 추가한다.
```dart
        TextFormField(
          validator: (value){
            if(value == null || value.isEmpty){
              return "Please enter some text";
            } else {
              return null;
            }

            //value!.isEmpty ? "Please enter some text" : null
```
- 주석처리된 부분은 null safety연산자가 추가된 것이다.
- 강의에서는 Form 부분을 위젯으로 추출했는데 이것이 재사용되기 때문에 추출하는 것은 아닌것 같다.
- 아무래도 코드의 가독성 때문이 아닌가 싶다.


### 7. errBorder 속성 & Navigator Push, Pop
```dart
errorBorder: OutlineInputBorder(
  borderRadius:  BorderRadius.circular(20),
),
focusedErrorBorder: OutlineInputBorder(
    borderRadius:  BorderRadius.circular(20),
),
```
- errorBorder : 버튼을 눌렀을 때 에러가 났을 때의 태두리
- focusedErrorBorder : 버튼을 눌렀을 때 에러가 났을 때의 태두리, 커서가 있는 텍스트필드의 테두리이다.

```dart
if(_formKey.currentState!.validate()){
  Navigator.pushNamed(context, "/home");
}
```
- validate() 매서드는 boolean 타입을 리턴한다. 
- 따라서 validate()의 리턴 값이 true이면 유효성 검사를 만족하는 것이고,
- 유효성 검사를 만족하면 다음 페이지로 넘겨주는 로직이다.
- 이 때 사용하는게 Navigator이다.
- 홈 페이지에는 Navigator.pop()으로 이전 페이지로 가도록 하였다.
- Navigator는 stack 자료구조로 이루어진 클래스이다. FILO

### 8. validators 라이브러리 사용
- (pub.get)[pub.get]에 접속한다.
- validators를 검색하고 Installing 탭에 가서 dependency를 복사하여 pubspec.yaml에 입력한다.
- import 'package:validators/validators.dart';를 사용할 클래스에 입력한다.
- custom_text_form_field.dart의 파일을 수정할 것이다.
```dart

class CustomTextFormField extends StatelessWidget {

  final String text;
  final mValid;

  const CustomTextFormField({required this.text, required this.mValid});
```
- 위와 같이 mValid 필드를 추가하고 생성자도 수정한다.
- mValid가 우리가 사용한 validation 부분을 받을 것이다.
- 따라서 custom_form.dart에 유효성검사 로직을 아래 코드처럼 수정한다.
```dart
CustomTextFormField(text: "Email",
      mValid: (value){
    if(value == null || value.isEmpty){
      return "Please enter some text";
    } else if(!isEmail(value)){
      return "email 형식이 아닙니다.";
    } else {
      return null;
    }
    }),
SizedBox(height: medium_gap,),
CustomTextFormField(
    text: "Password",
    mValid: (value){
      if(value == null || value.isEmpty){
        return "Please enter some text";
      } else if(value.toString().length > 20) {
        return "Too long password.";
      } else{
        return null;
      }
},),
```
- isEmail : 이메일 형식인지 검사하는 메서드이다.
- 이렇게 하지않고 customTextFormField에서 한꺼번에 수정하면 에러메세지가 Email 박스와 Pw박스에 동시에 나타나게 되는 버그가 생긴다.



