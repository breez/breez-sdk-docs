# Installing

The Breez SDK is available in the following platforms:

## Android

We recommend integrating the Breez SDK as Gradle dependency from [our Maven repository](https://mvn.breez.technology/releases).

To do so, add the following to your Gradle dependencies:

``` groovy
repositories {
  maven {
      url("https://mvn.breez.technology/releases")
  }
}

dependencies {
  implementation("breez_sdk:bindings-android:<version>")
}
```

## iOS

We support integration via the [Swift Package Manager](https://www.swift.org/package-manager/) and via [CocoaPods](https://cocoapods.org/).
See [breez/breez-sdk-swift](https://github.com/breez/breez-sdk-swift) for more information.

### Swift Package Manager

#### Installation via Xcode

Via `File > Add Packages...`, add

```
https://github.com/breez/breez-sdk-swift.git
```

as a package dependency in Xcode.

#### Installation via Swift Package Manifest

Add the following to the dependencies array of your `Package.swift`:

``` swift
.package(url: "https://github.com/breez/breez-sdk-swift.git", from: "<version>"),
```

### CocoaPods

Add the Breez SDK to your `Podfile` like so:

``` ruby
target '<YourApp' do
  use_frameworks!
  pod 'BreezSDK'
end
```

## React Native

We recommmend using the official npm package:

```console
$ npm install @breeztech/react-native-breez-sdk
```
or
```console
$ yarn add @breeztech/react-native-breez-sdk
```

## C#

Currently c# is built from source only. Please visit the [sdk-bindings](https://github.com/breez/breez-sdk/tree/main/libs/sdk-bindings#c) project for instructions.

## rust

Currently rust is still not accessible via cargo and is needed to be built from source. Please visit the [sdk-core](https://github.com/breez/breez-sdk/tree/main/libs/sdk-core) project for instructions.
