unsetopt auto_cd # with cdpath enabled, auto_cd gives too many false positives
cdpath=(
  $HOME/source \
  $HOME/code/work/current \
  $HOME
)

_cdpath_directories() {
  modified_in_last_days=${1:-999}
  echo "${CDPATH//:/\n}" | while read dir; do
    find -L "$dir" \
      -not -path '*/\.*' \
      -type d \
      -atime -"$modified_in_last_days" \
      -maxdepth 1
  done
}

_is_a_git_repo() {
  while read dir; do
    if [[ -d "$dir/.git" ]] || [[ "$dir" =~ .*_tree$ ]] || [[ "$dir" =~ .*-tree$ ]]; then
      basename "$dir"
    fi
  done
}

tm-select-session() {
  project=$(projects | fzf --reverse)
  if [ ! -z "$project" ]; then
    (cd "$project" && tat)
  fi
}

projects() {
  _cdpath_directories $1 | _is_a_git_repo
}

_is_a_worktree() {
  while read dir; do
    if [[ "$dir" =~ .*_tree$ ]] || [[ "$dir" =~ .*-tree$ ]]; then
      basename "$dir"
    fi
  done
}

worktree_projects() {
  _cdpath_directories $1 | _is_a_worktree
}

tm-select-worktree() {
  project=$(worktree_projects | fzf --reverse)
  if [ ! -z "$project" ]; then
    (cd "$project" && tat)
  fi
}

itree() {
  if [ -f .gitignore ]; then
    tree -I "$(cat .gitignore | paste -s -d'|' -)" -C | less -R
  else
    tree -I node_modules -C
  fi
}
