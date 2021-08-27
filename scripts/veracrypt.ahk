#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#NoTrayIcon
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 1
SetControlDelay -1
 
winTitleInstall = VeraCrypt Portable 1.24
winTitleInstall1 = VeraCrypt Setup Wizard
winTitleInstall2 = VeraCrypt Portable
 
WinWait, %winTitleInstall1%, , 300
WinActivate
; BlockInput, Off

; Language selection
ControlClick, OK, %winTitleInstall1%,,,, NA

; License terms
WinWait, %winTitleInstall%, license,,
WinActivate
ControlClick, I &accept the license terms, %winTitleInstall%,,,, NA
ControlClick, &Next >, %winTitleInstall%,,,, NA
 
; Extract
WinWait, %winTitleInstall%, Extraction,,
ControlClick, &Open the destination location when finished, %winTitleInstall%,,,, NA
ControlClick, E&xtract, %winTitleInstall%,,,, NA

; Wait until the install process is finished
WinWait, %winTitleInstall2%, successfully extracted to the destination location,,
WinActivate
ControlClick, OK, %winTitleInstall2%,,,, NA
 
; Donation
WinWait, %winTitleInstall%, donation, , 10
if !(ErrorLevel) {
  Sleep, 200
  ControlClick, &Finish, %winTitleInstall%,,,, NA
}