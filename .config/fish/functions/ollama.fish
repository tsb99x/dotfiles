function ollama --description 'alias ollama=podman exec -it ollama ollama'
  podman exec -it ollama ollama $argv
end
