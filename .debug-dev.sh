export ARM_SUBSCRIPTION_ID="8b521544-a3c1-493d-ad92-9ee6c75a609c"

export TF_VAR_env_name="dev"
export TF_VAR_application_name="devops"

export BACKEND_RESOURCE_GROUP="rg-tfstate-dev"
export BACKEND_STORAGE_ACCOUNT="st3ue6ub01on"
export BACKEND_CONTAINER="tfstate"
export BACKEND_KEY=$TF_VAR_application_name-$TF_VAR_env_name

terraform init \
    -backend-config="resource_group_name=${BACKEND_RESOURCE_GROUP}" \
    -backend-config="storage_account_name=${BACKEND_STORAGE_ACCOUNT}" \
    -backend-config="container_name=${BACKEND_CONTAINER}" \
    -backend-config="key=${BACKEND_KEY}"

# MSYS_NO_PATHCONV=1 terraform import azurerm_resource_group.main "/subscriptions/8b521544-a3c1-493d-ad92-9ee6c75a609c/resourceGroups/rg-devops-dev"
# MSYS_NO_PATHCONV=1 terraform import azurerm_key_vault.main "/subscriptions/8b521544-a3c1-493d-ad92-9ee6c75a609c/resourceGroups/rg-devops-dev/providers/Microsoft.KeyVault/vaults/kv-devops-dev-5z2ar2"
# MSYS_NO_PATHCONV=1 terraform import azurerm_role_assignment.terraform_user "/subscriptions/8b521544-a3c1-493d-ad92-9ee6c75a609c/resourceGroups/rg-devops-dev/providers/Microsoft.KeyVault/vaults/kv-devops-dev-5z2ar2/providers/Microsoft.Authorization/roleAssignments/b524386a-38d5-c020-7e89-c3fc1973c135"
# MSYS_NO_PATHCONV=1 terraform import azurerm_monitor_diagnostic_setting.main "/subscriptions/8b521544-a3c1-493d-ad92-9ee6c75a609c/resourceGroups/rg-devops-dev/providers/Microsoft.KeyVault/vaults/kv-devops-dev-5z2ar2|diag-devops-dev-5z2ar2"

terraform $*

rm -rf .terraform

