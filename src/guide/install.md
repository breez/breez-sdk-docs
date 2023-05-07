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

We recommend using our official Swift package: [breez/breez-sdk-swift](https://github.com/breez/breez-sdk-swift).

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