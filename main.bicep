targetScope = 'managementGroup'

@description('Required. The scope of the subscription billing.')
param subscriptionBillingScope string = ''

@description('Optional. The name of the Subscription Alias, that will be created by this module.\n\nThe string must be comprised of `a-z`, `A-Z`, `0-9`, `-`, `_` and ` ` (space). The maximum length is 63 characters.\n\n> **Not required when providing an existing Subscription ID via the parameter `existingSubscriptionId`**.\n')
param subscriptionAliasName string = 'dep-sub-hr-phoenix'

@description('Optional. The name of the subscription alias. The string must be comprised of a-z, A-Z, 0-9, - and _. The maximum length is 63 characters.\n\nThe string must be comprised of `a-z`, `A-Z`, `0-9`, `-`, `_` and ` ` (space). The maximum length is 63 characters.\n\n> The value for this parameter and the parameter named `subscriptionAliasName` are usually set to the same value for simplicity. But they can be different if required for a reason.\n\n> **Not required when providing an existing Subscription ID via the parameter `existingSubscriptionId`**.\n')
param subscriptionDisplayName string = 'dep-sub-hr-phoenix'

@description('Optional. The workload type can be either `Production` or `DevTest` and is case sensitive.\n\n> **Not required when providing an existing Subscription ID via the parameter `existingSubscriptionId`**.\n')
param subscriptionWorkload 'DevTest' | 'Production' = 'Production'

@description('Optional. An object of Tag key & value pairs to be appended to a Subscription.\n\n> **NOTE:** Tags will only be overwritten if existing tag exists with same key as provided in this parameter; values provided here win.\n')
param subscriptionTags object = {
}

@description('Optional. Whether to move the Subscription to the specified Management Group supplied in the parameter `subscriptionManagementGroupId`.\n')
param subscriptionManagementGroupAssociationEnabled bool = true

@description('Optional. The destination Management Group ID for the new Subscription that will be created by this module (or the existing one provided in the parameter `existingSubscriptionId`).\n\n**IMPORTANT:** Do not supply the display name of the Management Group. The Management Group ID forms part of the Azure Resource ID. e.g., `/providers/Microsoft.Management/managementGroups/{managementGroupId}`.\n')
param subscriptionManagementGroupId string

@description('Optional. The existing Subscription ID to use instead of creating a new one. Leave empty to create a new subscription.')
param existingSubscriptionId string = ''

module subVending 'br/public:avm/ptn/lz/sub-vending:0.3.0' = {
  params: {
    subscriptionAliasEnabled: true
    subscriptionBillingScope: subscriptionBillingScope
    subscriptionAliasName: subscriptionAliasName
    subscriptionDisplayName: subscriptionDisplayName
    subscriptionWorkload: subscriptionWorkload
    existingSubscriptionId: existingSubscriptionId
    subscriptionTags: subscriptionTags
    subscriptionManagementGroupAssociationEnabled: subscriptionManagementGroupAssociationEnabled
    subscriptionManagementGroupId: subscriptionManagementGroupId
  }
}
