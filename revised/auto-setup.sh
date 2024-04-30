echo "NOTE: We currently only support MacOS/Darwin based systems"

# Get the system type
if uname -s | grep -q Darwin; then
  echo "Running on macOS (Darwin)"
else
  echo "Currently We don't support this system. Please check the GitHub Readme for more information!"
  exit 1
fi

# Create an array of apps from the filenames in the `./apps/` dir
apps=($(ls ./apps))

echo "Current Apps are: "
for i in $apps
do
  echo $i | awk -F. '{print $1}'
done

# Get the total of commandline arguments
total_args=$#

if [ $total_args -eq 0 ]; then
  echo "Launcing all apps"
  for i in $apps
  do
    zsh ./apps/$i
  done
  exit 0
else
  for i in $@
  do
    if [[ " ${apps[@]} " =~ " $i.sh " ]]; then
      echo "Launching $i"
      zsh ./apps/$i.sh
    else
      echo "App $i not found"
    fi
  done
fi


