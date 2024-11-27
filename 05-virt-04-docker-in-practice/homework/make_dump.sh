DUMP_DIR=/opt/backup
LOGS_DIR=/opt/logs

set -e
  if [ ! -e $DUMP_DIR ]; then
    sudo mkdir $DUMP_DIR
    sudo chown $USER:$USER $DUMP_DIR
  fi
  if [ ! -e $LOGS_DIR ]; then
    sudo mkdir $LOGS_DIR
    sudo chown $USER:$USER $LOGS_DIR
  fi
  sudo docker exec shvirtd-example-python-db-1 \
    sh -c 'exec mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" virtd' > "$DUMP_DIR/virtd_$(date '+%Y-%m-%d_%H:%M:%S').sql"
