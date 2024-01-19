echo '#----------------------------- VARIABLES --------------------------------'
cat <(curl -s https://raw.githubusercontent.com/tornermarton/toolkit/master/shell/tools/variables.sh)
echo '#------------------------------ ALIASES ---------------------------------'
cat <(curl -s https://raw.githubusercontent.com/tornermarton/toolkit/master/shell/tools/aliases.sh)
echo '#----------------------------- FUNCTIONS --------------------------------'
cat <(curl -s https://raw.githubusercontent.com/tornermarton/toolkit/master/shell/tools/functions.sh)
echo '#------------------------------- TMUX -----------------------------------'
cat <(curl -s https://raw.githubusercontent.com/tornermarton/toolkit/master/shell/tools/tmux.sh)

echo '#------------------------------ BANNER ----------------------------------'
cat <(curl -s https://raw.githubusercontent.com/tornermarton/toolkit/master/shell/tools/banner.sh)

echo '#---------------------------- AUTOCOMPLETE ------------------------------'
cat <(curl -s https://raw.githubusercontent.com/tornermarton/toolkit/master/bash/tools/autocomplete.sh)
echo '#----------------------------- POWERLINE --------------------------------'
cat <(curl -s https://raw.githubusercontent.com/tornermarton/toolkit/master/bash/tools/powerline.sh)
