# Qaree-App

Qaree is a digital product aiming to facilitate group reading by enabling readers to create group cycles online. In addition, individual readers can use Qaree to track their reading status and keep a record of their achievements. Qaree will target regular readers, but also other sectors of Saudi Arabia’s society. That would result in enriching the culture of society and promoting reading between its members. Current products mainly target English-speaking audience with little or no support of Arabic. Some digital products can be used regardless of the language barrier. However, with a socially heavy activity like group reading, it is a must to have a platform that is tailored for local needs and culture. That is where Qaree will fill this gap and provide the desired solution. 

### Files Structure

When you want to implement a new feature in the app you should create a new folder representing this feature in the `features` folder.

The features are based on screens which hold the same functions or a task in the app, and the structure of the new feature folder will be as follows:

    featrues
    │ 
    ├──  new_feature_name
    │    │
    │    ├──  screens                                         # contains all the screens for the feature
    │    │     ├── screen_one.dart              
    │    │     └── screen_two.dart
    │    │
    │    ├──  widgets                                         # contains all the widgets that are specific for the feature
    │    │     └── expanded_container.dart              
    │    │     
    │    ├──  controllers                                     # contains all logic functions of the feature (can create file for each screen)
    │    │     └── new_feature_name_controller.dart         
    │    │
    │    ├──  providers                                       # contains all the riverpod's provdiders that are specific for the feature
    │    │     ├── screen_name_one_provider.dart            
    │    │     └── screen_name_two_provider.dart
    │    │
    │    ├──  models                                          # contains all the models that are specific for the feature
    │    │     └──  model_one.dart           
    │    │
    │    └──  consts                                          # contains all the consts that are specific for the feature (usually does not exist)
    │         └── constants.dart       
    │    
    └── ...

    

Outside the lib folder, there are also other `widgets`, `models`, `consts`, `proivders`, `services` folders which have the same idea but conatain all the global parts of the app 


### Conventions

#### Creating a New Branch

Once you're assigned to an issue or want to start working on a new feature, create a new branch with a descriptive title preceded with your name as `@yourname/new-feature-title`.

_Note: branch names ar all small case separated by a dash `-`, e.g. `@Abdulkareem/booking-bug`_

#### Commits & PR

The commit message should be structured as follows:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

The commit contains the following structural elements, to communicate intent to the consumers of your library:

* **fix:** a commit of the type `fix` patches a bug in the codebase.

* **new:** a commit of the type `new` introduces a new feature to the codebase.

* **BREAKING CHANGE:** a commit that has a footer `BREAKING CHANGE:`, or appends a `!` after the type/scope, introduces a breaking change.

* types other than fix: and feat: are allowed, for example `build:`, `chore:`, `ci:`, `docs:`, `style:`, `refactor:`, `perf:`, `test:`, and others.
 
Refer to [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) for more information. 


#### Dart File Naming
* Small letters only.
* Use underscore as delimiters.
* Keep it short, clear and simple.

Examples :
`main_view.dart`
`settings_controller.dart`
