# Installing

The Breez SDK is available in the following platforms:

## iOS/Swift

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

## Android/Kotlin

We recommend integrating the Breez SDK as Gradle dependency from [our Maven repository](https://mvn.breez.technology/#/releases).

To do so, add the following to your Gradle dependencies:

```gradle
repositories {
  maven {
      url("https://mvn.breez.technology/releases")
  }
}

dependencies {
  implementation("breez_sdk:bindings-android:<version>")
}
```

See [the example](https://github.com/breez/breez-sdk-examples/tree/main/Android) for more details

## React Native

We recommend using the official npm package:

```console
npm install @breeztech/react-native-breez-sdk
```
or
```console
yarn add @breeztech/react-native-breez-sdk
```

## Go

We recommend using our official Go package: [breez/breez-sdk-go](https://github.com/breez/breez-sdk-go).

```console
go get github.com/breez/breez-sdk-go
```

## C#

We recommend using our official C# package: [Breez.Sdk](https://www.nuget.org/packages/Breez.Sdk).

```console
dotnet add package Breez.Sdk
```

## rust

We recommend to add breez sdk as a git dependency with a specific release tag.
Check https://github.com/breez/breez-sdk/releases for the latest version.

```toml
[dependencies]
breez-sdk-core = { git = "https://github.com/breez/breez-sdk", tag = "0.3.1" }
```

## Flutter/Dart

We recommend to add our official flutter package as a git dependency. 

```yaml
dependencies:
  breez_sdk:
    git:
      url: https://github.com/breez/breez-sdk-flutter.git
```
## Python

Use the latest package [here](https://pypi.org/project/breez-sdk/). 

```console
pip install breez_sdk
```
