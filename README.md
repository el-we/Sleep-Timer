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
   ´´´
3. Run the script:
   ```sh
   ./sleep_timer_macos.zsh
   ´´´

### Linux
1. Download the `sleep_timer_linux.sh` file.
2. Give execute permissions to the script:
   ```sh
   chmod +x sleep_timer_linux.sh
   ´´´
3. Run the script:
   ```sh
   ./sleep_timer_linux.sh
   ´´´

