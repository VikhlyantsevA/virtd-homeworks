DIR="/opt/shvirtd-example-python"

set -e
  sudo apt update
  sudo apt install git -y
  if [ -e $DIR ]; then
    sudo rm -rf $DIR
  fi
  sudo mkdir -p $DIR
  sudo chown $USER:$USER $DIR
  cd $DIR
  git clone git@github.com:VikhlyantsevA/shvirtd-example-python.git .
  git checkout dev
  sudo docker compose up -d