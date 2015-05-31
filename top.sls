base:
  '* and not salt*':
    - hosts
    - iptables
    - pgsql.ssh
    - pgsql.service

  'pg*':
    - pgsql
    - pgsql.setup
    - pgsql.config_files
    - mount
    - pgsql.mvdb
    - git
    - pg_shard

  'master1*':
    - pgsql
    - pgsql.setup
    - pgsql.config_files
    - mount
    - pgsql.mvdb
    - git
    - pg_shard
    - pg_shard.workers
    - pg_replication.master1

  'master2*':
    - pgsql
    - mount
    - git
    - pg_shard
    - pg_replication.master2
    - pgsql.mvdb
    - pgsql.config_files
