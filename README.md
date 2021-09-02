# epicture

![](./assets/Epicture.png)

Made with  by [fabien](https://github.com/FabienBounoir) and [Pierre Antoine](https://github.com/palegger)

A photo finder / browsing app

epicture is a Flutter application that consumes the imgur api. This is a project being used to learn flutter and hopefully build a useful imgur client for iOS and Android.

## Getting Started

- flutter pub get --> get package
- flutter run --> launch project (select your device: ios / android / google chrome)


To get a client id, generate one with imgur at https://api.imgur.com/oauth2/addclient 

## UI

![](https://i.imgur.com/eMdV54x.jpg "Home page")
![](https://i.imgur.com/Sl8HYAt.jpg "Search page")


## Why Flutter ?

Flutter is a multiplatform framework made by Google which allow us to write one application for both IOS, Android and google chrome. 

Flutter is all about widgets. Your application is a combination of Widgets that works together in order to create a responsive UI without thinking much of the hardware. Widgets are built and refreshed everytime they have to. For example, when some widget data which is displayed is changed, the widget is rebuilt and the UI is automatically updated.

Flutter is very documented, very easy to use but difficult to master. It comes with a very powerful environment.

## Why not React Native ?
React Native is a very powerful framework to develop cross-platform application. We already knew how to use React so it would have been a perfect choice.

The main reasons is because React Native environment is a pain to set up compared to Flutter. Expo often doesn't work as intended and Flutter is well known for it's hot reloading, which makes development easier.

There is other reasons such as syntax and architecture. React Native would have been good nonetheless but developing Flutter application feel's way better.


