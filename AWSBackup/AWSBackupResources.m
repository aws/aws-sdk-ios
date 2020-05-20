//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSBackupResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSBackupResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSBackupResources

+ (instancetype)sharedInstance {
    static AWSBackupResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSBackupResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2018-11-15\",\
    \"endpointPrefix\":\"backup\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"AWS Backup\",\
    \"serviceId\":\"Backup\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"backup-2018-11-15\"\
  },\
  \"operations\":{\
    \"CreateBackupPlan\":{\
      \"name\":\"CreateBackupPlan\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/backup/plans/\"\
      },\
      \"input\":{\"shape\":\"CreateBackupPlanInput\"},\
      \"output\":{\"shape\":\"CreateBackupPlanOutput\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Backup plans are documents that contain information that AWS Backup uses to schedule tasks that create recovery points of resources.</p> <p>If you call <code>CreateBackupPlan</code> with a plan that already exists, an <code>AlreadyExistsException</code> is returned.</p>\",\
      \"idempotent\":true\
    },\
    \"CreateBackupSelection\":{\
      \"name\":\"CreateBackupSelection\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/backup/plans/{backupPlanId}/selections/\"\
      },\
      \"input\":{\"shape\":\"CreateBackupSelectionInput\"},\
      \"output\":{\"shape\":\"CreateBackupSelectionOutput\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates a JSON document that specifies a set of resources to assign to a backup plan. Resources can be included by specifying patterns for a <code>ListOfTags</code> and selected <code>Resources</code>. </p> <p>For example, consider the following patterns:</p> <ul> <li> <p> <code>Resources: \\\"arn:aws:ec2:region:account-id:volume/volume-id\\\"</code> </p> </li> <li> <p> <code>ConditionKey:\\\"department\\\"</code> </p> <p> <code>ConditionValue:\\\"finance\\\"</code> </p> <p> <code>ConditionType:\\\"STRINGEQUALS\\\"</code> </p> </li> <li> <p> <code>ConditionKey:\\\"importance\\\"</code> </p> <p> <code>ConditionValue:\\\"critical\\\"</code> </p> <p> <code>ConditionType:\\\"STRINGEQUALS\\\"</code> </p> </li> </ul> <p>Using these patterns would back up all Amazon Elastic Block Store (Amazon EBS) volumes that are tagged as <code>\\\"department=finance\\\"</code>, <code>\\\"importance=critical\\\"</code>, in addition to an EBS volume with the specified volume Id.</p> <p>Resources and conditions are additive in that all resources that match the pattern are selected. This shouldn't be confused with a logical AND, where all conditions must match. The matching patterns are logically 'put together using the OR operator. In other words, all patterns that match are selected for backup.</p>\",\
      \"idempotent\":true\
    },\
    \"CreateBackupVault\":{\
      \"name\":\"CreateBackupVault\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/backup-vaults/{backupVaultName}\"\
      },\
      \"input\":{\"shape\":\"CreateBackupVaultInput\"},\
      \"output\":{\"shape\":\"CreateBackupVaultOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"AlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>Creates a logical container where backups are stored. A <code>CreateBackupVault</code> request includes a name, optionally one or more resource tags, an encryption key, and a request ID.</p> <note> <p>Sensitive data, such as passport numbers, should not be included the name of a backup vault.</p> </note>\",\
      \"idempotent\":true\
    },\
    \"DeleteBackupPlan\":{\
      \"name\":\"DeleteBackupPlan\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/backup/plans/{backupPlanId}\"\
      },\
      \"input\":{\"shape\":\"DeleteBackupPlanInput\"},\
      \"output\":{\"shape\":\"DeleteBackupPlanOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Deletes a backup plan. A backup plan can only be deleted after all associated selections of resources have been deleted. Deleting a backup plan deletes the current version of a backup plan. Previous versions, if any, will still exist.</p>\"\
    },\
    \"DeleteBackupSelection\":{\
      \"name\":\"DeleteBackupSelection\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/backup/plans/{backupPlanId}/selections/{selectionId}\"\
      },\
      \"input\":{\"shape\":\"DeleteBackupSelectionInput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the resource selection associated with a backup plan that is specified by the <code>SelectionId</code>.</p>\"\
    },\
    \"DeleteBackupVault\":{\
      \"name\":\"DeleteBackupVault\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/backup-vaults/{backupVaultName}\"\
      },\
      \"input\":{\"shape\":\"DeleteBackupVaultInput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Deletes the backup vault identified by its name. A vault can be deleted only if it is empty.</p>\"\
    },\
    \"DeleteBackupVaultAccessPolicy\":{\
      \"name\":\"DeleteBackupVaultAccessPolicy\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/backup-vaults/{backupVaultName}/access-policy\"\
      },\
      \"input\":{\"shape\":\"DeleteBackupVaultAccessPolicyInput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the policy document that manages permissions on a backup vault.</p>\",\
      \"idempotent\":true\
    },\
    \"DeleteBackupVaultNotifications\":{\
      \"name\":\"DeleteBackupVaultNotifications\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/backup-vaults/{backupVaultName}/notification-configuration\"\
      },\
      \"input\":{\"shape\":\"DeleteBackupVaultNotificationsInput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes event notifications for the specified backup vault.</p>\",\
      \"idempotent\":true\
    },\
    \"DeleteRecoveryPoint\":{\
      \"name\":\"DeleteRecoveryPoint\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}\"\
      },\
      \"input\":{\"shape\":\"DeleteRecoveryPointInput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Deletes the recovery point specified by a recovery point ID.</p>\",\
      \"idempotent\":true\
    },\
    \"DescribeBackupJob\":{\
      \"name\":\"DescribeBackupJob\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup-jobs/{backupJobId}\"\
      },\
      \"input\":{\"shape\":\"DescribeBackupJobInput\"},\
      \"output\":{\"shape\":\"DescribeBackupJobOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"DependencyFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns metadata associated with creating a backup of a resource.</p>\",\
      \"idempotent\":true\
    },\
    \"DescribeBackupVault\":{\
      \"name\":\"DescribeBackupVault\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup-vaults/{backupVaultName}\"\
      },\
      \"input\":{\"shape\":\"DescribeBackupVaultInput\"},\
      \"output\":{\"shape\":\"DescribeBackupVaultOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns metadata about a backup vault specified by its name.</p>\",\
      \"idempotent\":true\
    },\
    \"DescribeCopyJob\":{\
      \"name\":\"DescribeCopyJob\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/copy-jobs/{copyJobId}\"\
      },\
      \"input\":{\"shape\":\"DescribeCopyJobInput\"},\
      \"output\":{\"shape\":\"DescribeCopyJobOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns metadata associated with creating a copy of a resource.</p>\",\
      \"idempotent\":true\
    },\
    \"DescribeProtectedResource\":{\
      \"name\":\"DescribeProtectedResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/resources/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"DescribeProtectedResourceInput\"},\
      \"output\":{\"shape\":\"DescribeProtectedResourceOutput\"},\
      \"errors\":[\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a saved resource, including the last time it was backed up, its Amazon Resource Name (ARN), and the AWS service type of the saved resource.</p>\",\
      \"idempotent\":true\
    },\
    \"DescribeRecoveryPoint\":{\
      \"name\":\"DescribeRecoveryPoint\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}\"\
      },\
      \"input\":{\"shape\":\"DescribeRecoveryPointInput\"},\
      \"output\":{\"shape\":\"DescribeRecoveryPointOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns metadata associated with a recovery point, including ID, status, encryption, and lifecycle.</p>\",\
      \"idempotent\":true\
    },\
    \"DescribeRegionSettings\":{\
      \"name\":\"DescribeRegionSettings\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/account-settings\"\
      },\
      \"input\":{\"shape\":\"DescribeRegionSettingsInput\"},\
      \"output\":{\"shape\":\"DescribeRegionSettingsOutput\"},\
      \"errors\":[\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns the current service opt-in settings for the region. If the service has a value set to true, AWS Backup will attempt to protect that service's resources in this region, when included in an on-demand backup or scheduled backup plan. If the value is set to false for a service, AWS Backup will not attempt to protect that service's resources in this region.</p>\"\
    },\
    \"DescribeRestoreJob\":{\
      \"name\":\"DescribeRestoreJob\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/restore-jobs/{restoreJobId}\"\
      },\
      \"input\":{\"shape\":\"DescribeRestoreJobInput\"},\
      \"output\":{\"shape\":\"DescribeRestoreJobOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"DependencyFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns metadata associated with a restore job that is specified by a job ID.</p>\",\
      \"idempotent\":true\
    },\
    \"ExportBackupPlanTemplate\":{\
      \"name\":\"ExportBackupPlanTemplate\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup/plans/{backupPlanId}/toTemplate/\"\
      },\
      \"input\":{\"shape\":\"ExportBackupPlanTemplateInput\"},\
      \"output\":{\"shape\":\"ExportBackupPlanTemplateOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns the backup plan that is specified by the plan ID as a backup template.</p>\"\
    },\
    \"GetBackupPlan\":{\
      \"name\":\"GetBackupPlan\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup/plans/{backupPlanId}/\"\
      },\
      \"input\":{\"shape\":\"GetBackupPlanInput\"},\
      \"output\":{\"shape\":\"GetBackupPlanOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns the body of a backup plan in JSON format, in addition to plan metadata.</p>\",\
      \"idempotent\":true\
    },\
    \"GetBackupPlanFromJSON\":{\
      \"name\":\"GetBackupPlanFromJSON\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/backup/template/json/toPlan\"\
      },\
      \"input\":{\"shape\":\"GetBackupPlanFromJSONInput\"},\
      \"output\":{\"shape\":\"GetBackupPlanFromJSONOutput\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>Returns a valid JSON document specifying a backup plan or an error.</p>\"\
    },\
    \"GetBackupPlanFromTemplate\":{\
      \"name\":\"GetBackupPlanFromTemplate\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup/template/plans/{templateId}/toPlan\"\
      },\
      \"input\":{\"shape\":\"GetBackupPlanFromTemplateInput\"},\
      \"output\":{\"shape\":\"GetBackupPlanFromTemplateOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns the template specified by its <code>templateId</code> as a backup plan.</p>\"\
    },\
    \"GetBackupSelection\":{\
      \"name\":\"GetBackupSelection\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup/plans/{backupPlanId}/selections/{selectionId}\"\
      },\
      \"input\":{\"shape\":\"GetBackupSelectionInput\"},\
      \"output\":{\"shape\":\"GetBackupSelectionOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns selection metadata and a document in JSON format that specifies a list of resources that are associated with a backup plan.</p>\",\
      \"idempotent\":true\
    },\
    \"GetBackupVaultAccessPolicy\":{\
      \"name\":\"GetBackupVaultAccessPolicy\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup-vaults/{backupVaultName}/access-policy\"\
      },\
      \"input\":{\"shape\":\"GetBackupVaultAccessPolicyInput\"},\
      \"output\":{\"shape\":\"GetBackupVaultAccessPolicyOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns the access policy document that is associated with the named backup vault.</p>\",\
      \"idempotent\":true\
    },\
    \"GetBackupVaultNotifications\":{\
      \"name\":\"GetBackupVaultNotifications\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup-vaults/{backupVaultName}/notification-configuration\"\
      },\
      \"input\":{\"shape\":\"GetBackupVaultNotificationsInput\"},\
      \"output\":{\"shape\":\"GetBackupVaultNotificationsOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns event notifications for the specified backup vault.</p>\",\
      \"idempotent\":true\
    },\
    \"GetRecoveryPointRestoreMetadata\":{\
      \"name\":\"GetRecoveryPointRestoreMetadata\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}/restore-metadata\"\
      },\
      \"input\":{\"shape\":\"GetRecoveryPointRestoreMetadataInput\"},\
      \"output\":{\"shape\":\"GetRecoveryPointRestoreMetadataOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns a set of metadata key-value pairs that were used to create the backup.</p>\",\
      \"idempotent\":true\
    },\
    \"GetSupportedResourceTypes\":{\
      \"name\":\"GetSupportedResourceTypes\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/supported-resource-types\"\
      },\
      \"output\":{\"shape\":\"GetSupportedResourceTypesOutput\"},\
      \"errors\":[\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns the AWS resource types supported by AWS Backup.</p>\"\
    },\
    \"ListBackupJobs\":{\
      \"name\":\"ListBackupJobs\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup-jobs/\"\
      },\
      \"input\":{\"shape\":\"ListBackupJobsInput\"},\
      \"output\":{\"shape\":\"ListBackupJobsOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns metadata about your backup jobs.</p>\",\
      \"idempotent\":true\
    },\
    \"ListBackupPlanTemplates\":{\
      \"name\":\"ListBackupPlanTemplates\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup/template/plans\"\
      },\
      \"input\":{\"shape\":\"ListBackupPlanTemplatesInput\"},\
      \"output\":{\"shape\":\"ListBackupPlanTemplatesOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns metadata of your saved backup plan templates, including the template ID, name, and the creation and deletion dates.</p>\"\
    },\
    \"ListBackupPlanVersions\":{\
      \"name\":\"ListBackupPlanVersions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup/plans/{backupPlanId}/versions/\"\
      },\
      \"input\":{\"shape\":\"ListBackupPlanVersionsInput\"},\
      \"output\":{\"shape\":\"ListBackupPlanVersionsOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns version metadata of your backup plans, including Amazon Resource Names (ARNs), backup plan IDs, creation and deletion dates, plan names, and version IDs.</p>\",\
      \"idempotent\":true\
    },\
    \"ListBackupPlans\":{\
      \"name\":\"ListBackupPlans\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup/plans/\"\
      },\
      \"input\":{\"shape\":\"ListBackupPlansInput\"},\
      \"output\":{\"shape\":\"ListBackupPlansOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns metadata of your saved backup plans, including Amazon Resource Names (ARNs), plan IDs, creation and deletion dates, version IDs, plan names, and creator request IDs.</p>\",\
      \"idempotent\":true\
    },\
    \"ListBackupSelections\":{\
      \"name\":\"ListBackupSelections\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup/plans/{backupPlanId}/selections/\"\
      },\
      \"input\":{\"shape\":\"ListBackupSelectionsInput\"},\
      \"output\":{\"shape\":\"ListBackupSelectionsOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns an array containing metadata of the resources associated with the target backup plan.</p>\",\
      \"idempotent\":true\
    },\
    \"ListBackupVaults\":{\
      \"name\":\"ListBackupVaults\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup-vaults/\"\
      },\
      \"input\":{\"shape\":\"ListBackupVaultsInput\"},\
      \"output\":{\"shape\":\"ListBackupVaultsOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of recovery point storage containers along with information about them.</p>\",\
      \"idempotent\":true\
    },\
    \"ListCopyJobs\":{\
      \"name\":\"ListCopyJobs\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/copy-jobs/\"\
      },\
      \"input\":{\"shape\":\"ListCopyJobsInput\"},\
      \"output\":{\"shape\":\"ListCopyJobsOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns metadata about your copy jobs.</p>\"\
    },\
    \"ListProtectedResources\":{\
      \"name\":\"ListProtectedResources\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/resources/\"\
      },\
      \"input\":{\"shape\":\"ListProtectedResourcesInput\"},\
      \"output\":{\"shape\":\"ListProtectedResourcesOutput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns an array of resources successfully backed up by AWS Backup, including the time the resource was saved, an Amazon Resource Name (ARN) of the resource, and a resource type.</p>\",\
      \"idempotent\":true\
    },\
    \"ListRecoveryPointsByBackupVault\":{\
      \"name\":\"ListRecoveryPointsByBackupVault\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/backup-vaults/{backupVaultName}/recovery-points/\"\
      },\
      \"input\":{\"shape\":\"ListRecoveryPointsByBackupVaultInput\"},\
      \"output\":{\"shape\":\"ListRecoveryPointsByBackupVaultOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns detailed information about the recovery points stored in a backup vault.</p>\",\
      \"idempotent\":true\
    },\
    \"ListRecoveryPointsByResource\":{\
      \"name\":\"ListRecoveryPointsByResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/resources/{resourceArn}/recovery-points/\"\
      },\
      \"input\":{\"shape\":\"ListRecoveryPointsByResourceInput\"},\
      \"output\":{\"shape\":\"ListRecoveryPointsByResourceOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns detailed information about recovery points of the type specified by a resource Amazon Resource Name (ARN).</p>\",\
      \"idempotent\":true\
    },\
    \"ListRestoreJobs\":{\
      \"name\":\"ListRestoreJobs\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/restore-jobs/\"\
      },\
      \"input\":{\"shape\":\"ListRestoreJobsInput\"},\
      \"output\":{\"shape\":\"ListRestoreJobsOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of jobs that AWS Backup initiated to restore a saved resource, including metadata about the recovery process.</p>\",\
      \"idempotent\":true\
    },\
    \"ListTags\":{\
      \"name\":\"ListTags\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tags/{resourceArn}/\"\
      },\
      \"input\":{\"shape\":\"ListTagsInput\"},\
      \"output\":{\"shape\":\"ListTagsOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of key-value pairs assigned to a target recovery point, backup plan, or backup vault.</p> <note> <p> <code>ListTags</code> are currently only supported with Amazon EFS backups.</p> </note>\",\
      \"idempotent\":true\
    },\
    \"PutBackupVaultAccessPolicy\":{\
      \"name\":\"PutBackupVaultAccessPolicy\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/backup-vaults/{backupVaultName}/access-policy\"\
      },\
      \"input\":{\"shape\":\"PutBackupVaultAccessPolicyInput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Sets a resource-based policy that is used to manage access permissions on the target backup vault. Requires a backup vault name and an access policy document in JSON format.</p>\",\
      \"idempotent\":true\
    },\
    \"PutBackupVaultNotifications\":{\
      \"name\":\"PutBackupVaultNotifications\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/backup-vaults/{backupVaultName}/notification-configuration\"\
      },\
      \"input\":{\"shape\":\"PutBackupVaultNotificationsInput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Turns on notifications on a backup vault for the specified topic and events.</p>\",\
      \"idempotent\":true\
    },\
    \"StartBackupJob\":{\
      \"name\":\"StartBackupJob\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/backup-jobs\"\
      },\
      \"input\":{\"shape\":\"StartBackupJobInput\"},\
      \"output\":{\"shape\":\"StartBackupJobOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Starts a job to create a one-time backup of the specified resource.</p>\",\
      \"idempotent\":true\
    },\
    \"StartCopyJob\":{\
      \"name\":\"StartCopyJob\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/copy-jobs\"\
      },\
      \"input\":{\"shape\":\"StartCopyJobInput\"},\
      \"output\":{\"shape\":\"StartCopyJobOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Starts a job to create a one-time copy of the specified resource.</p>\",\
      \"idempotent\":true\
    },\
    \"StartRestoreJob\":{\
      \"name\":\"StartRestoreJob\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/restore-jobs\"\
      },\
      \"input\":{\"shape\":\"StartRestoreJobInput\"},\
      \"output\":{\"shape\":\"StartRestoreJobOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Recovers the saved resource identified by an Amazon Resource Name (ARN). </p> <p>If the resource ARN is included in the request, then the last complete backup of that resource is recovered. If the ARN of a recovery point is supplied, then that recovery point is restored.</p>\",\
      \"idempotent\":true\
    },\
    \"StopBackupJob\":{\
      \"name\":\"StopBackupJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/backup-jobs/{backupJobId}\"\
      },\
      \"input\":{\"shape\":\"StopBackupJobInput\"},\
      \"errors\":[\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Attempts to cancel a job to create a one-time backup of a resource.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tags/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"TagResourceInput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Assigns a set of key-value pairs to a recovery point, backup plan, or backup vault identified by an Amazon Resource Name (ARN).</p>\",\
      \"idempotent\":true\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/untag/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"UntagResourceInput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Removes a set of key-value pairs from a recovery point, backup plan, or backup vault identified by an Amazon Resource Name (ARN)</p>\",\
      \"idempotent\":true\
    },\
    \"UpdateBackupPlan\":{\
      \"name\":\"UpdateBackupPlan\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/backup/plans/{backupPlanId}\"\
      },\
      \"input\":{\"shape\":\"UpdateBackupPlanInput\"},\
      \"output\":{\"shape\":\"UpdateBackupPlanOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Replaces the body of a saved backup plan identified by its <code>backupPlanId</code> with the input document in JSON format. The new version is uniquely identified by a <code>VersionId</code>.</p>\",\
      \"idempotent\":true\
    },\
    \"UpdateRecoveryPointLifecycle\":{\
      \"name\":\"UpdateRecoveryPointLifecycle\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}\"\
      },\
      \"input\":{\"shape\":\"UpdateRecoveryPointLifecycleInput\"},\
      \"output\":{\"shape\":\"UpdateRecoveryPointLifecycleOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Sets the transition lifecycle of a recovery point.</p> <p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define. </p> <p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the âexpire after daysâ setting must be 90 days greater than the âtransition to cold after daysâ setting. The âtransition to cold after daysâ setting cannot be changed after a backup has been transitioned to cold. </p>\",\
      \"idempotent\":true\
    },\
    \"UpdateRegionSettings\":{\
      \"name\":\"UpdateRegionSettings\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/account-settings\"\
      },\
      \"input\":{\"shape\":\"UpdateRegionSettingsInput\"},\
      \"errors\":[\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"MissingParameterValueException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Updates the current service opt-in settings for the region. If the service has a value set to true, AWS Backup will attempt to protect that service's resources in this region, when included in an on-demand backup or scheduled backup plan. If the value is set to false for a service, AWS Backup will not attempt to protect that service's resources in this region.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"ARN\":{\"type\":\"string\"},\
    \"AlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"string\"},\
        \"Message\":{\"shape\":\"string\"},\
        \"CreatorRequestId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        },\
        \"Arn\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        },\
        \"Type\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        },\
        \"Context\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>The required resource already exists.</p>\",\
      \"exception\":true\
    },\
    \"BackupJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupJobId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a request to AWS Backup to back up a resource.</p>\"\
        },\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\"\
        },\
        \"BackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>\"\
        },\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\"\
        },\
        \"ResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a backup job is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"CompletionDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a job to create a backup job is completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>CompletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"BackupJobState\",\
          \"documentation\":\"<p>The current state of a resource recovery point.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A detailed message explaining the status of the job to back up a resource.</p>\"\
        },\
        \"PercentDone\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Contains an estimated percentage complete of a job at the time the job status was queried.</p>\"\
        },\
        \"BackupSizeInBytes\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size, in bytes, of a backup.</p>\"\
        },\
        \"IamRoleArn\":{\
          \"shape\":\"IAMRoleArn\",\
          \"documentation\":\"<p>Specifies the IAM role ARN used to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>\"\
        },\
        \"CreatedBy\":{\
          \"shape\":\"RecoveryPointCreator\",\
          \"documentation\":\"<p>Contains identifying information about the creation of a backup job, including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>, <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup plan used to create it.</p>\"\
        },\
        \"ExpectedCompletionDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a job to back up resources is expected to be completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>ExpectedCompletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"StartBy\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>Specifies the time in Unix format and Coordinated Universal Time (UTC) when a backup job must be started before it is canceled. The value is calculated by adding the start window to the scheduled time. So if the scheduled time were 6:00 PM and the start window is 2 hours, the <code>StartBy</code> time would be 8:00 PM on the date specified. The value of <code>StartBy</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of AWS resource to be backed up; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.</p>\"\
        },\
        \"BytesTransferred\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size in bytes transferred to a backup vault at the time that the job status was queried.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains detailed information about a backup job.</p>\"\
    },\
    \"BackupJobState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATED\",\
        \"PENDING\",\
        \"RUNNING\",\
        \"ABORTING\",\
        \"ABORTED\",\
        \"COMPLETED\",\
        \"FAILED\",\
        \"EXPIRED\"\
      ]\
    },\
    \"BackupJobsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BackupJob\"}\
    },\
    \"BackupPlan\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BackupPlanName\",\
        \"Rules\"\
      ],\
      \"members\":{\
        \"BackupPlanName\":{\
          \"shape\":\"BackupPlanName\",\
          \"documentation\":\"<p>The display name of a backup plan.</p>\"\
        },\
        \"Rules\":{\
          \"shape\":\"BackupRules\",\
          \"documentation\":\"<p>An array of <code>BackupRule</code> objects, each of which specifies a scheduled task that is used to back up a selection of resources. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains an optional backup plan display name and an array of <code>BackupRule</code> objects, each of which specifies a backup rule. Each rule in a backup plan is a separate scheduled task and can back up a different selection of AWS resources.</p>\"\
    },\
    \"BackupPlanInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BackupPlanName\",\
        \"Rules\"\
      ],\
      \"members\":{\
        \"BackupPlanName\":{\
          \"shape\":\"BackupPlanName\",\
          \"documentation\":\"<p>The display name of a backup plan.</p>\"\
        },\
        \"Rules\":{\
          \"shape\":\"BackupRulesInput\",\
          \"documentation\":\"<p>An array of <code>BackupRule</code> objects, each of which specifies a scheduled task that is used to back up a selection of resources.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains an optional backup plan display name and an array of <code>BackupRule</code> objects, each of which specifies a backup rule. Each rule in a backup plan is a separate scheduled task and can back up a different selection of AWS resources. </p>\"\
    },\
    \"BackupPlanName\":{\"type\":\"string\"},\
    \"BackupPlanTemplatesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BackupPlanTemplatesListMember\"}\
    },\
    \"BackupPlanTemplatesListMember\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupPlanTemplateId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a stored backup plan template.</p>\"\
        },\
        \"BackupPlanTemplateName\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The optional display name of a backup plan template.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object specifying metadata associated with a backup plan template.</p>\"\
    },\
    \"BackupPlanVersionsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BackupPlansListMember\"}\
    },\
    \"BackupPlansList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BackupPlansListMember\"}\
    },\
    \"BackupPlansListMember\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupPlanArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example, <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.</p>\"\
        },\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a resource backup plan is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"DeletionDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a backup plan is deleted, in Unix format and Coordinated Universal Time (UTC). The value of <code>DeletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. Version IDs cannot be edited.</p>\"\
        },\
        \"BackupPlanName\":{\
          \"shape\":\"BackupPlanName\",\
          \"documentation\":\"<p>The display name of a saved backup plan.</p>\"\
        },\
        \"CreatorRequestId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>\"\
        },\
        \"LastExecutionDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The last time a job to back up resources was executed with this rule. A date and time, in Unix format and Coordinated Universal Time (UTC). The value of <code>LastExecutionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains metadata about a backup plan.</p>\"\
    },\
    \"BackupRule\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RuleName\",\
        \"TargetBackupVaultName\"\
      ],\
      \"members\":{\
        \"RuleName\":{\
          \"shape\":\"BackupRuleName\",\
          \"documentation\":\"<p>An optional display name for a backup rule.</p>\"\
        },\
        \"TargetBackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\"\
        },\
        \"ScheduleExpression\":{\
          \"shape\":\"CronExpression\",\
          \"documentation\":\"<p>A CRON expression specifying when AWS Backup initiates a backup job.</p>\"\
        },\
        \"StartWindowMinutes\":{\
          \"shape\":\"WindowMinutes\",\
          \"documentation\":\"<p>A value in minutes after a backup is scheduled before a job will be canceled if it doesn't start successfully. This value is optional.</p>\"\
        },\
        \"CompletionWindowMinutes\":{\
          \"shape\":\"WindowMinutes\",\
          \"documentation\":\"<p>A value in minutes after a backup job is successfully started before it must be completed or it will be canceled by AWS Backup. This value is optional.</p>\"\
        },\
        \"Lifecycle\":{\
          \"shape\":\"Lifecycle\",\
          \"documentation\":\"<p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define. </p> <p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the âexpire after daysâ setting must be 90 days greater than the âtransition to cold after daysâ setting. The âtransition to cold after daysâ setting cannot be changed after a backup has been transitioned to cold. </p>\"\
        },\
        \"RecoveryPointTags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>An array of key-value pair strings that are assigned to resources that are associated with this rule when restored from backup.</p>\"\
        },\
        \"RuleId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a rule that is used to schedule the backup of a selection of resources.</p>\"\
        },\
        \"CopyActions\":{\
          \"shape\":\"CopyActions\",\
          \"documentation\":\"<p>An array of <code>CopyAction</code> objects, which contains the details of the copy operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a scheduled task used to back up a selection of resources.</p>\"\
    },\
    \"BackupRuleInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RuleName\",\
        \"TargetBackupVaultName\"\
      ],\
      \"members\":{\
        \"RuleName\":{\
          \"shape\":\"BackupRuleName\",\
          \"documentation\":\"<p>An optional display name for a backup rule.</p>\"\
        },\
        \"TargetBackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\"\
        },\
        \"ScheduleExpression\":{\
          \"shape\":\"CronExpression\",\
          \"documentation\":\"<p>A CRON expression specifying when AWS Backup initiates a backup job.</p>\"\
        },\
        \"StartWindowMinutes\":{\
          \"shape\":\"WindowMinutes\",\
          \"documentation\":\"<p>A value in minutes after a backup is scheduled before a job will be canceled if it doesn't start successfully. This value is optional.</p>\"\
        },\
        \"CompletionWindowMinutes\":{\
          \"shape\":\"WindowMinutes\",\
          \"documentation\":\"<p>A value in minutes after a backup job is successfully started before it must be completed or it will be canceled by AWS Backup. This value is optional.</p>\"\
        },\
        \"Lifecycle\":{\
          \"shape\":\"Lifecycle\",\
          \"documentation\":\"<p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup will transition and expire backups automatically according to the lifecycle that you define. </p> <p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the âexpire after daysâ setting must be 90 days greater than the âtransition to cold after daysâ setting. The âtransition to cold after daysâ setting cannot be changed after a backup has been transitioned to cold. </p>\"\
        },\
        \"RecoveryPointTags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>To help organize your resources, you can assign your own metadata to the resources that you create. Each tag is a key-value pair.</p>\"\
        },\
        \"CopyActions\":{\
          \"shape\":\"CopyActions\",\
          \"documentation\":\"<p>An array of <code>CopyAction</code> objects, which contains the details of the copy operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a scheduled task used to back up a selection of resources.</p>\"\
    },\
    \"BackupRuleName\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[a-zA-Z0-9\\\\-\\\\_\\\\.]{1,50}$\"\
    },\
    \"BackupRules\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BackupRule\"}\
    },\
    \"BackupRulesInput\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BackupRuleInput\"}\
    },\
    \"BackupSelection\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SelectionName\",\
        \"IamRoleArn\"\
      ],\
      \"members\":{\
        \"SelectionName\":{\
          \"shape\":\"BackupSelectionName\",\
          \"documentation\":\"<p>The display name of a resource selection document.</p>\"\
        },\
        \"IamRoleArn\":{\
          \"shape\":\"IAMRoleArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that AWS Backup uses to authenticate when restoring the target resource; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>\"\
        },\
        \"Resources\":{\
          \"shape\":\"ResourceArns\",\
          \"documentation\":\"<p>An array of strings that contain Amazon Resource Names (ARNs) of resources to assign to a backup plan.</p>\"\
        },\
        \"ListOfTags\":{\
          \"shape\":\"ListOfTags\",\
          \"documentation\":\"<p>An array of conditions used to specify a set of resources to assign to a backup plan; for example, <code>\\\"STRINGEQUALS\\\": {\\\"ec2:ResourceTag/Department\\\": \\\"accounting\\\"</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Used to specify a set of resources to a backup plan.</p>\"\
    },\
    \"BackupSelectionName\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[a-zA-Z0-9\\\\-\\\\_\\\\.]{1,50}$\"\
    },\
    \"BackupSelectionsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BackupSelectionsListMember\"}\
    },\
    \"BackupSelectionsListMember\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SelectionId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a request to assign a set of resources to a backup plan.</p>\"\
        },\
        \"SelectionName\":{\
          \"shape\":\"BackupSelectionName\",\
          \"documentation\":\"<p>The display name of a resource selection document.</p>\"\
        },\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a backup plan is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"CreatorRequestId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>\"\
        },\
        \"IamRoleArn\":{\
          \"shape\":\"IAMRoleArn\",\
          \"documentation\":\"<p>Specifies the IAM role Amazon Resource Name (ARN) to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains metadata about a <code>BackupSelection</code> object.</p>\"\
    },\
    \"BackupVaultEvent\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"BACKUP_JOB_STARTED\",\
        \"BACKUP_JOB_COMPLETED\",\
        \"BACKUP_JOB_SUCCESSFUL\",\
        \"BACKUP_JOB_FAILED\",\
        \"BACKUP_JOB_EXPIRED\",\
        \"RESTORE_JOB_STARTED\",\
        \"RESTORE_JOB_COMPLETED\",\
        \"RESTORE_JOB_SUCCESSFUL\",\
        \"RESTORE_JOB_FAILED\",\
        \"COPY_JOB_STARTED\",\
        \"COPY_JOB_SUCCESSFUL\",\
        \"COPY_JOB_FAILED\",\
        \"RECOVERY_POINT_MODIFIED\",\
        \"BACKUP_PLAN_CREATED\",\
        \"BACKUP_PLAN_MODIFIED\"\
      ]\
    },\
    \"BackupVaultEvents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BackupVaultEvent\"}\
    },\
    \"BackupVaultList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BackupVaultListMember\"}\
    },\
    \"BackupVaultListMember\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\"\
        },\
        \"BackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a resource backup is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"EncryptionKeyArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The server-side encryption key that is used to protect your backups; for example, <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p>\"\
        },\
        \"CreatorRequestId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>\"\
        },\
        \"NumberOfRecoveryPoints\":{\
          \"shape\":\"long\",\
          \"documentation\":\"<p>The number of recovery points that are stored in a backup vault.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains metadata about a backup vault.</p>\"\
    },\
    \"BackupVaultName\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[a-zA-Z0-9\\\\-\\\\_\\\\.]{1,50}$\"\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"CalculatedLifecycle\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MoveToColdStorageAt\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>A timestamp that specifies when to transition a recovery point to cold storage.</p>\"\
        },\
        \"DeleteAt\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>A timestamp that specifies when to delete a recovery point.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains <code>DeleteAt</code> and <code>MoveToColdStorageAt</code> timestamps, which are used to specify a lifecycle for a recovery point.</p> <p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define.</p> <p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the âexpire after daysâ setting must be 90 days greater than the âtransition to cold after daysâ setting. The âtransition to cold after daysâ setting cannot be changed after a backup has been transitioned to cold.</p>\"\
    },\
    \"Condition\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConditionType\",\
        \"ConditionKey\",\
        \"ConditionValue\"\
      ],\
      \"members\":{\
        \"ConditionType\":{\
          \"shape\":\"ConditionType\",\
          \"documentation\":\"<p>An operation, such as <code>STRINGEQUALS</code>, that is applied to a key-value pair used to filter resources in a selection.</p>\"\
        },\
        \"ConditionKey\":{\
          \"shape\":\"ConditionKey\",\
          \"documentation\":\"<p>The key in a key-value pair. For example, in <code>\\\"ec2:ResourceTag/Department\\\": \\\"accounting\\\"</code>, <code>\\\"ec2:ResourceTag/Department\\\"</code> is the key.</p>\"\
        },\
        \"ConditionValue\":{\
          \"shape\":\"ConditionValue\",\
          \"documentation\":\"<p>The value in a key-value pair. For example, in <code>\\\"ec2:ResourceTag/Department\\\": \\\"accounting\\\"</code>, <code>\\\"accounting\\\"</code> is the value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains an array of triplets made up of a condition type (such as <code>STRINGEQUALS</code>), a key, and a value. Conditions are used to filter resources in a selection that is assigned to a backup plan.</p>\"\
    },\
    \"ConditionKey\":{\"type\":\"string\"},\
    \"ConditionType\":{\
      \"type\":\"string\",\
      \"enum\":[\"STRINGEQUALS\"]\
    },\
    \"ConditionValue\":{\"type\":\"string\"},\
    \"CopyAction\":{\
      \"type\":\"structure\",\
      \"required\":[\"DestinationBackupVaultArn\"],\
      \"members\":{\
        \"Lifecycle\":{\"shape\":\"Lifecycle\"},\
        \"DestinationBackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies the destination backup vault for the copied backup. For example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of the copy operation.</p>\"\
    },\
    \"CopyActions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CopyAction\"}\
    },\
    \"CopyJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CopyJobId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a copy job.</p>\"\
        },\
        \"SourceBackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a source copy vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>. </p>\"\
        },\
        \"SourceRecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a source recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\"\
        },\
        \"DestinationBackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a destination copy vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>\"\
        },\
        \"DestinationRecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a destination recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\"\
        },\
        \"ResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The AWS resource to be copied; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a copy job is created, in Unix format and Coordinated Universal Time (UTC). The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM. </p>\"\
        },\
        \"CompletionDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a copy job is completed, in Unix format and Coordinated Universal Time (UTC). The value of CompletionDate is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM. </p>\"\
        },\
        \"State\":{\
          \"shape\":\"CopyJobState\",\
          \"documentation\":\"<p>The current state of a copy job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A detailed message explaining the status of the job to copy a resource.</p>\"\
        },\
        \"BackupSizeInBytes\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size, in bytes, of a copy job.</p>\"\
        },\
        \"IamRoleArn\":{\
          \"shape\":\"IAMRoleArn\",\
          \"documentation\":\"<p>Specifies the IAM role ARN used to copy the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>\"\
        },\
        \"CreatedBy\":{\"shape\":\"RecoveryPointCreator\"},\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of AWS resource to be copied; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains detailed information about a copy job.</p>\"\
    },\
    \"CopyJobState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATED\",\
        \"RUNNING\",\
        \"COMPLETED\",\
        \"FAILED\"\
      ]\
    },\
    \"CopyJobsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CopyJob\"}\
    },\
    \"CreateBackupPlanInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupPlan\"],\
      \"members\":{\
        \"BackupPlan\":{\
          \"shape\":\"BackupPlanInput\",\
          \"documentation\":\"<p>Specifies the body of a backup plan. Includes a <code>BackupPlanName</code> and one or more sets of <code>Rules</code>.</p>\"\
        },\
        \"BackupPlanTags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>To help organize your resources, you can assign your own metadata to the resources that you create. Each tag is a key-value pair. The specified tags are assigned to all backups created with this plan.</p>\"\
        },\
        \"CreatorRequestId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Identifies the request and allows failed requests to be retried without the risk of executing the operation twice. If the request includes a <code>CreatorRequestId</code> that matches an existing backup plan, that plan is returned. This parameter is optional.</p>\"\
        }\
      }\
    },\
    \"CreateBackupPlanOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\"\
        },\
        \"BackupPlanArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example, <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a backup plan is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. They cannot be edited.</p>\"\
        }\
      }\
    },\
    \"CreateBackupSelectionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BackupPlanId\",\
        \"BackupSelection\"\
      ],\
      \"members\":{\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies the backup plan to be associated with the selection of resources.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupPlanId\"\
        },\
        \"BackupSelection\":{\
          \"shape\":\"BackupSelection\",\
          \"documentation\":\"<p>Specifies the body of a request to assign a set of resources to a backup plan.</p>\"\
        },\
        \"CreatorRequestId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>\"\
        }\
      }\
    },\
    \"CreateBackupSelectionOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SelectionId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies the body of a request to assign a set of resources to a backup plan.</p>\"\
        },\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a backup selection is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        }\
      }\
    },\
    \"CreateBackupVaultInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupVaultName\"],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupVaultName\"\
        },\
        \"BackupVaultTags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>Metadata that you can assign to help organize the resources that you create. Each tag is a key-value pair.</p>\"\
        },\
        \"EncryptionKeyArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The server-side encryption key that is used to protect your backups; for example, <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p>\"\
        },\
        \"CreatorRequestId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>\"\
        }\
      }\
    },\
    \"CreateBackupVaultOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\"\
        },\
        \"BackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a backup vault is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        }\
      }\
    },\
    \"CronExpression\":{\"type\":\"string\"},\
    \"DeleteBackupPlanInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupPlanId\"],\
      \"members\":{\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupPlanId\"\
        }\
      }\
    },\
    \"DeleteBackupPlanOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\"\
        },\
        \"BackupPlanArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example, <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.</p>\"\
        },\
        \"DeletionDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a backup plan is deleted, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. Version Ids cannot be edited.</p>\"\
        }\
      }\
    },\
    \"DeleteBackupSelectionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BackupPlanId\",\
        \"SelectionId\"\
      ],\
      \"members\":{\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupPlanId\"\
        },\
        \"SelectionId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies the body of a request to assign a set of resources to a backup plan.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"selectionId\"\
        }\
      }\
    },\
    \"DeleteBackupVaultAccessPolicyInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupVaultName\"],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupVaultName\"\
        }\
      }\
    },\
    \"DeleteBackupVaultInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupVaultName\"],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupVaultName\"\
        }\
      }\
    },\
    \"DeleteBackupVaultNotificationsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupVaultName\"],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupVaultName\"\
        }\
      }\
    },\
    \"DeleteRecoveryPointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BackupVaultName\",\
        \"RecoveryPointArn\"\
      ],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupVaultName\"\
        },\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"recoveryPointArn\"\
        }\
      }\
    },\
    \"DependencyFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"string\"},\
        \"Message\":{\"shape\":\"string\"},\
        \"Type\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        },\
        \"Context\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>A dependent AWS service or resource returned an error to the AWS Backup service, and the action cannot be completed.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"DescribeBackupJobInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupJobId\"],\
      \"members\":{\
        \"BackupJobId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a request to AWS Backup to back up a resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupJobId\"\
        }\
      }\
    },\
    \"DescribeBackupJobOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupJobId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a request to AWS Backup to back up a resource.</p>\"\
        },\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\"\
        },\
        \"BackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>\"\
        },\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\"\
        },\
        \"ResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a saved resource. The format of the ARN depends on the resource type.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a backup job is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"CompletionDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a job to create a backup job is completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"BackupJobState\",\
          \"documentation\":\"<p>The current state of a resource recovery point.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A detailed message explaining the status of the job to back up a resource.</p>\"\
        },\
        \"PercentDone\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Contains an estimated percentage that is complete of a job at the time the job status was queried.</p>\"\
        },\
        \"BackupSizeInBytes\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size, in bytes, of a backup.</p>\"\
        },\
        \"IamRoleArn\":{\
          \"shape\":\"IAMRoleArn\",\
          \"documentation\":\"<p>Specifies the IAM role ARN used to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>\"\
        },\
        \"CreatedBy\":{\
          \"shape\":\"RecoveryPointCreator\",\
          \"documentation\":\"<p>Contains identifying information about the creation of a backup job, including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>, <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup plan that is used to create it.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of AWS resource to be backed up; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.</p>\"\
        },\
        \"BytesTransferred\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size in bytes transferred to a backup vault at the time that the job status was queried.</p>\"\
        },\
        \"ExpectedCompletionDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a job to back up resources is expected to be completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>ExpectedCompletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"StartBy\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>Specifies the time in Unix format and Coordinated Universal Time (UTC) when a backup job must be started before it is canceled. The value is calculated by adding the start window to the scheduled time. So if the scheduled time were 6:00 PM and the start window is 2 hours, the <code>StartBy</code> time would be 8:00 PM on the date specified. The value of <code>StartBy</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        }\
      }\
    },\
    \"DescribeBackupVaultInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupVaultName\"],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupVaultName\"\
        }\
      }\
    },\
    \"DescribeBackupVaultOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\"\
        },\
        \"BackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>\"\
        },\
        \"EncryptionKeyArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The server-side encryption key that is used to protect your backups; for example, <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a backup vault is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"CreatorRequestId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>\"\
        },\
        \"NumberOfRecoveryPoints\":{\
          \"shape\":\"long\",\
          \"documentation\":\"<p>The number of recovery points that are stored in a backup vault.</p>\"\
        }\
      }\
    },\
    \"DescribeCopyJobInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"CopyJobId\"],\
      \"members\":{\
        \"CopyJobId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a copy job.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"copyJobId\"\
        }\
      }\
    },\
    \"DescribeCopyJobOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CopyJob\":{\
          \"shape\":\"CopyJob\",\
          \"documentation\":\"<p>Contains detailed information about a copy job.</p>\"\
        }\
      }\
    },\
    \"DescribeProtectedResourceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        }\
      }\
    },\
    \"DescribeProtectedResourceOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of AWS resource saved as a recovery point; for example, an EBS volume or an Amazon RDS database.</p>\"\
        },\
        \"LastBackupTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a resource was last backed up, in Unix format and Coordinated Universal Time (UTC). The value of <code>LastBackupTime</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        }\
      }\
    },\
    \"DescribeRecoveryPointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BackupVaultName\",\
        \"RecoveryPointArn\"\
      ],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupVaultName\"\
        },\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"recoveryPointArn\"\
        }\
      }\
    },\
    \"DescribeRecoveryPointOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\"\
        },\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\"\
        },\
        \"BackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>\"\
        },\
        \"ResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a saved resource. The format of the ARN depends on the resource type.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of AWS resource to save as a recovery point; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.</p>\"\
        },\
        \"CreatedBy\":{\
          \"shape\":\"RecoveryPointCreator\",\
          \"documentation\":\"<p>Contains identifying information about the creation of a recovery point, including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>, <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup plan used to create it.</p>\"\
        },\
        \"IamRoleArn\":{\
          \"shape\":\"IAMRoleArn\",\
          \"documentation\":\"<p>Specifies the IAM role ARN used to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"RecoveryPointStatus\",\
          \"documentation\":\"<p>A status code specifying the state of the recovery point.</p> <note> <p>A partial status indicates that the recovery point was not successfully re-created and must be retried.</p> </note>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a recovery point is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"CompletionDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a job to create a recovery point is completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>CompletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"BackupSizeInBytes\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size, in bytes, of a backup.</p>\"\
        },\
        \"CalculatedLifecycle\":{\
          \"shape\":\"CalculatedLifecycle\",\
          \"documentation\":\"<p>A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code> and <code>MoveToColdStorageAt</code> timestamps.</p>\"\
        },\
        \"Lifecycle\":{\
          \"shape\":\"Lifecycle\",\
          \"documentation\":\"<p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define. </p> <p>Backups that are transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the âexpire after daysâ setting must be 90 days greater than the âtransition to cold after daysâ setting. The âtransition to cold after daysâ setting cannot be changed after a backup has been transitioned to cold. </p>\"\
        },\
        \"EncryptionKeyArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The server-side encryption key used to protect your backups; for example, <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p>\"\
        },\
        \"IsEncrypted\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value that is returned as <code>TRUE</code> if the specified recovery point is encrypted, or <code>FALSE</code> if the recovery point is not encrypted.</p>\"\
        },\
        \"StorageClass\":{\
          \"shape\":\"StorageClass\",\
          \"documentation\":\"<p>Specifies the storage class of the recovery point. Valid values are <code>WARM</code> or <code>COLD</code>.</p>\"\
        },\
        \"LastRestoreTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a recovery point was last restored, in Unix format and Coordinated Universal Time (UTC). The value of <code>LastRestoreTime</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        }\
      }\
    },\
    \"DescribeRegionSettingsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeRegionSettingsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceTypeOptInPreference\":{\
          \"shape\":\"ResourceTypeOptInPreference\",\
          \"documentation\":\"<p>Returns a list of all services along with the opt-in preferences in the region.</p>\"\
        }\
      }\
    },\
    \"DescribeRestoreJobInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"RestoreJobId\"],\
      \"members\":{\
        \"RestoreJobId\":{\
          \"shape\":\"RestoreJobId\",\
          \"documentation\":\"<p>Uniquely identifies the job that restores a recovery point.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"restoreJobId\"\
        }\
      }\
    },\
    \"DescribeRestoreJobOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RestoreJobId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies the job that restores a recovery point.</p>\"\
        },\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a restore job is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"CompletionDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a job to restore a recovery point is completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>CompletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"RestoreJobStatus\",\
          \"documentation\":\"<p>Status code specifying the state of the job that is initiated by AWS Backup to restore a recovery point.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A detailed message explaining the status of a job to restore a recovery point.</p>\"\
        },\
        \"PercentDone\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Contains an estimated percentage that is complete of a job at the time the job status was queried.</p>\"\
        },\
        \"BackupSizeInBytes\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size, in bytes, of the restored resource.</p>\"\
        },\
        \"IamRoleArn\":{\
          \"shape\":\"IAMRoleArn\",\
          \"documentation\":\"<p>Specifies the IAM role ARN used to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>\"\
        },\
        \"ExpectedCompletionTimeMinutes\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The amount of time in minutes that a job restoring a recovery point is expected to take.</p>\"\
        },\
        \"CreatedResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a resource whose recovery point is being restored. The format of the ARN depends on the resource type of the backed-up resource.</p>\"\
        }\
      }\
    },\
    \"ExportBackupPlanTemplateInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupPlanId\"],\
      \"members\":{\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupPlanId\"\
        }\
      }\
    },\
    \"ExportBackupPlanTemplateOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupPlanTemplateJson\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The body of a backup plan template in JSON format.</p> <note> <p>This is a signed JSON document that cannot be modified before being passed to <code>GetBackupPlanFromJSON.</code> </p> </note>\"\
        }\
      }\
    },\
    \"GetBackupPlanFromJSONInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupPlanTemplateJson\"],\
      \"members\":{\
        \"BackupPlanTemplateJson\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A customer-supplied backup plan document in JSON format.</p>\"\
        }\
      }\
    },\
    \"GetBackupPlanFromJSONOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupPlan\":{\
          \"shape\":\"BackupPlan\",\
          \"documentation\":\"<p>Specifies the body of a backup plan. Includes a <code>BackupPlanName</code> and one or more sets of <code>Rules</code>.</p>\"\
        }\
      }\
    },\
    \"GetBackupPlanFromTemplateInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupPlanTemplateId\"],\
      \"members\":{\
        \"BackupPlanTemplateId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a stored backup plan template.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"templateId\"\
        }\
      }\
    },\
    \"GetBackupPlanFromTemplateOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupPlanDocument\":{\
          \"shape\":\"BackupPlan\",\
          \"documentation\":\"<p>Returns the body of a backup plan based on the target template, including the name, rules, and backup vault of the plan.</p>\"\
        }\
      }\
    },\
    \"GetBackupPlanInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupPlanId\"],\
      \"members\":{\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupPlanId\"\
        },\
        \"VersionId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. Version IDs cannot be edited.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"versionId\"\
        }\
      }\
    },\
    \"GetBackupPlanOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupPlan\":{\
          \"shape\":\"BackupPlan\",\
          \"documentation\":\"<p>Specifies the body of a backup plan. Includes a <code>BackupPlanName</code> and one or more sets of <code>Rules</code>.</p>\"\
        },\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\"\
        },\
        \"BackupPlanArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example, <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. Version IDs cannot be edited.</p>\"\
        },\
        \"CreatorRequestId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a backup plan is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"DeletionDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a backup plan is deleted, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"LastExecutionDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The last time a job to back up resources was executed with this backup plan. A date and time, in Unix format and Coordinated Universal Time (UTC). The value of <code>LastExecutionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        }\
      }\
    },\
    \"GetBackupSelectionInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BackupPlanId\",\
        \"SelectionId\"\
      ],\
      \"members\":{\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupPlanId\"\
        },\
        \"SelectionId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies the body of a request to assign a set of resources to a backup plan.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"selectionId\"\
        }\
      }\
    },\
    \"GetBackupSelectionOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupSelection\":{\
          \"shape\":\"BackupSelection\",\
          \"documentation\":\"<p>Specifies the body of a request to assign a set of resources to a backup plan.</p>\"\
        },\
        \"SelectionId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies the body of a request to assign a set of resources to a backup plan.</p>\"\
        },\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a backup selection is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"CreatorRequestId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A unique string that identifies the request and allows failed requests to be retried without the risk of executing the operation twice.</p>\"\
        }\
      }\
    },\
    \"GetBackupVaultAccessPolicyInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupVaultName\"],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupVaultName\"\
        }\
      }\
    },\
    \"GetBackupVaultAccessPolicyOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\"\
        },\
        \"BackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>\"\
        },\
        \"Policy\":{\
          \"shape\":\"IAMPolicy\",\
          \"documentation\":\"<p>The backup vault access policy document in JSON format.</p>\"\
        }\
      }\
    },\
    \"GetBackupVaultNotificationsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupVaultName\"],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupVaultName\"\
        }\
      }\
    },\
    \"GetBackupVaultNotificationsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\"\
        },\
        \"BackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>\"\
        },\
        \"SNSTopicArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies an Amazon Simple Notification Service (Amazon SNS) topic; for example, <code>arn:aws:sns:us-west-2:111122223333:MyTopic</code>.</p>\"\
        },\
        \"BackupVaultEvents\":{\
          \"shape\":\"BackupVaultEvents\",\
          \"documentation\":\"<p>An array of events that indicate the status of jobs to back up resources to the backup vault.</p>\"\
        }\
      }\
    },\
    \"GetRecoveryPointRestoreMetadataInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BackupVaultName\",\
        \"RecoveryPointArn\"\
      ],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupVaultName\"\
        },\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"recoveryPointArn\"\
        }\
      }\
    },\
    \"GetRecoveryPointRestoreMetadataOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>\"\
        },\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\"\
        },\
        \"RestoreMetadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The set of metadata key-value pairs that describes the original configuration of the backed-up resource. These values vary depending on the service that is being restored.</p>\"\
        }\
      }\
    },\
    \"GetSupportedResourceTypesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceTypes\":{\
          \"shape\":\"ResourceTypes\",\
          \"documentation\":\"<p>Contains a string with the supported AWS resource types:</p> <ul> <li> <p> <code>EBS</code> for Amazon Elastic Block Store</p> </li> <li> <p> <code>Storage Gateway</code> for AWS Storage Gateway</p> </li> <li> <p> <code>RDS</code> for Amazon Relational Database Service</p> </li> <li> <p> <code>DDB</code> for Amazon DynamoDB</p> </li> <li> <p> <code>EFS</code> for Amazon Elastic File System</p> </li> </ul>\"\
        }\
      }\
    },\
    \"IAMPolicy\":{\"type\":\"string\"},\
    \"IAMRoleArn\":{\"type\":\"string\"},\
    \"InvalidParameterValueException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"string\"},\
        \"Message\":{\"shape\":\"string\"},\
        \"Type\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        },\
        \"Context\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that something is wrong with a parameter's value. For example, the value is out of range.</p>\",\
      \"exception\":true\
    },\
    \"InvalidRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"string\"},\
        \"Message\":{\"shape\":\"string\"},\
        \"Type\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        },\
        \"Context\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that something is wrong with the input to the request. For example, a parameter is of the wrong type.</p>\",\
      \"exception\":true\
    },\
    \"IsEnabled\":{\"type\":\"boolean\"},\
    \"Lifecycle\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MoveToColdStorageAfterDays\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>Specifies the number of days after creation that a recovery point is moved to cold storage.</p>\"\
        },\
        \"DeleteAfterDays\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>Specifies the number of days after creation that a recovery point is deleted. Must be greater than 90 days plus <code>MoveToColdStorageAfterDays</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains an array of <code>Transition</code> objects specifying how long in days before a recovery point transitions to cold storage or is deleted.</p> <p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, on the console, the âexpire after daysâ setting must be 90 days greater than the âtransition to cold after daysâ setting. The âtransition to cold after daysâ setting cannot be changed after a backup has been transitioned to cold.</p>\"\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"string\"},\
        \"Message\":{\"shape\":\"string\"},\
        \"Type\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        },\
        \"Context\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>A limit in the request has been exceeded; for example, a maximum number of items allowed in a request.</p>\",\
      \"exception\":true\
    },\
    \"ListBackupJobsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to be returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"ByResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>Returns only backup jobs that match the specified resource Amazon Resource Name (ARN).</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"ByState\":{\
          \"shape\":\"BackupJobState\",\
          \"documentation\":\"<p>Returns only backup jobs that are in the specified state.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"state\"\
        },\
        \"ByBackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>Returns only backup jobs that will be stored in the specified backup vault. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"backupVaultName\"\
        },\
        \"ByCreatedBefore\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>Returns only backup jobs that were created before the specified date.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"createdBefore\"\
        },\
        \"ByCreatedAfter\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>Returns only backup jobs that were created after the specified date.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"createdAfter\"\
        },\
        \"ByResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>Returns only backup jobs for the specified resources:</p> <ul> <li> <p> <code>DynamoDB</code> for Amazon DynamoDB</p> </li> <li> <p> <code>EBS</code> for Amazon Elastic Block Store</p> </li> <li> <p> <code>EFS</code> for Amazon Elastic File System</p> </li> <li> <p> <code>RDS</code> for Amazon Relational Database Service</p> </li> <li> <p> <code>Storage Gateway</code> for AWS Storage Gateway</p> </li> </ul>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceType\"\
        }\
      }\
    },\
    \"ListBackupJobsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupJobs\":{\
          \"shape\":\"BackupJobsList\",\
          \"documentation\":\"<p>An array of structures containing metadata about your backup jobs returned in JSON format.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\"\
        }\
      }\
    },\
    \"ListBackupPlanTemplatesInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to be returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListBackupPlanTemplatesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\"\
        },\
        \"BackupPlanTemplatesList\":{\
          \"shape\":\"BackupPlanTemplatesList\",\
          \"documentation\":\"<p>An array of template list items containing metadata about your saved templates.</p>\"\
        }\
      }\
    },\
    \"ListBackupPlanVersionsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupPlanId\"],\
      \"members\":{\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupPlanId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to be returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListBackupPlanVersionsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\"\
        },\
        \"BackupPlanVersionsList\":{\
          \"shape\":\"BackupPlanVersionsList\",\
          \"documentation\":\"<p>An array of version list items containing metadata about your backup plans.</p>\"\
        }\
      }\
    },\
    \"ListBackupPlansInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to be returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"IncludeDeleted\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>A Boolean value with a default value of <code>FALSE</code> that returns deleted backup plans when set to <code>TRUE</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"includeDeleted\"\
        }\
      }\
    },\
    \"ListBackupPlansOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\"\
        },\
        \"BackupPlansList\":{\
          \"shape\":\"BackupPlansList\",\
          \"documentation\":\"<p>An array of backup plan list items containing metadata about your saved backup plans.</p>\"\
        }\
      }\
    },\
    \"ListBackupSelectionsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupPlanId\"],\
      \"members\":{\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupPlanId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to be returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListBackupSelectionsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\"\
        },\
        \"BackupSelectionsList\":{\
          \"shape\":\"BackupSelectionsList\",\
          \"documentation\":\"<p>An array of backup selection list items containing metadata about each resource in the list.</p>\"\
        }\
      }\
    },\
    \"ListBackupVaultsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to be returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListBackupVaultsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupVaultList\":{\
          \"shape\":\"BackupVaultList\",\
          \"documentation\":\"<p>An array of backup vault list members containing vault metadata, including Amazon Resource Name (ARN), display name, creation date, number of saved recovery points, and encryption information if the resources saved in the backup vault are encrypted.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\"\
        }\
      }\
    },\
    \"ListCopyJobsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return maxResults number of items, NextToken allows you to return more items in your list starting at the location pointed to by the next token. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to be returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"ByResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>Returns only copy jobs that match the specified resource Amazon Resource Name (ARN). </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"ByState\":{\
          \"shape\":\"CopyJobState\",\
          \"documentation\":\"<p>Returns only copy jobs that are in the specified state.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"state\"\
        },\
        \"ByCreatedBefore\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>Returns only copy jobs that were created before the specified date.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"createdBefore\"\
        },\
        \"ByCreatedAfter\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>Returns only copy jobs that were created after the specified date.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"createdAfter\"\
        },\
        \"ByResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>Returns only backup jobs for the specified resources:</p> <ul> <li> <p> <code>EBS</code> for Amazon Elastic Block Store</p> </li> <li> <p> <code>EFS</code> for Amazon Elastic File System</p> </li> <li> <p> <code>RDS</code> for Amazon Relational Database Service</p> </li> <li> <p> <code>Storage Gateway</code> for AWS Storage Gateway</p> </li> </ul>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceType\"\
        },\
        \"ByDestinationVaultArn\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a source backup vault to copy from; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"destinationVaultArn\"\
        }\
      }\
    },\
    \"ListCopyJobsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CopyJobs\":{\
          \"shape\":\"CopyJobsList\",\
          \"documentation\":\"<p>An array of structures containing metadata about your copy jobs returned in JSON format. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return maxResults number of items, NextToken allows you to return more items in your list starting at the location pointed to by the next token. </p>\"\
        }\
      }\
    },\
    \"ListOfTags\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Condition\"}\
    },\
    \"ListProtectedResourcesInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to be returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListProtectedResourcesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Results\":{\
          \"shape\":\"ProtectedResourcesList\",\
          \"documentation\":\"<p>An array of resources successfully backed up by AWS Backup including the time the resource was saved, an Amazon Resource Name (ARN) of the resource, and a resource type.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\"\
        }\
      }\
    },\
    \"ListRecoveryPointsByBackupVaultInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupVaultName\"],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupVaultName\"\
        },\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to be returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"ByResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>Returns only recovery points that match the specified resource Amazon Resource Name (ARN).</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"ByResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>Returns only recovery points that match the specified resource type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceType\"\
        },\
        \"ByBackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Returns only recovery points that match the specified backup plan ID.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"backupPlanId\"\
        },\
        \"ByCreatedBefore\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>Returns only recovery points that were created before the specified timestamp.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"createdBefore\"\
        },\
        \"ByCreatedAfter\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>Returns only recovery points that were created after the specified timestamp.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"createdAfter\"\
        }\
      }\
    },\
    \"ListRecoveryPointsByBackupVaultOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\"\
        },\
        \"RecoveryPoints\":{\
          \"shape\":\"RecoveryPointByBackupVaultList\",\
          \"documentation\":\"<p>An array of objects that contain detailed information about recovery points saved in a backup vault.</p>\"\
        }\
      }\
    },\
    \"ListRecoveryPointsByResourceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to be returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListRecoveryPointsByResourceOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\"\
        },\
        \"RecoveryPoints\":{\
          \"shape\":\"RecoveryPointByResourceList\",\
          \"documentation\":\"<p>An array of objects that contain detailed information about recovery points of the specified resource type.</p>\"\
        }\
      }\
    },\
    \"ListRestoreJobsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to be returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListRestoreJobsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RestoreJobs\":{\
          \"shape\":\"RestoreJobsList\",\
          \"documentation\":\"<p>An array of objects that contain detailed information about jobs to restore saved resources.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\"\
        }\
      }\
    },\
    \"ListTagsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on the type of resource. Valid targets for <code>ListTags</code> are recovery points, backup plans, and backup vaults.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to be returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListTagsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>The next item following a partial list of returned items. For example, if a request is made to return <code>maxResults</code> number of items, <code>NextToken</code> allows you to return more items in your list starting at the location pointed to by the next token.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>To help organize your resources, you can assign your own metadata to the resources you create. Each tag is a key-value pair.</p>\"\
        }\
      }\
    },\
    \"Long\":{\"type\":\"long\"},\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"Metadata\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"MetadataKey\"},\
      \"value\":{\"shape\":\"MetadataValue\"},\
      \"sensitive\":true\
    },\
    \"MetadataKey\":{\"type\":\"string\"},\
    \"MetadataValue\":{\"type\":\"string\"},\
    \"MissingParameterValueException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"string\"},\
        \"Message\":{\"shape\":\"string\"},\
        \"Type\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        },\
        \"Context\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates that a required parameter is missing.</p>\",\
      \"exception\":true\
    },\
    \"ProtectedResource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of AWS resource; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.</p>\"\
        },\
        \"LastBackupTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a resource was last backed up, in Unix format and Coordinated Universal Time (UTC). The value of <code>LastBackupTime</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure that contains information about a backed-up resource.</p>\"\
    },\
    \"ProtectedResourcesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProtectedResource\"}\
    },\
    \"PutBackupVaultAccessPolicyInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupVaultName\"],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupVaultName\"\
        },\
        \"Policy\":{\
          \"shape\":\"IAMPolicy\",\
          \"documentation\":\"<p>The backup vault access policy document in JSON format.</p>\"\
        }\
      }\
    },\
    \"PutBackupVaultNotificationsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BackupVaultName\",\
        \"SNSTopicArn\",\
        \"BackupVaultEvents\"\
      ],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupVaultName\"\
        },\
        \"SNSTopicArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that specifies the topic for a backup vaultâs events; for example, <code>arn:aws:sns:us-west-2:111122223333:MyVaultTopic</code>.</p>\"\
        },\
        \"BackupVaultEvents\":{\
          \"shape\":\"BackupVaultEvents\",\
          \"documentation\":\"<p>An array of events that indicate the status of jobs to back up resources to the backup vault.</p>\"\
        }\
      }\
    },\
    \"RecoveryPointByBackupVault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\"\
        },\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\"\
        },\
        \"BackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>\"\
        },\
        \"ResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of AWS resource saved as a recovery point; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.</p>\"\
        },\
        \"CreatedBy\":{\
          \"shape\":\"RecoveryPointCreator\",\
          \"documentation\":\"<p>Contains identifying information about the creation of a recovery point, including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>, <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup plan that is used to create it.</p>\"\
        },\
        \"IamRoleArn\":{\
          \"shape\":\"IAMRoleArn\",\
          \"documentation\":\"<p>Specifies the IAM role ARN used to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"RecoveryPointStatus\",\
          \"documentation\":\"<p>A status code specifying the state of the recovery point.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a recovery point is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"CompletionDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a job to restore a recovery point is completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>CompletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"BackupSizeInBytes\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size, in bytes, of a backup.</p>\"\
        },\
        \"CalculatedLifecycle\":{\
          \"shape\":\"CalculatedLifecycle\",\
          \"documentation\":\"<p>A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code> and <code>MoveToColdStorageAt</code> timestamps.</p>\"\
        },\
        \"Lifecycle\":{\
          \"shape\":\"Lifecycle\",\
          \"documentation\":\"<p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define. </p> <p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the âexpire after daysâ setting must be 90 days greater than the âtransition to cold after daysâ setting. The âtransition to cold after daysâ setting cannot be changed after a backup has been transitioned to cold. </p>\"\
        },\
        \"EncryptionKeyArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The server-side encryption key that is used to protect your backups; for example, <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p>\"\
        },\
        \"IsEncrypted\":{\
          \"shape\":\"boolean\",\
          \"documentation\":\"<p>A Boolean value that is returned as <code>TRUE</code> if the specified recovery point is encrypted, or <code>FALSE</code> if the recovery point is not encrypted.</p>\"\
        },\
        \"LastRestoreTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a recovery point was last restored, in Unix format and Coordinated Universal Time (UTC). The value of <code>LastRestoreTime</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains detailed information about the recovery points stored in a backup vault.</p>\"\
    },\
    \"RecoveryPointByBackupVaultList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RecoveryPointByBackupVault\"}\
    },\
    \"RecoveryPointByResource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a recovery point is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"RecoveryPointStatus\",\
          \"documentation\":\"<p>A status code specifying the state of the recovery point.</p>\"\
        },\
        \"EncryptionKeyArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The server-side encryption key that is used to protect your backups; for example, <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.</p>\"\
        },\
        \"BackupSizeBytes\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size, in bytes, of a backup.</p>\"\
        },\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains detailed information about a saved recovery point.</p>\"\
    },\
    \"RecoveryPointByResourceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RecoveryPointByResource\"}\
    },\
    \"RecoveryPointCreator\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\"\
        },\
        \"BackupPlanArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example, <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.</p>\"\
        },\
        \"BackupPlanVersion\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Version IDs are unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. They cannot be edited.</p>\"\
        },\
        \"BackupRuleId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a rule used to schedule the backup of a selection of resources.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the backup plan and rule that AWS Backup used to initiate the recovery point backup.</p>\"\
    },\
    \"RecoveryPointStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"COMPLETED\",\
        \"PARTIAL\",\
        \"DELETING\",\
        \"EXPIRED\"\
      ]\
    },\
    \"ResourceArns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ARN\"}\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"string\"},\
        \"Message\":{\"shape\":\"string\"},\
        \"Type\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        },\
        \"Context\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>A resource that is required for the action doesn't exist.</p>\",\
      \"exception\":true\
    },\
    \"ResourceType\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[a-zA-Z0-9\\\\-\\\\_\\\\.]{1,50}$\"\
    },\
    \"ResourceTypeOptInPreference\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ResourceType\"},\
      \"value\":{\"shape\":\"IsEnabled\"}\
    },\
    \"ResourceTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceType\"}\
    },\
    \"RestoreJobId\":{\"type\":\"string\"},\
    \"RestoreJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"RUNNING\",\
        \"COMPLETED\",\
        \"ABORTED\",\
        \"FAILED\"\
      ]\
    },\
    \"RestoreJobsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RestoreJobsListMember\"}\
    },\
    \"RestoreJobsListMember\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RestoreJobId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies the job that restores a recovery point.</p>\"\
        },\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a restore job is created, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"CompletionDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a job to restore a recovery point is completed, in Unix format and Coordinated Universal Time (UTC). The value of <code>CompletionDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"RestoreJobStatus\",\
          \"documentation\":\"<p>A status code specifying the state of the job initiated by AWS Backup to restore a recovery point.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A detailed message explaining the status of the job to restore a recovery point.</p>\"\
        },\
        \"PercentDone\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Contains an estimated percentage complete of a job at the time the job status was queried.</p>\"\
        },\
        \"BackupSizeInBytes\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size, in bytes, of the restored resource.</p>\"\
        },\
        \"IamRoleArn\":{\
          \"shape\":\"IAMRoleArn\",\
          \"documentation\":\"<p>Specifies the IAM role ARN used to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>\"\
        },\
        \"ExpectedCompletionTimeMinutes\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The amount of time in minutes that a job restoring a recovery point is expected to take.</p>\"\
        },\
        \"CreatedResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains metadata about a restore job.</p>\"\
    },\
    \"ServiceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"string\"},\
        \"Message\":{\"shape\":\"string\"},\
        \"Type\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        },\
        \"Context\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>The request failed due to a temporary failure of the server.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"StartBackupJobInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BackupVaultName\",\
        \"ResourceArn\",\
        \"IamRoleArn\"\
      ],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\"\
        },\
        \"ResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on the resource type.</p>\"\
        },\
        \"IamRoleArn\":{\
          \"shape\":\"IAMRoleArn\",\
          \"documentation\":\"<p>Specifies the IAM role ARN used to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>\"\
        },\
        \"IdempotencyToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A customer chosen string that can be used to distinguish between calls to <code>StartBackupJob</code>.</p>\"\
        },\
        \"StartWindowMinutes\":{\
          \"shape\":\"WindowMinutes\",\
          \"documentation\":\"<p>A value in minutes after a backup is scheduled before a job will be canceled if it doesn't start successfully. This value is optional.</p>\"\
        },\
        \"CompleteWindowMinutes\":{\
          \"shape\":\"WindowMinutes\",\
          \"documentation\":\"<p>A value in minutes after a backup job is successfully started before it must be completed or it will be canceled by AWS Backup. This value is optional.</p>\"\
        },\
        \"Lifecycle\":{\
          \"shape\":\"Lifecycle\",\
          \"documentation\":\"<p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup will transition and expire backups automatically according to the lifecycle that you define. </p> <p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the âexpire after daysâ setting must be 90 days greater than the âtransition to cold after daysâ setting. The âtransition to cold after daysâ setting cannot be changed after a backup has been transitioned to cold. </p>\"\
        },\
        \"RecoveryPointTags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>To help organize your resources, you can assign your own metadata to the resources that you create. Each tag is a key-value pair.</p>\"\
        }\
      }\
    },\
    \"StartBackupJobOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupJobId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a request to AWS Backup to back up a resource.</p>\"\
        },\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a backup job is started, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        }\
      }\
    },\
    \"StartCopyJobInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RecoveryPointArn\",\
        \"SourceBackupVaultName\",\
        \"DestinationBackupVaultArn\",\
        \"IamRoleArn\"\
      ],\
      \"members\":{\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a recovery point to use for the copy job; for example, arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45. </p>\"\
        },\
        \"SourceBackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical source container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\"\
        },\
        \"DestinationBackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a destination backup vault to copy to; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>\"\
        },\
        \"IamRoleArn\":{\
          \"shape\":\"IAMRoleArn\",\
          \"documentation\":\"<p>Specifies the IAM role ARN used to copy the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>\"\
        },\
        \"IdempotencyToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A customer chosen string that can be used to distinguish between calls to <code>StartCopyJob</code>.</p>\"\
        },\
        \"Lifecycle\":{\"shape\":\"Lifecycle\"}\
      }\
    },\
    \"StartCopyJobOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CopyJobId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a copy job.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time that a copy job is started, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        }\
      }\
    },\
    \"StartRestoreJobInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RecoveryPointArn\",\
        \"Metadata\",\
        \"IamRoleArn\"\
      ],\
      \"members\":{\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>A set of metadata key-value pairs. Contains information, such as a resource name, required to restore a recovery point.</p> <p> You can get configuration metadata about a resource at the time it was backed up by calling <code>GetRecoveryPointRestoreMetadata</code>. However, values in addition to those provided by <code>GetRecoveryPointRestoreMetadata</code> might be required to restore a resource. For example, you might need to provide a new resource name if the original already exists.</p> <p>You need to specify specific metadata to restore an Amazon Elastic File System (Amazon EFS) instance:</p> <ul> <li> <p> <code>file-system-id</code>: ID of the Amazon EFS file system that is backed up by AWS Backup. Returned in <code>GetRecoveryPointRestoreMetadata</code>.</p> </li> <li> <p> <code>Encrypted</code>: A Boolean value that, if true, specifies that the file system is encrypted. If <code>KmsKeyId</code> is specified, <code>Encrypted</code> must be set to <code>true</code>.</p> </li> <li> <p> <code>KmsKeyId</code>: Specifies the AWS KMS key that is used to encrypt the restored file system.</p> </li> <li> <p> <code>PerformanceMode</code>: Specifies the throughput mode of the file system.</p> </li> <li> <p> <code>CreationToken</code>: A user-supplied value that ensures the uniqueness (idempotency) of the request.</p> </li> <li> <p> <code>newFileSystem</code>: A Boolean value that, if true, specifies that the recovery point is restored to a new Amazon EFS file system.</p> </li> </ul>\"\
        },\
        \"IamRoleArn\":{\
          \"shape\":\"IAMRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that AWS Backup uses to create the target recovery point; for example, <code>arn:aws:iam::123456789012:role/S3Access</code>.</p>\"\
        },\
        \"IdempotencyToken\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>A customer chosen string that can be used to distinguish between calls to <code>StartRestoreJob</code>.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>Starts a job to restore a recovery point for one of the following resources:</p> <ul> <li> <p> <code>EBS</code> for Amazon Elastic Block Store</p> </li> <li> <p> <code>Storage Gateway</code> for AWS Storage Gateway</p> </li> <li> <p> <code>RDS</code> for Amazon Relational Database Service</p> </li> <li> <p> <code>DDB</code> for Amazon DynamoDB</p> </li> <li> <p> <code>EFS</code> for Amazon Elastic File System</p> </li> </ul>\"\
        }\
      }\
    },\
    \"StartRestoreJobOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RestoreJobId\":{\
          \"shape\":\"RestoreJobId\",\
          \"documentation\":\"<p>Uniquely identifies the job that restores a recovery point.</p>\"\
        }\
      }\
    },\
    \"StopBackupJobInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"BackupJobId\"],\
      \"members\":{\
        \"BackupJobId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a request to AWS Backup to back up a resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupJobId\"\
        }\
      }\
    },\
    \"StorageClass\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"WARM\",\
        \"COLD\",\
        \"DELETED\"\
      ]\
    },\
    \"TagKey\":{\"type\":\"string\"},\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"string\"},\
      \"sensitive\":true\
    },\
    \"TagResourceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a resource. The format of the ARN depends on the type of the tagged resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>Key-value pairs that are used to help organize your resources. You can assign your own metadata to the resources you create. </p>\"\
        }\
      }\
    },\
    \"TagValue\":{\"type\":\"string\"},\
    \"Tags\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"},\
      \"sensitive\":true\
    },\
    \"UntagResourceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeyList\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a resource. The format of the ARN depends on the type of the tagged resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"TagKeyList\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>A list of keys to identify which key-value tags to remove from a resource.</p>\"\
        }\
      }\
    },\
    \"UpdateBackupPlanInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BackupPlanId\",\
        \"BackupPlan\"\
      ],\
      \"members\":{\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupPlanId\"\
        },\
        \"BackupPlan\":{\
          \"shape\":\"BackupPlanInput\",\
          \"documentation\":\"<p>Specifies the body of a backup plan. Includes a <code>BackupPlanName</code> and one or more sets of <code>Rules</code>.</p>\"\
        }\
      }\
    },\
    \"UpdateBackupPlanOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupPlanId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Uniquely identifies a backup plan.</p>\"\
        },\
        \"BackupPlanArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example, <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time a backup plan is updated, in Unix format and Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is accurate to milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"string\",\
          \"documentation\":\"<p>Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. Version Ids cannot be edited.</p>\"\
        }\
      }\
    },\
    \"UpdateRecoveryPointLifecycleInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BackupVaultName\",\
        \"RecoveryPointArn\"\
      ],\
      \"members\":{\
        \"BackupVaultName\":{\
          \"shape\":\"BackupVaultName\",\
          \"documentation\":\"<p>The name of a logical container where backups are stored. Backup vaults are identified by names that are unique to the account used to create them and the AWS Region where they are created. They consist of lowercase letters, numbers, and hyphens.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"backupVaultName\"\
        },\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"recoveryPointArn\"\
        },\
        \"Lifecycle\":{\
          \"shape\":\"Lifecycle\",\
          \"documentation\":\"<p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define. </p> <p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the âexpire after daysâ setting must be 90 days greater than the âtransition to cold after daysâ setting. The âtransition to cold after daysâ setting cannot be changed after a backup has been transitioned to cold. </p>\"\
        }\
      }\
    },\
    \"UpdateRecoveryPointLifecycleOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BackupVaultArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An ARN that uniquely identifies a backup vault; for example, <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.</p>\"\
        },\
        \"RecoveryPointArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example, <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.</p>\"\
        },\
        \"Lifecycle\":{\
          \"shape\":\"Lifecycle\",\
          \"documentation\":\"<p>The lifecycle defines when a protected resource is transitioned to cold storage and when it expires. AWS Backup transitions and expires backups automatically according to the lifecycle that you define. </p> <p>Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days. Therefore, the âexpire after daysâ setting must be 90 days greater than the âtransition to cold after daysâ setting. The âtransition to cold after daysâ setting cannot be changed after a backup has been transitioned to cold. </p>\"\
        },\
        \"CalculatedLifecycle\":{\
          \"shape\":\"CalculatedLifecycle\",\
          \"documentation\":\"<p>A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code> and <code>MoveToColdStorageAt</code> timestamps.</p>\"\
        }\
      }\
    },\
    \"UpdateRegionSettingsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceTypeOptInPreference\":{\
          \"shape\":\"ResourceTypeOptInPreference\",\
          \"documentation\":\"<p>Updates the list of services along with the opt-in preferences for the region.</p>\"\
        }\
      }\
    },\
    \"WindowMinutes\":{\"type\":\"long\"},\
    \"boolean\":{\"type\":\"boolean\"},\
    \"long\":{\"type\":\"long\"},\
    \"string\":{\"type\":\"string\"},\
    \"timestamp\":{\"type\":\"timestamp\"}\
  },\
  \"documentation\":\"<fullname>AWS Backup</fullname> <p>AWS Backup is a unified backup service designed to protect AWS services and their associated data. AWS Backup simplifies the creation, migration, restoration, and deletion of backups, while also providing reporting and auditing.</p>\"\
}\
";
}

@end
