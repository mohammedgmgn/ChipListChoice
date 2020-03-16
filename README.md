[![Codacy Badge](https://api.codacy.com/project/badge/Grade/c7d41a28a6774e6ab0b8ace9cab2706b)](https://www.codacy.com?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=mohammedgmgn/ChipListChoice&amp;utm_campaign=Badge_Grade)


# ChipListChoice
![Output sample](https://github.com/mohammedgmgn/ChipListChoice/blob/master/finaldemo%20(1).gif)




##### ChipListChoice example

```dart
class ChipListSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ChipListSample1State();
  }
}

class ChipListSample1State extends State<ChipListSample1> {
   @override
  Widget build(BuildContext context) {
    return ChipListChoice<User>(
        title: "Users",
        usersDataSet: users.toSet(),
        finalListResult: _finalListSelection,
        color: Colors.cyan);
  }

  _finalListSelection(List<User> finalSelectionResult) {
    print(finalSelectionResult.length.toString());
  }
}

List<User> users = [
  User(name: "Mohammed"),
  User(name: "Mahmoud"),
  User(name: "Karim"),
  User(name: "eman"),
  User(name: "osama"),
  User(name: "mohsen"),
  User(name: "Mostafa"),
  User(name: "Abdullaha"),
  User(name: "Ibrahim"),
];

class User extends CheckBoxModel {
  final String name;

    User({this.name}) : super(name);

}

```




### 1 - Depend on it

##### Add it to your package's pubspec.yaml file

```kotlin
dependencies:
  chip_list_choice: ^0.0.5
```


### 2 - Install it

##### Install packages from the command line
```kotlin
flutter packages get
```

### 3 - Import it
```kotlin
import 'package:chip_list_choice/ChipListChoice.dart';
```


## Contributing
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/mohammedgmgn/ChipListChoice/issues)

Want to contribute? Great!

To fix a bug or enhance an existing module, follow these steps:

- Fork the repo
- Create a new branch (`git checkout -b improve-feature`)
- Make the appropriate changes in the files
- Add changes to reflect the changes made
- Commit your changes (`git commit -am 'Improve feature'`)
- Push to the branch (`git push origin improve-feature`)
- Create a Pull Request 


### License: ###
~~~~
Copyright (c) 2019 mohammed mahmoud 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
~~~~
