# /bin/bash

NETANEL_URL="https://www.youtube.com/watch?v=e2kaI2b-cyw"
START_TIME="02:24"
END_TIME="04:10"


if [ ! -f "netanel.mp4" ]; then
    youtube-dl $NETANEL_URL --postprocessor-args "\-ss $START_TIME \-to $END_TIME -c copy -an netanel.mp4" 
fi

if [ "$1" == "--url" ]; then
    echo "downloading $2"
    youtube-dl -x "$2"
    echo "downloading $2"
    music_name=$(youtube-dl -x --get-filename "$2")
else
    music_name="$1"
fi
echo "using $music_name as music"

if [ -f "$music_name" ]; then
    ffmpeg -i netanel.mp4 -i "$music_name" -c:v copy -c:a aac -shortest output.mp4
else
    echo "no file named $1 found, maybe try --url"
fi
