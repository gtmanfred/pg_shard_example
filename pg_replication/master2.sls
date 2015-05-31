{%- set master1ip = salt['publish.publish']('master1*', 'grains.get', 'ip4_interfaces:eth2:0')['master1.gtmanfred.com'] %}
include:
  - .archive

{%- if not salt['service.status']('postgresql-9.4') or salt['postgres.psql_query']('select pg_is_in_recovery()', user='postgres')[0].get('pg_is_in_recovery') == 'f' %}
remove old data:
  service.dead:
    - name: postgresql-9.4
  file.absent:
    - name: /var/lib/pgsql/9.4/data

streaming setup:
  cmd.run:
    - name: su - postgres -s /bin/bash --command='/usr/bin/pg_basebackup -h master1.gtmanfred.com -D /var/lib/pgsql/9.4/data -P -U replication --xlog-method=stream -R' <<< password

  file.managed:
    - name: /var/lib/pgsql/9.4/data/recovery.conf
    - source: salt://pg_replication/files/recovery.conf
    - template: jinja
    - context:
        ip: {{ master1ip }}
    - listen_in:
      - service: postgresql service
{%- endif %}

replication pg_hba.conf file:
  file.append:
    - name: /var/lib/pgsql/9.4/data/pg_hba.conf
    - text: host replication replication {{ master1ip }}/23 trust
    - listen_in:
      - service: postgresql service
