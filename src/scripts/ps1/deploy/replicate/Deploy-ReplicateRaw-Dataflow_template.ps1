. $PSScriptRoot'\..\..\variables.ps1'
. $PSScriptRoot'\..\base-config.ps1'
$postfix = Get-Postfix

mvn compile exec:java -D exec.mainClass=com.cognite.sa.beam.replicate.ReplicateRaw -D exec.args="--project=$gcpProject --runner=DataFlowRunner --gcpTempLocation=$gcpBucketPrefix$postfix/temp --stagingLocation=$gcpBucketPrefix$postfix/template-stage/replicate/replicate-raw --region=europe-west1 --templateLocation=$gcpBucketPrefix$postfix/template/replicate/replicate-raw --experiments=shuffle_mode=service --maxNumWorkers=4 --experiments=enable_stackdriver_agent_metrics --workerMachineType=e2-standard-2"