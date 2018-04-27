Scripts for Configuring Color Scheme for VIM (UBUNTU): 

Use at your own risk.

#
# SCRIPTS OVERWRITES ANY EXISTING VIM SETTINGS (~/.vimrc ~/.vim/colors will be overwritten)
#

usage:
1. Download Any Vim Color Schemes 

2. ./generateScript.sh <directoryToColorSchemeSourceCode> <nameOfColorScheme>

	./generateScript.sh colorSchemeSource/gruvbox.sh gruvbox

3. script generated in generatedScripts/
	
	./generatedScripts/gruvboxScript.sh

execute to configure the server to this color

SCP SCRIPT
with port 
./scpscript.sh ./generatedScripts/papercolorScript.sh user@localhost 2222

without port 
./scpscript.sh ./generatedScripts/papercolorScripts.sh sxxxxx@ssh.xxx.exxx.ac.uk
