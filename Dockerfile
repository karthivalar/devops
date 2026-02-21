version: 0.2

env:
  variables:
    AWS_REGION: ap-south-1
    AWS_ACCOUNT_ID: 227764537166
    IMAGE_NAME: brain-tasks-app

phases:
  pre_build:
    commands:
      - aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
      - export IMAGE_REPO_NAME=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE_NAME
      - echo "Repo: $IMAGE_REPO_NAME"

  build:
    commands:
      - docker build -t $IMAGE_REPO_NAME:latest .

  post_build:
    commands:
      - docker push $IMAGE_REPO_NAME:latest
