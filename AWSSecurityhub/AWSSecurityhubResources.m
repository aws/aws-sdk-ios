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

#import "AWSSecurityhubResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSSecurityhubResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSSecurityhubResources

+ (instancetype)sharedInstance {
    static AWSSecurityhubResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSSecurityhubResources new];
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
    \"apiVersion\":\"2018-10-26\",\
    \"endpointPrefix\":\"securityhub\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"AWS SecurityHub\",\
    \"serviceId\":\"SecurityHub\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"securityhub\",\
    \"uid\":\"securityhub-2018-10-26\"\
  },\
  \"operations\":{\
    \"AcceptInvitation\":{\
      \"name\":\"AcceptInvitation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/master\"\
      },\
      \"input\":{\"shape\":\"AcceptInvitationRequest\"},\
      \"output\":{\"shape\":\"AcceptInvitationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidAccessException\"}\
      ],\
      \"documentation\":\"<p>Accepts the invitation to be a member account and be monitored by the Security Hub master account that the invitation was sent from.</p> <p>When the member account accepts the invitation, permission is granted to the master account to view findings generated in the member account.</p>\"\
    },\
    \"BatchDisableStandards\":{\
      \"name\":\"BatchDisableStandards\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/standards/deregister\"\
      },\
      \"input\":{\"shape\":\"BatchDisableStandardsRequest\"},\
      \"output\":{\"shape\":\"BatchDisableStandardsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Disables the standards specified by the provided <code>StandardsSubscriptionArns</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html\\\">Security Standards</a> section of the <i>AWS Security Hub User Guide</i>.</p>\"\
    },\
    \"BatchEnableStandards\":{\
      \"name\":\"BatchEnableStandards\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/standards/register\"\
      },\
      \"input\":{\"shape\":\"BatchEnableStandardsRequest\"},\
      \"output\":{\"shape\":\"BatchEnableStandardsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Enables the standards specified by the provided <code>StandardsArn</code>. To obtain the ARN for a standard, use the <code> <a>DescribeStandards</a> </code> operation.</p> <p>For more information, see the <a href=\\\"https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html\\\">Security Standards</a> section of the <i>AWS Security Hub User Guide</i>.</p>\"\
    },\
    \"BatchImportFindings\":{\
      \"name\":\"BatchImportFindings\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/findings/import\"\
      },\
      \"input\":{\"shape\":\"BatchImportFindingsRequest\"},\
      \"output\":{\"shape\":\"BatchImportFindingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidAccessException\"}\
      ],\
      \"documentation\":\"<p>Imports security findings generated from an integrated third-party product into Security Hub. This action is requested by the integrated product to import its findings into Security Hub.</p> <p>The maximum allowed size for a finding is 240 Kb. An error is returned for any finding larger than 240 Kb.</p> <p>After a finding is created, <code>BatchImportFindings</code> cannot be used to update the following finding fields and objects, which Security Hub customers use to manage their investigation workflow.</p> <ul> <li> <p> <code>Confidence</code> </p> </li> <li> <p> <code>Criticality</code> </p> </li> <li> <p> <code>Note</code> </p> </li> <li> <p> <code>RelatedFindings</code> </p> </li> <li> <p> <code>Severity</code> </p> </li> <li> <p> <code>Types</code> </p> </li> <li> <p> <code>UserDefinedFields</code> </p> </li> <li> <p> <code>VerificationState</code> </p> </li> <li> <p> <code>Workflow</code> </p> </li> </ul>\"\
    },\
    \"BatchUpdateFindings\":{\
      \"name\":\"BatchUpdateFindings\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/findings/batchupdate\"\
      },\
      \"input\":{\"shape\":\"BatchUpdateFindingsRequest\"},\
      \"output\":{\"shape\":\"BatchUpdateFindingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidAccessException\"}\
      ],\
      \"documentation\":\"<p>Used by Security Hub customers to update information about their investigation into a finding. Requested by master accounts or member accounts. Master accounts can update findings for their account and their member accounts. Member accounts can update findings for their account.</p> <p>Updates from <code>BatchUpdateFindings</code> do not affect the value of <code>UpdatedAt</code> for a finding.</p> <p>Master accounts can use <code>BatchUpdateFindings</code> to update the following finding fields and objects.</p> <ul> <li> <p> <code>Confidence</code> </p> </li> <li> <p> <code>Criticality</code> </p> </li> <li> <p> <code>Note</code> </p> </li> <li> <p> <code>RelatedFindings</code> </p> </li> <li> <p> <code>Severity</code> </p> </li> <li> <p> <code>Types</code> </p> </li> <li> <p> <code>UserDefinedFields</code> </p> </li> <li> <p> <code>VerificationState</code> </p> </li> <li> <p> <code>Workflow</code> </p> </li> </ul> <p>Member accounts can only use <code>BatchUpdateFindings</code> to update the Note object.</p>\"\
    },\
    \"CreateActionTarget\":{\
      \"name\":\"CreateActionTarget\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/actionTargets\"\
      },\
      \"input\":{\"shape\":\"CreateActionTargetRequest\"},\
      \"output\":{\"shape\":\"CreateActionTargetResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a custom action target in Security Hub.</p> <p>You can use custom actions on findings and insights in Security Hub to trigger target actions in Amazon CloudWatch Events.</p>\"\
    },\
    \"CreateInsight\":{\
      \"name\":\"CreateInsight\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/insights\"\
      },\
      \"input\":{\"shape\":\"CreateInsightRequest\"},\
      \"output\":{\"shape\":\"CreateInsightResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a custom insight in Security Hub. An insight is a consolidation of findings that relate to a security issue that requires attention or remediation.</p> <p>To group the related findings in the insight, use the <code>GroupByAttribute</code>.</p>\"\
    },\
    \"CreateMembers\":{\
      \"name\":\"CreateMembers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/members\"\
      },\
      \"input\":{\"shape\":\"CreateMembersRequest\"},\
      \"output\":{\"shape\":\"CreateMembersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a member association in Security Hub between the specified accounts and the account used to make the request, which is the master account. To successfully create a member, you must use this action from an account that already has Security Hub enabled. To enable Security Hub, you can use the <code> <a>EnableSecurityHub</a> </code> operation.</p> <p>After you use <code>CreateMembers</code> to create member account associations in Security Hub, you must use the <code> <a>InviteMembers</a> </code> operation to invite the accounts to enable Security Hub and become member accounts in Security Hub.</p> <p>If the account owner accepts the invitation, the account becomes a member account in Security Hub. A permissions policy is added that permits the master account to view the findings generated in the member account. When Security Hub is enabled in the invited account, findings start to be sent to both the member and master accounts.</p> <p>To remove the association between the master and member accounts, use the <code> <a>DisassociateFromMasterAccount</a> </code> or <code> <a>DisassociateMembers</a> </code> operation.</p>\"\
    },\
    \"DeclineInvitations\":{\
      \"name\":\"DeclineInvitations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/invitations/decline\"\
      },\
      \"input\":{\"shape\":\"DeclineInvitationsRequest\"},\
      \"output\":{\"shape\":\"DeclineInvitationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Declines invitations to become a member account.</p>\"\
    },\
    \"DeleteActionTarget\":{\
      \"name\":\"DeleteActionTarget\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/actionTargets/{ActionTargetArn+}\"\
      },\
      \"input\":{\"shape\":\"DeleteActionTargetRequest\"},\
      \"output\":{\"shape\":\"DeleteActionTargetResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes a custom action target from Security Hub.</p> <p>Deleting a custom action target does not affect any findings or insights that were already sent to Amazon CloudWatch Events using the custom action.</p>\"\
    },\
    \"DeleteInsight\":{\
      \"name\":\"DeleteInsight\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/insights/{InsightArn+}\"\
      },\
      \"input\":{\"shape\":\"DeleteInsightRequest\"},\
      \"output\":{\"shape\":\"DeleteInsightResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes the insight specified by the <code>InsightArn</code>.</p>\"\
    },\
    \"DeleteInvitations\":{\
      \"name\":\"DeleteInvitations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/invitations/delete\"\
      },\
      \"input\":{\"shape\":\"DeleteInvitationsRequest\"},\
      \"output\":{\"shape\":\"DeleteInvitationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidAccessException\"}\
      ],\
      \"documentation\":\"<p>Deletes invitations received by the AWS account to become a member account.</p>\"\
    },\
    \"DeleteMembers\":{\
      \"name\":\"DeleteMembers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/members/delete\"\
      },\
      \"input\":{\"shape\":\"DeleteMembersRequest\"},\
      \"output\":{\"shape\":\"DeleteMembersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified member accounts from Security Hub.</p>\"\
    },\
    \"DescribeActionTargets\":{\
      \"name\":\"DescribeActionTargets\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/actionTargets/get\"\
      },\
      \"input\":{\"shape\":\"DescribeActionTargetsRequest\"},\
      \"output\":{\"shape\":\"DescribeActionTargetsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of the custom action targets in Security Hub in your account.</p>\"\
    },\
    \"DescribeHub\":{\
      \"name\":\"DescribeHub\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/accounts\"\
      },\
      \"input\":{\"shape\":\"DescribeHubRequest\"},\
      \"output\":{\"shape\":\"DescribeHubResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns details about the Hub resource in your account, including the <code>HubArn</code> and the time when you enabled Security Hub.</p>\"\
    },\
    \"DescribeProducts\":{\
      \"name\":\"DescribeProducts\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/products\"\
      },\
      \"input\":{\"shape\":\"DescribeProductsRequest\"},\
      \"output\":{\"shape\":\"DescribeProductsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"InvalidInputException\"}\
      ],\
      \"documentation\":\"<p>Returns information about the available products that you can subscribe to and integrate with Security Hub in order to consolidate findings.</p>\"\
    },\
    \"DescribeStandards\":{\
      \"name\":\"DescribeStandards\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/standards\"\
      },\
      \"input\":{\"shape\":\"DescribeStandardsRequest\"},\
      \"output\":{\"shape\":\"DescribeStandardsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of the available standards in Security Hub.</p> <p>For each standard, the results include the standard ARN, the name, and a description. </p>\"\
    },\
    \"DescribeStandardsControls\":{\
      \"name\":\"DescribeStandardsControls\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/standards/controls/{StandardsSubscriptionArn+}\"\
      },\
      \"input\":{\"shape\":\"DescribeStandardsControlsRequest\"},\
      \"output\":{\"shape\":\"DescribeStandardsControlsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of security standards controls.</p> <p>For each control, the results include information about whether it is currently enabled, the severity, and a link to remediation information.</p>\"\
    },\
    \"DisableImportFindingsForProduct\":{\
      \"name\":\"DisableImportFindingsForProduct\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/productSubscriptions/{ProductSubscriptionArn+}\"\
      },\
      \"input\":{\"shape\":\"DisableImportFindingsForProductRequest\"},\
      \"output\":{\"shape\":\"DisableImportFindingsForProductResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Disables the integration of the specified product with Security Hub. After the integration is disabled, findings from that product are no longer sent to Security Hub.</p>\"\
    },\
    \"DisableSecurityHub\":{\
      \"name\":\"DisableSecurityHub\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/accounts\"\
      },\
      \"input\":{\"shape\":\"DisableSecurityHubRequest\"},\
      \"output\":{\"shape\":\"DisableSecurityHubResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Disables Security Hub in your account only in the current Region. To disable Security Hub in all Regions, you must submit one request per Region where you have enabled Security Hub.</p> <p>When you disable Security Hub for a master account, it doesn't disable Security Hub for any associated member accounts.</p> <p>When you disable Security Hub, your existing findings and insights and any Security Hub configuration settings are deleted after 90 days and cannot be recovered. Any standards that were enabled are disabled, and your master and member account associations are removed.</p> <p>If you want to save your existing findings, you must export them before you disable Security Hub.</p>\"\
    },\
    \"DisassociateFromMasterAccount\":{\
      \"name\":\"DisassociateFromMasterAccount\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/master/disassociate\"\
      },\
      \"input\":{\"shape\":\"DisassociateFromMasterAccountRequest\"},\
      \"output\":{\"shape\":\"DisassociateFromMasterAccountResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Disassociates the current Security Hub member account from the associated master account.</p>\"\
    },\
    \"DisassociateMembers\":{\
      \"name\":\"DisassociateMembers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/members/disassociate\"\
      },\
      \"input\":{\"shape\":\"DisassociateMembersRequest\"},\
      \"output\":{\"shape\":\"DisassociateMembersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Disassociates the specified member accounts from the associated master account.</p>\"\
    },\
    \"EnableImportFindingsForProduct\":{\
      \"name\":\"EnableImportFindingsForProduct\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/productSubscriptions\"\
      },\
      \"input\":{\"shape\":\"EnableImportFindingsForProductRequest\"},\
      \"output\":{\"shape\":\"EnableImportFindingsForProductResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Enables the integration of a partner product with Security Hub. Integrated products send findings to Security Hub.</p> <p>When you enable a product integration, a permissions policy that grants permission for the product to send findings to Security Hub is applied.</p>\"\
    },\
    \"EnableSecurityHub\":{\
      \"name\":\"EnableSecurityHub\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/accounts\"\
      },\
      \"input\":{\"shape\":\"EnableSecurityHubRequest\"},\
      \"output\":{\"shape\":\"EnableSecurityHubResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Enables Security Hub for your account in the current Region or the Region you specify in the request.</p> <p>When you enable Security Hub, you grant to Security Hub the permissions necessary to gather findings from other services that are integrated with Security Hub.</p> <p>When you use the <code>EnableSecurityHub</code> operation to enable Security Hub, you also automatically enable the following standards.</p> <ul> <li> <p>CIS AWS Foundations</p> </li> <li> <p>AWS Foundational Security Best Practices</p> </li> </ul> <p>You do not enable the Payment Card Industry Data Security Standard (PCI DSS) standard. </p> <p>To not enable the automatically enabled standards, set <code>EnableDefaultStandards</code> to <code>false</code>.</p> <p>After you enable Security Hub, to enable a standard, use the <code> <a>BatchEnableStandards</a> </code> operation. To disable a standard, use the <code> <a>BatchDisableStandards</a> </code> operation.</p> <p>To learn more, see <a href=\\\"https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-settingup.html\\\">Setting Up AWS Security Hub</a> in the <i>AWS Security Hub User Guide</i>.</p>\"\
    },\
    \"GetEnabledStandards\":{\
      \"name\":\"GetEnabledStandards\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/standards/get\"\
      },\
      \"input\":{\"shape\":\"GetEnabledStandardsRequest\"},\
      \"output\":{\"shape\":\"GetEnabledStandardsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of the standards that are currently enabled.</p>\"\
    },\
    \"GetFindings\":{\
      \"name\":\"GetFindings\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/findings\"\
      },\
      \"input\":{\"shape\":\"GetFindingsRequest\"},\
      \"output\":{\"shape\":\"GetFindingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of findings that match the specified criteria.</p>\"\
    },\
    \"GetInsightResults\":{\
      \"name\":\"GetInsightResults\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/insights/results/{InsightArn+}\"\
      },\
      \"input\":{\"shape\":\"GetInsightResultsRequest\"},\
      \"output\":{\"shape\":\"GetInsightResultsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Lists the results of the Security Hub insight specified by the insight ARN.</p>\"\
    },\
    \"GetInsights\":{\
      \"name\":\"GetInsights\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/insights/get\"\
      },\
      \"input\":{\"shape\":\"GetInsightsRequest\"},\
      \"output\":{\"shape\":\"GetInsightsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Lists and describes insights for the specified insight ARNs.</p>\"\
    },\
    \"GetInvitationsCount\":{\
      \"name\":\"GetInvitationsCount\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/invitations/count\"\
      },\
      \"input\":{\"shape\":\"GetInvitationsCountRequest\"},\
      \"output\":{\"shape\":\"GetInvitationsCountResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Returns the count of all Security Hub membership invitations that were sent to the current member account, not including the currently accepted invitation. </p>\"\
    },\
    \"GetMasterAccount\":{\
      \"name\":\"GetMasterAccount\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/master\"\
      },\
      \"input\":{\"shape\":\"GetMasterAccountRequest\"},\
      \"output\":{\"shape\":\"GetMasterAccountResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Provides the details for the Security Hub master account for the current member account. </p>\"\
    },\
    \"GetMembers\":{\
      \"name\":\"GetMembers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/members/get\"\
      },\
      \"input\":{\"shape\":\"GetMembersRequest\"},\
      \"output\":{\"shape\":\"GetMembersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns the details for the Security Hub member accounts for the specified account IDs.</p>\"\
    },\
    \"InviteMembers\":{\
      \"name\":\"InviteMembers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/members/invite\"\
      },\
      \"input\":{\"shape\":\"InviteMembersRequest\"},\
      \"output\":{\"shape\":\"InviteMembersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Invites other AWS accounts to become member accounts for the Security Hub master account that the invitation is sent from.</p> <p>Before you can use this action to invite a member, you must first use the <code> <a>CreateMembers</a> </code> action to create the member account in Security Hub.</p> <p>When the account owner accepts the invitation to become a member account and enables Security Hub, the master account can view the findings generated from the member account.</p>\"\
    },\
    \"ListEnabledProductsForImport\":{\
      \"name\":\"ListEnabledProductsForImport\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/productSubscriptions\"\
      },\
      \"input\":{\"shape\":\"ListEnabledProductsForImportRequest\"},\
      \"output\":{\"shape\":\"ListEnabledProductsForImportResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidAccessException\"}\
      ],\
      \"documentation\":\"<p>Lists all findings-generating solutions (products) that you are subscribed to receive findings from in Security Hub.</p>\"\
    },\
    \"ListInvitations\":{\
      \"name\":\"ListInvitations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/invitations\"\
      },\
      \"input\":{\"shape\":\"ListInvitationsRequest\"},\
      \"output\":{\"shape\":\"ListInvitationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Lists all Security Hub membership invitations that were sent to the current AWS account. </p>\"\
    },\
    \"ListMembers\":{\
      \"name\":\"ListMembers\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/members\"\
      },\
      \"input\":{\"shape\":\"ListMembersRequest\"},\
      \"output\":{\"shape\":\"ListMembersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Lists details about all member accounts for the current Security Hub master account.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tags/{ResourceArn}\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of tags associated with a resource.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tags/{ResourceArn}\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Adds one or more tags to a resource.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/tags/{ResourceArn}\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Removes one or more tags from a resource.</p>\"\
    },\
    \"UpdateActionTarget\":{\
      \"name\":\"UpdateActionTarget\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/actionTargets/{ActionTargetArn+}\"\
      },\
      \"input\":{\"shape\":\"UpdateActionTargetRequest\"},\
      \"output\":{\"shape\":\"UpdateActionTargetResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Updates the name and description of a custom action target in Security Hub.</p>\"\
    },\
    \"UpdateFindings\":{\
      \"name\":\"UpdateFindings\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/findings\"\
      },\
      \"input\":{\"shape\":\"UpdateFindingsRequest\"},\
      \"output\":{\"shape\":\"UpdateFindingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p> <code>UpdateFindings</code> is deprecated. Instead of <code>UpdateFindings</code>, use <code>BatchUpdateFindings</code>.</p> <p>Updates the <code>Note</code> and <code>RecordState</code> of the Security Hub-aggregated findings that the filter attributes specify. Any member account that can view the finding also sees the update to the finding.</p>\"\
    },\
    \"UpdateInsight\":{\
      \"name\":\"UpdateInsight\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/insights/{InsightArn+}\"\
      },\
      \"input\":{\"shape\":\"UpdateInsightRequest\"},\
      \"output\":{\"shape\":\"UpdateInsightResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Updates the Security Hub insight identified by the specified insight ARN.</p>\"\
    },\
    \"UpdateStandardsControl\":{\
      \"name\":\"UpdateStandardsControl\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/standards/control/{StandardsControlArn+}\"\
      },\
      \"input\":{\"shape\":\"UpdateStandardsControlRequest\"},\
      \"output\":{\"shape\":\"UpdateStandardsControlResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalException\"},\
        {\"shape\":\"InvalidInputException\"},\
        {\"shape\":\"InvalidAccessException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Used to control whether an individual security standard control is enabled or disabled.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AcceptInvitationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MasterId\",\
        \"InvitationId\"\
      ],\
      \"members\":{\
        \"MasterId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The account ID of the Security Hub master account that sent the invitation.</p>\"\
        },\
        \"InvitationId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the invitation sent from the Security Hub master account.</p>\"\
        }\
      }\
    },\
    \"AcceptInvitationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"NonEmptyString\"},\
        \"Code\":{\"shape\":\"NonEmptyString\"}\
      },\
      \"documentation\":\"<p>You don't have permission to perform the action specified in the request.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
    },\
    \"AccountDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccountId\":{\
          \"shape\":\"AccountId\",\
          \"documentation\":\"<p>The ID of an AWS account.</p>\"\
        },\
        \"Email\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The email of an AWS account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of an AWS account.</p>\"\
    },\
    \"AccountDetailsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AccountDetails\"}\
    },\
    \"AccountId\":{\"type\":\"string\"},\
    \"AccountIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyString\"}\
    },\
    \"ActionTarget\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ActionTargetArn\",\
        \"Name\",\
        \"Description\"\
      ],\
      \"members\":{\
        \"ActionTargetArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN for the target action.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the action target.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The description of the target action.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An <code>ActionTarget</code> object.</p>\"\
    },\
    \"ActionTargetList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ActionTarget\"}\
    },\
    \"ArnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyString\"}\
    },\
    \"AvailabilityZone\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ZoneName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the Availability Zone.</p>\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the subnet. You can specify one subnet per Availability Zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an Availability Zone.</p>\"\
    },\
    \"AvailabilityZones\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AvailabilityZone\"}\
    },\
    \"AwsCloudFrontDistributionDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The domain name corresponding to the distribution.</p>\"\
        },\
        \"ETag\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The entity tag is a hash of the object.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The date and time that the distribution was last modified.</p>\"\
        },\
        \"Logging\":{\
          \"shape\":\"AwsCloudFrontDistributionLogging\",\
          \"documentation\":\"<p>A complex type that controls whether access logs are written for the distribution.</p>\"\
        },\
        \"Origins\":{\
          \"shape\":\"AwsCloudFrontDistributionOrigins\",\
          \"documentation\":\"<p>A complex type that contains information about origins for this distribution.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Indicates the current status of the distribution.</p>\"\
        },\
        \"WebAclId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A unique identifier that specifies the AWS WAF web ACL, if any, to associate with this distribution.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A distribution configuration.</p>\"\
    },\
    \"AwsCloudFrontDistributionLogging\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon S3 bucket to store the access logs in.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>With this field, you can enable or disable the selected distribution.</p>\"\
        },\
        \"IncludeCookies\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether you want CloudFront to include cookies in access logs.</p>\"\
        },\
        \"Prefix\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>An optional string that you want CloudFront to use as a prefix to the access log filenames for this distribution.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that controls whether access logs are written for the distribution.</p>\"\
    },\
    \"AwsCloudFrontDistributionOriginItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Amazon S3 origins: The DNS name of the Amazon S3 bucket from which you want CloudFront to get objects for this origin.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A unique identifier for the origin or origin group.</p>\"\
        },\
        \"OriginPath\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>An optional element that causes CloudFront to request your content from a directory in your Amazon S3 bucket or your custom origin.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that describes the Amazon S3 bucket, HTTP server (for example, a web server), Amazon Elemental MediaStore, or other server from which CloudFront gets your files.</p>\"\
    },\
    \"AwsCloudFrontDistributionOriginItemList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsCloudFrontDistributionOriginItem\"}\
    },\
    \"AwsCloudFrontDistributionOrigins\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Items\":{\
          \"shape\":\"AwsCloudFrontDistributionOriginItemList\",\
          \"documentation\":\"<p>A complex type that contains origins or origin groups for this distribution.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that contains information about origins and origin groups for this distribution.</p>\"\
    },\
    \"AwsCodeBuildProjectDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EncryptionKey\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The AWS Key Management Service (AWS KMS) customer master key (CMK) used to encrypt the build output artifacts.</p> <p>You can specify either the Amazon Resource Name (ARN) of the CMK or, if available, the CMK alias (using the format alias/alias-name). </p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"AwsCodeBuildProjectEnvironment\",\
          \"documentation\":\"<p>Information about the build environment for this build project.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the build project.</p>\"\
        },\
        \"Source\":{\
          \"shape\":\"AwsCodeBuildProjectSource\",\
          \"documentation\":\"<p>Information about the build input source code for this build project.</p>\"\
        },\
        \"ServiceRole\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the IAM role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"AwsCodeBuildProjectVpcConfig\",\
          \"documentation\":\"<p>Information about the VPC configuration that AWS CodeBuild accesses.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an AWS CodeBuild project.</p>\"\
    },\
    \"AwsCodeBuildProjectEnvironment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Certificate\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The certificate to use with this build project.</p>\"\
        },\
        \"ImagePullCredentialsType\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The type of credentials AWS CodeBuild uses to pull images in your build.</p> <p>Valid values:</p> <ul> <li> <p> <code>CODEBUILD</code> specifies that AWS CodeBuild uses its own credentials. This requires that you modify your ECR repository policy to trust the AWS CodeBuild service principal.</p> </li> <li> <p> <code>SERVICE_ROLE</code> specifies that AWS CodeBuild uses your build project's service role.</p> </li> </ul> <p>When you use a cross-account or private registry image, you must use <code>SERVICE_ROLE</code> credentials. When you use an AWS CodeBuild curated image, you must use <code>CODEBUILD</code> credentials.</p>\"\
        },\
        \"RegistryCredential\":{\
          \"shape\":\"AwsCodeBuildProjectEnvironmentRegistryCredential\",\
          \"documentation\":\"<p>The credentials for access to a private registry.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The type of build environment to use for related builds.</p> <p>The environment type <code>ARM_CONTAINER</code> is available only in Regions US East (N. Virginia), US East (Ohio), US West (Oregon), Europe (Ireland), Asia Pacific (Mumbai), Asia Pacific (Tokyo), Asia Pacific (Sydney), and Europe (Frankfurt).</p> <p>The environment type <code>LINUX_CONTAINER</code> with compute type build.general1.2xlarge is available only in Regions US East (N. Virginia), US East (N. Virginia), US West (Oregon), Canada (Central), Europe (Ireland), Europe (London), Europe (Frankfurt), Asia Pacific (Tokyo), Asia Pacific (Seoul), Asia Pacific (Singapore), Asia Pacific (Sydney), China (Beijing), and China (Ningxia).</p> <p>The environment type <code>LINUX_GPU_CONTAINER</code> is available only in Regions US East (N. Virginia), US East (N. Virginia), US West (Oregon), Canada (Central), Europe (Ireland), Europe (London), Europe (Frankfurt), Asia Pacific (Tokyo), Asia Pacific (Seoul), Asia Pacific (Singapore), Asia Pacific (Sydney), China (Beijing), and China (Ningxia).</p> <p>Valid values: <code>WINDOWS_CONTAINER</code> | <code>LINUX_CONTAINER</code> | <code>LINUX_GPU_CONTAINER</code> | <code>ARM_CONTAINER</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the build environment for this build project.</p>\"\
    },\
    \"AwsCodeBuildProjectEnvironmentRegistryCredential\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Credential\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) or name of credentials created using AWS Secrets Manager.</p> <note> <p>The credential can use the name of the credentials only if they exist in your current AWS Region. </p> </note>\"\
        },\
        \"CredentialProvider\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The service that created the credentials to access a private Docker registry.</p> <p>The valid value,<code> SECRETS_MANAGER</code>, is for AWS Secrets Manager.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The credentials for access to a private registry.</p>\"\
    },\
    \"AwsCodeBuildProjectSource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The type of repository that contains the source code to be built. Valid values are:</p> <ul> <li> <p> <code>BITBUCKET</code> - The source code is in a Bitbucket repository.</p> </li> <li> <p> <code>CODECOMMIT</code> - The source code is in an AWS CodeCommit repository.</p> </li> <li> <p> <code>CODEPIPELINE</code> - The source code settings are specified in the source action of a pipeline in AWS CodePipeline.</p> </li> <li> <p> <code>GITHUB</code> - The source code is in a GitHub repository.</p> </li> <li> <p> <code>GITHUB_ENTERPRISE</code> - The source code is in a GitHub Enterprise repository.</p> </li> <li> <p> <code>NO_SOURCE</code> - The project does not have input source code.</p> </li> <li> <p> <code>S3</code> - The source code is in an S3 input bucket. </p> </li> </ul>\"\
        },\
        \"Location\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Information about the location of the source code to be built.</p> <p>Valid values include:</p> <ul> <li> <p>For source code settings that are specified in the source action of a pipeline in AWS CodePipeline, location should not be specified. If it is specified, AWS CodePipeline ignores it. This is because AWS CodePipeline uses the settings in a pipeline's source action instead of this value.</p> </li> <li> <p>For source code in an AWS CodeCommit repository, the HTTPS clone URL to the repository that contains the source code and the build spec file (for example, <code>https://git-codecommit.region-ID.amazonaws.com/v1/repos/repo-name</code> ).</p> </li> <li> <p>For source code in an S3 input bucket, one of the following.</p> <ul> <li> <p>The path to the ZIP file that contains the source code (for example, <code>bucket-name/path/to/object-name.zip</code>).</p> </li> <li> <p> The path to the folder that contains the source code (for example, <code>bucket-name/path/to/source-code/folder/</code>).</p> </li> </ul> </li> <li> <p>For source code in a GitHub repository, the HTTPS clone URL to the repository that contains the source and the build spec file.</p> </li> <li> <p>For source code in a Bitbucket repository, the HTTPS clone URL to the repository that contains the source and the build spec file. </p> </li> </ul>\"\
        },\
        \"GitCloneDepth\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Information about the Git clone depth for the build project.</p>\"\
        },\
        \"InsecureSsl\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether to ignore SSL warnings while connecting to the project source code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the build input source code for this build project.</p>\"\
    },\
    \"AwsCodeBuildProjectVpcConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        },\
        \"Subnets\":{\
          \"shape\":\"NonEmptyStringList\",\
          \"documentation\":\"<p>A list of one or more subnet IDs in your Amazon VPC.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"NonEmptyStringList\",\
          \"documentation\":\"<p>A list of one or more security group IDs in your Amazon VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the VPC configuration that AWS CodeBuild accesses.</p>\"\
    },\
    \"AwsEc2InstanceDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The instance type of the instance. </p>\"\
        },\
        \"ImageId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Machine Image (AMI) ID of the instance.</p>\"\
        },\
        \"IpV4Addresses\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>The IPv4 addresses associated with the instance.</p>\"\
        },\
        \"IpV6Addresses\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>The IPv6 addresses associated with the instance.</p>\"\
        },\
        \"KeyName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The key name associated with the instance.</p>\"\
        },\
        \"IamInstanceProfileArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The IAM profile ARN of the instance.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The identifier of the VPC that the instance was launched in.</p>\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The identifier of the subnet that the instance was launched in.</p>\"\
        },\
        \"LaunchedAt\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The date/time the instance was launched.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of an Amazon EC2 instance.</p>\"\
    },\
    \"AwsEc2NetworkInterfaceAttachment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AttachTime\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The timestamp indicating when the attachment initiated.</p>\"\
        },\
        \"AttachmentId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The identifier of the network interface attachment</p>\"\
        },\
        \"DeleteOnTermination\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the network interface is deleted when the instance is terminated.</p>\"\
        },\
        \"DeviceIndex\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The device index of the network interface attachment on the instance.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the instance.</p>\"\
        },\
        \"InstanceOwnerId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The AWS account ID of the owner of the instance.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The attachment state.</p> <p>Valid values: <code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the network interface attachment.</p>\"\
    },\
    \"AwsEc2NetworkInterfaceDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attachment\":{\
          \"shape\":\"AwsEc2NetworkInterfaceAttachment\",\
          \"documentation\":\"<p>The network interface attachment.</p>\"\
        },\
        \"NetworkInterfaceId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the network interface.</p>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"AwsEc2NetworkInterfaceSecurityGroupList\",\
          \"documentation\":\"<p>Security groups for the network interface.</p>\"\
        },\
        \"SourceDestCheck\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether traffic to or from the instance is validated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about the network interface</p>\"\
    },\
    \"AwsEc2NetworkInterfaceSecurityGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GroupName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the security group.</p>\"\
        },\
        \"GroupId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the security group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A security group associated with the network interface.</p>\"\
    },\
    \"AwsEc2NetworkInterfaceSecurityGroupList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsEc2NetworkInterfaceSecurityGroup\"}\
    },\
    \"AwsEc2SecurityGroupDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GroupName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the security group.</p>\"\
        },\
        \"GroupId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the security group.</p>\"\
        },\
        \"OwnerId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The AWS account ID of the owner of the security group.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>[VPC only] The ID of the VPC for the security group.</p>\"\
        },\
        \"IpPermissions\":{\
          \"shape\":\"AwsEc2SecurityGroupIpPermissionList\",\
          \"documentation\":\"<p>The inbound rules associated with the security group.</p>\"\
        },\
        \"IpPermissionsEgress\":{\
          \"shape\":\"AwsEc2SecurityGroupIpPermissionList\",\
          \"documentation\":\"<p>[VPC only] The outbound rules associated with the security group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about an EC2 security group.</p>\"\
    },\
    \"AwsEc2SecurityGroupIpPermission\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IpProtocol\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The IP protocol name (<code>tcp</code>, <code>udp</code>, <code>icmp</code>, <code>icmpv6</code>) or number.</p> <p>[VPC only] Use <code>-1</code> to specify all protocols.</p> <p>When authorizing security group rules, specifying -1 or a protocol number other than <code>tcp</code>, <code>udp</code>, <code>icmp</code>, or <code>icmpv6</code> allows traffic on all ports, regardless of any port range you specify.</p> <p>For <code>tcp</code>, <code>udp</code>, and <code>icmp</code>, you must specify a port range.</p> <p>For <code>icmpv6</code>, the port range is optional. If you omit the port range, traffic for all types and codes is allowed. </p>\"\
        },\
        \"FromPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The start of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6 type number.</p> <p>A value of -1 indicates all ICMP/ICMPv6 types. If you specify all ICMP/ICMPv6 types, you must specify all codes. </p>\"\
        },\
        \"ToPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The end of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6 code.</p> <p>A value of -1 indicates all ICMP/ICMPv6 codes. If you specify all ICMP/ICMPv6 types, you must specify all codes.</p>\"\
        },\
        \"UserIdGroupPairs\":{\
          \"shape\":\"AwsEc2SecurityGroupUserIdGroupPairList\",\
          \"documentation\":\"<p>The security group and AWS account ID pairs.</p>\"\
        },\
        \"IpRanges\":{\
          \"shape\":\"AwsEc2SecurityGroupIpRangeList\",\
          \"documentation\":\"<p>The IPv4 ranges.</p>\"\
        },\
        \"Ipv6Ranges\":{\
          \"shape\":\"AwsEc2SecurityGroupIpv6RangeList\",\
          \"documentation\":\"<p>The IPv6 ranges.</p>\"\
        },\
        \"PrefixListIds\":{\
          \"shape\":\"AwsEc2SecurityGroupPrefixListIdList\",\
          \"documentation\":\"<p>[VPC only] The prefix list IDs for an AWS service. With outbound rules, this is the AWS service to access through a VPC endpoint from instances associated with the security group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An IP permission for an EC2 security group.</p>\"\
    },\
    \"AwsEc2SecurityGroupIpPermissionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsEc2SecurityGroupIpPermission\"}\
    },\
    \"AwsEc2SecurityGroupIpRange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CidrIp\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The IPv4 CIDR range. You can specify either a CIDR range or a source security group, but not both. To specify a single IPv4 address, use the /32 prefix length.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A range of IPv4 addresses.</p>\"\
    },\
    \"AwsEc2SecurityGroupIpRangeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsEc2SecurityGroupIpRange\"}\
    },\
    \"AwsEc2SecurityGroupIpv6Range\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CidrIpv6\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The IPv6 CIDR range. You can specify either a CIDR range or a source security group, but not both. To specify a single IPv6 address, use the /128 prefix length.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A range of IPv6 addresses.</p>\"\
    },\
    \"AwsEc2SecurityGroupIpv6RangeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsEc2SecurityGroupIpv6Range\"}\
    },\
    \"AwsEc2SecurityGroupPrefixListId\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PrefixListId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the prefix.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A prefix list ID.</p>\"\
    },\
    \"AwsEc2SecurityGroupPrefixListIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsEc2SecurityGroupPrefixListId\"}\
    },\
    \"AwsEc2SecurityGroupUserIdGroupPair\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GroupId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the security group.</p>\"\
        },\
        \"GroupName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the security group.</p>\"\
        },\
        \"PeeringStatus\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The status of a VPC peering connection, if applicable.</p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of an AWS account.</p> <p>For a referenced security group in another VPC, the account ID of the referenced security group is returned in the response. If the referenced security group is deleted, this value is not returned.</p> <p>[EC2-Classic] Required when adding or removing rules that reference a security group in another AWS. </p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the VPC for the referenced security group, if applicable.</p>\"\
        },\
        \"VpcPeeringConnectionId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the VPC peering connection, if applicable.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A relationship between a security group and a user.</p>\"\
    },\
    \"AwsEc2SecurityGroupUserIdGroupPairList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsEc2SecurityGroupUserIdGroupPair\"}\
    },\
    \"AwsElasticsearchDomainDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccessPolicies\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>IAM policy document specifying the access policies for the new Amazon ES domain.</p>\"\
        },\
        \"DomainEndpointOptions\":{\
          \"shape\":\"AwsElasticsearchDomainDomainEndpointOptions\",\
          \"documentation\":\"<p>Additional options for the domain endpoint.</p>\"\
        },\
        \"DomainId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Unique identifier for an Amazon ES domain.</p>\"\
        },\
        \"DomainName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Name of an Amazon ES domain.</p> <p>Domain names are unique across all domains owned by the same account within an AWS Region.</p> <p>Domain names must start with a lowercase letter and must be between 3 and 28 characters.</p> <p>Valid characters are a-z (lowercase only), 0-9, and â (hyphen). </p>\"\
        },\
        \"Endpoint\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Domain-specific endpoint used to submit index, search, and data upload requests to an Amazon ES domain.</p> <p>The endpoint is a service URL. </p>\"\
        },\
        \"Endpoints\":{\
          \"shape\":\"FieldMap\",\
          \"documentation\":\"<p>The key-value pair that exists if the Amazon ES domain uses VPC endpoints.</p>\"\
        },\
        \"ElasticsearchVersion\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Elasticsearch version.</p>\"\
        },\
        \"EncryptionAtRestOptions\":{\
          \"shape\":\"AwsElasticsearchDomainEncryptionAtRestOptions\",\
          \"documentation\":\"<p>Details about the configuration for encryption at rest.</p>\"\
        },\
        \"NodeToNodeEncryptionOptions\":{\
          \"shape\":\"AwsElasticsearchDomainNodeToNodeEncryptionOptions\",\
          \"documentation\":\"<p>Details about the configuration for node-to-node encryption.</p>\"\
        },\
        \"VPCOptions\":{\
          \"shape\":\"AwsElasticsearchDomainVPCOptions\",\
          \"documentation\":\"<p>Information that Amazon ES derives based on <code>VPCOptions</code> for the domain.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an Elasticsearch domain.</p>\"\
    },\
    \"AwsElasticsearchDomainDomainEndpointOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EnforceHTTPS\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether to require that all traffic to the domain arrive over HTTPS.</p>\"\
        },\
        \"TLSSecurityPolicy\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The TLS security policy to apply to the HTTPS endpoint of the Elasticsearch domain.</p> <p>Valid values:</p> <ul> <li> <p> <code>Policy-Min-TLS-1-0-2019-07</code>, which supports TLSv1.0 and higher</p> </li> <li> <p> <code>Policy-Min-TLS-1-2-2019-07</code>, which only supports TLSv1.2</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Additional options for the domain endpoint, such as whether to require HTTPS for all traffic.</p>\"\
    },\
    \"AwsElasticsearchDomainEncryptionAtRestOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether encryption at rest is enabled.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The KMS key ID. Takes the form 1a2a3a4-1a2a-3a4a-5a6a-1a2a3a4a5a6a.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about the configuration for encryption at rest.</p>\"\
    },\
    \"AwsElasticsearchDomainNodeToNodeEncryptionOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether node-to-node encryption is enabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about the configuration for node-to-node encryption.</p>\"\
    },\
    \"AwsElasticsearchDomainVPCOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvailabilityZones\":{\
          \"shape\":\"NonEmptyStringList\",\
          \"documentation\":\"<p>The list of Availability Zones associated with the VPC subnets.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"NonEmptyStringList\",\
          \"documentation\":\"<p>The list of security group IDs associated with the VPC endpoints for the domain.</p>\"\
        },\
        \"SubnetIds\":{\
          \"shape\":\"NonEmptyStringList\",\
          \"documentation\":\"<p>A list of subnet IDs associated with the VPC endpoints for the domain.</p>\"\
        },\
        \"VPCId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>ID for the VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information that Amazon ES derives based on <code>VPCOptions</code> for the domain.</p>\"\
    },\
    \"AwsElbv2LoadBalancerDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZones\",\
          \"documentation\":\"<p>The Availability Zones for the load balancer.</p>\"\
        },\
        \"CanonicalHostedZoneId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the Amazon Route 53 hosted zone associated with the load balancer.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The date and time the load balancer was created.</p>\"\
        },\
        \"DNSName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The public DNS name of the load balancer.</p>\"\
        },\
        \"IpAddressType\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The type of IP addresses used by the subnets for your load balancer. The possible values are <code>ipv4</code> (for IPv4 addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses).</p>\"\
        },\
        \"Scheme\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The nodes of an Internet-facing load balancer have public IP addresses.</p>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroups\",\
          \"documentation\":\"<p>The IDs of the security groups for the load balancer.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"LoadBalancerState\",\
          \"documentation\":\"<p>The state of the load balancer.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The type of load balancer.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the VPC for the load balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a load balancer.</p>\"\
    },\
    \"AwsIamAccessKeyDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The user associated with the IAM access key related to a finding.</p> <p>The <code>UserName</code> parameter has been replaced with the <code>PrincipalName</code> parameter because access keys can also be assigned to principals that are not IAM users.</p>\",\
          \"deprecated\":true,\
          \"deprecatedMessage\":\"This field is deprecated, use PrincipalName instead.\"\
        },\
        \"Status\":{\
          \"shape\":\"AwsIamAccessKeyStatus\",\
          \"documentation\":\"<p>The status of the IAM access key related to a finding.</p>\"\
        },\
        \"CreatedAt\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The creation date/time of the IAM access key related to a finding.</p>\"\
        },\
        \"PrincipalId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the principal associated with an access key.</p>\"\
        },\
        \"PrincipalType\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The type of principal associated with an access key.</p>\"\
        },\
        \"PrincipalName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the principal.</p>\"\
        }\
      },\
      \"documentation\":\"<p>IAM access key details related to a finding.</p>\"\
    },\
    \"AwsIamAccessKeyStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Active\",\
        \"Inactive\"\
      ]\
    },\
    \"AwsIamRoleAssumeRolePolicyDocument\":{\
      \"type\":\"string\",\
      \"max\":131072,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0009\\\\u000A\\\\u000D\\\\u0020-\\\\u007E\\\\u00A1-\\\\u00FF]+\"\
    },\
    \"AwsIamRoleDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssumeRolePolicyDocument\":{\
          \"shape\":\"AwsIamRoleAssumeRolePolicyDocument\",\
          \"documentation\":\"<p>The trust policy that grants permission to assume the role.</p>\"\
        },\
        \"CreateDate\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The date and time, in ISO 8601 date-time format, when the role was created.</p>\"\
        },\
        \"RoleId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The stable and unique string identifying the role.</p>\"\
        },\
        \"RoleName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The friendly name that identifies the role.</p>\"\
        },\
        \"MaxSessionDuration\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum session duration (in seconds) that you want to set for the specified role.</p>\"\
        },\
        \"Path\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The path to the role.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about an IAM role, including all of the role's policies.</p>\"\
    },\
    \"AwsKmsKeyDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AWSAccountId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The twelve-digit account ID of the AWS account that owns the CMK.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The date and time when the CMK was created.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The globally unique identifier for the CMK.</p>\"\
        },\
        \"KeyManager\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The manager of the CMK. CMKs in your AWS account are either customer managed or AWS managed.</p>\"\
        },\
        \"KeyState\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The state of the CMK.</p>\"\
        },\
        \"Origin\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The source of the CMK's key material.</p> <p>When this value is <code>AWS_KMS</code>, AWS KMS created the key material.</p> <p>When this value is <code>EXTERNAL</code>, the key material was imported from your existing key management infrastructure or the CMK lacks key material.</p> <p>When this value is <code>AWS_CLOUDHSM</code>, the key material was created in the AWS CloudHSM cluster associated with a custom key store.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains metadata about a customer master key (CMK).</p>\"\
    },\
    \"AwsLambdaFunctionCode\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Bucket\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>An Amazon S3 bucket in the same AWS Region as your function. The bucket can be in a different AWS account.</p>\"\
        },\
        \"S3Key\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon S3 key of the deployment package.</p>\"\
        },\
        \"S3ObjectVersion\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>For versioned objects, the version of the deployment package object to use.</p>\"\
        },\
        \"ZipFile\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The base64-encoded contents of the deployment package. AWS SDK and AWS CLI clients handle the encoding for you.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The code for the Lambda function. You can specify either an object in Amazon S3, or upload a deployment package directly.</p>\"\
    },\
    \"AwsLambdaFunctionDeadLetterConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TargetArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The dead-letter queue for failed asynchronous invocations.</p>\"\
    },\
    \"AwsLambdaFunctionDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"AwsLambdaFunctionCode\",\
          \"documentation\":\"<p>An <code>AwsLambdaFunctionCode</code> object.</p>\"\
        },\
        \"CodeSha256\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The SHA256 hash of the function's deployment package.</p>\"\
        },\
        \"DeadLetterConfig\":{\
          \"shape\":\"AwsLambdaFunctionDeadLetterConfig\",\
          \"documentation\":\"<p>The function's dead letter queue.</p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"AwsLambdaFunctionEnvironment\",\
          \"documentation\":\"<p>The function's environment variables.</p>\"\
        },\
        \"FunctionName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the function.</p>\"\
        },\
        \"Handler\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The function that Lambda calls to begin executing your function.</p>\"\
        },\
        \"KmsKeyArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The KMS key that's used to encrypt the function's environment variables. This key is only returned if you've configured a customer managed CMK.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The date and time that the function was last updated, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).</p>\"\
        },\
        \"Layers\":{\
          \"shape\":\"AwsLambdaFunctionLayerList\",\
          \"documentation\":\"<p>The function's layers.</p>\"\
        },\
        \"MasterArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>For Lambda@Edge functions, the ARN of the master function.</p>\"\
        },\
        \"MemorySize\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The memory that's allocated to the function.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The latest updated revision of the function or alias.</p>\"\
        },\
        \"Role\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The function's execution role.</p>\"\
        },\
        \"Runtime\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The runtime environment for the Lambda function.</p>\"\
        },\
        \"Timeout\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The amount of time that Lambda allows a function to run before stopping it.</p>\"\
        },\
        \"TracingConfig\":{\
          \"shape\":\"AwsLambdaFunctionTracingConfig\",\
          \"documentation\":\"<p>The function's AWS X-Ray tracing configuration.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"AwsLambdaFunctionVpcConfig\",\
          \"documentation\":\"<p>The function's networking configuration.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The version of the Lambda function.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about a function's configuration.</p>\"\
    },\
    \"AwsLambdaFunctionEnvironment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Variables\":{\
          \"shape\":\"FieldMap\",\
          \"documentation\":\"<p>Environment variable key-value pairs.</p>\"\
        },\
        \"Error\":{\
          \"shape\":\"AwsLambdaFunctionEnvironmentError\",\
          \"documentation\":\"<p>An <code>AwsLambdaFunctionEnvironmentError</code> object.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A function's environment variable settings.</p>\"\
    },\
    \"AwsLambdaFunctionEnvironmentError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ErrorCode\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The error code.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The error message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Error messages for environment variables that couldn't be applied.</p>\"\
    },\
    \"AwsLambdaFunctionLayer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the function layer.</p>\"\
        },\
        \"CodeSize\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The size of the layer archive in bytes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An AWS Lambda layer.</p>\"\
    },\
    \"AwsLambdaFunctionLayerList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsLambdaFunctionLayer\"}\
    },\
    \"AwsLambdaFunctionTracingConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Mode\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The tracing mode.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The function's AWS X-Ray tracing configuration.</p>\"\
    },\
    \"AwsLambdaFunctionVpcConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityGroupIds\":{\
          \"shape\":\"NonEmptyStringList\",\
          \"documentation\":\"<p>A list of VPC security groups IDs.</p>\"\
        },\
        \"SubnetIds\":{\
          \"shape\":\"NonEmptyStringList\",\
          \"documentation\":\"<p>A list of VPC subnet IDs.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The VPC security groups and subnets that are attached to a Lambda function. For more information, see VPC Settings.</p>\"\
    },\
    \"AwsLambdaLayerVersionDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Version\":{\
          \"shape\":\"AwsLambdaLayerVersionNumber\",\
          \"documentation\":\"<p>The version number.</p>\"\
        },\
        \"CompatibleRuntimes\":{\
          \"shape\":\"NonEmptyStringList\",\
          \"documentation\":\"<p>The layer's compatible runtimes. Maximum number of five items.</p> <p>Valid values: <code>nodejs10.x</code> | <code>nodejs12.x</code> | <code>java8</code> | <code>java11</code> | <code>python2.7</code> | <code>python3.6</code> | <code>python3.7</code> | <code>python3.8</code> | <code>dotnetcore1.0</code> | <code>dotnetcore2.1</code> | <code>go1.x</code> | <code>ruby2.5</code> | <code>provided</code> </p>\"\
        },\
        \"CreatedDate\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The date that the version was created, in ISO 8601 format. For example, 2018-11-27T15:10:45.123+0000. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about a Lambda layer version.</p>\"\
    },\
    \"AwsLambdaLayerVersionNumber\":{\"type\":\"long\"},\
    \"AwsRdsDbInstanceAssociatedRole\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoleArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that is associated with the DB instance.</p>\"\
        },\
        \"FeatureName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the feature associated with the IAM)role.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Describes the state of the association between the IAM role and the DB instance. The <code>Status</code> property returns one of the following values:</p> <ul> <li> <p> <code>ACTIVE</code> - The IAM role ARN is associated with the DB instance and can be used to access other AWS services on your behalf.</p> </li> <li> <p> <code>PENDING</code> - The IAM role ARN is being associated with the DB instance.</p> </li> <li> <p> <code>INVALID</code> - The IAM role ARN is associated with the DB instance. But the DB instance is unable to assume the IAM role in order to access other AWS services on your behalf. </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>An AWS Identity and Access Management (IAM) role associated with the DB instance.</p>\"\
    },\
    \"AwsRdsDbInstanceAssociatedRoles\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsRdsDbInstanceAssociatedRole\"}\
    },\
    \"AwsRdsDbInstanceDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssociatedRoles\":{\
          \"shape\":\"AwsRdsDbInstanceAssociatedRoles\",\
          \"documentation\":\"<p>The AWS Identity and Access Management (IAM) roles associated with the DB instance.</p>\"\
        },\
        \"CACertificateIdentifier\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The identifier of the CA certificate for this DB instance.</p>\"\
        },\
        \"DBClusterIdentifier\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>If the DB instance is a member of a DB cluster, contains the name of the DB cluster that the DB instance is a member of.</p>\"\
        },\
        \"DBInstanceIdentifier\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Contains a user-supplied database identifier. This identifier is the unique key that identifies a DB instance.</p>\"\
        },\
        \"DBInstanceClass\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Contains the name of the compute and memory capacity class of the DB instance.</p>\"\
        },\
        \"DbInstancePort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Specifies the port that the DB instance listens on. If the DB instance is part of a DB cluster, this can be a different port than the DB cluster port.</p>\"\
        },\
        \"DbiResourceId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The AWS Region-unique, immutable identifier for the DB instance. This identifier is found in AWS CloudTrail log entries whenever the AWS KMS key for the DB instance is accessed. </p>\"\
        },\
        \"DBName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The meaning of this parameter differs according to the database engine you use.</p> <p> <b>MySQL, MariaDB, SQL Server, PostgreSQL</b> </p> <p>Contains the name of the initial database of this instance that was provided at create time, if one was specified when the DB instance was created. This same name is returned for the life of the DB instance.</p> <p> <b>Oracle</b> </p> <p>Contains the Oracle System ID (SID) of the created DB instance. Not shown when the returned parameters do not apply to an Oracle DB instance. </p>\"\
        },\
        \"DeletionProtection\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the DB instance has deletion protection enabled.</p> <p>When deletion protection is enabled, the database cannot be deleted.</p>\"\
        },\
        \"Endpoint\":{\
          \"shape\":\"AwsRdsDbInstanceEndpoint\",\
          \"documentation\":\"<p>Specifies the connection endpoint.</p>\"\
        },\
        \"Engine\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Provides the name of the database engine to use for this DB instance.</p>\"\
        },\
        \"EngineVersion\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Indicates the database engine version.</p>\"\
        },\
        \"IAMDatabaseAuthenticationEnabled\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>True if mapping of AWS Identity and Access Management (IAM) accounts to database accounts is enabled, and otherwise false.</p> <p>IAM database authentication can be enabled for the following database engines.</p> <ul> <li> <p>For MySQL 5.6, minor version 5.6.34 or higher</p> </li> <li> <p>For MySQL 5.7, minor version 5.7.16 or higher</p> </li> <li> <p>Aurora 5.6 or higher</p> </li> </ul>\"\
        },\
        \"InstanceCreateTime\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Provides the date and time the DB instance was created.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>If <code>StorageEncrypted</code> is true, the AWS KMS key identifier for the encrypted DB instance.</p>\"\
        },\
        \"PubliclyAccessible\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies the accessibility options for the DB instance.</p> <p>A value of true specifies an Internet-facing instance with a publicly resolvable DNS name, which resolves to a public IP address.</p> <p>A value of false specifies an internal instance with a DNS name that resolves to a private IP address. </p>\"\
        },\
        \"StorageEncrypted\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether the DB instance is encrypted.</p>\"\
        },\
        \"TdeCredentialArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN from the key store with which the instance is associated for TDE encryption.</p>\"\
        },\
        \"VpcSecurityGroups\":{\
          \"shape\":\"AwsRdsDbInstanceVpcSecurityGroups\",\
          \"documentation\":\"<p>A list of VPC security groups that the DB instance belongs to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the details of an Amazon RDS DB instance.</p>\"\
    },\
    \"AwsRdsDbInstanceEndpoint\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Address\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Specifies the DNS address of the DB instance.</p>\"\
        },\
        \"Port\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Specifies the port that the database engine is listening on.</p>\"\
        },\
        \"HostedZoneId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the connection endpoint.</p>\"\
    },\
    \"AwsRdsDbInstanceVpcSecurityGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcSecurityGroupId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the VPC security group.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The status of the VPC security group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A VPC security groups that the DB instance belongs to.</p>\"\
    },\
    \"AwsRdsDbInstanceVpcSecurityGroups\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsRdsDbInstanceVpcSecurityGroup\"}\
    },\
    \"AwsS3BucketDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OwnerId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The canonical user ID of the owner of the S3 bucket.</p>\"\
        },\
        \"OwnerName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The display name of the owner of the S3 bucket.</p>\"\
        },\
        \"CreatedAt\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The date and time when the S3 bucket was created.</p>\"\
        },\
        \"ServerSideEncryptionConfiguration\":{\
          \"shape\":\"AwsS3BucketServerSideEncryptionConfiguration\",\
          \"documentation\":\"<p>The encryption rules that are applied to the S3 bucket.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of an Amazon S3 bucket.</p>\"\
    },\
    \"AwsS3BucketServerSideEncryptionByDefault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SSEAlgorithm\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Server-side encryption algorithm to use for the default encryption.</p>\"\
        },\
        \"KMSMasterKeyID\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>AWS KMS customer master key (CMK) ID to use for the default encryption.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the default server-side encryption to apply to new objects in the bucket.</p>\"\
    },\
    \"AwsS3BucketServerSideEncryptionConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Rules\":{\
          \"shape\":\"AwsS3BucketServerSideEncryptionRules\",\
          \"documentation\":\"<p>The encryption rules that are applied to the S3 bucket.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The encryption configuration for the S3 bucket.</p>\"\
    },\
    \"AwsS3BucketServerSideEncryptionRule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ApplyServerSideEncryptionByDefault\":{\
          \"shape\":\"AwsS3BucketServerSideEncryptionByDefault\",\
          \"documentation\":\"<p>Specifies the default server-side encryption to apply to new objects in the bucket. If a <code>PUT</code> object request doesn't specify any server-side encryption, this default encryption is applied.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An encryption rule to apply to the S3 bucket.</p>\"\
    },\
    \"AwsS3BucketServerSideEncryptionRules\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsS3BucketServerSideEncryptionRule\"}\
    },\
    \"AwsS3ObjectDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LastModified\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The date and time when the object was last modified.</p>\"\
        },\
        \"ETag\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The opaque identifier assigned by a web server to a specific version of a resource found at a URL.</p>\"\
        },\
        \"VersionId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The version of the object.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A standard MIME type describing the format of the object data.</p>\"\
        },\
        \"ServerSideEncryption\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>If the object is stored using server-side encryption, the value of the server-side encryption algorithm used when storing this object in Amazon S3.</p>\"\
        },\
        \"SSEKMSKeyId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The identifier of the AWS Key Management Service (AWS KMS) symmetric customer managed customer master key (CMK) that was used for the object.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about an Amazon S3 object.</p>\"\
    },\
    \"AwsSecurityFinding\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SchemaVersion\",\
        \"Id\",\
        \"ProductArn\",\
        \"GeneratorId\",\
        \"AwsAccountId\",\
        \"Types\",\
        \"CreatedAt\",\
        \"UpdatedAt\",\
        \"Severity\",\
        \"Title\",\
        \"Description\",\
        \"Resources\"\
      ],\
      \"members\":{\
        \"SchemaVersion\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The schema version that a finding is formatted for.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The security findings provider-specific identifier for a finding.</p>\"\
        },\
        \"ProductArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN generated by Security Hub that uniquely identifies a product that generates findings. This can be the ARN for a third-party product that is integrated with Security Hub, or the ARN for a custom integration.</p>\"\
        },\
        \"GeneratorId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The identifier for the solution-specific component (a discrete unit of logic) that generated a finding. In various security-findings providers' solutions, this generator can be called a rule, a check, a detector, a plugin, etc. </p>\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The AWS account ID that a finding is generated in.</p>\"\
        },\
        \"Types\":{\
          \"shape\":\"TypeList\",\
          \"documentation\":\"<p>One or more finding types in the format of <code>namespace/category/classifier</code> that classify a finding.</p> <p>Valid namespace values are: Software and Configuration Checks | TTPs | Effects | Unusual Behaviors | Sensitive Data Identifications</p>\"\
        },\
        \"FirstObservedAt\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>An ISO8601-formatted timestamp that indicates when the security-findings provider first observed the potential security issue that a finding captured.</p>\"\
        },\
        \"LastObservedAt\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>An ISO8601-formatted timestamp that indicates when the security-findings provider most recently observed the potential security issue that a finding captured.</p>\"\
        },\
        \"CreatedAt\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>An ISO8601-formatted timestamp that indicates when the security-findings provider created the potential security issue that a finding captured.</p>\"\
        },\
        \"UpdatedAt\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>An ISO8601-formatted timestamp that indicates when the security-findings provider last updated the finding record. </p>\"\
        },\
        \"Severity\":{\
          \"shape\":\"Severity\",\
          \"documentation\":\"<p>A finding's severity.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>A finding's confidence. Confidence is defined as the likelihood that a finding accurately identifies the behavior or issue that it was intended to identify.</p> <p>Confidence is scored on a 0-100 basis using a ratio scale, where 0 means zero percent confidence and 100 means 100 percent confidence.</p>\"\
        },\
        \"Criticality\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The level of importance assigned to the resources associated with the finding.</p> <p>A score of 0 means that the underlying resources have no criticality, and a score of 100 is reserved for the most critical resources.</p>\"\
        },\
        \"Title\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A finding's title.</p> <note> <p>In this release, <code>Title</code> is a required property.</p> </note>\"\
        },\
        \"Description\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A finding's description.</p> <note> <p>In this release, <code>Description</code> is a required property.</p> </note>\"\
        },\
        \"Remediation\":{\
          \"shape\":\"Remediation\",\
          \"documentation\":\"<p>A data type that describes the remediation options for a finding.</p>\"\
        },\
        \"SourceUrl\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A URL that links to a page about the current finding in the security-findings provider's solution.</p>\"\
        },\
        \"ProductFields\":{\
          \"shape\":\"FieldMap\",\
          \"documentation\":\"<p>A data type where security-findings providers can include additional solution-specific details that aren't part of the defined <code>AwsSecurityFinding</code> format.</p>\"\
        },\
        \"UserDefinedFields\":{\
          \"shape\":\"FieldMap\",\
          \"documentation\":\"<p>A list of name/value string pairs associated with the finding. These are custom, user-defined fields added to a finding. </p>\"\
        },\
        \"Malware\":{\
          \"shape\":\"MalwareList\",\
          \"documentation\":\"<p>A list of malware related to a finding.</p>\"\
        },\
        \"Network\":{\
          \"shape\":\"Network\",\
          \"documentation\":\"<p>The details of network-related information about a finding.</p>\"\
        },\
        \"Process\":{\
          \"shape\":\"ProcessDetails\",\
          \"documentation\":\"<p>The details of process-related information about a finding.</p>\"\
        },\
        \"ThreatIntelIndicators\":{\
          \"shape\":\"ThreatIntelIndicatorList\",\
          \"documentation\":\"<p>Threat intelligence details related to a finding.</p>\"\
        },\
        \"Resources\":{\
          \"shape\":\"ResourceList\",\
          \"documentation\":\"<p>A set of resource data types that describe the resources that the finding refers to.</p>\"\
        },\
        \"Compliance\":{\
          \"shape\":\"Compliance\",\
          \"documentation\":\"<p>This data type is exclusive to findings that are generated as the result of a check run against a specific rule in a supported security standard, such as CIS AWS Foundations. Contains security standard-related finding details.</p>\"\
        },\
        \"VerificationState\":{\
          \"shape\":\"VerificationState\",\
          \"documentation\":\"<p>Indicates the veracity of a finding. </p>\"\
        },\
        \"WorkflowState\":{\
          \"shape\":\"WorkflowState\",\
          \"documentation\":\"<p>The workflow state of a finding. </p>\"\
        },\
        \"Workflow\":{\
          \"shape\":\"Workflow\",\
          \"documentation\":\"<p>Provides information about the status of the investigation into a finding.</p>\"\
        },\
        \"RecordState\":{\
          \"shape\":\"RecordState\",\
          \"documentation\":\"<p>The record state of a finding.</p>\"\
        },\
        \"RelatedFindings\":{\
          \"shape\":\"RelatedFindingList\",\
          \"documentation\":\"<p>A list of related findings.</p>\"\
        },\
        \"Note\":{\
          \"shape\":\"Note\",\
          \"documentation\":\"<p>A user-defined note added to a finding.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides consistent format for the contents of the Security Hub-aggregated findings. <code>AwsSecurityFinding</code> format enables you to share findings between AWS security services and third-party solutions, and security standards checks.</p> <note> <p>A finding is a potential security issue generated either by AWS services (Amazon GuardDuty, Amazon Inspector, and Amazon Macie) or by the integrated third-party solutions and standards checks.</p> </note>\"\
    },\
    \"AwsSecurityFindingFilters\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProductArn\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The ARN generated by Security Hub that uniquely identifies a third-party company (security findings provider) after this provider's product (solution that generates findings) is registered with Security Hub.</p>\"\
        },\
        \"AwsAccountId\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The AWS account ID that a finding is generated in.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The security findings provider-specific identifier for a finding.</p>\"\
        },\
        \"GeneratorId\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The identifier for the solution-specific component (a discrete unit of logic) that generated a finding. In various security-findings providers' solutions, this generator can be called a rule, a check, a detector, a plugin, etc.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>A finding type in the format of <code>namespace/category/classifier</code> that classifies a finding.</p>\"\
        },\
        \"FirstObservedAt\":{\
          \"shape\":\"DateFilterList\",\
          \"documentation\":\"<p>An ISO8601-formatted timestamp that indicates when the security-findings provider first observed the potential security issue that a finding captured.</p>\"\
        },\
        \"LastObservedAt\":{\
          \"shape\":\"DateFilterList\",\
          \"documentation\":\"<p>An ISO8601-formatted timestamp that indicates when the security-findings provider most recently observed the potential security issue that a finding captured.</p>\"\
        },\
        \"CreatedAt\":{\
          \"shape\":\"DateFilterList\",\
          \"documentation\":\"<p>An ISO8601-formatted timestamp that indicates when the security-findings provider captured the potential security issue that a finding captured.</p>\"\
        },\
        \"UpdatedAt\":{\
          \"shape\":\"DateFilterList\",\
          \"documentation\":\"<p>An ISO8601-formatted timestamp that indicates when the security-findings provider last updated the finding record. </p>\"\
        },\
        \"SeverityProduct\":{\
          \"shape\":\"NumberFilterList\",\
          \"documentation\":\"<p>The native severity as defined by the security-findings provider's solution that generated the finding.</p>\"\
        },\
        \"SeverityNormalized\":{\
          \"shape\":\"NumberFilterList\",\
          \"documentation\":\"<p>The normalized severity of a finding.</p>\"\
        },\
        \"SeverityLabel\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The label of a finding's severity.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"NumberFilterList\",\
          \"documentation\":\"<p>A finding's confidence. Confidence is defined as the likelihood that a finding accurately identifies the behavior or issue that it was intended to identify.</p> <p>Confidence is scored on a 0-100 basis using a ratio scale, where 0 means zero percent confidence and 100 means 100 percent confidence.</p>\"\
        },\
        \"Criticality\":{\
          \"shape\":\"NumberFilterList\",\
          \"documentation\":\"<p>The level of importance assigned to the resources associated with the finding.</p> <p>A score of 0 means that the underlying resources have no criticality, and a score of 100 is reserved for the most critical resources.</p>\"\
        },\
        \"Title\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>A finding's title.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>A finding's description.</p>\"\
        },\
        \"RecommendationText\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The recommendation of what to do about the issue described in a finding.</p>\"\
        },\
        \"SourceUrl\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>A URL that links to a page about the current finding in the security-findings provider's solution.</p>\"\
        },\
        \"ProductFields\":{\
          \"shape\":\"MapFilterList\",\
          \"documentation\":\"<p>A data type where security-findings providers can include additional solution-specific details that aren't part of the defined <code>AwsSecurityFinding</code> format.</p>\"\
        },\
        \"ProductName\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The name of the solution (product) that generates findings.</p>\"\
        },\
        \"CompanyName\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The name of the findings provider (company) that owns the solution (product) that generates findings.</p>\"\
        },\
        \"UserDefinedFields\":{\
          \"shape\":\"MapFilterList\",\
          \"documentation\":\"<p>A list of name/value string pairs associated with the finding. These are custom, user-defined fields added to a finding. </p>\"\
        },\
        \"MalwareName\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The name of the malware that was observed.</p>\"\
        },\
        \"MalwareType\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The type of the malware that was observed.</p>\"\
        },\
        \"MalwarePath\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The filesystem path of the malware that was observed.</p>\"\
        },\
        \"MalwareState\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The state of the malware that was observed.</p>\"\
        },\
        \"NetworkDirection\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>Indicates the direction of network traffic associated with a finding.</p>\"\
        },\
        \"NetworkProtocol\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The protocol of network-related information about a finding.</p>\"\
        },\
        \"NetworkSourceIpV4\":{\
          \"shape\":\"IpFilterList\",\
          \"documentation\":\"<p>The source IPv4 address of network-related information about a finding.</p>\"\
        },\
        \"NetworkSourceIpV6\":{\
          \"shape\":\"IpFilterList\",\
          \"documentation\":\"<p>The source IPv6 address of network-related information about a finding.</p>\"\
        },\
        \"NetworkSourcePort\":{\
          \"shape\":\"NumberFilterList\",\
          \"documentation\":\"<p>The source port of network-related information about a finding.</p>\"\
        },\
        \"NetworkSourceDomain\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The source domain of network-related information about a finding.</p>\"\
        },\
        \"NetworkSourceMac\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The source media access control (MAC) address of network-related information about a finding.</p>\"\
        },\
        \"NetworkDestinationIpV4\":{\
          \"shape\":\"IpFilterList\",\
          \"documentation\":\"<p>The destination IPv4 address of network-related information about a finding.</p>\"\
        },\
        \"NetworkDestinationIpV6\":{\
          \"shape\":\"IpFilterList\",\
          \"documentation\":\"<p>The destination IPv6 address of network-related information about a finding.</p>\"\
        },\
        \"NetworkDestinationPort\":{\
          \"shape\":\"NumberFilterList\",\
          \"documentation\":\"<p>The destination port of network-related information about a finding.</p>\"\
        },\
        \"NetworkDestinationDomain\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The destination domain of network-related information about a finding.</p>\"\
        },\
        \"ProcessName\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The name of the process.</p>\"\
        },\
        \"ProcessPath\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The path to the process executable.</p>\"\
        },\
        \"ProcessPid\":{\
          \"shape\":\"NumberFilterList\",\
          \"documentation\":\"<p>The process ID.</p>\"\
        },\
        \"ProcessParentPid\":{\
          \"shape\":\"NumberFilterList\",\
          \"documentation\":\"<p>The parent process ID.</p>\"\
        },\
        \"ProcessLaunchedAt\":{\
          \"shape\":\"DateFilterList\",\
          \"documentation\":\"<p>The date/time that the process was launched.</p>\"\
        },\
        \"ProcessTerminatedAt\":{\
          \"shape\":\"DateFilterList\",\
          \"documentation\":\"<p>The date/time that the process was terminated.</p>\"\
        },\
        \"ThreatIntelIndicatorType\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The type of a threat intelligence indicator.</p>\"\
        },\
        \"ThreatIntelIndicatorValue\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The value of a threat intelligence indicator.</p>\"\
        },\
        \"ThreatIntelIndicatorCategory\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The category of a threat intelligence indicator.</p>\"\
        },\
        \"ThreatIntelIndicatorLastObservedAt\":{\
          \"shape\":\"DateFilterList\",\
          \"documentation\":\"<p>The date/time of the last observation of a threat intelligence indicator.</p>\"\
        },\
        \"ThreatIntelIndicatorSource\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The source of the threat intelligence.</p>\"\
        },\
        \"ThreatIntelIndicatorSourceUrl\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The URL for more details from the source of the threat intelligence.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>Specifies the type of the resource that details are provided for.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The canonical identifier for the given resource type.</p>\"\
        },\
        \"ResourcePartition\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The canonical AWS partition name that the Region is assigned to.</p>\"\
        },\
        \"ResourceRegion\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The canonical AWS external Region name where this resource is located.</p>\"\
        },\
        \"ResourceTags\":{\
          \"shape\":\"MapFilterList\",\
          \"documentation\":\"<p>A list of AWS tags associated with a resource at the time the finding was processed.</p>\"\
        },\
        \"ResourceAwsEc2InstanceType\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The instance type of the instance.</p>\"\
        },\
        \"ResourceAwsEc2InstanceImageId\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The Amazon Machine Image (AMI) ID of the instance.</p>\"\
        },\
        \"ResourceAwsEc2InstanceIpV4Addresses\":{\
          \"shape\":\"IpFilterList\",\
          \"documentation\":\"<p>The IPv4 addresses associated with the instance.</p>\"\
        },\
        \"ResourceAwsEc2InstanceIpV6Addresses\":{\
          \"shape\":\"IpFilterList\",\
          \"documentation\":\"<p>The IPv6 addresses associated with the instance.</p>\"\
        },\
        \"ResourceAwsEc2InstanceKeyName\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The key name associated with the instance.</p>\"\
        },\
        \"ResourceAwsEc2InstanceIamInstanceProfileArn\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The IAM profile ARN of the instance.</p>\"\
        },\
        \"ResourceAwsEc2InstanceVpcId\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The identifier of the VPC that the instance was launched in.</p>\"\
        },\
        \"ResourceAwsEc2InstanceSubnetId\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The identifier of the subnet that the instance was launched in.</p>\"\
        },\
        \"ResourceAwsEc2InstanceLaunchedAt\":{\
          \"shape\":\"DateFilterList\",\
          \"documentation\":\"<p>The date and time the instance was launched.</p>\"\
        },\
        \"ResourceAwsS3BucketOwnerId\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The canonical user ID of the owner of the S3 bucket.</p>\"\
        },\
        \"ResourceAwsS3BucketOwnerName\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The display name of the owner of the S3 bucket.</p>\"\
        },\
        \"ResourceAwsIamAccessKeyUserName\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The user associated with the IAM access key related to a finding.</p>\"\
        },\
        \"ResourceAwsIamAccessKeyStatus\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The status of the IAM access key related to a finding.</p>\"\
        },\
        \"ResourceAwsIamAccessKeyCreatedAt\":{\
          \"shape\":\"DateFilterList\",\
          \"documentation\":\"<p>The creation date/time of the IAM access key related to a finding.</p>\"\
        },\
        \"ResourceContainerName\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The name of the container related to a finding.</p>\"\
        },\
        \"ResourceContainerImageId\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The identifier of the image related to a finding.</p>\"\
        },\
        \"ResourceContainerImageName\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The name of the image related to a finding.</p>\"\
        },\
        \"ResourceContainerLaunchedAt\":{\
          \"shape\":\"DateFilterList\",\
          \"documentation\":\"<p>The date/time that the container was started.</p>\"\
        },\
        \"ResourceDetailsOther\":{\
          \"shape\":\"MapFilterList\",\
          \"documentation\":\"<p>The details of a resource that doesn't have a specific subfield for the resource type defined.</p>\"\
        },\
        \"ComplianceStatus\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>Exclusive to findings that are generated as the result of a check run against a specific rule in a supported standard, such as CIS AWS Foundations. Contains security standard-related finding details.</p>\"\
        },\
        \"VerificationState\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The veracity of a finding.</p>\"\
        },\
        \"WorkflowState\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The workflow state of a finding.</p>\"\
        },\
        \"WorkflowStatus\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The status of the investigation into a finding. Allowed values are the following.</p> <ul> <li> <p> <code>NEW</code> - The initial state of a finding, before it is reviewed.</p> </li> <li> <p> <code>NOTIFIED</code> - Indicates that the resource owner has been notified about the security issue. Used when the initial reviewer is not the resource owner, and needs intervention from the resource owner.</p> </li> <li> <p> <code>SUPPRESSED</code> - The finding will not be reviewed again and will not be acted upon.</p> </li> <li> <p> <code>RESOLVED</code> - The finding was reviewed and remediated and is now considered resolved. </p> </li> </ul>\"\
        },\
        \"RecordState\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The updated record state for the finding.</p>\"\
        },\
        \"RelatedFindingsProductArn\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The ARN of the solution that generated a related finding.</p>\"\
        },\
        \"RelatedFindingsId\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The solution-generated identifier for a related finding.</p>\"\
        },\
        \"NoteText\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The text of a note.</p>\"\
        },\
        \"NoteUpdatedAt\":{\
          \"shape\":\"DateFilterList\",\
          \"documentation\":\"<p>The timestamp of when the note was updated.</p>\"\
        },\
        \"NoteUpdatedBy\":{\
          \"shape\":\"StringFilterList\",\
          \"documentation\":\"<p>The principal that created a note.</p>\"\
        },\
        \"Keyword\":{\
          \"shape\":\"KeywordFilterList\",\
          \"documentation\":\"<p>A keyword for a finding.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A collection of attributes that are applied to all active Security Hub-aggregated findings and that result in a subset of findings that are included in this insight.</p>\"\
    },\
    \"AwsSecurityFindingIdentifier\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"ProductArn\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The identifier of the finding that was specified by the finding provider.</p>\"\
        },\
        \"ProductArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN generated by Security Hub that uniquely identifies a product that generates findings. This can be the ARN for a third-party product that is integrated with Security Hub, or the ARN for a custom integration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies a finding to update using <code>BatchUpdateFindings</code>.</p>\"\
    },\
    \"AwsSecurityFindingIdentifierList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsSecurityFindingIdentifier\"}\
    },\
    \"AwsSecurityFindingList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsSecurityFinding\"}\
    },\
    \"AwsSnsTopicDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KmsMasterKeyId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of an AWS managed customer master key (CMK) for Amazon SNS or a custom CMK.</p>\"\
        },\
        \"Subscription\":{\
          \"shape\":\"AwsSnsTopicSubscriptionList\",\
          \"documentation\":\"<p>Subscription is an embedded property that describes the subscription endpoints of an Amazon SNS topic.</p>\"\
        },\
        \"TopicName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the topic.</p>\"\
        },\
        \"Owner\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The subscription's owner.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A wrapper type for the topic's Amazon Resource Name (ARN).</p>\"\
    },\
    \"AwsSnsTopicSubscription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Endpoint\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The subscription's endpoint (format depends on the protocol).</p>\"\
        },\
        \"Protocol\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The subscription's protocol.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A wrapper type for the attributes of an Amazon SNS subscription.</p>\"\
    },\
    \"AwsSnsTopicSubscriptionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsSnsTopicSubscription\"}\
    },\
    \"AwsSqsQueueDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KmsDataKeyReusePeriodSeconds\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again.</p>\"\
        },\
        \"KmsMasterKeyId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of an AWS managed customer master key (CMK) for Amazon SQS or a custom CMK.</p>\"\
        },\
        \"QueueName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the new queue.</p>\"\
        },\
        \"DeadLetterTargetArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dead-letter queue to which Amazon SQS moves messages after the value of <code>maxReceiveCount</code> is exceeded. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Data about a queue.</p>\"\
    },\
    \"AwsWafWebAclDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A friendly name or description of the WebACL. You can't change the name of a WebACL after you create it.</p>\"\
        },\
        \"DefaultAction\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The action to perform if none of the rules contained in the WebACL match.</p>\"\
        },\
        \"Rules\":{\
          \"shape\":\"AwsWafWebAclRuleList\",\
          \"documentation\":\"<p>An array that contains the action for each rule in a WebACL, the priority of the rule, and the ID of the rule.</p>\"\
        },\
        \"WebAclId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A unique identifier for a WebACL.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about a WAF WebACL.</p>\"\
    },\
    \"AwsWafWebAclRule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Action\":{\
          \"shape\":\"WafAction\",\
          \"documentation\":\"<p>Specifies the action that CloudFront or AWS WAF takes when a web request matches the conditions in the rule. </p>\"\
        },\
        \"ExcludedRules\":{\
          \"shape\":\"WafExcludedRuleList\",\
          \"documentation\":\"<p>Rules to exclude from a rule group.</p>\"\
        },\
        \"OverrideAction\":{\
          \"shape\":\"WafOverrideAction\",\
          \"documentation\":\"<p>Use the <code>OverrideAction</code> to test your RuleGroup.</p> <p>Any rule in a RuleGroup can potentially block a request. If you set the <code>OverrideAction</code> to <code>None</code>, the RuleGroup blocks a request if any individual rule in the RuleGroup matches the request and is configured to block that request.</p> <p>However, if you first want to test the RuleGroup, set the <code>OverrideAction</code> to <code>Count</code>. The RuleGroup then overrides any block action specified by individual rules contained within the group. Instead of blocking matching requests, those requests are counted.</p> <p> <code>ActivatedRule</code>|<code>OverrideAction</code> applies only when updating or adding a RuleGroup to a WebACL. In this case you do not use <code>ActivatedRule</code>|<code>Action</code>. For all other update requests, <code>ActivatedRule</code>|<code>Action</code> is used instead of <code>ActivatedRule</code>|<code>OverrideAction</code>. </p>\"\
        },\
        \"Priority\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Specifies the order in which the rules in a WebACL are evaluated. Rules with a lower value for <code>Priority</code> are evaluated before rules with a higher value. The value must be a unique integer. If you add multiple rules to a WebACL, the values do not need to be consecutive.</p>\"\
        },\
        \"RuleId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The identifier for a rule.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The rule type.</p> <p>Valid values: <code>REGULAR</code> | <code>RATE_BASED</code> | <code>GROUP</code> </p> <p>The default is <code>REGULAR</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details for a rule in a WAF WebACL.</p>\"\
    },\
    \"AwsWafWebAclRuleList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AwsWafWebAclRule\"}\
    },\
    \"BatchDisableStandardsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"StandardsSubscriptionArns\"],\
      \"members\":{\
        \"StandardsSubscriptionArns\":{\
          \"shape\":\"StandardsSubscriptionArns\",\
          \"documentation\":\"<p>The ARNs of the standards subscriptions to disable.</p>\"\
        }\
      }\
    },\
    \"BatchDisableStandardsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StandardsSubscriptions\":{\
          \"shape\":\"StandardsSubscriptions\",\
          \"documentation\":\"<p>The details of the standards subscriptions that were disabled.</p>\"\
        }\
      }\
    },\
    \"BatchEnableStandardsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"StandardsSubscriptionRequests\"],\
      \"members\":{\
        \"StandardsSubscriptionRequests\":{\
          \"shape\":\"StandardsSubscriptionRequests\",\
          \"documentation\":\"<p>The list of standards checks to enable.</p>\"\
        }\
      }\
    },\
    \"BatchEnableStandardsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StandardsSubscriptions\":{\
          \"shape\":\"StandardsSubscriptions\",\
          \"documentation\":\"<p>The details of the standards subscriptions that were enabled.</p>\"\
        }\
      }\
    },\
    \"BatchImportFindingsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Findings\"],\
      \"members\":{\
        \"Findings\":{\
          \"shape\":\"AwsSecurityFindingList\",\
          \"documentation\":\"<p>A list of findings to import. To successfully import a finding, it must follow the <a href=\\\"https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-findings-format.html\\\">AWS Security Finding Format</a>. Maximum of 100 findings per request.</p>\"\
        }\
      }\
    },\
    \"BatchImportFindingsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FailedCount\",\
        \"SuccessCount\"\
      ],\
      \"members\":{\
        \"FailedCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of findings that failed to import.</p>\"\
        },\
        \"SuccessCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of findings that were successfully imported.</p>\"\
        },\
        \"FailedFindings\":{\
          \"shape\":\"ImportFindingsErrorList\",\
          \"documentation\":\"<p>The list of findings that failed to import.</p>\"\
        }\
      }\
    },\
    \"BatchUpdateFindingsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FindingIdentifiers\"],\
      \"members\":{\
        \"FindingIdentifiers\":{\
          \"shape\":\"AwsSecurityFindingIdentifierList\",\
          \"documentation\":\"<p>The list of findings to update. <code>BatchUpdateFindings</code> can be used to update up to 100 findings at a time.</p> <p>For each finding, the list provides the finding identifier and the ARN of the finding provider.</p>\"\
        },\
        \"Note\":{\"shape\":\"NoteUpdate\"},\
        \"Severity\":{\
          \"shape\":\"SeverityUpdate\",\
          \"documentation\":\"<p>Used to update the finding severity.</p>\"\
        },\
        \"VerificationState\":{\
          \"shape\":\"VerificationState\",\
          \"documentation\":\"<p>Indicates the veracity of a finding.</p> <p>The available values for <code>VerificationState</code> are as follows.</p> <ul> <li> <p> <code>UNKNOWN</code> â The default disposition of a security finding</p> </li> <li> <p> <code>TRUE_POSITIVE</code> â The security finding is confirmed</p> </li> <li> <p> <code>FALSE_POSITIVE</code> â The security finding was determined to be a false alarm</p> </li> <li> <p> <code>BENIGN_POSITIVE</code> â A special case of <code>TRUE_POSITIVE</code> where the finding doesn't pose any threat, is expected, or both</p> </li> </ul>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"RatioScale\",\
          \"documentation\":\"<p>The updated value for the finding confidence. Confidence is defined as the likelihood that a finding accurately identifies the behavior or issue that it was intended to identify.</p> <p>Confidence is scored on a 0-100 basis using a ratio scale, where 0 means zero percent confidence and 100 means 100 percent confidence.</p>\"\
        },\
        \"Criticality\":{\
          \"shape\":\"RatioScale\",\
          \"documentation\":\"<p>The updated value for the level of importance assigned to the resources associated with the findings.</p> <p>A score of 0 means that the underlying resources have no criticality, and a score of 100 is reserved for the most critical resources. </p>\"\
        },\
        \"Types\":{\
          \"shape\":\"TypeList\",\
          \"documentation\":\"<p>One or more finding types in the format of namespace/category/classifier that classify a finding.</p> <p>Valid namespace values are as follows.</p> <ul> <li> <p>Software and Configuration Checks</p> </li> <li> <p>TTPs</p> </li> <li> <p>Effects</p> </li> <li> <p>Unusual Behaviors</p> </li> <li> <p>Sensitive Data Identifications </p> </li> </ul>\"\
        },\
        \"UserDefinedFields\":{\
          \"shape\":\"FieldMap\",\
          \"documentation\":\"<p>A list of name/value string pairs associated with the finding. These are custom, user-defined fields added to a finding.</p>\"\
        },\
        \"Workflow\":{\
          \"shape\":\"WorkflowUpdate\",\
          \"documentation\":\"<p>Used to update the workflow status of a finding.</p> <p>The workflow status indicates the progress of the investigation into the finding. </p>\"\
        },\
        \"RelatedFindings\":{\
          \"shape\":\"RelatedFindingList\",\
          \"documentation\":\"<p>A list of findings that are related to the updated findings.</p>\"\
        }\
      }\
    },\
    \"BatchUpdateFindingsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ProcessedFindings\",\
        \"UnprocessedFindings\"\
      ],\
      \"members\":{\
        \"ProcessedFindings\":{\
          \"shape\":\"AwsSecurityFindingIdentifierList\",\
          \"documentation\":\"<p>The list of findings that were updated successfully.</p>\"\
        },\
        \"UnprocessedFindings\":{\
          \"shape\":\"BatchUpdateFindingsUnprocessedFindingsList\",\
          \"documentation\":\"<p>The list of findings that were not updated.</p>\"\
        }\
      }\
    },\
    \"BatchUpdateFindingsUnprocessedFinding\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FindingIdentifier\",\
        \"ErrorCode\",\
        \"ErrorMessage\"\
      ],\
      \"members\":{\
        \"FindingIdentifier\":{\
          \"shape\":\"AwsSecurityFindingIdentifier\",\
          \"documentation\":\"<p>The identifier of the finding that was not updated.</p>\"\
        },\
        \"ErrorCode\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The code associated with the error.</p>\"\
        },\
        \"ErrorMessage\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The message associated with the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A finding from a <code>BatchUpdateFindings</code> request that Security Hub was unable to update.</p>\"\
    },\
    \"BatchUpdateFindingsUnprocessedFindingsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchUpdateFindingsUnprocessedFinding\"}\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"CategoryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyString\"}\
    },\
    \"Compliance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"ComplianceStatus\",\
          \"documentation\":\"<p>The result of a standards check.</p> <p>The valid values for <code>Status</code> are as follows.</p> <ul> <li> <ul> <li> <p> <code>PASSED</code> - Standards check passed for all evaluated resources.</p> </li> <li> <p> <code>WARNING</code> - Some information is missing or this check is not supported for your configuration.</p> </li> <li> <p> <code>FAILED</code> - Standards check failed for at least one evaluated resource.</p> </li> <li> <p> <code>NOT_AVAILABLE</code> - Check could not be performed due to a service outage, API error, or because the result of the AWS Config evaluation was <code>NOT_APPLICABLE</code>. If the AWS Config evaluation result was <code>NOT_APPLICABLE</code>, then after 3 days, Security Hub automatically archives the finding.</p> </li> </ul> </li> </ul>\"\
        },\
        \"RelatedRequirements\":{\
          \"shape\":\"RelatedRequirementsList\",\
          \"documentation\":\"<p>For a control, the industry or regulatory framework requirements that are related to the control. The check for that control is aligned with these requirements.</p>\"\
        },\
        \"StatusReasons\":{\
          \"shape\":\"StatusReasonsList\",\
          \"documentation\":\"<p>For findings generated from controls, a list of reasons behind the value of <code>Status</code>. For the list of status reason codes and their meanings, see <a href=\\\"https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-results.html#securityhub-standards-results-asff\\\">Standards-related information in the ASFF</a> in the <i>AWS Security Hub User Guide</i>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains finding details that are specific to control-based findings. Only returned for findings generated from controls.</p>\"\
    },\
    \"ComplianceStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PASSED\",\
        \"WARNING\",\
        \"FAILED\",\
        \"NOT_AVAILABLE\"\
      ]\
    },\
    \"ContainerDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the container related to a finding.</p>\"\
        },\
        \"ImageId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The identifier of the image related to a finding.</p>\"\
        },\
        \"ImageName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the image related to a finding.</p>\"\
        },\
        \"LaunchedAt\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The date and time when the container started.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Container details related to a finding.</p>\"\
    },\
    \"ControlStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"DISABLED\"\
      ]\
    },\
    \"CreateActionTargetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Description\",\
        \"Id\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the custom action target.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The description for the custom action target.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID for the custom action target.</p>\"\
        }\
      }\
    },\
    \"CreateActionTargetResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ActionTargetArn\"],\
      \"members\":{\
        \"ActionTargetArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN for the custom action target.</p>\"\
        }\
      }\
    },\
    \"CreateInsightRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Filters\",\
        \"GroupByAttribute\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the custom insight to create.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"AwsSecurityFindingFilters\",\
          \"documentation\":\"<p>One or more attributes used to filter the findings included in the insight. The insight only includes findings that match the criteria defined in the filters.</p>\"\
        },\
        \"GroupByAttribute\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The attribute used to group the findings for the insight. The grouping attribute identifies the type of item that the insight applies to. For example, if an insight is grouped by resource identifier, then the insight produces a list of resource identifiers.</p>\"\
        }\
      }\
    },\
    \"CreateInsightResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"InsightArn\"],\
      \"members\":{\
        \"InsightArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the insight created.</p>\"\
        }\
      }\
    },\
    \"CreateMembersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccountDetails\":{\
          \"shape\":\"AccountDetailsList\",\
          \"documentation\":\"<p>The list of accounts to associate with the Security Hub master account. For each account, the list includes the account ID and the email address.</p>\"\
        }\
      }\
    },\
    \"CreateMembersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UnprocessedAccounts\":{\
          \"shape\":\"ResultList\",\
          \"documentation\":\"<p>The list of AWS accounts that were not processed. For each account, the list includes the account ID and the email address.</p>\"\
        }\
      }\
    },\
    \"DateFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Start\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A start date for the date filter.</p>\"\
        },\
        \"End\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>An end date for the date filter.</p>\"\
        },\
        \"DateRange\":{\
          \"shape\":\"DateRange\",\
          \"documentation\":\"<p>A date range for the date filter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A date filter for querying findings.</p>\"\
    },\
    \"DateFilterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DateFilter\"}\
    },\
    \"DateRange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>A date range value for the date filter.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"DateRangeUnit\",\
          \"documentation\":\"<p>A date range unit for the date filter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A date range for the date filter.</p>\"\
    },\
    \"DateRangeUnit\":{\
      \"type\":\"string\",\
      \"enum\":[\"DAYS\"]\
    },\
    \"DeclineInvitationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AccountIds\"],\
      \"members\":{\
        \"AccountIds\":{\
          \"shape\":\"AccountIdList\",\
          \"documentation\":\"<p>The list of account IDs for the accounts from which to decline the invitations to Security Hub.</p>\"\
        }\
      }\
    },\
    \"DeclineInvitationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UnprocessedAccounts\":{\
          \"shape\":\"ResultList\",\
          \"documentation\":\"<p>The list of AWS accounts that were not processed. For each account, the list includes the account ID and the email address.</p>\"\
        }\
      }\
    },\
    \"DeleteActionTargetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ActionTargetArn\"],\
      \"members\":{\
        \"ActionTargetArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the custom action target to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ActionTargetArn\"\
        }\
      }\
    },\
    \"DeleteActionTargetResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ActionTargetArn\"],\
      \"members\":{\
        \"ActionTargetArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the custom action target that was deleted.</p>\"\
        }\
      }\
    },\
    \"DeleteInsightRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InsightArn\"],\
      \"members\":{\
        \"InsightArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the insight to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InsightArn\"\
        }\
      }\
    },\
    \"DeleteInsightResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"InsightArn\"],\
      \"members\":{\
        \"InsightArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the insight that was deleted.</p>\"\
        }\
      }\
    },\
    \"DeleteInvitationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AccountIds\"],\
      \"members\":{\
        \"AccountIds\":{\
          \"shape\":\"AccountIdList\",\
          \"documentation\":\"<p>The list of the account IDs that sent the invitations to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteInvitationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UnprocessedAccounts\":{\
          \"shape\":\"ResultList\",\
          \"documentation\":\"<p>The list of AWS accounts for which the invitations were not deleted. For each account, the list includes the account ID and the email address.</p>\"\
        }\
      }\
    },\
    \"DeleteMembersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccountIds\":{\
          \"shape\":\"AccountIdList\",\
          \"documentation\":\"<p>The list of account IDs for the member accounts to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteMembersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UnprocessedAccounts\":{\
          \"shape\":\"ResultList\",\
          \"documentation\":\"<p>The list of AWS accounts that were not deleted. For each account, the list includes the account ID and the email address.</p>\"\
        }\
      }\
    },\
    \"DescribeActionTargetsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ActionTargetArns\":{\
          \"shape\":\"ArnList\",\
          \"documentation\":\"<p>A list of custom action target ARNs for the custom action targets to retrieve.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token that is required for pagination. On your first call to the <code>DescribeActionTargets</code> operation, set the value of this parameter to <code>NULL</code>.</p> <p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return.</p>\"\
        }\
      }\
    },\
    \"DescribeActionTargetsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ActionTargets\"],\
      \"members\":{\
        \"ActionTargets\":{\
          \"shape\":\"ActionTargetList\",\
          \"documentation\":\"<p>A list of <code>ActionTarget</code> objects. Each object includes the <code>ActionTargetArn</code>, <code>Description</code>, and <code>Name</code> of a custom action target available in Security Hub.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The pagination token to use to request the next page of results.</p>\"\
        }\
      }\
    },\
    \"DescribeHubRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HubArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the Hub resource to retrieve.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"HubArn\"\
        }\
      }\
    },\
    \"DescribeHubResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HubArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the Hub resource that was retrieved.</p>\"\
        },\
        \"SubscribedAt\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The date and time when Security Hub was enabled in the account.</p>\"\
        }\
      }\
    },\
    \"DescribeProductsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token that is required for pagination. On your first call to the <code>DescribeProducts</code> operation, set the value of this parameter to <code>NULL</code>.</p> <p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxResults\"\
        }\
      }\
    },\
    \"DescribeProductsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Products\"],\
      \"members\":{\
        \"Products\":{\
          \"shape\":\"ProductsList\",\
          \"documentation\":\"<p>A list of products, including details for each product.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The pagination token to use to request the next page of results.</p>\"\
        }\
      }\
    },\
    \"DescribeStandardsControlsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"StandardsSubscriptionArn\"],\
      \"members\":{\
        \"StandardsSubscriptionArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of a resource that represents your subscription to a supported standard.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"StandardsSubscriptionArn\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token that is required for pagination. On your first call to the <code>DescribeStandardsControls</code> operation, set the value of this parameter to <code>NULL</code>.</p> <p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of security standard controls to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxResults\"\
        }\
      }\
    },\
    \"DescribeStandardsControlsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Controls\":{\
          \"shape\":\"StandardsControls\",\
          \"documentation\":\"<p>A list of security standards controls.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The pagination token to use to request the next page of results.</p>\"\
        }\
      }\
    },\
    \"DescribeStandardsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token that is required for pagination. On your first call to the <code>DescribeStandards</code> operation, set the value of this parameter to <code>NULL</code>.</p> <p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of standards to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxResults\"\
        }\
      }\
    },\
    \"DescribeStandardsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Standards\":{\
          \"shape\":\"Standards\",\
          \"documentation\":\"<p>A list of available standards.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The pagination token to use to request the next page of results.</p>\"\
        }\
      }\
    },\
    \"DisableImportFindingsForProductRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ProductSubscriptionArn\"],\
      \"members\":{\
        \"ProductSubscriptionArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the integrated product to disable the integration for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ProductSubscriptionArn\"\
        }\
      }\
    },\
    \"DisableImportFindingsForProductResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DisableSecurityHubRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DisableSecurityHubResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DisassociateFromMasterAccountRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DisassociateFromMasterAccountResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DisassociateMembersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccountIds\":{\
          \"shape\":\"AccountIdList\",\
          \"documentation\":\"<p>The account IDs of the member accounts to disassociate from the master account.</p>\"\
        }\
      }\
    },\
    \"DisassociateMembersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"Double\":{\"type\":\"double\"},\
    \"EnableImportFindingsForProductRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ProductArn\"],\
      \"members\":{\
        \"ProductArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the product to enable the integration for.</p>\"\
        }\
      }\
    },\
    \"EnableImportFindingsForProductResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProductSubscriptionArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of your subscription to the product to enable integrations for.</p>\"\
        }\
      }\
    },\
    \"EnableSecurityHubRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags to add to the hub resource when you enable Security Hub.</p>\"\
        },\
        \"EnableDefaultStandards\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether to enable the security standards that Security Hub has designated as automatically enabled. If you do not provide a value for <code>EnableDefaultStandards</code>, it is set to <code>true</code>. To not enable the automatically enabled standards, set <code>EnableDefaultStandards</code> to <code>false</code>.</p>\"\
        }\
      }\
    },\
    \"EnableSecurityHubResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"FieldMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"NonEmptyString\"},\
      \"value\":{\"shape\":\"NonEmptyString\"}\
    },\
    \"GetEnabledStandardsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StandardsSubscriptionArns\":{\
          \"shape\":\"StandardsSubscriptionArns\",\
          \"documentation\":\"<p>The list of the standards subscription ARNs for the standards to retrieve.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token that is required for pagination. On your first call to the <code>GetEnabledStandards</code> operation, set the value of this parameter to <code>NULL</code>.</p> <p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return in the response.</p>\"\
        }\
      }\
    },\
    \"GetEnabledStandardsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StandardsSubscriptions\":{\
          \"shape\":\"StandardsSubscriptions\",\
          \"documentation\":\"<p>The list of <code>StandardsSubscriptions</code> objects that include information about the enabled standards.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The pagination token to use to request the next page of results.</p>\"\
        }\
      }\
    },\
    \"GetFindingsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filters\":{\
          \"shape\":\"AwsSecurityFindingFilters\",\
          \"documentation\":\"<p>The finding attributes used to define a condition to filter the returned findings.</p>\"\
        },\
        \"SortCriteria\":{\
          \"shape\":\"SortCriteria\",\
          \"documentation\":\"<p>The finding attributes used to sort the list of returned findings.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token that is required for pagination. On your first call to the <code>GetFindings</code> operation, set the value of this parameter to <code>NULL</code>.</p> <p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of findings to return.</p>\"\
        }\
      }\
    },\
    \"GetFindingsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Findings\"],\
      \"members\":{\
        \"Findings\":{\
          \"shape\":\"AwsSecurityFindingList\",\
          \"documentation\":\"<p>The findings that matched the filters specified in the request.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The pagination token to use to request the next page of results.</p>\"\
        }\
      }\
    },\
    \"GetInsightResultsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InsightArn\"],\
      \"members\":{\
        \"InsightArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the insight for which to return results.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InsightArn\"\
        }\
      }\
    },\
    \"GetInsightResultsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"InsightResults\"],\
      \"members\":{\
        \"InsightResults\":{\
          \"shape\":\"InsightResults\",\
          \"documentation\":\"<p>The insight results returned by the operation.</p>\"\
        }\
      }\
    },\
    \"GetInsightsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InsightArns\":{\
          \"shape\":\"ArnList\",\
          \"documentation\":\"<p>The ARNs of the insights to describe. If you do not provide any insight ARNs, then <code>GetInsights</code> returns all of your custom insights. It does not return any managed insights.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token that is required for pagination. On your first call to the <code>GetInsights</code> operation, set the value of this parameter to <code>NULL</code>.</p> <p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to return in the response.</p>\"\
        }\
      }\
    },\
    \"GetInsightsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Insights\"],\
      \"members\":{\
        \"Insights\":{\
          \"shape\":\"InsightList\",\
          \"documentation\":\"<p>The insights returned by the operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The pagination token to use to request the next page of results.</p>\"\
        }\
      }\
    },\
    \"GetInvitationsCountRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"GetInvitationsCountResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InvitationsCount\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of all membership invitations sent to this Security Hub member account, not including the currently accepted invitation.</p>\"\
        }\
      }\
    },\
    \"GetMasterAccountRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"GetMasterAccountResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Master\":{\
          \"shape\":\"Invitation\",\
          \"documentation\":\"<p>A list of details about the Security Hub master account for the current member account. </p>\"\
        }\
      }\
    },\
    \"GetMembersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AccountIds\"],\
      \"members\":{\
        \"AccountIds\":{\
          \"shape\":\"AccountIdList\",\
          \"documentation\":\"<p>The list of account IDs for the Security Hub member accounts to return the details for. </p>\"\
        }\
      }\
    },\
    \"GetMembersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Members\":{\
          \"shape\":\"MemberList\",\
          \"documentation\":\"<p>The list of details about the Security Hub member accounts.</p>\"\
        },\
        \"UnprocessedAccounts\":{\
          \"shape\":\"ResultList\",\
          \"documentation\":\"<p>The list of AWS accounts that could not be processed. For each account, the list includes the account ID and the email address.</p>\"\
        }\
      }\
    },\
    \"ImportFindingsError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Id\",\
        \"ErrorCode\",\
        \"ErrorMessage\"\
      ],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The identifier of the finding that could not be updated.</p>\"\
        },\
        \"ErrorCode\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The code of the error returned by the <code>BatchImportFindings</code> operation.</p>\"\
        },\
        \"ErrorMessage\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The message of the error returned by the <code>BatchImportFindings</code> operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The list of the findings that cannot be imported. For each finding, the list provides the error.</p>\"\
    },\
    \"ImportFindingsErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ImportFindingsError\"}\
    },\
    \"Insight\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InsightArn\",\
        \"Name\",\
        \"Filters\",\
        \"GroupByAttribute\"\
      ],\
      \"members\":{\
        \"InsightArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of a Security Hub insight.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of a Security Hub insight.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"AwsSecurityFindingFilters\",\
          \"documentation\":\"<p>One or more attributes used to filter the findings included in the insight. The insight only includes findings that match the criteria defined in the filters.</p>\"\
        },\
        \"GroupByAttribute\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The grouping attribute for the insight's findings. Indicates how to group the matching findings, and identifies the type of item that the insight applies to. For example, if an insight is grouped by resource identifier, then the insight produces a list of resource identifiers.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a Security Hub insight.</p>\"\
    },\
    \"InsightList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Insight\"}\
    },\
    \"InsightResultValue\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GroupByAttributeValue\",\
        \"Count\"\
      ],\
      \"members\":{\
        \"GroupByAttributeValue\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The value of the attribute that the findings are grouped by for the insight whose results are returned by the <code>GetInsightResults</code> operation.</p>\"\
        },\
        \"Count\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of findings returned for each <code>GroupByAttributeValue</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The insight result values returned by the <code>GetInsightResults</code> operation.</p>\"\
    },\
    \"InsightResultValueList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InsightResultValue\"}\
    },\
    \"InsightResults\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InsightArn\",\
        \"GroupByAttribute\",\
        \"ResultValues\"\
      ],\
      \"members\":{\
        \"InsightArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the insight whose results are returned by the <code>GetInsightResults</code> operation.</p>\"\
        },\
        \"GroupByAttribute\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The attribute that the findings are grouped by for the insight whose results are returned by the <code>GetInsightResults</code> operation.</p>\"\
        },\
        \"ResultValues\":{\
          \"shape\":\"InsightResultValueList\",\
          \"documentation\":\"<p>The list of insight result values returned by the <code>GetInsightResults</code> operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The insight results returned by the <code>GetInsightResults</code> operation.</p>\"\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"IntegrationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SEND_FINDINGS_TO_SECURITY_HUB\",\
        \"RECEIVE_FINDINGS_FROM_SECURITY_HUB\"\
      ]\
    },\
    \"IntegrationTypeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IntegrationType\"}\
    },\
    \"InternalException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"NonEmptyString\"},\
        \"Code\":{\"shape\":\"NonEmptyString\"}\
      },\
      \"documentation\":\"<p>Internal server error.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true\
    },\
    \"InvalidAccessException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"NonEmptyString\"},\
        \"Code\":{\"shape\":\"NonEmptyString\"}\
      },\
      \"documentation\":\"<p>AWS Security Hub isn't enabled for the account used to make this request.</p>\",\
      \"error\":{\"httpStatusCode\":401},\
      \"exception\":true\
    },\
    \"InvalidInputException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"NonEmptyString\"},\
        \"Code\":{\"shape\":\"NonEmptyString\"}\
      },\
      \"documentation\":\"<p>The request was rejected because you supplied an invalid or out-of-range value for an input parameter.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"Invitation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccountId\":{\
          \"shape\":\"AccountId\",\
          \"documentation\":\"<p>The account ID of the Security Hub master account that the invitation was sent from.</p>\"\
        },\
        \"InvitationId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ID of the invitation sent to the member account.</p>\"\
        },\
        \"InvitedAt\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp of when the invitation was sent.</p>\"\
        },\
        \"MemberStatus\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The current status of the association between the member and master accounts.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about an invitation.</p>\"\
    },\
    \"InvitationList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Invitation\"}\
    },\
    \"InviteMembersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccountIds\":{\
          \"shape\":\"AccountIdList\",\
          \"documentation\":\"<p>The list of account IDs of the AWS accounts to invite to Security Hub as members. </p>\"\
        }\
      }\
    },\
    \"InviteMembersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UnprocessedAccounts\":{\
          \"shape\":\"ResultList\",\
          \"documentation\":\"<p>The list of AWS accounts that could not be processed. For each account, the list includes the account ID and the email address.</p>\"\
        }\
      }\
    },\
    \"IpFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Cidr\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A finding's CIDR value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The IP filter for querying findings.</p>\"\
    },\
    \"IpFilterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IpFilter\"}\
    },\
    \"KeywordFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A value for the keyword.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A keyword filter for querying findings.</p>\"\
    },\
    \"KeywordFilterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"KeywordFilter\"}\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"NonEmptyString\"},\
        \"Code\":{\"shape\":\"NonEmptyString\"}\
      },\
      \"documentation\":\"<p>The request was rejected because it attempted to create resources beyond the current AWS account limits. The error code describes the limit exceeded.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"ListEnabledProductsForImportRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token that is required for pagination. On your first call to the <code>ListEnabledProductsForImport</code> operation, set the value of this parameter to <code>NULL</code>.</p> <p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to return in the response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxResults\"\
        }\
      }\
    },\
    \"ListEnabledProductsForImportResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProductSubscriptions\":{\
          \"shape\":\"ProductSubscriptionArnList\",\
          \"documentation\":\"<p>The list of ARNs for the resources that represent your subscriptions to products. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The pagination token to use to request the next page of results.</p>\"\
        }\
      }\
    },\
    \"ListInvitationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to return in the response. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxResults\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token that is required for pagination. On your first call to the <code>ListInvitations</code> operation, set the value of this parameter to <code>NULL</code>.</p> <p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        }\
      }\
    },\
    \"ListInvitationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Invitations\":{\
          \"shape\":\"InvitationList\",\
          \"documentation\":\"<p>The details of the invitations returned by the operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The pagination token to use to request the next page of results.</p>\"\
        }\
      }\
    },\
    \"ListMembersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OnlyAssociated\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies which member accounts to include in the response based on their relationship status with the master account. The default value is <code>TRUE</code>.</p> <p>If <code>OnlyAssociated</code> is set to <code>TRUE</code>, the response includes member accounts whose relationship status with the master is set to <code>ENABLED</code> or <code>DISABLED</code>.</p> <p>If <code>OnlyAssociated</code> is set to <code>FALSE</code>, the response includes all existing member accounts. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"OnlyAssociated\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of items to return in the response. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxResults\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token that is required for pagination. On your first call to the <code>ListMembers</code> operation, set the value of this parameter to <code>NULL</code>.</p> <p>For subsequent calls to the operation, to continue listing data, set the value of this parameter to the value returned from the previous response.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        }\
      }\
    },\
    \"ListMembersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Members\":{\
          \"shape\":\"MemberList\",\
          \"documentation\":\"<p>Member details returned by the operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The pagination token to use to request the next page of results.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The ARN of the resource to retrieve tags for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceArn\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags associated with a resource.</p>\"\
        }\
      }\
    },\
    \"LoadBalancerState\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The state code. The initial state of the load balancer is provisioning.</p> <p>After the load balancer is fully set up and ready to route traffic, its state is active.</p> <p>If the load balancer could not be set up, its state is failed. </p>\"\
        },\
        \"Reason\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A description of the state.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the state of the load balancer.</p>\"\
    },\
    \"Malware\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the malware that was observed.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"MalwareType\",\
          \"documentation\":\"<p>The type of the malware that was observed.</p>\"\
        },\
        \"Path\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The file system path of the malware that was observed.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"MalwareState\",\
          \"documentation\":\"<p>The state of the malware that was observed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of malware related to a finding.</p>\"\
    },\
    \"MalwareList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Malware\"}\
    },\
    \"MalwareState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"OBSERVED\",\
        \"REMOVAL_FAILED\",\
        \"REMOVED\"\
      ]\
    },\
    \"MalwareType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ADWARE\",\
        \"BLENDED_THREAT\",\
        \"BOTNET_AGENT\",\
        \"COIN_MINER\",\
        \"EXPLOIT_KIT\",\
        \"KEYLOGGER\",\
        \"MACRO\",\
        \"POTENTIALLY_UNWANTED\",\
        \"SPYWARE\",\
        \"RANSOMWARE\",\
        \"REMOTE_ACCESS\",\
        \"ROOTKIT\",\
        \"TROJAN\",\
        \"VIRUS\",\
        \"WORM\"\
      ]\
    },\
    \"MapFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The key of the map filter.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The value for the key in the map filter.</p>\"\
        },\
        \"Comparison\":{\
          \"shape\":\"MapFilterComparison\",\
          \"documentation\":\"<p>The condition to apply to a key value when querying for findings with a map filter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The map filter for querying findings.</p>\"\
    },\
    \"MapFilterComparison\":{\
      \"type\":\"string\",\
      \"enum\":[\"EQUALS\"]\
    },\
    \"MapFilterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MapFilter\"}\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"Member\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccountId\":{\
          \"shape\":\"AccountId\",\
          \"documentation\":\"<p>The AWS account ID of the member account.</p>\"\
        },\
        \"Email\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The email address of the member account.</p>\"\
        },\
        \"MasterId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The AWS account ID of the Security Hub master account associated with this member account.</p>\"\
        },\
        \"MemberStatus\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The status of the relationship between the member account and its master account. </p>\"\
        },\
        \"InvitedAt\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp for the date and time when the invitation was sent to the member account.</p>\"\
        },\
        \"UpdatedAt\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for the date and time when the member account was updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details about a member account.</p>\"\
    },\
    \"MemberList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Member\"}\
    },\
    \"Network\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Direction\":{\
          \"shape\":\"NetworkDirection\",\
          \"documentation\":\"<p>The direction of network traffic associated with a finding.</p>\"\
        },\
        \"Protocol\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The protocol of network-related information about a finding.</p>\"\
        },\
        \"SourceIpV4\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The source IPv4 address of network-related information about a finding.</p>\"\
        },\
        \"SourceIpV6\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The source IPv6 address of network-related information about a finding.</p>\"\
        },\
        \"SourcePort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The source port of network-related information about a finding.</p>\"\
        },\
        \"SourceDomain\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The source domain of network-related information about a finding.</p>\"\
        },\
        \"SourceMac\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The source media access control (MAC) address of network-related information about a finding.</p>\"\
        },\
        \"DestinationIpV4\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The destination IPv4 address of network-related information about a finding.</p>\"\
        },\
        \"DestinationIpV6\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The destination IPv6 address of network-related information about a finding.</p>\"\
        },\
        \"DestinationPort\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The destination port of network-related information about a finding.</p>\"\
        },\
        \"DestinationDomain\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The destination domain of network-related information about a finding.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of network-related information about a finding.</p>\"\
    },\
    \"NetworkDirection\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN\",\
        \"OUT\"\
      ]\
    },\
    \"NextToken\":{\"type\":\"string\"},\
    \"NonEmptyString\":{\
      \"type\":\"string\",\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"NonEmptyStringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyString\"}\
    },\
    \"Note\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"UpdatedBy\",\
        \"UpdatedAt\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The text of a note.</p>\"\
        },\
        \"UpdatedBy\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The principal that created a note.</p>\"\
        },\
        \"UpdatedAt\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The timestamp of when the note was updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A user-defined note added to a finding.</p>\"\
    },\
    \"NoteUpdate\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"UpdatedBy\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The updated note text.</p>\"\
        },\
        \"UpdatedBy\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The principal that updated the note.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The updated note.</p>\"\
    },\
    \"NumberFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Gte\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The greater-than-equal condition to be applied to a single field when querying for findings. </p>\"\
        },\
        \"Lte\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The less-than-equal condition to be applied to a single field when querying for findings. </p>\"\
        },\
        \"Eq\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The equal-to condition to be applied to a single field when querying for findings.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A number filter for querying findings.</p>\"\
    },\
    \"NumberFilterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NumberFilter\"}\
    },\
    \"Partition\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"aws\",\
        \"aws-cn\",\
        \"aws-us-gov\"\
      ]\
    },\
    \"ProcessDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the process.</p>\"\
        },\
        \"Path\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The path to the process executable.</p>\"\
        },\
        \"Pid\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The process ID.</p>\"\
        },\
        \"ParentPid\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The parent process ID.</p>\"\
        },\
        \"LaunchedAt\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The date/time that the process was launched.</p>\"\
        },\
        \"TerminatedAt\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The date and time when the process was terminated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of process-related information about a finding.</p>\"\
    },\
    \"Product\":{\
      \"type\":\"structure\",\
      \"required\":[\"ProductArn\"],\
      \"members\":{\
        \"ProductArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN assigned to the product.</p>\"\
        },\
        \"ProductName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the product.</p>\"\
        },\
        \"CompanyName\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the company that provides the product.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A description of the product.</p>\"\
        },\
        \"Categories\":{\
          \"shape\":\"CategoryList\",\
          \"documentation\":\"<p>The categories assigned to the product.</p>\"\
        },\
        \"IntegrationTypes\":{\
          \"shape\":\"IntegrationTypeList\",\
          \"documentation\":\"<p>The types of integration that the product supports. Available values are the following.</p> <ul> <li> <p> <code>SEND_FINDINGS_TO_SECURITY_HUB</code> - Indicates that the integration sends findings to Security Hub.</p> </li> <li> <p> <code>RECEIVE_FINDINGS_FROM_SECURITY_HUB</code> - Indicates that the integration receives findings from Security Hub.</p> </li> </ul>\"\
        },\
        \"MarketplaceUrl\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The URL for the page that contains more information about the product.</p>\"\
        },\
        \"ActivationUrl\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The URL used to activate the product.</p>\"\
        },\
        \"ProductSubscriptionResourcePolicy\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The resource policy associated with the product.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains details about a product.</p>\"\
    },\
    \"ProductSubscriptionArnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyString\"}\
    },\
    \"ProductsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Product\"}\
    },\
    \"RatioScale\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"Recommendation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Describes the recommended steps to take to remediate an issue identified in a finding.</p>\"\
        },\
        \"Url\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A URL to a page or site that contains information about how to remediate a finding.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A recommendation on how to remediate the issue identified in a finding.</p>\"\
    },\
    \"RecordState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"ARCHIVED\"\
      ]\
    },\
    \"RelatedFinding\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ProductArn\",\
        \"Id\"\
      ],\
      \"members\":{\
        \"ProductArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the product that generated a related finding.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The product-generated identifier for a related finding.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about a related finding.</p>\"\
    },\
    \"RelatedFindingList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RelatedFinding\"}\
    },\
    \"RelatedRequirementsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyString\"}\
    },\
    \"Remediation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Recommendation\":{\
          \"shape\":\"Recommendation\",\
          \"documentation\":\"<p>A recommendation on the steps to take to remediate the issue identified by a finding.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about the remediation steps for a finding.</p>\"\
    },\
    \"Resource\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Type\",\
        \"Id\"\
      ],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The type of the resource that details are provided for. If possible, set <code>Type</code> to one of the supported resource types. For example, if the resource is an EC2 instance, then set <code>Type</code> to <code>AwsEc2Instance</code>.</p> <p>If the resource does not match any of the provided types, then set <code>Type</code> to <code>Other</code>. </p>\"\
        },\
        \"Id\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The canonical identifier for the given resource type.</p>\"\
        },\
        \"Partition\":{\
          \"shape\":\"Partition\",\
          \"documentation\":\"<p>The canonical AWS partition name that the Region is assigned to.</p>\"\
        },\
        \"Region\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The canonical AWS external Region name where this resource is located.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"FieldMap\",\
          \"documentation\":\"<p>A list of AWS tags associated with a resource at the time the finding was processed.</p>\"\
        },\
        \"Details\":{\
          \"shape\":\"ResourceDetails\",\
          \"documentation\":\"<p>Additional details about the resource related to a finding.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A resource related to a finding.</p>\"\
    },\
    \"ResourceArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"^arn:aws:securityhub:.*\"\
    },\
    \"ResourceConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"NonEmptyString\"},\
        \"Code\":{\"shape\":\"NonEmptyString\"}\
      },\
      \"documentation\":\"<p>The resource specified in the request conflicts with an existing resource.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ResourceDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AwsCodeBuildProject\":{\
          \"shape\":\"AwsCodeBuildProjectDetails\",\
          \"documentation\":\"<p>Details for an AWS CodeBuild project.</p>\"\
        },\
        \"AwsCloudFrontDistribution\":{\
          \"shape\":\"AwsCloudFrontDistributionDetails\",\
          \"documentation\":\"<p>Details about a CloudFront distribution.</p>\"\
        },\
        \"AwsEc2Instance\":{\
          \"shape\":\"AwsEc2InstanceDetails\",\
          \"documentation\":\"<p>Details about an Amazon EC2 instance related to a finding.</p>\"\
        },\
        \"AwsEc2NetworkInterface\":{\
          \"shape\":\"AwsEc2NetworkInterfaceDetails\",\
          \"documentation\":\"<p>Details for an Amazon EC2 network interface.</p>\"\
        },\
        \"AwsEc2SecurityGroup\":{\
          \"shape\":\"AwsEc2SecurityGroupDetails\",\
          \"documentation\":\"<p>Details for an EC2 security group.</p>\"\
        },\
        \"AwsElbv2LoadBalancer\":{\
          \"shape\":\"AwsElbv2LoadBalancerDetails\",\
          \"documentation\":\"<p>Details about a load balancer.</p>\"\
        },\
        \"AwsElasticsearchDomain\":{\
          \"shape\":\"AwsElasticsearchDomainDetails\",\
          \"documentation\":\"<p>Details for an Elasticsearch domain.</p>\"\
        },\
        \"AwsS3Bucket\":{\
          \"shape\":\"AwsS3BucketDetails\",\
          \"documentation\":\"<p>Details about an Amazon S3 bucket related to a finding.</p>\"\
        },\
        \"AwsS3Object\":{\
          \"shape\":\"AwsS3ObjectDetails\",\
          \"documentation\":\"<p>Details about an Amazon S3 object related to a finding.</p>\"\
        },\
        \"AwsIamAccessKey\":{\
          \"shape\":\"AwsIamAccessKeyDetails\",\
          \"documentation\":\"<p>Details about an IAM access key related to a finding.</p>\"\
        },\
        \"AwsIamRole\":{\
          \"shape\":\"AwsIamRoleDetails\",\
          \"documentation\":\"<p>Details about an IAM role.</p>\"\
        },\
        \"AwsKmsKey\":{\
          \"shape\":\"AwsKmsKeyDetails\",\
          \"documentation\":\"<p>Details about a KMS key.</p>\"\
        },\
        \"AwsLambdaFunction\":{\
          \"shape\":\"AwsLambdaFunctionDetails\",\
          \"documentation\":\"<p>Details about a Lambda function.</p>\"\
        },\
        \"AwsLambdaLayerVersion\":{\
          \"shape\":\"AwsLambdaLayerVersionDetails\",\
          \"documentation\":\"<p>Details for a Lambda layer version.</p>\"\
        },\
        \"AwsRdsDbInstance\":{\
          \"shape\":\"AwsRdsDbInstanceDetails\",\
          \"documentation\":\"<p>Details for an Amazon RDS database instance.</p>\"\
        },\
        \"AwsSnsTopic\":{\
          \"shape\":\"AwsSnsTopicDetails\",\
          \"documentation\":\"<p>Details about an SNS topic.</p>\"\
        },\
        \"AwsSqsQueue\":{\
          \"shape\":\"AwsSqsQueueDetails\",\
          \"documentation\":\"<p>Details about an SQS queue.</p>\"\
        },\
        \"AwsWafWebAcl\":{\
          \"shape\":\"AwsWafWebAclDetails\",\
          \"documentation\":\"<p>Details for a WAF WebACL.</p>\"\
        },\
        \"Container\":{\
          \"shape\":\"ContainerDetails\",\
          \"documentation\":\"<p>Details about a container resource related to a finding.</p>\"\
        },\
        \"Other\":{\
          \"shape\":\"FieldMap\",\
          \"documentation\":\"<p>Details about a resource that are not available in a type-specific details object. Use the <code>Other</code> object in the following cases.</p> <ul> <li> <p>The type-specific object does not contain all of the fields that you want to populate. In this case, first use the type-specific object to populate those fields. Use the <code>Other</code> object to populate the fields that are missing from the type-specific object.</p> </li> <li> <p>The resource type does not have a corresponding object. This includes resources for which the type is <code>Other</code>. </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Additional details about a resource related to a finding.</p> <p>To provide the details, use the object that corresponds to the resource type. For example, if the resource type is <code>AwsEc2Instance</code>, then you use the <code>AwsEc2Instance</code> object to provide the details.</p> <p>If the type-specific object does not contain all of the fields you want to populate, then you use the <code>Other</code> object to populate those additional fields.</p> <p>You also use the <code>Other</code> object to populate the details when the selected type does not have a corresponding object.</p>\"\
    },\
    \"ResourceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Resource\"}\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"NonEmptyString\"},\
        \"Code\":{\"shape\":\"NonEmptyString\"}\
      },\
      \"documentation\":\"<p>The request was rejected because we can't find the specified resource.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"Result\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccountId\":{\
          \"shape\":\"AccountId\",\
          \"documentation\":\"<p>An AWS account ID of the account that was not processed.</p>\"\
        },\
        \"ProcessingResult\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The reason that the account was not processed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about the account that was not processed.</p>\"\
    },\
    \"ResultList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Result\"}\
    },\
    \"SecurityGroups\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyString\"}\
    },\
    \"Severity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Product\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>Deprecated. This attribute is being deprecated. Instead of providing <code>Product</code>, provide <code>Original</code>.</p> <p>The native severity as defined by the AWS service or integrated partner product that generated the finding.</p>\"\
        },\
        \"Label\":{\
          \"shape\":\"SeverityLabel\",\
          \"documentation\":\"<p>The severity value of the finding. The allowed values are the following.</p> <ul> <li> <p> <code>INFORMATIONAL</code> - No issue was found.</p> </li> <li> <p> <code>LOW</code> - The issue does not require action on its own.</p> </li> <li> <p> <code>MEDIUM</code> - The issue must be addressed but not urgently.</p> </li> <li> <p> <code>HIGH</code> - The issue must be addressed as a priority.</p> </li> <li> <p> <code>CRITICAL</code> - The issue must be remediated immediately to avoid it escalating.</p> </li> </ul>\"\
        },\
        \"Normalized\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Deprecated. This attribute is being deprecated. Instead of providing <code>Normalized</code>, provide <code>Label</code>.</p> <p>If you provide <code>Normalized</code> and do not provide <code>Label</code>, <code>Label</code> is set automatically as follows. </p> <ul> <li> <p>0 - <code>INFORMATIONAL</code> </p> </li> <li> <p>1â39 - <code>LOW</code> </p> </li> <li> <p>40â69 - <code>MEDIUM</code> </p> </li> <li> <p>70â89 - <code>HIGH</code> </p> </li> <li> <p>90â100 - <code>CRITICAL</code> </p> </li> </ul>\"\
        },\
        \"Original\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The native severity from the finding product that generated the finding.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The severity of the finding.</p>\"\
    },\
    \"SeverityLabel\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INFORMATIONAL\",\
        \"LOW\",\
        \"MEDIUM\",\
        \"HIGH\",\
        \"CRITICAL\"\
      ]\
    },\
    \"SeverityRating\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LOW\",\
        \"MEDIUM\",\
        \"HIGH\",\
        \"CRITICAL\"\
      ]\
    },\
    \"SeverityUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Normalized\":{\
          \"shape\":\"RatioScale\",\
          \"documentation\":\"<p>The normalized severity for the finding. This attribute is to be deprecated in favor of <code>Label</code>.</p> <p>If you provide <code>Normalized</code> and do not provide <code>Label</code>, <code>Label</code> is set automatically as follows.</p> <ul> <li> <p>0 - <code>INFORMATIONAL</code> </p> </li> <li> <p>1â39 - <code>LOW</code> </p> </li> <li> <p>40â69 - <code>MEDIUM</code> </p> </li> <li> <p>70â89 - <code>HIGH</code> </p> </li> <li> <p>90â100 - <code>CRITICAL</code> </p> </li> </ul>\"\
        },\
        \"Product\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The native severity as defined by the AWS service or integrated partner product that generated the finding.</p>\"\
        },\
        \"Label\":{\
          \"shape\":\"SeverityLabel\",\
          \"documentation\":\"<p>The severity value of the finding. The allowed values are the following.</p> <ul> <li> <p> <code>INFORMATIONAL</code> - No issue was found.</p> </li> <li> <p> <code>LOW</code> - The issue does not require action on its own.</p> </li> <li> <p> <code>MEDIUM</code> - The issue must be addressed but not urgently.</p> </li> <li> <p> <code>HIGH</code> - The issue must be addressed as a priority.</p> </li> <li> <p> <code>CRITICAL</code> - The issue must be remediated immediately to avoid it escalating.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Updates to the severity information for a finding.</p>\"\
    },\
    \"SortCriteria\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SortCriterion\"}\
    },\
    \"SortCriterion\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Field\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The finding attribute used to sort findings.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The order used to sort findings.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A collection of finding attributes used to sort findings.</p>\"\
    },\
    \"SortOrder\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"asc\",\
        \"desc\"\
      ]\
    },\
    \"Standard\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StandardsArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of a standard.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The name of the standard.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A description of the standard.</p>\"\
        },\
        \"EnabledByDefault\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether the standard is enabled by default. When Security Hub is enabled from the console, if a standard is enabled by default, the check box for that standard is selected by default.</p> <p>When Security Hub is enabled using the <code>EnableSecurityHub</code> API operation, the standard is enabled by default unless <code>EnableDefaultStandards</code> is set to <code>false</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a specific standard.</p>\"\
    },\
    \"Standards\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Standard\"}\
    },\
    \"StandardsControl\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StandardsControlArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the security standard control.</p>\"\
        },\
        \"ControlStatus\":{\
          \"shape\":\"ControlStatus\",\
          \"documentation\":\"<p>The current status of the security standard control. Indicates whether the control is enabled or disabled. Security Hub does not check against disabled controls.</p>\"\
        },\
        \"DisabledReason\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The reason provided for the most recent change in status for the control.</p>\"\
        },\
        \"ControlStatusUpdatedAt\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the status of the security standard control was most recently updated.</p>\"\
        },\
        \"ControlId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The identifier of the security standard control.</p>\"\
        },\
        \"Title\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The title of the security standard control.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The longer description of the security standard control. Provides information about what the control is checking for.</p>\"\
        },\
        \"RemediationUrl\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A link to remediation information for the control in the Security Hub user documentation.</p>\"\
        },\
        \"SeverityRating\":{\
          \"shape\":\"SeverityRating\",\
          \"documentation\":\"<p>The severity of findings generated from this security standard control.</p> <p>The finding severity is based on an assessment of how easy it would be to compromise AWS resources if the issue is detected.</p>\"\
        },\
        \"RelatedRequirements\":{\
          \"shape\":\"RelatedRequirementsList\",\
          \"documentation\":\"<p>The list of requirements that are related to this control.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details for an individual security standard control.</p>\"\
    },\
    \"StandardsControls\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StandardsControl\"}\
    },\
    \"StandardsInputParameterMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"NonEmptyString\"},\
      \"value\":{\"shape\":\"NonEmptyString\"}\
    },\
    \"StandardsStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"READY\",\
        \"FAILED\",\
        \"DELETING\",\
        \"INCOMPLETE\"\
      ]\
    },\
    \"StandardsSubscription\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StandardsSubscriptionArn\",\
        \"StandardsArn\",\
        \"StandardsInput\",\
        \"StandardsStatus\"\
      ],\
      \"members\":{\
        \"StandardsSubscriptionArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of a resource that represents your subscription to a supported standard.</p>\"\
        },\
        \"StandardsArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of a standard.</p>\"\
        },\
        \"StandardsInput\":{\
          \"shape\":\"StandardsInputParameterMap\",\
          \"documentation\":\"<p>A key-value pair of input for the standard.</p>\"\
        },\
        \"StandardsStatus\":{\
          \"shape\":\"StandardsStatus\",\
          \"documentation\":\"<p>The status of the standards subscription.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A resource that represents your subscription to a supported standard.</p>\"\
    },\
    \"StandardsSubscriptionArns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyString\"},\
      \"max\":25,\
      \"min\":1\
    },\
    \"StandardsSubscriptionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"StandardsArn\"],\
      \"members\":{\
        \"StandardsArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the standard that you want to enable. To view the list of available standards and their ARNs, use the <code> <a>DescribeStandards</a> </code> operation.</p>\"\
        },\
        \"StandardsInput\":{\
          \"shape\":\"StandardsInputParameterMap\",\
          \"documentation\":\"<p>A key-value pair of input for the standard.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The standard that you want to enable.</p>\"\
    },\
    \"StandardsSubscriptionRequests\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StandardsSubscriptionRequest\"},\
      \"max\":25,\
      \"min\":1\
    },\
    \"StandardsSubscriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StandardsSubscription\"}\
    },\
    \"StatusReason\":{\
      \"type\":\"structure\",\
      \"required\":[\"ReasonCode\"],\
      \"members\":{\
        \"ReasonCode\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A code that represents a reason for the control status. For the list of status reason codes and their meanings, see <a href=\\\"https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-results.html#securityhub-standards-results-asff\\\">Standards-related information in the ASFF</a> in the <i>AWS Security Hub User Guide</i>. </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The corresponding description for the status reason code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides additional context for the value of <code>Compliance.Status</code>.</p>\"\
    },\
    \"StatusReasonsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StatusReason\"}\
    },\
    \"StringFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The string filter value.</p>\"\
        },\
        \"Comparison\":{\
          \"shape\":\"StringFilterComparison\",\
          \"documentation\":\"<p>The condition to be applied to a string value when querying for findings. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A string filter for querying findings.</p>\"\
    },\
    \"StringFilterComparison\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"EQUALS\",\
        \"PREFIX\"\
      ]\
    },\
    \"StringFilterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StringFilter\"}\
    },\
    \"StringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyString\"}\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^(?!aws:)[a-zA-Z+-=._:/]+$\"\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The ARN of the resource to apply the tags to.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceArn\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags to add to the resource.</p>\"\
        }\
      }\
    },\
    \"TagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"ThreatIntelIndicator\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"ThreatIntelIndicatorType\",\
          \"documentation\":\"<p>The type of threat intelligence indicator.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The value of a threat intelligence indicator.</p>\"\
        },\
        \"Category\":{\
          \"shape\":\"ThreatIntelIndicatorCategory\",\
          \"documentation\":\"<p>The category of a threat intelligence indicator.</p>\"\
        },\
        \"LastObservedAt\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The date and time when the most recent instance of a threat intelligence indicator was observed.</p>\"\
        },\
        \"Source\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The source of the threat intelligence indicator.</p>\"\
        },\
        \"SourceUrl\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The URL to the page or site where you can get more information about the threat intelligence indicator.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about the threat intelligence related to a finding.</p>\"\
    },\
    \"ThreatIntelIndicatorCategory\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"BACKDOOR\",\
        \"CARD_STEALER\",\
        \"COMMAND_AND_CONTROL\",\
        \"DROP_SITE\",\
        \"EXPLOIT_SITE\",\
        \"KEYLOGGER\"\
      ]\
    },\
    \"ThreatIntelIndicatorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ThreatIntelIndicator\"}\
    },\
    \"ThreatIntelIndicatorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DOMAIN\",\
        \"EMAIL_ADDRESS\",\
        \"HASH_MD5\",\
        \"HASH_SHA1\",\
        \"HASH_SHA256\",\
        \"HASH_SHA512\",\
        \"IPV4_ADDRESS\",\
        \"IPV6_ADDRESS\",\
        \"MUTEX\",\
        \"PROCESS\",\
        \"URL\"\
      ]\
    },\
    \"Timestamp\":{\
      \"type\":\"timestamp\",\
      \"timestampFormat\":\"iso8601\"\
    },\
    \"TypeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyString\"}\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The ARN of the resource to remove the tags from.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceArn\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The tag keys associated with the tags to remove from the resource.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"tagKeys\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateActionTargetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ActionTargetArn\"],\
      \"members\":{\
        \"ActionTargetArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the custom action target to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ActionTargetArn\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The updated name of the custom action target.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The updated description for the custom action target.</p>\"\
        }\
      }\
    },\
    \"UpdateActionTargetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateFindingsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Filters\"],\
      \"members\":{\
        \"Filters\":{\
          \"shape\":\"AwsSecurityFindingFilters\",\
          \"documentation\":\"<p>A collection of attributes that specify which findings you want to update.</p>\"\
        },\
        \"Note\":{\
          \"shape\":\"NoteUpdate\",\
          \"documentation\":\"<p>The updated note for the finding.</p>\"\
        },\
        \"RecordState\":{\
          \"shape\":\"RecordState\",\
          \"documentation\":\"<p>The updated record state for the finding.</p>\"\
        }\
      }\
    },\
    \"UpdateFindingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateInsightRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InsightArn\"],\
      \"members\":{\
        \"InsightArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the insight that you want to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InsightArn\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The updated name for the insight.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"AwsSecurityFindingFilters\",\
          \"documentation\":\"<p>The updated filters that define this insight.</p>\"\
        },\
        \"GroupByAttribute\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The updated <code>GroupBy</code> attribute that defines this insight.</p>\"\
        }\
      }\
    },\
    \"UpdateInsightResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateStandardsControlRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"StandardsControlArn\"],\
      \"members\":{\
        \"StandardsControlArn\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The ARN of the security standard control to enable or disable.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"StandardsControlArn\"\
        },\
        \"ControlStatus\":{\
          \"shape\":\"ControlStatus\",\
          \"documentation\":\"<p>The updated status of the security standard control.</p>\"\
        },\
        \"DisabledReason\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>A description of the reason why you are disabling a security standard control.</p>\"\
        }\
      }\
    },\
    \"UpdateStandardsControlResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"VerificationState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UNKNOWN\",\
        \"TRUE_POSITIVE\",\
        \"FALSE_POSITIVE\",\
        \"BENIGN_POSITIVE\"\
      ]\
    },\
    \"WafAction\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>Specifies how you want AWS WAF to respond to requests that match the settings in a rule.</p> <p>Valid settings include the following:</p> <ul> <li> <p> <code>ALLOW</code> - AWS WAF allows requests</p> </li> <li> <p> <code>BLOCK</code> - AWS WAF blocks requests</p> </li> <li> <p> <code>COUNT</code> - AWS WAF increments a counter of the requests that match all of the conditions in the rule. AWS WAF then continues to inspect the web request based on the remaining rules in the web ACL. You can't specify <code>COUNT</code> for the default action for a WebACL.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Details about the action that CloudFront or AWS WAF takes when a web request matches the conditions in the rule. </p>\"\
    },\
    \"WafExcludedRule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RuleId\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The unique identifier for the rule to exclude from the rule group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about a rule to exclude from a rule group.</p>\"\
    },\
    \"WafExcludedRuleList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"WafExcludedRule\"}\
    },\
    \"WafOverrideAction\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p> <code>COUNT</code> overrides the action specified by the individual rule within a <code>RuleGroup</code> .</p> <p>If set to <code>NONE</code>, the rule's action takes place.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about an override action for a rule.</p>\"\
    },\
    \"Workflow\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"WorkflowStatus\",\
          \"documentation\":\"<p>The status of the investigation into the finding. The allowed values are the following.</p> <ul> <li> <p> <code>NEW</code> - The initial state of a finding, before it is reviewed.</p> </li> <li> <p> <code>NOTIFIED</code> - Indicates that you notified the resource owner about the security issue. Used when the initial reviewer is not the resource owner, and needs intervention from the resource owner.</p> </li> <li> <p> <code>SUPPRESSED</code> - The finding will not be reviewed again and will not be acted upon.</p> </li> <li> <p> <code>RESOLVED</code> - The finding was reviewed and remediated and is now considered resolved. </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about the status of the investigation into a finding.</p>\"\
    },\
    \"WorkflowState\":{\
      \"type\":\"string\",\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"This field is deprecated, use Workflow.Status instead.\",\
      \"enum\":[\
        \"NEW\",\
        \"ASSIGNED\",\
        \"IN_PROGRESS\",\
        \"DEFERRED\",\
        \"RESOLVED\"\
      ]\
    },\
    \"WorkflowStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NEW\",\
        \"NOTIFIED\",\
        \"RESOLVED\",\
        \"SUPPRESSED\"\
      ]\
    },\
    \"WorkflowUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"WorkflowStatus\",\
          \"documentation\":\"<p>The status of the investigation into the finding. The allowed values are the following.</p> <ul> <li> <p> <code>NEW</code> - The initial state of a finding, before it is reviewed.</p> </li> <li> <p> <code>NOTIFIED</code> - Indicates that you notified the resource owner about the security issue. Used when the initial reviewer is not the resource owner, and needs intervention from the resource owner.</p> </li> <li> <p> <code>RESOLVED</code> - The finding was reviewed and remediated and is now considered resolved.</p> </li> <li> <p> <code>SUPPRESSED</code> - The finding will not be reviewed again and will not be acted upon.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Used to update information about the investigation into the finding.</p>\"\
    }\
  },\
  \"documentation\":\"<p>Security Hub provides you with a comprehensive view of the security state of your AWS environment and resources. It also provides you with the readiness status of your environment based on controls from supported security standards. Security Hub collects security data from AWS accounts, services, and integrated third-party products and helps you analyze security trends in your environment to identify the highest priority security issues. For more information about Security Hub, see the <i> <a href=\\\"https://docs.aws.amazon.com/securityhub/latest/userguide/what-is-securityhub.html\\\">AWS Security Hub User Guide</a> </i>.</p> <p>When you use operations in the Security Hub API, the requests are executed only in the AWS Region that is currently active or in the specific AWS Region that you specify in your request. Any configuration or settings change that results from the operation is applied only to that Region. To make the same change in other Regions, execute the same command for each Region to apply the change to.</p> <p>For example, if your Region is set to <code>us-west-2</code>, when you use <code> <a>CreateMembers</a> </code> to add a member account to Security Hub, the association of the member account with the master account is created only in the <code>us-west-2</code> Region. Security Hub must be enabled for the member account in the same Region that the invitation was sent from.</p> <p>The following throttling limits apply to using Security Hub API operations.</p> <ul> <li> <p> <code> <a>GetFindings</a> </code> - <code>RateLimit</code> of 3 requests per second. <code>BurstLimit</code> of 6 requests per second.</p> </li> <li> <p> <code> <a>UpdateFindings</a> </code> - <code>RateLimit</code> of 1 request per second. <code>BurstLimit</code> of 5 requests per second.</p> </li> <li> <p>All other operations - <code>RateLimit</code> of 10 requests per second. <code>BurstLimit</code> of 30 requests per second.</p> </li> </ul>\"\
}\
";
}

@end
