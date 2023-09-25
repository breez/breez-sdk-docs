# Static Channel Backup

A static channel backup is automatically saved by the Breez SDK in the background. More specifically, the static backup is updated
each time a new channel is opened.

If the Greenlight node is not available, you can retrieve the static channel backup from the SDK's working directory as follows:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
let backup_data = BreezServices::static_backup(StaticBackupRequest {
    working_dir: "<working directory>".into(),
})?;
```

</section>

<div slot="title">Swift</div>
<section>

```swift
do {
    let backupData = breez_sdk.staticBackup(workingDir: "<working directory>");    
} catch{
    // handle error
}
```

</section>

<div slot="title">Android</div>
<section>

```kotlin,ignore
try {
    val backupData = staticBackup("<working directory>")
} catch (e: Exception) {
    // handle error
}
```

</section>

<div slot="title">React Native</div>
<section>

```typescript
try {
    let backupData = await staticBackup("<working directory>");
} catch (error) {
    console.log(error)
}
```

</section>

<div slot="title">Dart</div>
<section>

```dart
try {
    StaticBackupResponse backupData = await staticBackup(workingDir: "<working directory>");
} catch (error) {
   // handle error
}
```
</section>

<div slot="title">Python</div>
<section>

```python
try:
    backup_data = breez_sdk.static_backup("<working directory>")    
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go
backupData, err := breez_sdk.StaticBackup("<working directory>")
if err != nil {
    log.Fatalf("Failed to retrieve static backup data: %#v", err)
}
```
</section>

<div slot="title">C#</div>
<section>

```cs
using Breez.Sdk;

StaticBackupResponse backupData;
try 
{
    backupData = BreezSdkMethods.StaticBackup("<working directory>");  
} catch (Exception) 
{
   // Handle error
}
```
</section>
</custom-tabs>
