#!/bin/bash

display_help() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -h, --help                Display this help message"
    echo "  -u URL, --url URL         Specify the URL to check"
    echo "  -f FILE, --file FILE      Read URLs from a file (one per line)"
    exit 0
}

check_files_exist() { #check the both setting and payload file.
    local file1="$1"
    local file2="$2"

    # Check if both files exist
    if [ -e "$file1" ] && [ -e "$file2" ]; then
        echo "Both files exist."
    else
        echo "setting.yaml or payload.yaml do not exist."
        exit 0
    fi
}

check_status_code() {
    local website="$1"
    local response=$(curl -s -o /dev/null -w "%{http_code}" "$website")
    echo "$response"

}


#--------------------------- MAIN -----------------------------------
main(){
    # Usage example
    setting_file="./settings.yaml"
    payload_file="./payloaad.yaml"

    check_files_exist "$setting_file" "$payload_file"
    response_code=$(check_status_code "$website")
    echo "Response code: $response_code"
}
main



