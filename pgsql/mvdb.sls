mv pgsql:
  cmd.run:
    - name: mv /var/lib/pgsql/9.4 /mnt/data/9.4
    - unless: test -d /mnt/data/9.4

  file.symlink:
    - name: /var/lib/pgsql/9.4
    - target: /mnt/data/9.4
    - user: postgres
    - group: postgres
