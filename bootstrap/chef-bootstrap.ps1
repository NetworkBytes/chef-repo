
$GitRepoUrl = "https://github.com/NetworkBytes/chef-repo"
$WorkDir    = $env:TEMP + "\chef-local"
$ClientRB   = $WorkDir + "\client.rb"
$ScriptDir  = Split-Path $script:MyInvocation.MyCommand.Path
$Git        = "git.exe"



enum LogType 
{
	ERROR
	WARN
	INFO
}

function Log {
  param(
    [Parameter(Mandatory=$true)] [string]$message,
    [Parameter(Mandatory=$false)][LogType]$LogType
  )
  switch ($message) 
  { 
    "ERROR" {echo "### ERROR ### $message"}
    "WARN"  {echo "### WARN ### $message"}
    default {echo "$message"}
   }
}


# REMOVE WORKDIR IF EXISTS
if (Test-Path $WorkDir) {
  Log("# Temp Directory Exists - Removing: $WorkDir")
  cd \
  Remove-Item -path $WorkDir -Recurse -Force| Out-Null
}

# CREATE WORKDIR
Log("# Creating Temp Directory: $WorkDir")
New-Item -Type Directory $WorkDir| Out-Null


# GIT CLONE / DOWNLOAD cookbooks
Log("# Download latest chef cookbooks")
Log("  - Executing ... $Git clone $GitRepoUrl 2>&1")
cd $WorkDir
&$Git clone -q $GitRepoUrl 2>&1
if ($lastexitcode -ne 0) {
  Log("Git Clone Failed", [LogType]::ERROR)
  exit(1) 
}


# GENERATE CLIENT.RB SETTINGS FILE
Log( "# Generating client.rb file")
$clientrb_content = @(
  "local_mode        true",
  "chef_repo_path    '$WorkDir\chef'",
  "cache_path        '$WorkDir\cache'",
  "node_name         'sql_dev'",
  "#environment       '_default'"
)
Set-Content -Path $ClientRB -Value $clientrb_content -Force



# EXECUTE CHEF RUN
Log("# Execute Chef in Zero (local-mode)")
echo "chef-client --why-run --local-mode --config $ClientRB"
&     chef-client --why-run --local-mode --config "$ClientRB"


