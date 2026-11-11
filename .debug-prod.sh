export ARM_SUBSCRIPTION_ID="8b521544-a3c1-493d-ad92-9ee6c75a609c"

export TF_VAR_env_name="prod"
export TF_VAR_application_name="devops"

export BACKEND_RESOURCE_GROUP="rg-rajaalab-prod"
export BACKEND_STORAGE_ACCOUNT="stubcjcj7n5e"
export BACKEND_CONTAINER="tfstate"
export BACKEND_KEY=$TF_VAR_application_name-$TF_VAR_env_name

terraform init \
    -backend-config="resource_group_name=${BACKEND_RESOURCE_GROUP}" \
    -backend-config="storage_account_name=${BACKEND_STORAGE_ACCOUNT}" \
    -backend-config="container_name=${BACKEND_CONTAINER}" \
    -backend-config="key=${BACKEND_KEY}"


terraform $*

rm -rf .terraform
