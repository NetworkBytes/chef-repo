


# override the default sql_server cookbook attributes with our defaults

override['sql_server']['install_dir']    = 'C:\Program Files\Microsoft SQL Server'
#override['sql_server']['instance_name']  = 'SQLEXPRESS'
override['sql_server']['instance_dir']   = 'C:\Program Files\Microsoft SQL Server'
override['sql_server']['shared_wow_dir'] = 'C:\Program Files (x86)\Microsoft SQL Server'
override['sql_server']['feature_list'] = 'SQLENGINE,REPLICATION,SNAC_SDK'
override['sql_server']['agent_account'] =  'NT AUTHORITY\NETWORK SERVICE'
override['sql_server']['agent_startup'] =  'Disabled'
override['sql_server']['rs_mode'] = 'FilesOnlyMode'
override['sql_server']['rs_account'] = 'NT AUTHORITY\NETWORK SERVICE'
override['sql_server']['rs_startup'] = 'Automatic'
override['sql_server']['browser_startup'] = 'Disabled'
override['sql_server']['sysadmins'] = ['Administrator']
override['sql_server']['sql_account'] = 'NT AUTHORITY\NETWORK SERVICE'
override['sql_server']['update_enabled'] = true # applies to SQL Server 2012 and later
override['sql_server']['filestream_level'] = 0
override['sql_server']['filestream_share_name'] = 'MSSQLSERVER'

override['sql_server']['server']['installer_timeout'] = 1500

# Set these to specify the URL, checksum, and package name. Otherwise, the cookbook will
# use default values based on the value of node['sql_server']['version'] and the
# server architecture (x86 or x64).
override['sql_server']['server']['url'] = nil
override['sql_server']['server']['checksum'] = nil
override['sql_server']['server']['package_name'] = nil
