{%- set master2ip = salt['publish.publish']('master2*', 'grains.get', 'ip4_interfaces:eth2:0')['master2.gtmanfred.com'] %}
include:
  - .archive

replication pg_hba.conf file:
  file.append:
    - name: /var/lib/pgsql/9.4/data/pg_hba.conf
    - text: host replication replication {{master2ip}}/23 trust
    - listen_in:
      - service: postgresql service

replication user:
  postgres_user.present:
    - name: replication
    - replication: True
    - login: True
    - password: password
    - encrypted: True
