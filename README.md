# RemoveExplicit
PowerShell Script to parse a directory and delete those with "Explicit" in file name


A simple PowerShell script that scans the current directory for .mp3 files and deletes those containing "explicit" in the filename.

- Dry-run by default
- Optional recursive scanning
- Safe deletion (must explicitly enable)
- Processes .mp3 files only

## What It Does

- Searches the current directory
- Looks only at .mp3 files
- Matches filenames containing "explicit" (case-insensitive)
- Runs in dry-run mode by default

**Requires -ForceDelete to actually delete files**

Provides a summary at the end

**Example filename that will match:**
Taylor Swift - Wi$h Li$t [Explicit].mp3

## Usage
Open PowerShell in the target folder
Shift + Right Click → Open PowerShell window here
## Dry Run
**.\Remove-ExplicitMP3s.ps1**
## Include subfolder
**.\Remove-ExplicitMP3s.ps1 -Recurse**
## Actually Delete
**.\Remove-ExplicitMP3s.ps1 -Recurse -ForceDelete**

### If execution policy blocks it, run:

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
