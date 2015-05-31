install gcc:
  pkg.installed:
    - names:
      - gcc
      - postgresql94-devel

make pg_shard:
  git.latest:
    - name: git://github.com/citusdata/pg_shard 
    - target: /pg_shard
    - always_fetch: True

  file.absent:
    - name: /pg_shard/pg_shard.so
    - onchanges:
      - git: make pg_shard

  cmd.run:
    - name: make
    - cwd: /pg_shard
    - env:
      - PATH: '/usr/pgsql-9.4/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin'
    - creates: /pg_shard/pg_shard.so

install pg_shard:
  cmd.run:
    - name: make install
    - cwd: /pg_shard
    - env:
      - PATH: '/usr/pgsql-9.4/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin'
    - onchanges:
      - cmd: make pg_shard
