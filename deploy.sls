pg_setup:
  salt.state:
    - tgt: 'pg*'
    - highstate: True

master1_setup:
  salt.state:
    - tgt: 'master1*'
    - highstate: True

master2_setup:
  salt.state:
    - tgt: 'master2*'
    - highstate: True
