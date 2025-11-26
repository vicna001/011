#!/bin/bash

TOKEN="8336730611:AAFnePntlR1f_bbtPOa_5HUZQALKh1kUOT8"
CHAT_ID="8342679510"
FOLDER="/sdcard/abc"

echo "Sending all files from folder: $FOLDER"

for FILE in "$FOLDER"/*; do
    if [ -f "$FILE" ]; then
        echo "Sending file: $FILE"
        curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendDocument" \
            -F chat_id="$CHAT_ID" \
            -F document=@"$FILE"
        echo "Done."
    fi
done

echo "All files sent!"
