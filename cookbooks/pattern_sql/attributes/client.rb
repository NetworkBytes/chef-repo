
if node['kernel']['machine'] =~ /x86_64/
  case node['sql_server']['version']
  when '2012'
    default['sql_server']['native_client']['url']               = "#{node['sql_pattern']['download_url']}/sqlncli.msi"
    default['sql_server']['native_client']['checksum']          = '1364bf4c37a09ce3c87b029a2db4708f066074b1eaa22aa4e86d437b7b05203d'
    default['sql_server']['native_client']['package_name']      = 'Microsoft SQL Server 2012 Native Client'

    default['sql_server']['command_line_utils']['url']          = "#{node['sql_pattern']['download_url']}/SqlCmdLnUtils.msi"
    default['sql_server']['command_line_utils']['checksum']     = 'ad9186c1acc786c116d0520fc642f6b315c4b8b62fc589d8e2763a2da4c80347'
    default['sql_server']['command_line_utils']['package_name'] = 'Microsoft SQL Server 2012 Command Line Utilities'

    default['sql_server']['clr_types']['url']                   = "#{node['sql_pattern']['download_url']}/SQLSysClrTypes.msi"
    default['sql_server']['clr_types']['checksum']              = '674c396e9c9bf389dd21cec0780b3b4c808ff50c570fa927b07fa620db7d4537'
    default['sql_server']['clr_types']['package_name']          = 'Microsoft SQL Server System CLR Types (x64)'

    default['sql_server']['smo']['url']                         = "#{node['sql_pattern']['download_url']}/SharedManagementObjects.msi"
    default['sql_server']['smo']['checksum']                    = 'ed753d85b51e7eae381085cad3dcc0f29c0b72f014f8f8fba1ad4e0fe387ce0a'
    default['sql_server']['smo']['package_name']                = 'Microsoft SQL Server 2012 Management Objects (x64)'

    default['sql_server']['ps_extensions']['url']               = "#{node['sql_pattern']['download_url']}/PowerShellTools.MSI"
    default['sql_server']['ps_extensions']['checksum']          = '532261175cc6116439b89be476fa403737d85f2ee742f2958cf9c066bcbdeaba'
    default['sql_server']['ps_extensions']['package_name']      = 'Windows PowerShell Extensions for SQL Server 2012'
  end
end
