# DuoKit
Unofficial swift wrapper for the Duolingo API

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

### Client

- 'DuoClient'
  - Singleton object for making network calls to the API

### Models

- 'DuoUser'
  - Base information about the Duolingo user
- 'DuoLanguage'
  - Information about a single language the user is learning
- 'DuoImprovement'
  - Value the user gained and the datetime they achieved it
- 'DuoSkill'
  - Represents a single skill within a language the user is learning
- 'DuoLevel'
  - Information for the current users level (i.e. current level, points to next level)
  
## Usage

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
