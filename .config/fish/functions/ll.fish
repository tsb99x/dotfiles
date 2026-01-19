function ll --wraps=ls --wraps='ls -lahF' --description 'alias ll=ls -lahF'
  ls -lahF $argv
end
