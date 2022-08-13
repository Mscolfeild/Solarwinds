
<#

                                                           Remove File Process

Change : it's just $path. Optionally it will delete according to the number control in the file.(Default : 10 file.)

#if : Today, by checking whether the file has been created and whether the number of files is greater than 10, it deletes it if it meets the condition, and does not delete it if it does not.
 

#>

$path = "xxxx"
$file =    Get-ChildItem -Path $path
$FirstFile = Get-ChildItem -Path $path  |Sort-Object LastWriteTime -Descending| Select-Object -First 1
$EndFile = Get-ChildItem -Path $path  |Sort-Object LastWriteTime -Descending| Select-Object -Last 1

$FirstFileCal = $FirstFile |Select-Object LastWriteTime
$EndFileCal = $EndFile| Select-Object LastWriteTime






if(($FirstFileCal.LastWriteTime.Day -eq (Get-Date).AddDays(0).Day) -and $file.Count -gt 10)
{
        
        Write-Host 'Message.State: Remove File Name : ' $EndFile
        Write-Host 'Statistic.State: 0'
        $EndFile| Remove-Item 

}
else
{
        Write-Host 'Message.State: The file did not occur today or there are less than 10 files in the folder. Please check.  Last created file : ' $FirstFile
        Write-Host 'Statistic.State: 1'
}
