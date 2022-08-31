# GCP Workflow

- Waiting for x seconds until the work is done.
- Waiting for callback to indicate the work is done.
- Parallel run

## Setting up

```
gcloud components update
REGION=asia-southeast1
gcloud config set workflows/location $REGION
gcloud config set run/region $REGION
```

```
CALLBACK_URL=
curl -X GET -H "Authorization: Bearer $(gcloud auth print-access-token)" $CALLBACK_URL
```