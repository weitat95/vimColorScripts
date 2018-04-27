#!/bin/bash
COLORSOURCE=$1
COLORNAME=$2
if [ "$COLORSOURCE" == "" ] || [ "$COLORNAME" == "" ]; then
	echo './generateScript path/to/colorsourcecode colorname'
	exit 1
fi
COLORSOURCECODE="$(cat $COLORSOURCE)"
rm "generatedScripts/""$COLORNAME""Script.sh" 2> /dev/null
cat > "generatedScripts/""$COLORNAME""Script.sh" << AOF
#!/bin/bash
NAME="$COLORNAME"
rm ~/.vimrc 2> /dev/null
cat > ~/.vimrc << EOF 
syntax on
colorscheme \$NAME
set background=dark
set number
EOF

mkdir ~/.vim 2> /dev/null
mkdir ~/.vim/colors 2> /dev/null
rm ~/.vim/colors/"\$NAME.vim" 2> /dev/null 
cat > ~/.vim/colors/"\$NAME.vim" << 'EOF'
$COLORSOURCECODE
EOF
AOF
echo 'script located in ./generatedScripts'
