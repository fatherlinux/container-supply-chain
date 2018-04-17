if [ -v MYSQL_ROOT_PASSWORD ]; then
  log_info "Setting password for MySQL root user ..."
  mysql $mysql_flags <<EOSQL
  CREATE USER IF NOT EXISTS 'root'@'%';
  EOSQL
  mysql $mysql_flags <<EOSQL
  GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;
  EOSQL
fi

# Do not care what option is compulsory here, just create what is specified
if [ -v MYSQL_USER ]; then
  log_info "Creating user specified by MYSQL_USER (${MYSQL_USER}) ..."
  mysql $mysql_flags <<EOSQL
  CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
  EOSQL
fi

if [ -v MYSQL_DATABASE ]; then
  log_info "Creating database ${MYSQL_DATABASE} ..."
  mysqladmin $admin_flags create "${MYSQL_DATABASE}"
  if [ -v MYSQL_USER ]; then
    log_info "Granting privileges to user ${MYSQL_USER} for ${MYSQL_DATABASE} ..."
    mysql $mysql_flags <<EOSQL
    GRANT ALL ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%' ;
    FLUSH PRIVILEGES ;
    EOSQL
  fi
fi
