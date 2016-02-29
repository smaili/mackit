#
#    /$$   /$$ /$$$$$$$$ /$$
#   | $$$ | $$| $$_____/| $$
#   | $$$$| $$| $$      | $$
#   | $$ $$ $$| $$$$$   | $$
#   | $$  $$$$| $$__/   | $$
#   | $$\  $$$| $$      | $$
#   | $$ \  $$| $$      | $$$$$$$$
#   |__/  \__/|__/      |________/
#
#           NFL
#
#     This is the main bash file for batch downloading.
#
#     Place this file in your home:
#     /Users/michael/
#


MAX=24
FILE="b.log"
BASE="http://lt30.com/static/img"
URL="${BASE}/${FILE}"

WGET_TRIES="100"
WGET_TIMEOUT="10"
WGET_UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36"

if (( $# == 1 ));
then
    zeros="00"
    if (( $1 < 10 ));
    then
        zeros="000"
    fi
    file="${URL}.${zeros}${1}"
    # make quiet and run in background
    echo "wget -q -b -t ${WGET_TRIES} -T ${WGET_TIMEOUT} -U \"${WGET_UA}\" ${file}"
elif (( $# == 2 ));
then
    #for i in $1 $2
    for i in $(eval echo {$1..$2});
    do
        zeros="00"
        if (( $i < 10 ));
        then
            zeros="000"
        fi
        file="${URL}.${zeros}${i}"
        # make quiet and run in background
        wget -q -b -t ${WGET_TRIES} -T ${WGET_TIMEOUT} -U "${WGET_UA}" ${file}
    done
else
    for (( i = 1; i <= MAX; i++));
    do
        zeros="00"
        if (( $i < 10 ));
        then
            zeros="000"
        fi
        file="${URL}.${zeros}${i}"
        wget -t ${WGET_TRIES} -T ${WGET_TIMEOUT} -U "${WGET_UA}" ${file}
    done
fi
