########### Aliases ###########
#### Setting Vim as NeoVim ####
Set-Alias vvim 'vi'
Set-Alias vim 'nvim'

#### Superuser do ####
Set-Alias sudo "C:\tools\gsudo\Current\gsudo.exe"
Set-Alias gsudo "C:\tools\gsudo\Current\gsudo.exe"
Set-Alias fucking sudo

### Code Editors ###
Set-Alias v "nvim"
Set-Alias c "code"

#### Shutdown/Reboot ####
function ssn { shutdown -t 0 -s }
function sr { shutdown -t 0 -r }
function sfr { sudo shutdown -t 0 -r -fw }

#### cd ####
function cdc { Set-Location C:\Coding }
function cdcd { Set-Location C:\Coding\Dotfiles }
function cdcl { Set-Location C:\Coding\LearningCoding }

#### rm ####
function rm { Remove-Item $args -r -force }

#### touch ####
function touch { New-Item $args }


#### Package Manager ####
## Aliasing Winget ##
function wgs { sudo winget install $args --accept-source-agreements --accept-package-agreements }
function wgss { winget search $args }
function wgr { sudo winget uninstall $args }
## Aliasing Chocolatey ##
function chs { sudo choco install $args -y }
function chss { choco search $args }
function chr { sudo choco uninstall $args -y }


########### Startup Functions ###########
### Zoxide ###
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    # Initialize zoxide
    Invoke-Expression (& { (zoxide init powershell | Out-String) })

    # Safely remove built-in 'cd' alias if it exists
    if (Get-Alias cd -ErrorAction SilentlyContinue) {
        try {
            Remove-Item Alias:cd -Force -ErrorAction Stop
        }
        catch {
            Write-Warning "Could not remove existing 'cd' alias: $_"
        }
    }

    # Set custom alias
    Set-Alias cd z
}

#### Starship ####
if (Get-Command starship -ErrorAction SilentlyContinue) {
    function Invoke-Starship-TransientFunction {
        &starship module character
    }
    Invoke-Expression (& "C:\Program Files\starship\bin\starship.exe" init powershell --print-full-init | Out-String)
    Enable-TransientPrompt
}

#### Eza ####
if (Get-Command eza -ErrorAction SilentlyContinue) {
    if (Get-Alias ls -ErrorAction SilentlyContinue) {
        try {
            Remove-Item Alias:ls -Force -ErrorAction Stop
        }
        catch {
            Write-Warning "Could not remove existing 'ls' alias: $_"
        }
    }
    Set-Alias ls eza
    function l { eza -la @args }
    function ll { eza -la @args }
}
else {
    Set-Alias l ls
    Set-Alias ll ls
}


#### Yazi ####
if (Get-Command yazi -ErrorAction SilentlyContinue) {
    Set-Alias y yazi
}

#### Komorebi ####
if (Get-Command komorebic -ErrorAction SilentlyContinue) {
    $Env:KOMOREBI_CONFIG_HOME = '%USERPROFILE%\.config\komorebi'
}
