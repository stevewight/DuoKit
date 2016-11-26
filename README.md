# DuoKit
Swift 3 wrapper for the unofficial Duolingo API

## Installation
The easiest way to use DuoKit is with CocoaPods
### Installation with CocoaPods
To integrate DuoKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'

target 'TargetName' do
  pod 'DuoKit', :git => 'https://github.com/stevewight/DuoKit.git'
end
```

Then, run the following command:

```bash
$ pod install
```

## Architecture

### UML Diagram of Object Model

![uml diagram of DuoKits object model](https://github.com/stevewight/DuoKit/blob/master/images/duo_kit-uml.png)

### Client

- `DuoClient`
  - Singleton object for making network calls to the API
  - Has a single `DuoUser` object

### Models

* `DuoUser`
  - Base information about the Duolingo user
  - Has a collection of `DuoLanguage` objects 
* `DuoLanguage`
  - Information about a single language the user is learning
  - Has a collection of `DuoSkill` objects
  - Has a signle `DuoLevel` object
  - Has a collection of `DuoImprovement` objects
* `DuoSkill`
  - Represents a single skill within a language the user is learning
* `DuoLevel`
  - Information for the current users level (i.e. current level, points to next level)
* `DuoImprovement`
  - Value the user gained and the datetime they achieved it
  
## Usage

### Getting the DuoUser object
```swift
// Get the singleton client
let client = DuoClient.sharedInstance

// Set the Duolingo user name
client.currentUser = MY_DUOLINGO_USER_NAME

// Make request to load user passing closures for success and failure
client.loadDuoUser(success: { (duoUser) in
  print("Success loading duoUser: \(duoUser)")
}) {
  print("Failed to load user, try again")
}
```

### Accessing User Information
The DuoUser is the entry point of all the users data and therefore the starting point for accessing all other objects:
```swift
// The duoUser object is accessed from the 'DuoClient' object returning 'success' (see above)

// returns the current language the user is learning
let duoLanguage = duoUser.duoLanguage()

// returns an array of all DuoSkill objects within the learning language
let duoSkills = duoLanguage.skills

// returns a single duoLevel object
let duoLevel = duoLanguage.duoLevel

// returns an array of all DuoImprovment (Note: the api only returns the last 7 days of improvments)
let duoImprovments = duoLanguage.improvements

```

There is additional information within each of these objects.  I recommend digging through the above model objects to find all properties.

