#!/bin/bash -euo pipefail

ECR_REPOSITORY=example
NEW_TAG=hoge

MANIFEST=$(
  aws ecr batch-get-image \
    --repository-name koki-sato-test \
    --image-ids imageTag=latest \
    --output json \
  | jq \
    --raw-output \
    --join-output \
    '.images[0].imageManifest'
)

aws ecr put-image --repository-name ${ECR_REPOSITORY} --image-tag ${NEW_TAG} --image-manifest "${MANIFEST}"

aws ecr describe-images --repository-name ${ECR_REPOSITORY}
