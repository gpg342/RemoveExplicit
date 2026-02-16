param(
    [switch]$Recurse,
    [switch]$ForceDelete
)

# Use current directory
$FullPath = Get-Location

Write-Host "Scanning: $FullPath (MP3 files only)"
if ($Recurse) { Write-Host "Including subfolders" }

$dryRun = -not $ForceDelete
if ($dryRun) {
    Write-Host "DRY RUN (default) - nothing will be deleted"
    Write-Host "Use -ForceDelete to actually delete files.`n"
}

# Get only .mp3 files
$files =
    if ($Recurse) {
        Get-ChildItem -Recurse -File -Filter *.mp3
    } else {
        Get-ChildItem -File -Filter *.mp3
    }

Write-Host ("Total MP3 files found: {0}" -f $files.Count)

$matched = 0
$deleted = 0

foreach ($f in $files) {
    # Case-insensitive match for "explicit"
    if ($f.Name -like "*explicit*") {
        $matched++

        if ($dryRun) {
            Write-Host "[DRY] Would delete: $($f.FullName)"
        } else {
            Remove-Item -LiteralPath $f.FullName -Force
            Write-Host "[DEL] Deleted: $($f.FullName)"
            $deleted++
        }
    }
}

Write-Host "`nFinished."
Write-Host "Matched: $matched"
if (-not $dryRun) { Write-Host "Deleted: $deleted" }
