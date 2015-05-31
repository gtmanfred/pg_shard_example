ius repo:
  pkg.installed:
    - sources:
      - ius-release: http://dl.iuscommunity.org/pub/ius/stable/CentOS/7/x86_64/ius-release-1.0-13.ius.centos7.noarch.rpm

remove git:
  pkg.removed:
    - name: git
    - unless: rpm -q git2u

install git2u:
  pkg.installed:
    - name: git2u
