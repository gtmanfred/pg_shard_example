postgresql.conf file:
  file.managed:
    - name: /var/lib/pgsql/9.4/data/postgresql.conf
    - source: salt://pgsql/files/postgresql.conf
    - template: jinja
    - listen_in:
      - service: postgresql service

pg_hba.conf file:
  file.append:
    - name: /var/lib/pgsql/9.4/data/pg_hba.conf
    - text: host all all 192.168.4.0/23 trust
    - listen_in:
      - service: postgresql service
