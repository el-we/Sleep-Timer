#!/bin/zsh

# Function to validate if the input is a positive integer
function is_positive_integer() {
    [[ "$1" =~ ^[1-9][0-9]*$ ]]
}

# Ask the user for the action they want to perform and validate the input
while true; do
    read "action?Would you like to send this device to sleep (s) or shut it down (d)? "
    case "$action" in
        [sS]) action="sleep"; break;;
        [dD]) action="shutdown"; break;;
        *) echo "Invalid choice. Please enter 's' for sleep or 'd' for shutdown.";;
    esac
done

# Ask the user for the duration and validate the input
while true; do
    read "duration?In how many minutes would you like to $action this device? "
    if is_positive_integer "$duration"; then
        break
    else
        echo "Invalid input. Please enter a positive number."
    fi
done

# Calculate the sleep/shutdown time
end_time=$(date -v +${duration}M +"%H:%M:%S")
echo "This device will $action at $end_time."

# Function to handle the abort operation
trap 'echo -e "\nOperation aborted."; exit 1' SIGINT

# Countdown loop
while (( duration > 0 )); do
    sleep 60
    (( duration-- ))
    if (( duration > 0 )); then
        echo "$duration minutes left until $action."
    fi
done

# Perform the selected action
if [[ "$action" == "sleep" ]]; then
    pmset sleepnow
elif [[ "$action" == "shutdown" ]]; then
    sudo shutdown -h now
fi
