postgresql ssh directory:
  file.directory:
    - name: /var/lib/pgsql/.ssh
    - user: postgres
    - group: postgres
    - mode: 700
    - require:
      - sls: pgsql

postgres ssh key:
  file.managed:
    - name: /var/lib/pgsql/.ssh/id_rsa
    - user: postgres
    - group: postgres
    - mode: 600
    - makedirs: True
    - contents_pillar: postgres:ssh:private
    - require:
      - sls: pgsql

postgres authorized_keys:
  file.managed:
    - name: /var/lib/pgsql/.ssh/authorized_keys
    - user: postgres
    - group: postgres
    - mode: 600
    - makedirs: True
    - contents_pillar: postgres:ssh:public
    - require:
      - sls: pgsql
