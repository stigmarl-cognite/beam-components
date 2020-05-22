. $PSScriptRoot'\..\variables.ps1'
. $PSScriptRoot'\replicateVariables.ps1'
# Default variable values are picked up from the above file.
# You can override them with local variable definitions in this file.
#
#-------------------------------------------------------------------
# The CDF config file (host, api)
#
# In case you use a config file to communicate the api key (and api host)
# then set the reference here.
#
# Please note that the defaul is to use GCP Secret Manager for communicating the api key.
# If Secret Manager is unavailable (i.e. running on Flink in Azure), then use a
# config file instead.
#-------------------------------------------------------------------
#$cdfInputConfigFile = 'gs://beam-component/config/project-config-test.toml'
#$cdfOutputConfigFile = 'gs://beam-component/config/project-config-test.toml'

#-------------------------------------------------------------------
# The CDF api key and host.
#
# The api key is read from GCP Secret Manager. Add the Secret Manager reference
# to read from.
#
# CDF api host must be set if you use a dedicated tenant. For example:
# https://<myTenantHost>.cognitedata.com
#-------------------------------------------------------------------
#$cdfInputSecret = 'projectId.secretId'
#$cdfOutputSecret = 'projectId.secretId'
#$cdfInputHost = 'https://api.cognitedata.com'
#$cdfOutputHost = 'https://api.cognitedata.com'

#---------------------------------------------------------------------
# The job config file.
#---------------------------------------------------------------------
$jobConfigFile = 'gs://' + $gcpBucketPrefix + '-test/config/replicate/job-config-raw-replication.toml'

mvn compile exec:java -D exec.mainClass=com.cognite.sa.beam.replicate.ReplicateRaw -D exec.args="--cdfInputSecret=$cdfInputSecret --cdfInputHost=$cdfInputHost --cdfOutputSecret=$cdfOutputSecret --cdfOutputHost=$cdfOutputHost --jobConfigFile=$jobConfigFile"