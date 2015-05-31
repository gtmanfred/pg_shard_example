postgresql repo:
  pkg.installed:
    - sources:
      - pgdg-centos94: http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-1.noarch.rpm

postgresql package:
  pkg.latest:
    - name: postgresql94-server

  file.append:
    - name: /etc/profile.d/pgsql.sh
    - text: export PATH="/usr/pgsql-9.4/bin:$PATH"
