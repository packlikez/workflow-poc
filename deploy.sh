gcloud run deploy workflow-poc --source . --ingress internal --allow-unauthenticated

WORKFLOW_NAME=workflow
WORKFLOW_NAME=workflow-sleep
WORKFLOW_NAME=workflow-parallel
WORKFLOW_NAME=workflow-parallel-check

WORKFLOW_NAME=workflow-parallel-check
SERVICE_ACCOUNT=workflow@poc-gcp-359507.iam.gserviceaccount.com
gcloud workflows deploy $WORKFLOW_NAME --source $WORKFLOW_NAME.yml --service-account $SERVICE_ACCOUNT
