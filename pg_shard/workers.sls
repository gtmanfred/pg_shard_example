pg_worker_list.conf file:
  file.managed:
    - name: /var/lib/pgsql/9.4/data/pg_worker_list.conf
    - source: salt://pg_shard/files/pg_worker_list.conf
    - template: jinja
    - listen_in:
      - service: postgresql service

activate pg_shard:
  postgres_extension.present:
    - name: pg_shard
    - require:
      - service: postgresql service
