#!/bin/bash

#Bash script to verify file integrity (with a dialog box included!)

filename=$(whiptail --inputbox "Welcome to my checksum script! \
Please type in the file you would like to verify." 9 39 --title "Checksum Verification" 3>&1 1>&2 2>&3 )

exitstatus=$?
if [ $exitstatus = 0 ]; then
    hash=$(whiptail --title "Checksum Verification" --menu "Would you like to use SHA-256 or SHA-512 for verification?" 25 78 16 \
        "SHA-256" "Use the SHA-256 hash algorithim" \
        "SHA-512" "Use the SHA-512 hash algorithim" 3>&1 1>&2 2>&3)
    if [ -z "$hash" ]; then
        echo "No option was chosen (canceled)"
    else
        for hash in $hash; do
            case "$hash" in
            "SHA-256")
                sha256sample=$(whiptail --inputbox "Please type in the hash you want to compare your file to:" 8 39 --title "Checksum Verification" 3>&1 1>&2 2>&3 )
                if [ $exitstatus = 0 ]; then
                    echo "$sha256sample $filename" | sha256sum -c
                fi
                ;;
            "SHA-512")
                sha512sample=$(whiptail --inputbox "Please type in the hash you want to compare your file to:" 8 39 --title "Checksum Verification" 3>&1 1>&2 2>&3 )
                if [ $exitstatus = 0 ]; then
                    echo "$sha512sample $filename" | sha512sum -c
                fi
                ;;
            *)
                echo "Unsupported item $hash!" >&2
                exit 1
                ;;
            esac
        done
    fi      
else
    echo "Succesfully exited the program."
fi

