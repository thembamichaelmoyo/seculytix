<#
    Harden Windows Security - March 2025.
    
    This script applies a set of security settings to enhance system protection, including:
    - Attack Surface Reduction (ASR) rules to block known threats.
    - Brute force protection and aggressiveness tuning.
    - Control over various real-time scanning options, cloud protection, and email scanning.
    - Configuration of controlled folder access, automatic scan scheduling, and signature updates.
    
    It is recommended to implement these settings for stronger security posture, particularly in preventing malware, ransomware, and brute force attacks. This script is intended for systems requiring robust protection, ensuring that Microsoft Defender is optimized for defense against modern threats.

    IMPORTANT: Ensure that the system meets prerequisites for some of the advanced settings like ASR and Cloud protection.

#>

# Enable Datagram Processing on Windows Server (can help with network performance and security configurations)
Set-MpPreference -AllowDatagramProcessingOnWinServer 1

# Enable Network Protection to prevent users from accessing dangerous domains
Set-MpPreference -AllowNetworkProtectionOnWinServer $True

# Enable multiple Attack Surface Reduction (ASR) rules to mitigate various threats
Set-MpPreference -AttackSurfaceReductionRules_Ids 56a863a9-875e-4185-98a7-b882c64b5ce5, 7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c, d4f940ab-401b-4efc-aadc-ad5f3c50688a, 9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2, be9ba2d9-53ea-4cdc-84e5-9b1eeee46550, 01443614-cd74-433a-b99e-2ecdc07bfc25, 5beb7efe-fd9a-4556-801d-275e5ffc04cc, d3e037e1-3eb8-44c8-a917-57927947596d, 3b576869-a4ec-4529-8536-b80a7769e899, 75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84, 26190899-1602-49e8-8b27-eb1d0a1ce869, e6db77e5-3df2-4cf1-b95a-636979351e5b, d1e49aac-8f56-4280-b9ba-993a6d77406c, b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4, 92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b, c1db55ab-c21a-4637-bb3f-a12568109d35 -AttackSurfaceReductionRules_Actions Enabled

# Set Brute Force Protection Aggressiveness to High
Set-MpPreference -BruteForceProtectionAggressiveness High

# Enable Brute Force Protection
Set-MpPreference -BruteForceProtectionConfiguredState 1

# Enable blocking brute force attacks on the local network
Set-MpPreference -BruteForceProtectionLocalNetworkBlocking $True

# Set maximum block time for brute force attacks to 1440 minutes (24 hours)
Set-MpPreference -BruteForceProtectionMaxBlockTime 1440

# Ensure Windows Defender checks for signature updates before running a scan
Set-MpPreference -CheckForSignaturesBeforeRunningScan $True

# Set Cloud Protection level to High for better malware detection
Set-MpPreference -CloudBlockLevel High

# Enable "Block at First Seen" to block new threats immediately
Set-MpPreference -DisableBlockAtFirstSeen $False

# Ensure full scan catch-up is enabled if scheduled scans are missed
Set-MpPreference -DisableCatchupFullScan $False

# Ensure quick scan catch-up is enabled if scheduled scans are missed
Set-MpPreference -DisableCatchupQuickScan $False

# Enable email scanning for malware
Set-MpPreference -DisableEmailScanning $False

# Enable IOAV (Internet Open Application Validation) Protection
Set-MpPreference -DisableIOAVProtection $False

# Enable QUIC protocol scanning
Set-MpPreference -DisableQuicParsing $False

# Enable scanning of removable drives
Set-MpPreference -DisableRemovableDriveScanning $False

# Enable creation of restore points before threat remediation
Set-MpPreference -DisableRestorePoint $False

# Enable scanning of mapped network drives during full scans
Set-MpPreference -DisableScanningMappedNetworkDrivesForFullScan $False

# Enable script scanning to detect malicious scripts
Set-MpPreference -DisableScriptScanning $False

# Enable Controlled Folder Access to protect against ransomware
Set-MpPreference -EnableControlledFolderAccess Enabled

# Convert warnings to blocks for potentially unwanted applications (PUA)
Set-MpPreference -EnableConvertWarnToBlock $True

# Enable file hash computation for security analysis
Set-MpPreference -EnableFileHashComputation $True

# Enable Network Protection
Set-MpPreference -EnableNetworkProtection 1

# Enable UDP Receive Offload for better network performance
Set-MpPreference -EnableUdpReceiveOffload $True

# Enable UDP Segmentation Offload for better network performance
Set-MpPreference -EnableUdpSegmentationOffload $True

# Automatically remove high-threat malware
Set-MpPreference -HighThreatDefaultAction Remove

# Quarantine low-threat malware instead of removing it
Set-MpPreference -LowThreatDefaultAction Quarantine

# Set Microsoft Advanced Protection Service (MAPS) reporting to Advanced
Set-MpPreference -MAPSReporting Advanced

# Enable updates even on metered connections
Set-MpPreference -MeteredConnectionUpdates $True

# Automatically remove moderate threats
Set-MpPreference -ModerateThreatDefaultAction Remove

# Enable Potentially Unwanted Application (PUA) protection at maximum level
Set-MpPreference -PUAProtection 2

# Randomize scheduled scan times to avoid predictability
Set-MpPreference -RandomizeScheduleTaskTimes $True

# Set real-time scanning direction (0 = Both Inbound & Outbound)
Set-MpPreference -RealTimeScanDirection 0

# Schedule daily remediation at 16:00
Set-MpPreference -RemediationScheduleTime 16:00:00

# Enable Remote Encryption Protection with medium aggressiveness
Set-MpPreference -RemoteEncryptionProtectionAggressiveness 1

# Enable Remote Encryption Protection
Set-MpPreference -RemoteEncryptionProtectionConfiguredState 1

# Set Remote Encryption Protection block time to 15 minutes
Set-MpPreference -RemoteEncryptionProtectionMaxBlockTime 15

# Report dropped dynamic signatures for malware detection
Set-MpPreference -ReportDynamicSignatureDroppedEvent $True

# Limit CPU usage during scans to 20%
Set-MpPreference -scanAvgCPULoadFactor 20

# Schedule a daily quick scan at 10:00 AM
Set-MpPreference -ScanScheduleQuickScanTime 10:00:00

# Schedule a daily full scan at 1:00 PM
Set-MpPreference -ScanScheduleTime 13:00:00

# Automatically remove severe threats
Set-MpPreference -SevereThreatDefaultAction Remove

# Schedule daily signature updates at 12:45 PM
Set-MpPreference -SignatureScheduleTime 12:45:00

# Set signature update catch-up interval to 5 minutes
Set-MpPreference -SignatureUpdateCatchupInterval 5

# Set signature update interval to 15 minutes
Set-MpPreference -SignatureUpdateInterval 15

# Display success message upon completion
Write-Host "Windows Security Stack has been successfully HARDENED!!" -ForegroundColor Green

Pause
