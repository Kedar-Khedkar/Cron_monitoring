#!/bin/bash
# Usage example
bot_token="API_TOKEN"
chat_id="YOUR_CHAT_ID"
message=$(printf "*** 
🕛 Current date and time: %s" "$current_datetime***"
)
# Update and upgrade packages
#Commands to run goes here 
if [ $? -eq 0 ]; then
    message+=$(printf "\n 📝 Update/Upgrade done successfully \n ") #message goes heere
else
    message+=$(printf "\n ❌ Update/Upgrade Failed\n")
fi
# For example Flatpak update
flatpak update -y
if [ $? -eq 0 ]; then
    message+=$(printf "\n 📝 Flatpak Update done successfully \n")
else
    message+=$(printf "\n ❌ Flatpak Update Failed \n")
fi
# Update Snap packages
snap refresh
if [ $? -eq 0 ]; then
    message+=$(printf "\n 📝 Snap Update done successfully \n")
else
    message+=$(printf "\n ❌ Snap Update Failed ")
fi
# Remove unnecessary packages
sudo apt-fast autoremove -y
if [ $? -eq 0 ]; then
    message+=$(printf "\n 📝 autoremove done successfully ")
else
    message+=$(printf "\n ❌ autoremove Failed \n")
fi
# Update anti virus
sudo pkill -15 -x freshclam
sudo freshclam
if [ $? -eq 0 ]; then
    message+=$(printf "\n 📝 Antivirus updated successfully ")
else
    message+=$(printf "\n ❌ Antivirus update Failed ")
fi
send_telegram_sticker "$bot_token" "$chat_id" "${sticker_id['welcome']}"
send_telegram_message "$bot_token" "$chat_id" "$message" 		