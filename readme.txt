Scripts for Configuring Color Scheme for VIM editor to my prefered settings (UBUNTU): 

Vim Color Scripts


################################# WARNING ########################################################
# SCRIPTS OVERWRITES ANY EXISTING VIM CONFIGURATION (~/.vimrc ~/.vim/colors will be overwritten) #
##################################################################################################

usage:
1. Download any vim color schemes 

2. ./generateScript.sh <directoryToColorSchemeSourceCode> <nameOfColorScheme>

	./generateScript.sh colorSchemeSource/gruvbox.sh gruvbox

3. script generated in generatedScripts/
	
	./generatedScripts/gruvboxScript.sh

Copy and execute the script in a server to configure vim configurations in the server. 

-------------------------------------------------------------------------------

SCP SCRIPT 

Copy colorscripts to a server

Usage : 
	./scpscript.sh <Dir to generated ColorScript> <user@localhost> [PORT]

with port 
./scpscript.sh ./generatedScripts/papercolorScript.sh user@localhost 2222

without port 
./scpscript.sh ./generatedScripts/papercolorScripts.sh sxxxxx@ssh.xxx.exxx.ac.uk
