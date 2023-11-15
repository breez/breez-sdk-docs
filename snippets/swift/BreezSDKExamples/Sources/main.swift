// The Swift Programming Language
// https://docs.swift.org/swift-book

print("Hello, tester!")
if let sdk = try gettingStarted(){
    if let fiarRates = getFiatCurrencyAndRates(sdk: sdk)  {
        for fiat in fiarRates {
            print("rate \(fiat)\n")
            print("------------------------")
        }
    }
}

