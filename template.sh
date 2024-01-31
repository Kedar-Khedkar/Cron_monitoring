#!/bin/bash
# Usage example
bot_token="API_TOKEN"
chat_id="YOUR_CHAT_ID"
message=$(printf "*** 
🕛 Current date and time: %s" "$current_datetime***"
)
# Update and upgrade packages
#Commands to run goes here 
# for example 
# sudo apt install git
if [ $? -eq 0 ]; then
    message+=$(printf "\n 📝 Update/Upgrade done successfully \n ") #message goes heere
else
    message+=$(printf "\n ❌ Update/Upgrade Failed\n")
fi


send_telegram_sticker "$bot_token" "$chat_id" "${sticker_id['welcome']}"
send_telegram_message "$bot_token" "$chat_id" "$message" 		