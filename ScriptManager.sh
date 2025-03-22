 #!/bin/bash

while true; do
    echo "=================================================="
    echo "                  SCRIPT MANAGER                  "
    echo " Made by Arkadiy, Ofir, Sagi, Ilay, Sasha and Inna"
    echo "=================================================="
    echo "1. Run Utility Script"
    echo "2. Delete by Extension"
    echo "3. Read File and Search"
    echo "4. Delete All Files in Folder"
    echo "5. Exit"
    echo "-----------------------------"
    read -p "Choose an option (1-5): " choice

    case $choice in
        1)
            chmod +x UtilityScript.sh
            ./UtilityScript.sh
            ;;
        2)
            chmod +x delete_by_extension.sh
            ./delete_by_extension.sh
            ;;
        3)
            chmod +x readfile.sh
            ./readfile.sh
            ;;
        4)
            chmod +x delete.sh
            ./delete.sh
            ;;
        5)
            break
            ;;
        *)
            echo "Invalid option. Please enter a number between 1 and 5."
            ;;
    esac

    echo
    read -p "Press Enter to return to the menu..."
    clear
done
