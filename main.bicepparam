using './main.bicep'

param existingSubscriptionId = '3dba0f43-3f1c-442a-9f99-4b83275bc95b'
param subscriptionBillingScope = '/providers/Microsoft.Billing/billingAccounts/kubanychbek.djekishev@gmail.com'
param subscriptionAliasName = 'mj-sub-app1'
param subscriptionDisplayName = 'mj-sub-app1'
param subscriptionWorkload = 'DevTest'
param subscriptionTags = {
  workload: 'app1'
}
param subscriptionManagementGroupAssociationEnabled = false
param subscriptionManagementGroupId = 'main'

