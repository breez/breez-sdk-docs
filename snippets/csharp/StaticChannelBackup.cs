using Breez.Sdk;

public class StaticChannelBackupSnippets
{
  public void StaticChannelBackup(BlockingBreezServices sdk)
  {
    // ANCHOR: static-channel-backup
    try
    {
      var backupData = BreezSdkMethods.StaticBackup(
          new StaticBackupRequest("<working directory>"));
    }
    catch (Exception)
    {
      // Handle error
    }
    // ANCHOR_END: static-channel-backup
  }
}
