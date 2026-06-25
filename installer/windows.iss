; Inno Setup script — Speakeasy Serato Helper (Windows installer).
; Compiled in CI by ISCC.exe. Produces dist\SpeakeasyHelper-Setup.exe.
; Per-user install (no admin needed). UNSIGNED — SmartScreen shows
; "More info -> Run anyway" the first time until code-signing is added.

#define MyAppName "Speakeasy Serato Helper"
#define MyAppVersion "0.2.3"
#define MyAppPublisher "Speakeasy Coding"
#define MyAppExeName "speakeasy-helper.exe"

[Setup]
AppId={{7C9E6A4B-2F8D-4A1C-9E3B-5D6F8A0B1C2D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\Speakeasy Serato Helper
DefaultGroupName=Speakeasy Serato Helper
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
; Resolve Source/OutputDir from the repo root (this .iss lives in installer/).
SourceDir={#SourcePath}..
OutputDir=dist
OutputBaseFilename=SpeakeasyHelper-Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Files]
Source: "dist\speakeasy-helper.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "README.md"; DestDir: "{app}"; Flags: ignoreversion isreadme

[Icons]
Name: "{group}\Speakeasy Serato Helper"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\Speakeasy Serato Helper"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userstartup}\Speakeasy Serato Helper"; Filename: "{app}\{#MyAppExeName}"; Tasks: startupicon

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut"; GroupDescription: "Shortcuts:"
Name: "startupicon"; Description: "Start the helper automatically when I log in"; GroupDescription: "Shortcuts:"; Flags: unchecked

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Start the helper now"; Flags: postinstall nowait skipifsilent
