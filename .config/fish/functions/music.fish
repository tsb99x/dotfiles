function music --wraps="find ~/Music/ -type f -name '*.flac' -or -name '*.m4a' -or -name '*.m4v' -or -name '*.mp3' -or -name '*.opus' -print0 | xargs -0 mpv --shuffle --no-audio-display" --description "alias music=find ~/Music/ -type f -name '*.flac' -or -name '*.m4a' -or -name '*.m4v' -or -name '*.mp3' -or -name '*.opus' -print0 | xargs -0 mpv --shuffle --no-audio-display"
  find ~/Music/ -type f -name '*.flac' -or -name '*.m4a' -or -name '*.m4v' -or -name '*.mp3' -or -name '*.opus' -print0 | xargs -0 mpv --shuffle --no-audio-display $argv
end
