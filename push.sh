#!/bin/bash -euo pipefail

AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text); readonly AWS_ACCOUNT_ID
ECR_REPOSITORY=example

aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-1.amazonaws.com
docker build -t ${ECR_REPOSITORY} .
docker tag ${ECR_REPOSITORY}:latest ${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-1.amazonaws.com/${ECR_REPOSITORY}:latest
docker push ${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-1.amazonaws.com/${ECR_REPOSITORY}:latest
