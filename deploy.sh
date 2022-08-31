gcloud run deploy workflow-poc --source . --ingress internal --allow-unauthenticated

WORKFLOW_NAME=workflow
WORKFLOW_NAME=workflow-sleep
WORKFLOW_NAME=workflow-pararell
WORKFLOW_NAME=workflow-pararell-check

WORKFLOW_NAME=workflow
SERVICE_ACCOUNT=workflow@poc-gcp-359507.iam.gserviceaccount.com
gcloud workflows deploy $WORKFLOW_NAME --source $WORKFLOW_NAME.yml --service-account $SERVICE_ACCOUNT
