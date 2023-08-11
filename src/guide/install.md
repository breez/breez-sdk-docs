# Installing

The Breez SDK is available in the following platforms:

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

## Android

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

See [the example](https://github.com/breez/breez-sdk/tree/main/libs/sdk-bindings/bindings-android/example) for more details

## React Native

We recommmend using the official npm package:

```console
npm install https://github.com/breez/breez-sdk-react-native/releases/download/0.1.4/breeztech-react-native-breez-sdk-0.1.4.tgz
```
or
```console
yarn add https://github.com/breez/breez-sdk-react-native/releases/download/0.1.4/breeztech-react-native-breez-sdk-0.1.4.tgz
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

Currently rust is still not accessible via cargo and is needed to be built from source. Please visit the [sdk-core](https://github.com/breez/breez-sdk/tree/main/libs/sdk-core) project for instructions.

## Dart/Flutter
Currently Dart is built from source only. Please visit the [sdk-flutter](https://github.com/breez/breez-sdk/tree/main/libs/sdk-flutter#readme) project for instructions. We're planning to publish this package to [pub.dev](https://pub.dev/), until then it needs to be specified as a local directory dependency.

```yaml
dependencies:
  breez_sdk:
    path: <relative-path-to>/breez-sdk/libs/sdk-flutter
```
## Python

Currently python is not acceable as a package and is needed to build it from source. Please visit [sdk-core](https://github.com/breez/breez-sdk/tree/main/libs/sdk-bindings#python) project for instructions.
