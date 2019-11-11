# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/vince/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#CAPSLOCK remapped to ESC
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
xhost +local:root > /dev/null 2>&1

#powerlevel9k config
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator  dir dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs background_jobs battery)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_BATTERY_LEVEL_FOREGROUND=(red1 orangered1 darkorange orange1 gold1 yellow1 yellow2 greenyellow chartreuse1 chartreuse2 green1)
POWERLEVEL9K_BATTERY_STAGES=($'\uF244' $'\uF243' $'\uF242' $'\uF241' $'\uF240')

function p9k_separator() {
    if [ "$1" -eq "0" ]; then
	POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B0';
	POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B2';
    elif [ "$1" -eq "1" ]; then
	POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0C4';
	POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0C5';
    elif [ "$1" -eq "2" ]; then
	POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B8';
	POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0BE';
    elif [ "$1" -eq "3" ]; then
	POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0BC';
	POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0BA';
    elif [ "$1" -eq "4" ]; then
	POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0C0';
	POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0C2';
    elif [ "$1" -eq "5" ]; then
	POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0C6';
	POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0C7';
    elif [ "$1" -eq "6" ]; then
	POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0C8';
	POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0C9';
    fi
}
p9k_separator 0
POWERLEVEL9K_COLOR_SCHEME='dark'

POWERLEVEL9K_DIR_WRITABLE_BACKGROUND='039'
POWERLEVEL9K_DIR_WRITABLE_FOREGROUND='015'

POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='015'
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='031'
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='220'
POWERLEVEL9K_BATTERY_LOW_BACKGROUND='124'

POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='024'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='015'

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='034'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='008'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='214'

POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_ETC_ICON=''
