function package_version() {
  echo $(grep -m1 version package.json | awk -F: '{ print $2 }' | sed 's/[", ]//g')
}

function inline_image() {
  printf '\033]1338;url='"$1"';alt='"$2"'\a\n'
}

function color_text() {
  # text, color
  printf "\033[1;34m$1\033[0m\a"
}

function bold_text() {
  local text=$1
  printf "\033[1m$text\033[0m\a"
}

function remove_network() {
  local network=$1

  echo "Removing network $(bold_text $network)"
  if docker network inspect $network &> /dev/null; then
    docker network rm $network > /dev/null

    echo "...waiting until network is removed"
    while docker network inspect $network &> /dev/null; do
      echo "...waiting"
      sleep 1
    done

    echo "Removed network $(bold_text $network)"
  fi
}
