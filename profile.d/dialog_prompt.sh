#!/bin/bash

# $1 = Window title
# $2 = Prompt
dialog_prompt() {
	osascript -e \
	"tell application \"SystemUIServer\"  
		set thisvar to text returned of (display dialog \"$2\" with title \"$1\" default answer \"\" buttons {\"OK\", \"Cancel\"} default button 1 cancel button 2)  
		log thisvar
	end tell" 2>&1
}