function share --wraps='python3 -m http.server --bind ::' --description 'alias share=python3 -m http.server --bind ::'
  python3 -m http.server --bind :: $argv
end
