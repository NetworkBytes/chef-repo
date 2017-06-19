

default['pattern_sql']['download_url'] = 'http://download.microsoft.com/download/F/E/D/FEDB200F-DE2A-46D8-B661-D019DFE9D470/ENU/x64'
default['pattern_sql']['version'] = '2012'


default['sql_server']['accept_eula'] = true
default['sql_server']['product_key'] = nil
default['sql_server']['version'] = node['pattern_sql']['version']
