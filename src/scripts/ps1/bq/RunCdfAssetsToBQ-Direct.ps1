. $PSScriptRoot'\bqVariables.ps1'
# Default variable values are picked up from the above file.
# You can override them with local variable definitions here.

# The CDF config file (host, instance/project, api)
#$cdfConfigFile = 'gs://beam-component/config/project-config-test.toml'

# The CDF config file (instance, key, host)
#$cdfSecret = 'projectId.secretId'

# The destination table in BQ
#$outputMainTable = 'dataset:stage.cdf_raw'

# BQ temp storage
#$bqTempStorage = 'gs://beam-component/temp'

# Full read. Set to _true_ for full read, _false_ for delta read
$fullRead = 'true'

mvn compile exec:java -D exec.mainClass=com.cognite.sa.beam.bq.CdfAssetsBQ -D exec.args="--cdfSecret=$cdfSecret --cdfHost=$cdfHost --bqTempStorage=$bqTempStorage --outputMainTable=$outputMainTable --fullRead=$fullRead"