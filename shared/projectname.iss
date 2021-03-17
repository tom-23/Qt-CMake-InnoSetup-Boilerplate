#define Output "."

[Setup]
AppId={THIS SHOULD BE RANDOMLY GENERATED}
AppName=Projectname
AppVersion={#AppVersion}
AppVerName=Projectname {#AppVersion}
AppPublisher=Developer
DefaultDirName={pf}\Projectname
DefaultGroupName=Projectname
AllowNoIcons=yes
LicenseFile={#Source}\LICENSE
OutputDir={#Output}
OutputBaseFilename=projectname-{#AppVersion}-setup
Compression=lzma
SolidCompression=yes
SetupIconFile=installicon.ico
WizardImageFile=logo.bmp
WizardSmallImageFile=logo-small.bmp

[Languages]
Name: en; MessagesFile: "compiler:Default.isl"

[CustomMessages]
en.ProgramFiles=Program Files

[Types]
Name: "full"; Description: "{code:GetFullInstallation}"

[Components]
Name: "program"; Description: "{cm:ProgramFiles}"; Types: full ; Flags: fixed

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; Flags: unchecked

[Files]
Source: "{#Root}\projectname.exe"; DestDir: "{app}"; Components: program; Flags: ignoreversion
Source: "{#Root}\LICENSE"; DestDir: "{app}"; Components: program; Flags: ignoreversion
Source: "{#Root}\README.md"; DestDir: "{app}"; Components: program; Flags: ignoreversion

; Qt and toolchain
Source: "{#Root}\bearer\*.dll"; DestDir: "{app}\bearer"; Components: program; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#Root}\imageformats\*.dll"; DestDir: "{app}\imageformats"; Components: program; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#Root}\platforms\*.dll"; DestDir: "{app}\platforms"; Components: program; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#Root}\styles\*.dll"; DestDir: "{app}\styles"; Components: program; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#Root}\*.dll"; DestDir: "{app}"; Components: program; Flags: ignoreversion

[Icons]
Name: "{group}\Projectname"; Filename: "{app}\projectname.exe"
Name: "{commondesktop}\Projectname"; Filename: "{app}\projectname.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\projectname.exe"; Description: "{cm:LaunchProgram,Projectname}"; Flags: nowait postinstall skipifsilent

[Code]
function GetFullInstallation(Param: string): string;
begin
	Result := SetupMessage(msgFullInstallation);
end;