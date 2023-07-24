<#
.synopsis
Show free persentage under 20%(Write into the file)
.description
fisrt get ping to reach the Computer
Get Free Persentage on Drives(remote or local)


.Example
  . ./Free-Space #load Function
  
  FreeSpace (enter)
  FreeSpace -Computername localhost

 foreach ($computer in cat C:\BachtServersList.txt) {freespace "$computer"}  #Not Tested
#>






function FreeSpace {

    param( 
        [parameter(Mandatory=$true)]
        [string]$Computername
    ) 

    "$Computername ---- Free Space (percentage) ----"

    # Does the server respond to a ping (otherwise the WMI queries will fail)
    $result = Test-Connection "$Computername" -Quiet

    if ($result) {

        # Get the Disks for this computer using WMI
        $colDisks = Get-WmiObject Win32_LogicalDisk -ComputerName $Computername -Filter "DriveType = 3"

        # For each disk calculate the free space
        foreach ($disk in $colDisks) {
            if ($disk.Size -gt 0) {
                $PercentFree = [Math]::Round(($disk.FreeSpace / $disk.Size) * 100)
            } else {
                $PercentFree = 0
            }

            $Drive = $disk.DeviceID
            $OutputString = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $Computername - $Drive - $PercentFree %"

            # Display the output on the console
            Write-Host $OutputString

            # if < 20% free space, log to a file
            if ($PercentFree -le 20) {
                $OutputString | Out-File -Append -FilePath "C:\logs\Free Space.txt"
            }
        }
    }
}
