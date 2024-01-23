plugins {
    alias(libs.plugins.kotlinMultiplatform)
    alias(libs.plugins.androidLibrary)
}

kotlin {
    androidTarget {
        compilations.all {
            kotlinOptions {
                jvmTarget = "1.8"
            }
        }
    }
    
    listOf(
        iosX64(),
        iosArm64(),
        iosSimulatorArm64()
    ).forEach {
        it.binaries.framework {
            baseName = "shared"
            isStatic = true
        }
    }

    sourceSets {
        commonMain.dependencies {
            //put your multiplatform dependencies here
            implementation(libs.breez)

        }
        commonTest.dependencies {
            implementation(libs.kotlin.test)
        }
        val commonMain by getting {
            dependencies {
                implementation("technology.breez:breez-sdk-kmp:0.2.14")
            }
        }
    }
}

android {
    namespace = "com.example.kotlinmpplib"
    compileSdk = 34
    defaultConfig {
        minSdk = 34
    }
}

dependencies {
    implementation(libs.breez)
    implementation("androidx.core:core-ktx:+")
}