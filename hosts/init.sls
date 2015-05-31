{% set pghosts = salt['publish.publish']('pg*', 'grains.get', 'ip4_interfaces:eth2:0') %}
{% set mhosts = salt['publish.publish']('master*', 'grains.get', 'ip4_interfaces:eth2:0') %}

{%- for host, ip in pghosts.iteritems() %}
{{host}}-hosts:
  host.present:
    - name: {{host}}
    - ip: {{ip}}
{%- endfor %}

{%- for host, ip in mhosts.iteritems() %}
{{host}}-hosts:
  host.present:
    - name: {{host}}
    - ip: {{ip}}
{%- endfor %}
