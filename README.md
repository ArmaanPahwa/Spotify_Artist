# spotify_artist

Mobile app creation for searching and view Spotify Artists using Flutter. Created by Armaan Pahwa. Screenshots are located in the `screenshots` folder.
This project has only been run and test on Andriod, as it was developed on a Windows OS.
Installing Swift/Xcode on a copy of this repo _SHOULD_ allow for seamless iOS compatability, but it is currently untested.

## Features
- Spotify Artist Searching
- Modern Search Menu
- Relevant Artist information page
- Aritst Image onClick backdrop change: Click Artist Image to change the backdrop

## How to Use
Follow these instructions for launching the app:
- In order to use this application from the source code, you must ensure that [Flutter](https://flutter.dev/) and [Andriod Studio](https://developer.android.com/studio/) are installed.
- Once installed, ensure all packages listed below are installed through running `flutter pub get`.
- Launch your Andriod Virtual Emulator
- Run through an IDE or command line:
    - via IDE
        - Open this in any IDE and ensure there is a connection to an Andriod device or Andriod emulator.
        - Run the `lib\main.dart` file using `Dart and Flutter` and interact with application on connected device.
    - via command line
        - navigate to the `spotify_artist` directory
        - run the command `flutter run lib\main.dart`

Once launched, these are the functions of the application:
- Home/Splash Page allows for search menu to be opened via icon on top right
- Search menu has suggestions when there are no search history
- A suggestion fills in the query
- Once search button is pressed, a list will be made of the spotify api call
- Each List Tile has image and name that can be clicked
- Upon being pressed, the tile will display an Artist information page
- Artist information page displays image, name, and statistics
- Image can be clicked to change backdrop of page

## Current Functionality
- Home page
- API Authentication
- Search Menu
- Artist Information Page information display
- System refactoring

## Current Development
- Home Page refactoring
- UI/UX refactoring

## To-Do
- User Testing
- Seamless Image Loading
- Universal Image Formatting

## Packages
Packages can be installed through running the `flutter pub get` as long as packages are listed as dependencies in the `pubspec.yaml` file
- [http](https://pub.dev/packages/http)
- [DotEnv](https://pub.dev/packages/flutter_dotenv)
- [cupertino_icons](https://pub.dev/packages/cupertino_icons)
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)

## Technologies Used
- [Flutter](https://flutter.dev/): Cross platform mobile app SDK
- [VScode](https://code.visualstudio.com/): Code IDE

## References
- [Flutter documentation](https://flutter.dev/docs)
- [Flutter examples](https://flutter.dev/docs/cookbook)
- [TL Dev Tech](https://www.tldevtech.com/flutter-futurebuilder-with-listview-example/): Flutter FutureBuilder with ListView