# Troubleshooting Android

After installing Breez SDK into your application you might come across issues compiling on Android platforms because Breez SDK's Notification Plugin: 
- uses `kotlinx-serialization` dependency,
- and it relies on JNA library.

If you do, there are several steps you can take to compile and build properly, even if your application is not using the Notification Plugin feature.

## kotlinx-serialization

Starting with this 1.8.20 release, the Kotlin K2 compiler has a preview version of the serialization plugin. It's recommended for users to upgrade their Kotlin version to at least 1.8.20 or [set up the serialization plugin](https://github.com/Kotlin/kotlinx.serialization?tab=readme-ov-file#setup) on their projects explicitly with older versions.

## JNA library

JNA relies on specific class and method names to load native libraries and access native code. If these names are obfuscated or removed, it can cause runtime errors and failures in native library loading. 

The JNA library code obfuscation issue may not be apparent until compiled on "release" mode with maximum optimization and minimal footprint size that'll be used when deploying and publishing an application.

To ensure proper functionality, a Proguard rules needs to be added to explicitly tell R8 compiler to keep certain parts of the JNA library. Here is an example of Proguard rules:
```pro
-dontwarn dalvik.system.VMStack
-dontwarn java.lang.**
-dontwarn javax.naming.**
-dontwarn sun.reflect.Reflection

# JNA
-keep class com.sun.jna.** { *; }
-keep class * implements com.sun.jna.** { *; }

# Other
-dontoptimize
```

These rules ensure that the JNA library's core components are not obfuscated, allowing the library to function correctly. See [Shrink, obfuscate, and optimize your app](https://developer.android.com/build/shrink-code) for more information on how and where to add Proguard rules on your app.

## Inconsistent JVM-target compatibility

It could be that compilation tasks for Java and Kotlin are using different JVM targets, in which case you need to set the [JVM toolchain](https://kotl.in/gradle/jvm/toolchain). In your application's `build.gradle` file in the `app` directory set the Java and Kotlin JVM targets consistently. 
```
kotlin {
    jvmToolchain(17)
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

android {
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = '17'
    }
}
```

## Java heap space

```
> Could not resolve all files for configuration
    > Failed to transform react-android-0.72.10-debug.aar (com.facebook.react:react-android:0.72.10) 
    to match attributes {artifactType=android-symbol-with-package-name, 
    com.android.build.api.attributes.BuildTypeAttr=debug, org.gradle.category=library, 
    org.gradle.dependency.bundling=external, or g.gradle.libraryelements=aar, org.gradle.status=release, 
    org.gradle.usage=java-api}. 
        > Java heap error
```

If you get a `Java heap space` error, try to increase the maximum memory allocation pool for the JVM in `gradle.properties`.

```
org.gradle.jvmargs=-Xmx4G -XX:MaxMetaspaceSize=512m
```