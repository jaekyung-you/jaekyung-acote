### 프로젝트 빌드&실행

1. 프로젝트 다운로드 후 터미널에 ```flutter pub get``` 입력해서 라이브러리 다운로드
2. 원하는 디바이스 선택 후 main.dart에서 Run 혹은 Debug 모드로 실행


### 상태관리: GetX

- 이유1. 2페이지 정도 되는 작은 규모 애플리케이션
- 이유2. 상태 관리가 쉽고, 간편한 라우팅 지원


### 설계: MVVM

작은 규모 애플리케이션이므로 Clean Architecture보다는 MVVM 채택

acote  
├── common  
├── controller  
├── main.dart  
├── model  
├── presentation  
├── routes  
└── service  

common: 공통으로 사용하는 위젯  
model: 서버 통신으로 요청받은 응답 Model  
controller: GetxController 상속받는 ViewModel  
presentation: screen과 widget을 포함한 View  
routes: View 이동을 위한 라우트  
service: api 통신을 위한 설정, usecase   

