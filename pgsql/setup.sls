initdb:
  cmd.run:
    - name: /usr/pgsql-9.4/bin/postgresql94-setup initdb
    - unless: test -f /var/lib/pgsql/9.4/data/PG_VERSION
    - env:
      LC_ALL: en_US.utf8
