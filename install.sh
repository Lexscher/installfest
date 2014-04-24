








#######################################################################################

# clear terminal screen
clear

echo "Welcome to Installfest"
sudo echo "Thanks." # PJ: capture the user's password

# Start install fest ###################################################################
# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Please register for an account on github.com if you haven't already done so."

read -p "Enter your full name: "  user_name
read -p "Github Username: "       github_name
read -p "Github Email: "          github_email
#######################################################################################


#######################################################################################

quoth_the_bard "The play's the thing..."

# The curtain rises ###################################################################

quoth_the_bard \
"Double, double toil and trouble; Fire burn, and caldron bubble." \
"--Macbeth (IV.i)"

echo "First, let's ensure your SSH keys are setup."

# SSH keys establish a secure connection between your computer and GitHub
# This script follows these instructions `https://help.github.com/articles/generating-ssh-keys`

# SSH Keygen
ssh-keygen -t rsa -C $github_email
ssh-add id_rsa
# Copy SSH key to the clipboard
pbcopy < ~/.ssh/id_rsa.pub

echo "We just copied your SSH key to the clipboard."
echo "Now we're going to visit GitHub to add the SSH key"

echo "Do the following in your browser: "
echo '- Click "SSH Keys" in the left sidebar'
echo '- Click "Add SSH key"'
echo '- Paste your key into the "Key" field'
echo '- Click "Add key"'
echo '- Confirm the action by entering your GitHub password'

pause_awhile "Press Enter. We'll be here until you get back from Github."

open https://github.com/settings/ssh

pause_awhile "Ok. Ready to Continue? Press Enter."

# download the repo for the absolute paths
if [[ ! -d $SRC_DIR ]]; then
  echo 'Downloading Installfest repo...'
  # autoupdate bootstrap file
  git clone $INSTALL_REPO $SRC_DIR
  # hide folder
  chflags hidden $SRC_DIR
else
  # update repo
  echo 'Updating repo...'
  cd $SRC_DIR
  git pull origin master
fi
#######################################################################################

# Ensure Macports and RVM aren't installed ############################################
clear
echo "            _     _                                     _ "
echo "  __ _  ___| |_  / |          ___  ___ ___ _ __   ___  / |"
echo " / _' |/ __| __| | |  _____  / __|/ __/ _ \ '_ \ / _ \ | |"
echo "| (_| | (__| |_  | | |_____| \__ \ (_|  __/ | | |  __/ | |"
echo " \__,_|\___|\__| |_|         |___/\___\___|_| |_|\___| |_|"
echo "                                                          "

quoth_the_bard \
"Woe, destruction, ruin, and decay\; the worst is death and death will have his day." \
"--Richard II (III.ii)"

pause_awhile "Removing any previous installations of RVM and Macports."
source $SCRIPTS/clean.sh
######################################################################################

# Install homebrew and formulae ######################################################
clear
echo "            _     _                                     ____  "
echo "  __ _  ___| |_  / |          ___  ___ ___ _ __   ___  |___ \ "
echo " / _' |/ __| __| | |  _____  / __|/ __/ _ \ '_ \ / _ \   __) |"
echo "| (_| | (__| |_  | | |_____| \__ \ (_|  __/ | | |  __/  / __/ "
echo " \__,_|\___|\__| |_|         |___/\___\___|_| |_|\___| |_____|"
echo "                                                              "

quoth_the_bard \
"PISTOL: The plain-song is most just: for humours do abound:
Knocks go and come; God's vassals drop and die;
And sword and shield,
In bloody field,
Doth win immortal fame.

Boy: Would I were in an alehouse in London! I would give
all my fame for a pot of ale and safety." \
"--Henry V (III.ii)"

pause_awhile "Installing our Package Manager HomeBrew"
source $SCRIPTS/brew.sh
######################################################################################

# Additional settings and bash_profile ###############################################
# FIGLET enters stage left. (homebrew installed a figlet formula to do auto ascii-text art)
# PHIL: What ho, Figlet!
# FIGLET: It is a tale. Told by an idiot, full of sound and fury. Signifying nothing.
# PHIL: Ummmmm, ok... Would you mind announcing the acts?
figlet_announces "act 1 - scene 3"

quoth_the_bard \
"I have touch'd the highest point of all my greatness;
And, from that full meridian of my glory,
I haste now to my setting: I shall fall
Like a bright exhalation in the evening,
And no man see me more." \
"--Henry VIII (III.ii)"

pause_awhile "Config settings for terminal"
source $SCRIPTS/settings.sh # PL: someday maybe these are kept in a hidden folder?
#######################################################################################

# Ruby setup ##########################################################################
figlet_announces "act 3 - scene 1"

quoth_the_bard \
"Once more the ruby-colour'd portal open'd," \
"--Venus and Adonis (1593)"

pause_awhile "Setting up RBENV our Ruby Version Manager"
source $SCRIPTS/rbenv.sh
#######################################################################################

# git setup ###########################################################################
figlet_announces "act 2 - scene 1"

quoth_the_bard \
"MARIA: This and these pearls to me sent Longaville:
The letter is too long by half a mile.

PRINCESS OF FRANCE: I think no less. Dost thou not wish in heart
The chain were longer and the letter short?" \
"--Love's Labour Lost (V.ii)"

pause_awhile "Setting up Git for Version Control"
source $SCRIPTS/git.sh
#######################################################################################

# Apps ###############################################################################
figlet_announces "act 2 - scene 2"

quoth_the_bard \
"Lend me an arm; the rest have worn me out
With several applications..." \
"--All's Well That Ends Well (I.ii)"

pause_awhile "Installing applications for development"
source $SCRIPTS/apps.sh
#######################################################################################

# Sublime setup #######################################################################
figlet_announces "act 2 - scene 3"

quoth_the_bard \
"Suit the action to the word, the word to the action,
with this special observance that you o'erstep not the modesty of nature." \
"--Hamlet (III.ii)"

pause_awhile "Configuring Sublime and Terminal"
source $SCRIPTS/sublime.sh
source $SCRIPTS/terminal.sh & # solarize terminal colors
#######################################################################################


# PJ STOPPED CHECKING HERE ...


# Gem setup ###########################################################################
figlet_announces "act 3 - scene 2"

quoth_the_bard \
"Making a couplement of proud compare,
With sun and moon, with earth and sea's rich gems,
With April's first-born flowers, and all things rare
That heaven's air in this huge rondure hems." \
"--Sonnet 21"

pause_awhile "Installing system gems"
source $SCRIPTS/gems.sh
#######################################################################################

# Install Postgres ####################################################################
figlet_announces "act 4 - scene 1"

quoth_the_bard \
"'Tis in my memory lock'd, And you yourself shall keep the key of it." \
"--Hamlet (I.iii)"

pause_awhile "Configuring Postgres"
source $SCRIPTS/postgres.sh
#######################################################################################

# Reload ##############################################################################
figlet_announces "act 4 - scene 2"

quoth_the_bard \
"Once more unto the breach, dear friends, once more;
Or close the wall up with our English dead." \
"--Henry V (III.i)"

pause_awhile "Let's run some checks to see how the install went"
source ~/.bash_profile
#######################################################################################

# heroku keys
#source $SCRIPTS/heroku.sh

# checkpoints
source $SCRIPTS/checks.sh


welcome
source ~/.bash_profile
figlet_announces "fin"

