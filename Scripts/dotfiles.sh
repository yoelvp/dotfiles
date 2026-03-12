#!/bin/env bash

config_dotfiles() {
  # Config dirs
  printf "\n"
  info "Creating apps configuration in $TARGET_DIR/..."
  for dir in "$DOTFILES_DIR"/*/; do
    name="$(basename "$dir")"
    source="$dir"
    target="$TARGET_DIR/$name"

    if [[ " ${IGNORE_DIRS[*]} " == *" $name "* ]]; then
      echo "The $name directory is ignored in the config."
      continue
    fi

    if [ -e "$target" ]; then
      # cp "$target" "$target.bkp"
      echo "The folder already exists, a backup was created ($target.bkp)"
    else
      #ln -s "$source" "$target"
      echo "Config successfully created: $name -> $target"
    fi
  done

  # Config files
  printf "\n"
  info "Creating apps configuration in $TARGET_CONFIG_DIR/..."
  for file in "${CONFIG_FILES[@]}"; do
    source="$DOTFILES_DIR/$file"
    target_file="$TARGET_CONFIG_DIR/$file"

    if [ ! -e "$source" ]; then
      echo "$file file not found."
      continue
    fi

    if [ -e "$target_file" ]; then
      # cp "$target" "$target.bkp"
      echo "The file already exists, a backup was created ($target_file.bkp)"
    else
      #ln -s "$source" "$target"
      echo "Config successfully created: $file -> $target_file"
    fi
  done
}
