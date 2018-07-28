#!/usr/bin/env bash

###########################################################
###########################################################
print_db_usage () {
  echo "Your PostgreSQL database has been setup and can be accessed on your local machine on the forwarded port (default: 15432)"
  echo "  Host: localhost"
  echo "  Port: 15432"
  echo ""
  echo "Admin access to postgres user via VM:"
  echo "  vagrant ssh"
  echo "  sudo su - postgres"
  echo ""
}


# Update package list and upgrade all packages
yum update -y

# Set up environment
mkdir -p /data/pgnode1 /data/pgnode2
chown -R postgres. /data

# Init data directory
su - postgres -c '/usr/pgsql-11/bin/initdb -k -E utf8 -D /data/pgnode1'
su - postgres -c '/usr/pgsql-11/bin/initdb -k -E utf8 -D /data/pgnode2'

# Edit postgresql.conf to change listen address to '*':
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "/data/pgnode1/postgresql.conf"
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "/data/pgnode2/postgresql.conf"

# Append to pg_hba.conf to add password auth:
echo "host    all             all             all                     md5" >> "/data/pgnode1/pg_hba.conf"
echo "host    all             all             all                     md5" >> "/data/pgnode2/pg_hba.conf"


# Tag the provision time:
date > "$PROVISIONED_ON"

echo "Successfully created PostgreSQL dev virtual machine."
echo ""
print_db_usage
