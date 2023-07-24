# FreeSpace
DriveSpace PowerShell Script
Overview

The free-space.ps1 script is a PowerShell function designed to monitor the free space of logical disks on a remote computer. It calculates the percentage of 
free space for each disk and logs the information to a file. If the free space falls below 20%, the script will append the details to the log file with the date and time.
Requirements

    PowerShell with support for either CIM (Common Information Model) or WMI (Windows Management Instrumentation) cmdlets.

Usage

    Copy the FreeSpace.ps1 script to your local machine or server.

    Open a PowerShell terminal or PowerShell ISE.

    To use the script, load it into the PowerShell session by dot-sourcing the script:

    powershell

. .\Free-Space.ps1

Call the DriveSpace function with the target remote computer name as the parameter:

powershell

    Freespace -computername "RemoteComputerName"

    Replace "RemoteComputerName" with the actual name of the remote computer you want to monitor.

    The script will display the disk space information on the console. If the free space percentage is below 20%, 
    it will be logged to the file "C:\logs\Free Space.txt", along with the current date and time.

Output File

The output file will be located at "C:\logs\Free Space.txt". The script appends new entries to the beginning of the file, keeping the most recent entries at the top.

The log file format will be as follows:

- DateTime ComputerName - DriveLetter - PercentageFree 

For example:

yaml

2023-07-24 10:30:45  - Server1 - C: - 28%(if you change the code)
2023-07-24 10:30:47 - Server1 - D: - 17% 

Note

    The script requires appropriate permissions to access the remote computer and write to the log file.

    Ensure that you have enabled PowerShell script execution by running the following command (as administrator) if you haven't already:

    powershell

    Set-ExecutionPolicy RemoteSigned

License

Free.


The Free-Space.ps1 script was created by [Meysam Rajabipour].
