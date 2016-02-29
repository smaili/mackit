#
#    /$$$$$$$  /$$                    
#   | $$__  $$| $$                    
#   | $$  \ $$| $$  /$$$$$$  /$$   /$$
#   | $$$$$$$/| $$ |____  $$| $$  | $$
#   | $$____/ | $$  /$$$$$$$| $$  | $$
#   | $$      | $$ /$$__  $$| $$  | $$
#   | $$      | $$|  $$$$$$$|  $$$$$$$
#   |__/      |__/ \_______/ \____  $$
#                            /$$  | $$
#                           |  $$$$$$/
#                            \______/
#
#           Play
#
#     This is the main bash file for playing music.
#
#     Place this file in your home:
#     /Users/michael/
#


# check if an argument isn't given
if [ $# -eq 0 ]; then
    # if not, exit out
    echo 'Please provide a path argument'
    exit 1
fi

# replace word-based iteration with a line-based one
IFS=$'\n'

# set path and songs directory based on given argument
path=$1
songs="$path/*.mp3"

# get songs in current directory
songs=( $( ls ${songs} ) )

# start our infinite while loop
while :
do
    # shuffle
    songcount=${#songs[@]}
    for ((i=0; i<$songcount; ++i )) ;
        do
            rand=$(( RANDOM % songcount ))
            tmp=${songs[i]}
            songs[i]=${songs[rand]}
            songs[rand]=$tmp
        done

    # bind
    # Prev Song ( CTRL+\ )
    #trap 'current=${current}-1' SIGABRT
    # Next Song ( CTRL+C )
    #trap 'current=$current' SIGINT
    # Quit      ( CTRL+Z then CTRL+C )
    #trap 'current=$songcount' SIGTSTP

    # play
    current=0
    for ((; $current<$songcount; ++current )) ;
        do
            # the song
            song=${songs[current]}

            # make sure it's not ignorable
            if [[ $song == *"IGNORE"* ]]; then
                # log it
                echo 'Ignoring '${current}' '${song}

                # if it is we just continue along
                continue
            fi

            # if not we play it
            echo 'Playing '${current}' '${song}
            afplay -q 1 ${song}
        done
done
