# Multi-OS Sleep or Shutdown Timer Scripts

This repository contains scripts to schedule either sleep or shutdown for macOS, Linux, and Windows devices. Each script provides a countdown and the ability to abort the planned action.

## Features
- User can choose between putting the device to sleep or shutting it down.
- Accepts one-letter answers for action choice: 's' or 'S' for sleep, 'd' or 'D' for shutdown.
- Validates user inputs and repeatedly prompts until valid input is provided.
- Allows user to specify the delay before the chosen action in minutes.
- Displays the exact time when the device will perform the chosen action.
- Provides a countdown every minute until the action time.
- Allows aborting the planned action by pressing `Ctrl+C` (macOS and Linux only).

## Usage

### macOS
1. Download the `sleep_timer_macos.zsh` file.
2. Give execute permissions to the script:
   ```sh
   chmod +x sleep_timer_macos.zsh
3. Run the script:
   ```sh
   ./sleep_timer_macos.zsh

### Linux
1. Download the `sleep_timer_linux.sh` file.
2. Give execute permissions to the script:
   ```sh
   chmod +x sleep_timer_linux.sh
3. Run the script:
   ```sh
   ./sleep_timer_linux.sh

### Windows
1. Download the `sleep_timer_windows.ps1` file.
2. Open PowerShell as an administrator.
3. If you have not done so, adjust the PowerShell execution policy to allow the execution of scripts:
   ```powershell
   Set-ExecutionPolicy RemoteSigned
4. Navigate to the directory containing the downloaded script and run it::
   ```powershell
   ./sleep_timer_windows.ps1

After you are done, set the PowerShell execution policy back to its original setting (`Set-ExecutionPolicy Restricted`) for security reasons.


## Requirements
- zsh shell for macOS
- bash shell for Linux
- PowerShell for Windows

## License
This project is licensed under the Unlicense License - see the LICENSE.md file for details.


