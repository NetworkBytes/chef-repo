# Tcp settings
default['sql_server']['tcp_enabled']       = true
default['sql_server']['port']              = 1433 # Keep port for backward compatibility
default['sql_server']['tcp_dynamic_ports'] = ''
# Named Pipes settings
default['sql_server']['np_enabled']        = false
# Shared Memory settings
default['sql_server']['sm_enabled']        = true
# Via settings
default['sql_server']['via_default_port']  = '0:1433'
default['sql_server']['via_enabled']       = false
default['sql_server']['via_listen_info']   = '0:1433'
