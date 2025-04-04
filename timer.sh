#!/bin/bash

countdown_timer() {
    echo -n "Enter countdown time in seconds: "
    read duration
    i=$duration
    paused=false

    while [ $i -gt 0 ]; do
        if [ "$paused" = false ]; then
            echo -ne "Seconds remaining: $i \033[0K\r"
            ((i--))
        else
            echo -ne "Paused. Press 'r' to resume, 'q' to quit. \033[0K\r"
        fi

        read -n 1 -t 1 key

        if [[ $key == "p" ]]; then
            paused=true
        elif [[ $key == "r" ]]; then
            paused=false
        elif [[ $key == "q" ]]; then
            echo -e "\nCountdown aborted!"
            exit 0
        fi
    done

    echo -e "\nTime's up!"
}

stopwatch() {
    echo "Stopwatch started! Press 'p' to pause, 'r' to resume, 'q' to quit."
    seconds=0
    paused=false

    while true; do
        if [ "$paused" = false ]; then
            echo -ne "Elapsed Time: $seconds seconds \033[0K\r"
            ((seconds++))
        else
            echo -ne "Paused at $seconds seconds. Press 'r' to resume, 'q' to quit. \033[0K\r"
        fi

        read -n 1 -t 1 key

        if [[ $key == "p" ]]; then
            paused=true
        elif [[ $key == "r" ]]; then
            paused=false
        elif [[ $key == "q" ]]; then
            echo -e "\nStopwatch stopped at $seconds seconds."
            exit 0
        fi
    done
}

echo "Choose mode: (1) Countdown Timer (2) Stopwatch"
read mode

if [[ $mode == "1" ]]; then
    countdown_timer
elif [[ $mode == "2" ]]; then
    stopwatch
else
    echo "Invalid choice. Exiting..."
    exit 1
fi
