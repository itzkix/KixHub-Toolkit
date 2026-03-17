Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "Apps Installer"
$form.Size = New-Object System.Drawing.Size(400,500)
$form.StartPosition = "CenterScreen"

$apps = @(
    @{Name="Discord"; URL="https://discord.com/api/download?platform=win"},
    @{Name="Steam"; URL="https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe"},
    @{Name="Epic Games"; URL="https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi"},
    @{Name="Riot Games"; URL="https://valorant.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.live.eu.exe"},
    @{Name="Spotify"; URL="https://download.scdn.co/SpotifySetup.exe"},
    @{Name="Brave"; URL="https://laptop-updates.bravesoftware.com/latest/winx64"},
    @{Name="WinRAR"; URL="https://www.rarlab.com/rar/winrar-x64-720.exe"},
    @{Name="Malwarebytes"; URL="https://downloads.malwarebytes.com/file/mb3"},
    @{Name="Paint.NET"; URL="https://github.com/paintdotnet/release/releases/download/v5.1.12/paint.net.5.1.12.install.anycpu.web.zip"},
    @{Name="OBS Studio"; URL="https://cdn-fastly.obsproject.com/downloads/OBS-Studio-29.1.3-Full-Installer-x64.exe"}
)

# Checkboxen dynamisch erstellen
$y = 20
$cbArray = @()
foreach ($app in $apps) {
    $cb = New-Object System.Windows.Forms.CheckBox
    $cb.Text = $app.Name
    $cb.Location = [System.Drawing.Point]::new(20,$y)
    $cb.Width = 350
    $form.Controls.Add($cb)
    $cbArray += $cb
    $y += 30
}

# Installieren Button
$btn = New-Object System.Windows.Forms.Button
$btn.Text = "Downloads im Browser öffnen"
$btn.Width = 200
$btn.Location = [System.Drawing.Point]::new(20,$y+10)

$btn.Add_Click({
    for ($i=0; $i -lt $cbArray.Count; $i++) {
        if ($cbArray[$i].Checked) {
            $app = $apps[$i]
            Write-Host "Öffne Download-Seite von $($app.Name)..."
            Start-Process $app.URL
        }
    }
    [System.Windows.Forms.MessageBox]::Show("Die Downloads wurden im Browser geöffnet!")
    $form.Close()
})

$form.Controls.Add($btn)
[void]$form.ShowDialog()