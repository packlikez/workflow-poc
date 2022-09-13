# GCP Workflow

- Waiting for x seconds until the work is done.
- Waiting for callback to indicate the work is done.
- Parallel run

## Setting up

1. Copy and run theses

```
gcloud components update
REGION=asia-southeast1
gcloud config set workflows/location $REGION
gcloud config set run/region $REGION
```

2. Deploy Cloud Run

```
CLOUDRUN_NAME=workflow-poc
gcloud run deploy $CLOUDRUN_NAME --source . --ingress internal --allow-unauthenticated
```

3. Deploy your workflow

```
WORKFLOW_NAME=workflow-parallel-check
SERVICE_ACCOUNT=workflow@poc-gcp-359507.iam.gserviceaccount.com
gcloud workflows deploy $WORKFLOW_NAME --source $WORKFLOW_NAME.yml --service-account $SERVICE_ACCOUNT
```

## In this section, we test 4 patterns of GCP workflows

1. `workflow.yml` simple workflow with switch condition combining with waiting step
2. `workflow-sleep.yml` a flow which is waiting for callback to execute the next step. Unless, it will fail with timeout
   exception.

#### Use for triggering callback features

```
CALLBACK_URL=https://workflowexecutions.googleapis.com/v1/projects/836193494603/locations/asia-southeast1/workflows/workflow-sleep/executions/52927211-5ef9-4020-a62e-a0399287d998/callbacks/9c415168-6c95-4481-9294-6f29fc6047e8_9bb00a19-4e41-4422-8060-52e224d38335
curl -X GET -H "Authorization: Bearer $(gcloud auth print-access-token)" $CALLBACK_URL
```

3. `workflow-parallel.yml` a flow that runs simple parallel
3. `workflow-parallel-check.yml` a flow that runs parallel with different completion time