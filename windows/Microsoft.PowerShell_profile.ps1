###############################################################################
#                    __ _ _                   __  
#                   / _(_) |                 /  | 
#   _ __  _ __ ___ | |_ _| | ___   _ __  ___ `| | 
#  | '_ \| '__/ _ \|  _| | |/ _ \ | '_ \/ __| | | 
#  | |_) | | | (_) | | | | |  __/_| |_) \__ \_| |_
#  | .__/|_|  \___/|_| |_|_|\___(_) .__/|___/\___/
#  | |                            | |             
#  |_|                            |_|             
#
###############################################################################
#
# Notes:
#
# 	- Check the location of the current Powershell profile file with:
# 		> $profile
#
###############################################################################

# Import posh-git
Import-Module posh-git

# Import oh-my-posh
Import-Module oh-my-posh

# Start the default settings
Set-Prompt

# Set the desired theme for powerline
Set-Theme Agnoster


###############################################################################


# Useful shortcuts for traversing directories
function cd2 { cd ..\.. }
function cd3 { cd ..\..\.. }
function cd4 { cd ..\..\..\.. }


# Display directories and files in tree format
function lt { tree /f }

# Same as ubuntu's "ll" command
function ll { ls }

# Shortcuts to common directories
function go-docs { cd "$HOME\Documents" }
function go-pf { cd "C:\Program Files" }


###############################################################################


# Misc Commands
function whoami { (get-content env:\userdomain) + "\" + (get-content env:\username) }
function envs { dir env: } 


###############################################################################


# croc sending a file 
function croc-send {
  Param(
    [Parameter(Mandatory=$true)]
    [string]$Path
  )
  
  if (Test-Path -LiteralPath $Path) {
	croc send --code ismet-mail $Path
  } else {
    throw "INPUT ERROR: Please specify a file to croc"
  }
}


# "tail -f" a file (real-time content display)
function tail {
  Param(
    [Parameter(Mandatory=$true)]
    [string]$Path
  )
  
  if (Test-Path -LiteralPath $Path) {
	Get-Content -Path $Path -Wait
  } else {
    throw "INPUT ERROR: Please specify a file to tail"
  }

}


# Create a blank file
function touch {
  Param(
    [Parameter(Mandatory=$true)]
    [string]$Path
  )

  if (Test-Path -LiteralPath $Path) {
    (Get-Item -Path $Path).LastWriteTime = Get-Date
  } else {
    New-Item -Type File -Path $Path
  }
}


# Elevate session rights to admin
function Start-ElevatedSession {
    [CmdletBinding()]
    [Alias('super','su')]
    param(
        [Parameter(Position = 0)]
        [ValidateNotNull()]
        [scriptblock]
        $Command
    )
    $Params = @{
        FilePath    = 'pwsh.exe'
        Wait        = $true
        Verb        = 'RunAs'
    }
    if ($PSBoundParameters.ContainsKey('Command')) {
        $Params['ArgumentList'] = '-Command', $Command
    }

    Start-Process @Params
}


# Recursively list all file in current directory and sub-directories
# Does the the rough equivalent of dir /s /b. For example, dirs *.png is dir /s /b *.png
function dirs
{
    if ($args.Count -gt 0)
    {
        Get-ChildItem -Recurse -Include "$args" | Foreach-Object FullName
    }
    else
    {
        Get-ChildItem -Recurse | Foreach-Object FullName
    }
}
