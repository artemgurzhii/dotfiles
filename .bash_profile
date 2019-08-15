#!/usr/bin/env bash

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

for file in ~/.{aliases,exports,functions,terminal,others}; do
  if [[ -r "$file" && -f "$file" ]]; then
    # shellcheck source=/dev/null
    source "$file";
  fi
done;
unset file;

shopt -s nocaseglob; # Case-insensitive globbing (used in pathname expansion)
shopt -s histappend; # Append to the Bash history file, rather than overwriting it
shopt -s cdspell;    # Autocorrect typos in path names when using `cd`


# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# # Add tab completion for many Bash commands
# if [ -f /usr/local/share/bash-completion/bash_completion ]; then
#   source /usr/local/share/bash-completion/bash_completion
# fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_P    REFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM     into a shell session *as a function*

export PATH="$HOME/.cargo/bin:$PATH"
