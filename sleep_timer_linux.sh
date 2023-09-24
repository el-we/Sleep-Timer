#!/bin/bash

function is_positive_integer() {
    [[ "$1" =~ ^[1-9][0-9]*$ ]]
}

while true; do
    read -p "Would you like to send this device to sleep (s) or shut it down (d)? " action
    case "$action" in
        [sS]) action="sleep"; break;;
        [dD]) action="shutdown"; break;;
        *) echo "Invalid choice. Please enter 's' for sleep or 'd' for shutdown.";;
    esac
done

while true; do
    read -p "In how many minutes would you like to $action this device? " duration
    if is_positive_integer "$duration"; then
        break
    else
        echo "Invalid input. Please enter a positive number."
    fi
done

end_time=$(date -d "+${duration} minutes" +"%H:%M:%S")
echo "This device will $action at $end_time."

trap 'echo -e "\nOperation aborted."; exit 1' SIGINT

while (( duration > 0 )); do
    sleep 60
    (( duration-- ))
    if (( duration > 0 )); then
        echo "$duration minutes left until $action."
    fi
done

if [[ "$action" == "sleep" ]]; then
    systemctl suspend
elif [[ "$action" == "shutdown" ]]; then
    systemctl poweroff
fi
