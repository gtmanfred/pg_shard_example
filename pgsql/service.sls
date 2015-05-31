postgresql service:
  service.running:
    - name: postgresql-9.4
    - order: last
