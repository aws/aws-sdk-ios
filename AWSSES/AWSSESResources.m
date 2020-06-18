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

#import "AWSSESResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSSESResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSSESResources

+ (instancetype)sharedInstance {
    static AWSSESResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSSESResources new];
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
    \"apiVersion\":\"2019-09-27\",\
    \"endpointPrefix\":\"email\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceAbbreviation\":\"Amazon SES V2\",\
    \"serviceFullName\":\"Amazon Simple Email Service\",\
    \"serviceId\":\"SESv2\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"ses\",\
    \"uid\":\"sesv2-2019-09-27\"\
  },\
  \"operations\":{\
    \"CreateConfigurationSet\":{\
      \"name\":\"CreateConfigurationSet\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/v2/email/configuration-sets\"\
      },\
      \"input\":{\"shape\":\"CreateConfigurationSetRequest\"},\
      \"output\":{\"shape\":\"CreateConfigurationSetResponse\"},\
      \"errors\":[\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConcurrentModificationException\"}\
      ],\
      \"documentation\":\"<p>Create a configuration set. <i>Configuration sets</i> are groups of rules that you can apply to the emails that you send. You apply a configuration set to an email by specifying the name of the configuration set when you call the Amazon SES API v2. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email. </p>\"\
    },\
    \"CreateConfigurationSetEventDestination\":{\
      \"name\":\"CreateConfigurationSetEventDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/v2/email/configuration-sets/{ConfigurationSetName}/event-destinations\"\
      },\
      \"input\":{\"shape\":\"CreateConfigurationSetEventDestinationRequest\"},\
      \"output\":{\"shape\":\"CreateConfigurationSetEventDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Create an event destination. <i>Events</i> include message sends, deliveries, opens, clicks, bounces, and complaints. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p> <p>A single configuration set can include more than one event destination.</p>\"\
    },\
    \"CreateDedicatedIpPool\":{\
      \"name\":\"CreateDedicatedIpPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/v2/email/dedicated-ip-pools\"\
      },\
      \"input\":{\"shape\":\"CreateDedicatedIpPoolRequest\"},\
      \"output\":{\"shape\":\"CreateDedicatedIpPoolResponse\"},\
      \"errors\":[\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConcurrentModificationException\"}\
      ],\
      \"documentation\":\"<p>Create a new pool of dedicated IP addresses. A pool can include one or more dedicated IP addresses that are associated with your AWS account. You can associate a pool with a configuration set. When you send an email that uses that configuration set, the message is sent from one of the addresses in the associated pool.</p>\"\
    },\
    \"CreateDeliverabilityTestReport\":{\
      \"name\":\"CreateDeliverabilityTestReport\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/v2/email/deliverability-dashboard/test\"\
      },\
      \"input\":{\"shape\":\"CreateDeliverabilityTestReportRequest\"},\
      \"output\":{\"shape\":\"CreateDeliverabilityTestReportResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccountSuspendedException\"},\
        {\"shape\":\"SendingPausedException\"},\
        {\"shape\":\"MessageRejected\"},\
        {\"shape\":\"MailFromDomainNotVerifiedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConcurrentModificationException\"}\
      ],\
      \"documentation\":\"<p>Create a new predictive inbox placement test. Predictive inbox placement tests can help you predict how your messages will be handled by various email providers around the world. When you perform a predictive inbox placement test, you provide a sample message that contains the content that you plan to send to your customers. Amazon SES then sends that message to special email addresses spread across several major email providers. After about 24 hours, the test is complete, and you can use the <code>GetDeliverabilityTestReport</code> operation to view the results of the test.</p>\"\
    },\
    \"CreateEmailIdentity\":{\
      \"name\":\"CreateEmailIdentity\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/v2/email/identities\"\
      },\
      \"input\":{\"shape\":\"CreateEmailIdentityRequest\"},\
      \"output\":{\"shape\":\"CreateEmailIdentityResponse\"},\
      \"errors\":[\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConcurrentModificationException\"}\
      ],\
      \"documentation\":\"<p>Starts the process of verifying an email identity. An <i>identity</i> is an email address or domain that you use when you send email. Before you can use an identity to send email, you first have to verify it. By verifying an identity, you demonstrate that you're the owner of the identity, and that you've given Amazon SES API v2 permission to send email from the identity.</p> <p>When you verify an email address, Amazon SES sends an email to the address. Your email address is verified as soon as you follow the link in the verification email. </p> <p>When you verify a domain without specifying the <code>DkimSigningAttributes</code> object, this operation provides a set of DKIM tokens. You can convert these tokens into CNAME records, which you then add to the DNS configuration for your domain. Your domain is verified when Amazon SES detects these records in the DNS configuration for your domain. This verification method is known as <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Easy DKIM</a>.</p> <p>Alternatively, you can perform the verification process by providing your own public-private key pair. This verification method is known as Bring Your Own DKIM (BYODKIM). To use BYODKIM, your call to the <code>CreateEmailIdentity</code> operation has to include the <code>DkimSigningAttributes</code> object. When you specify this object, you provide a selector (a component of the DNS record name that identifies the public key that you want to use for DKIM authentication) and a private key.</p>\"\
    },\
    \"DeleteConfigurationSet\":{\
      \"name\":\"DeleteConfigurationSet\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/v2/email/configuration-sets/{ConfigurationSetName}\"\
      },\
      \"input\":{\"shape\":\"DeleteConfigurationSetRequest\"},\
      \"output\":{\"shape\":\"DeleteConfigurationSetResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConcurrentModificationException\"}\
      ],\
      \"documentation\":\"<p>Delete an existing configuration set.</p> <p> <i>Configuration sets</i> are groups of rules that you can apply to the emails you send. You apply a configuration set to an email by including a reference to the configuration set in the headers of the email. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email.</p>\"\
    },\
    \"DeleteConfigurationSetEventDestination\":{\
      \"name\":\"DeleteConfigurationSetEventDestination\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/v2/email/configuration-sets/{ConfigurationSetName}/event-destinations/{EventDestinationName}\"\
      },\
      \"input\":{\"shape\":\"DeleteConfigurationSetEventDestinationRequest\"},\
      \"output\":{\"shape\":\"DeleteConfigurationSetEventDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Delete an event destination.</p> <p> <i>Events</i> include message sends, deliveries, opens, clicks, bounces, and complaints. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p>\"\
    },\
    \"DeleteDedicatedIpPool\":{\
      \"name\":\"DeleteDedicatedIpPool\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/v2/email/dedicated-ip-pools/{PoolName}\"\
      },\
      \"input\":{\"shape\":\"DeleteDedicatedIpPoolRequest\"},\
      \"output\":{\"shape\":\"DeleteDedicatedIpPoolResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConcurrentModificationException\"}\
      ],\
      \"documentation\":\"<p>Delete a dedicated IP pool.</p>\"\
    },\
    \"DeleteEmailIdentity\":{\
      \"name\":\"DeleteEmailIdentity\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/v2/email/identities/{EmailIdentity}\"\
      },\
      \"input\":{\"shape\":\"DeleteEmailIdentityRequest\"},\
      \"output\":{\"shape\":\"DeleteEmailIdentityResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConcurrentModificationException\"}\
      ],\
      \"documentation\":\"<p>Deletes an email identity. An identity can be either an email address or a domain name.</p>\"\
    },\
    \"DeleteSuppressedDestination\":{\
      \"name\":\"DeleteSuppressedDestination\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/v2/email/suppression/addresses/{EmailAddress}\"\
      },\
      \"input\":{\"shape\":\"DeleteSuppressedDestinationRequest\"},\
      \"output\":{\"shape\":\"DeleteSuppressedDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Removes an email address from the suppression list for your account.</p>\"\
    },\
    \"GetAccount\":{\
      \"name\":\"GetAccount\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/account\"\
      },\
      \"input\":{\"shape\":\"GetAccountRequest\"},\
      \"output\":{\"shape\":\"GetAccountResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Obtain information about the email-sending status and capabilities of your Amazon SES account in the current AWS Region.</p>\"\
    },\
    \"GetBlacklistReports\":{\
      \"name\":\"GetBlacklistReports\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/deliverability-dashboard/blacklist-report\"\
      },\
      \"input\":{\"shape\":\"GetBlacklistReportsRequest\"},\
      \"output\":{\"shape\":\"GetBlacklistReportsResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Retrieve a list of the blacklists that your dedicated IP addresses appear on.</p>\"\
    },\
    \"GetConfigurationSet\":{\
      \"name\":\"GetConfigurationSet\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/configuration-sets/{ConfigurationSetName}\"\
      },\
      \"input\":{\"shape\":\"GetConfigurationSetRequest\"},\
      \"output\":{\"shape\":\"GetConfigurationSetResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Get information about an existing configuration set, including the dedicated IP pool that it's associated with, whether or not it's enabled for sending email, and more.</p> <p> <i>Configuration sets</i> are groups of rules that you can apply to the emails you send. You apply a configuration set to an email by including a reference to the configuration set in the headers of the email. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email.</p>\"\
    },\
    \"GetConfigurationSetEventDestinations\":{\
      \"name\":\"GetConfigurationSetEventDestinations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/configuration-sets/{ConfigurationSetName}/event-destinations\"\
      },\
      \"input\":{\"shape\":\"GetConfigurationSetEventDestinationsRequest\"},\
      \"output\":{\"shape\":\"GetConfigurationSetEventDestinationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Retrieve a list of event destinations that are associated with a configuration set.</p> <p> <i>Events</i> include message sends, deliveries, opens, clicks, bounces, and complaints. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p>\"\
    },\
    \"GetDedicatedIp\":{\
      \"name\":\"GetDedicatedIp\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/dedicated-ips/{IP}\"\
      },\
      \"input\":{\"shape\":\"GetDedicatedIpRequest\"},\
      \"output\":{\"shape\":\"GetDedicatedIpResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Get information about a dedicated IP address, including the name of the dedicated IP pool that it's associated with, as well information about the automatic warm-up process for the address.</p>\"\
    },\
    \"GetDedicatedIps\":{\
      \"name\":\"GetDedicatedIps\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/dedicated-ips\"\
      },\
      \"input\":{\"shape\":\"GetDedicatedIpsRequest\"},\
      \"output\":{\"shape\":\"GetDedicatedIpsResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>List the dedicated IP addresses that are associated with your AWS account.</p>\"\
    },\
    \"GetDeliverabilityDashboardOptions\":{\
      \"name\":\"GetDeliverabilityDashboardOptions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/deliverability-dashboard\"\
      },\
      \"input\":{\"shape\":\"GetDeliverabilityDashboardOptionsRequest\"},\
      \"output\":{\"shape\":\"GetDeliverabilityDashboardOptionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Retrieve information about the status of the Deliverability dashboard for your account. When the Deliverability dashboard is enabled, you gain access to reputation, deliverability, and other metrics for the domains that you use to send email. You also gain the ability to perform predictive inbox placement tests.</p> <p>When you use the Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that you accrue by using Amazon SES and other AWS services. For more information about the features and cost of a Deliverability dashboard subscription, see <a href=\\\"http://aws.amazon.com/ses/pricing/\\\">Amazon SES Pricing</a>.</p>\"\
    },\
    \"GetDeliverabilityTestReport\":{\
      \"name\":\"GetDeliverabilityTestReport\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/deliverability-dashboard/test-reports/{ReportId}\"\
      },\
      \"input\":{\"shape\":\"GetDeliverabilityTestReportRequest\"},\
      \"output\":{\"shape\":\"GetDeliverabilityTestReportResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Retrieve the results of a predictive inbox placement test.</p>\"\
    },\
    \"GetDomainDeliverabilityCampaign\":{\
      \"name\":\"GetDomainDeliverabilityCampaign\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/deliverability-dashboard/campaigns/{CampaignId}\"\
      },\
      \"input\":{\"shape\":\"GetDomainDeliverabilityCampaignRequest\"},\
      \"output\":{\"shape\":\"GetDomainDeliverabilityCampaignResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Retrieve all the deliverability data for a specific campaign. This data is available for a campaign only if the campaign sent email by using a domain that the Deliverability dashboard is enabled for.</p>\"\
    },\
    \"GetDomainStatisticsReport\":{\
      \"name\":\"GetDomainStatisticsReport\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/deliverability-dashboard/statistics-report/{Domain}\"\
      },\
      \"input\":{\"shape\":\"GetDomainStatisticsReportRequest\"},\
      \"output\":{\"shape\":\"GetDomainStatisticsReportResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Retrieve inbox placement and engagement rates for the domains that you use to send email.</p>\"\
    },\
    \"GetEmailIdentity\":{\
      \"name\":\"GetEmailIdentity\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/identities/{EmailIdentity}\"\
      },\
      \"input\":{\"shape\":\"GetEmailIdentityRequest\"},\
      \"output\":{\"shape\":\"GetEmailIdentityResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Provides information about a specific identity, including the identity's verification status, its DKIM authentication status, and its custom Mail-From settings.</p>\"\
    },\
    \"GetSuppressedDestination\":{\
      \"name\":\"GetSuppressedDestination\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/suppression/addresses/{EmailAddress}\"\
      },\
      \"input\":{\"shape\":\"GetSuppressedDestinationRequest\"},\
      \"output\":{\"shape\":\"GetSuppressedDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Retrieves information about a specific email address that's on the suppression list for your account.</p>\"\
    },\
    \"ListConfigurationSets\":{\
      \"name\":\"ListConfigurationSets\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/configuration-sets\"\
      },\
      \"input\":{\"shape\":\"ListConfigurationSetsRequest\"},\
      \"output\":{\"shape\":\"ListConfigurationSetsResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>List all of the configuration sets associated with your account in the current region.</p> <p> <i>Configuration sets</i> are groups of rules that you can apply to the emails you send. You apply a configuration set to an email by including a reference to the configuration set in the headers of the email. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email.</p>\"\
    },\
    \"ListDedicatedIpPools\":{\
      \"name\":\"ListDedicatedIpPools\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/dedicated-ip-pools\"\
      },\
      \"input\":{\"shape\":\"ListDedicatedIpPoolsRequest\"},\
      \"output\":{\"shape\":\"ListDedicatedIpPoolsResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>List all of the dedicated IP pools that exist in your AWS account in the current Region.</p>\"\
    },\
    \"ListDeliverabilityTestReports\":{\
      \"name\":\"ListDeliverabilityTestReports\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/deliverability-dashboard/test-reports\"\
      },\
      \"input\":{\"shape\":\"ListDeliverabilityTestReportsRequest\"},\
      \"output\":{\"shape\":\"ListDeliverabilityTestReportsResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Show a list of the predictive inbox placement tests that you've performed, regardless of their statuses. For predictive inbox placement tests that are complete, you can use the <code>GetDeliverabilityTestReport</code> operation to view the results.</p>\"\
    },\
    \"ListDomainDeliverabilityCampaigns\":{\
      \"name\":\"ListDomainDeliverabilityCampaigns\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/deliverability-dashboard/domains/{SubscribedDomain}/campaigns\"\
      },\
      \"input\":{\"shape\":\"ListDomainDeliverabilityCampaignsRequest\"},\
      \"output\":{\"shape\":\"ListDomainDeliverabilityCampaignsResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Retrieve deliverability data for all the campaigns that used a specific domain to send email during a specified time range. This data is available for a domain only if you enabled the Deliverability dashboard for the domain.</p>\"\
    },\
    \"ListEmailIdentities\":{\
      \"name\":\"ListEmailIdentities\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/identities\"\
      },\
      \"input\":{\"shape\":\"ListEmailIdentitiesRequest\"},\
      \"output\":{\"shape\":\"ListEmailIdentitiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of all of the email identities that are associated with your AWS account. An identity can be either an email address or a domain. This operation returns identities that are verified as well as those that aren't. This operation returns identities that are associated with Amazon SES and Amazon Pinpoint.</p>\"\
    },\
    \"ListSuppressedDestinations\":{\
      \"name\":\"ListSuppressedDestinations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/suppression/addresses\"\
      },\
      \"input\":{\"shape\":\"ListSuppressedDestinationsRequest\"},\
      \"output\":{\"shape\":\"ListSuppressedDestinationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidNextTokenException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a list of email addresses that are on the suppression list for your account.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/v2/email/tags\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Retrieve a list of the tags (keys and values) that are associated with a specified resource. AÂ <i>tag</i>Â is a label that you optionally define and associate with a resource. Each tag consists of a requiredÂ <i>tag key</i>Â and an optional associatedÂ <i>tag value</i>. A tag key is a general label that acts as a category for more specific tag values. A tag value acts as a descriptor within a tag key.</p>\"\
    },\
    \"PutAccountDedicatedIpWarmupAttributes\":{\
      \"name\":\"PutAccountDedicatedIpWarmupAttributes\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/account/dedicated-ips/warmup\"\
      },\
      \"input\":{\"shape\":\"PutAccountDedicatedIpWarmupAttributesRequest\"},\
      \"output\":{\"shape\":\"PutAccountDedicatedIpWarmupAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Enable or disable the automatic warm-up feature for dedicated IP addresses.</p>\"\
    },\
    \"PutAccountSendingAttributes\":{\
      \"name\":\"PutAccountSendingAttributes\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/account/sending\"\
      },\
      \"input\":{\"shape\":\"PutAccountSendingAttributesRequest\"},\
      \"output\":{\"shape\":\"PutAccountSendingAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Enable or disable the ability of your account to send email.</p>\"\
    },\
    \"PutAccountSuppressionAttributes\":{\
      \"name\":\"PutAccountSuppressionAttributes\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/account/suppression\"\
      },\
      \"input\":{\"shape\":\"PutAccountSuppressionAttributesRequest\"},\
      \"output\":{\"shape\":\"PutAccountSuppressionAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Change the settings for the account-level suppression list.</p>\"\
    },\
    \"PutConfigurationSetDeliveryOptions\":{\
      \"name\":\"PutConfigurationSetDeliveryOptions\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/configuration-sets/{ConfigurationSetName}/delivery-options\"\
      },\
      \"input\":{\"shape\":\"PutConfigurationSetDeliveryOptionsRequest\"},\
      \"output\":{\"shape\":\"PutConfigurationSetDeliveryOptionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Associate a configuration set with a dedicated IP pool. You can use dedicated IP pools to create groups of dedicated IP addresses for sending specific types of email.</p>\"\
    },\
    \"PutConfigurationSetReputationOptions\":{\
      \"name\":\"PutConfigurationSetReputationOptions\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/configuration-sets/{ConfigurationSetName}/reputation-options\"\
      },\
      \"input\":{\"shape\":\"PutConfigurationSetReputationOptionsRequest\"},\
      \"output\":{\"shape\":\"PutConfigurationSetReputationOptionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Enable or disable collection of reputation metrics for emails that you send using a particular configuration set in a specific AWS Region.</p>\"\
    },\
    \"PutConfigurationSetSendingOptions\":{\
      \"name\":\"PutConfigurationSetSendingOptions\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/configuration-sets/{ConfigurationSetName}/sending\"\
      },\
      \"input\":{\"shape\":\"PutConfigurationSetSendingOptionsRequest\"},\
      \"output\":{\"shape\":\"PutConfigurationSetSendingOptionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Enable or disable email sending for messages that use a particular configuration set in a specific AWS Region.</p>\"\
    },\
    \"PutConfigurationSetSuppressionOptions\":{\
      \"name\":\"PutConfigurationSetSuppressionOptions\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/configuration-sets/{ConfigurationSetName}/suppression-options\"\
      },\
      \"input\":{\"shape\":\"PutConfigurationSetSuppressionOptionsRequest\"},\
      \"output\":{\"shape\":\"PutConfigurationSetSuppressionOptionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Specify the account suppression list preferences for a configuration set.</p>\"\
    },\
    \"PutConfigurationSetTrackingOptions\":{\
      \"name\":\"PutConfigurationSetTrackingOptions\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/configuration-sets/{ConfigurationSetName}/tracking-options\"\
      },\
      \"input\":{\"shape\":\"PutConfigurationSetTrackingOptionsRequest\"},\
      \"output\":{\"shape\":\"PutConfigurationSetTrackingOptionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Specify a custom domain to use for open and click tracking elements in email that you send.</p>\"\
    },\
    \"PutDedicatedIpInPool\":{\
      \"name\":\"PutDedicatedIpInPool\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/dedicated-ips/{IP}/pool\"\
      },\
      \"input\":{\"shape\":\"PutDedicatedIpInPoolRequest\"},\
      \"output\":{\"shape\":\"PutDedicatedIpInPoolResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Move a dedicated IP address to an existing dedicated IP pool.</p> <note> <p>The dedicated IP address that you specify must already exist, and must be associated with your AWS account. </p> <p>The dedicated IP pool you specify must already exist. You can create a new pool by using the <code>CreateDedicatedIpPool</code> operation.</p> </note>\"\
    },\
    \"PutDedicatedIpWarmupAttributes\":{\
      \"name\":\"PutDedicatedIpWarmupAttributes\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/dedicated-ips/{IP}/warmup\"\
      },\
      \"input\":{\"shape\":\"PutDedicatedIpWarmupAttributesRequest\"},\
      \"output\":{\"shape\":\"PutDedicatedIpWarmupAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p/>\"\
    },\
    \"PutDeliverabilityDashboardOption\":{\
      \"name\":\"PutDeliverabilityDashboardOption\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/deliverability-dashboard\"\
      },\
      \"input\":{\"shape\":\"PutDeliverabilityDashboardOptionRequest\"},\
      \"output\":{\"shape\":\"PutDeliverabilityDashboardOptionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AlreadyExistsException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Enable or disable the Deliverability dashboard. When you enable the Deliverability dashboard, you gain access to reputation, deliverability, and other metrics for the domains that you use to send email. You also gain the ability to perform predictive inbox placement tests.</p> <p>When you use the Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that you accrue by using Amazon SES and other AWS services. For more information about the features and cost of a Deliverability dashboard subscription, see <a href=\\\"http://aws.amazon.com/ses/pricing/\\\">Amazon SES Pricing</a>.</p>\"\
    },\
    \"PutEmailIdentityDkimAttributes\":{\
      \"name\":\"PutEmailIdentityDkimAttributes\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/identities/{EmailIdentity}/dkim\"\
      },\
      \"input\":{\"shape\":\"PutEmailIdentityDkimAttributesRequest\"},\
      \"output\":{\"shape\":\"PutEmailIdentityDkimAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Used to enable or disable DKIM authentication for an email identity.</p>\"\
    },\
    \"PutEmailIdentityDkimSigningAttributes\":{\
      \"name\":\"PutEmailIdentityDkimSigningAttributes\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v1/email/identities/{EmailIdentity}/dkim/signing\"\
      },\
      \"input\":{\"shape\":\"PutEmailIdentityDkimSigningAttributesRequest\"},\
      \"output\":{\"shape\":\"PutEmailIdentityDkimSigningAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Used to configure or change the DKIM authentication settings for an email domain identity. You can use this operation to do any of the following:</p> <ul> <li> <p>Update the signing attributes for an identity that uses Bring Your Own DKIM (BYODKIM).</p> </li> <li> <p>Change from using no DKIM authentication to using Easy DKIM.</p> </li> <li> <p>Change from using no DKIM authentication to using BYODKIM.</p> </li> <li> <p>Change from using Easy DKIM to using BYODKIM.</p> </li> <li> <p>Change from using BYODKIM to using Easy DKIM.</p> </li> </ul>\"\
    },\
    \"PutEmailIdentityFeedbackAttributes\":{\
      \"name\":\"PutEmailIdentityFeedbackAttributes\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/identities/{EmailIdentity}/feedback\"\
      },\
      \"input\":{\"shape\":\"PutEmailIdentityFeedbackAttributesRequest\"},\
      \"output\":{\"shape\":\"PutEmailIdentityFeedbackAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Used to enable or disable feedback forwarding for an identity. This setting determines what happens when an identity is used to send an email that results in a bounce or complaint event.</p> <p>If the value is <code>true</code>, you receive email notifications when bounce or complaint events occur. These notifications are sent to the address that you specified in the <code>Return-Path</code> header of the original email.</p> <p>You're required to have a method of tracking bounces and complaints. If you haven't set up another mechanism for receiving bounce or complaint notifications (for example, by setting up an event destination), you receive an email notification when these events occur (even if this setting is disabled).</p>\"\
    },\
    \"PutEmailIdentityMailFromAttributes\":{\
      \"name\":\"PutEmailIdentityMailFromAttributes\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/identities/{EmailIdentity}/mail-from\"\
      },\
      \"input\":{\"shape\":\"PutEmailIdentityMailFromAttributesRequest\"},\
      \"output\":{\"shape\":\"PutEmailIdentityMailFromAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Used to enable or disable the custom Mail-From domain configuration for an email identity.</p>\"\
    },\
    \"PutSuppressedDestination\":{\
      \"name\":\"PutSuppressedDestination\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/suppression/addresses\"\
      },\
      \"input\":{\"shape\":\"PutSuppressedDestinationRequest\"},\
      \"output\":{\"shape\":\"PutSuppressedDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Adds an email address to the suppression list for your account.</p>\"\
    },\
    \"SendEmail\":{\
      \"name\":\"SendEmail\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/v2/email/outbound-emails\"\
      },\
      \"input\":{\"shape\":\"SendEmailRequest\"},\
      \"output\":{\"shape\":\"SendEmailResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"AccountSuspendedException\"},\
        {\"shape\":\"SendingPausedException\"},\
        {\"shape\":\"MessageRejected\"},\
        {\"shape\":\"MailFromDomainNotVerifiedException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Sends an email message. You can use the Amazon SES API v2 to send two types of messages:</p> <ul> <li> <p> <b>Simple</b> â A standard email message. When you create this type of message, you specify the sender, the recipient, and the message body, and Amazon SES assembles the message for you.</p> </li> <li> <p> <b>Raw</b> â A raw, MIME-formatted email message. When you send this type of email, you have to specify all of the message headers, as well as the message body. You can use this message type to send messages that contain attachments. The message that you specify has to be a valid MIME message.</p> </li> </ul>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/v2/email/tags\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConcurrentModificationException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Add one or more tags (keys and values) to a specified resource. A <i>tag</i>Â is a label that you optionally define and associate with a resource. Tags can help you categorize and manage resources in different ways, such as by purpose, owner, environment, or other criteria. A resource can have as many as 50 tags.</p> <p>Each tag consists of a requiredÂ <i>tag key</i>Â and an associatedÂ <i>tag value</i>, both of which you define. A tag key is a general label that acts as a category for more specific tag values. A tag value acts as a descriptor within a tag key.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/v2/email/tags\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConcurrentModificationException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Remove one or more tags (keys and values) from a specified resource.</p>\"\
    },\
    \"UpdateConfigurationSetEventDestination\":{\
      \"name\":\"UpdateConfigurationSetEventDestination\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/v2/email/configuration-sets/{ConfigurationSetName}/event-destinations/{EventDestinationName}\"\
      },\
      \"input\":{\"shape\":\"UpdateConfigurationSetEventDestinationRequest\"},\
      \"output\":{\"shape\":\"UpdateConfigurationSetEventDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Update the configuration of an event destination for a configuration set.</p> <p> <i>Events</i> include message sends, deliveries, opens, clicks, bounces, and complaints. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccountSuspendedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The message can't be sent because the account's ability to send email has been permanently restricted.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"AlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The resource specified in your request already exists.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"AmazonResourceName\":{\"type\":\"string\"},\
    \"BadRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The input you provided is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"BehaviorOnMxFailure\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The action that you want to take if the required MX record can't be found when you send an email. When you set this value to <code>UseDefaultValue</code>, the mail is sent using <i>amazonses.com</i> as the MAIL FROM domain. When you set this value to <code>RejectMessage</code>, the Amazon SES API v2 returns a <code>MailFromDomainNotVerified</code> error, and doesn't attempt to deliver the email.</p> <p>These behaviors are taken when the custom MAIL FROM domain configuration is in the <code>Pending</code>, <code>Failed</code>, and <code>TemporaryFailure</code> states.</p>\",\
      \"enum\":[\
        \"USE_DEFAULT_VALUE\",\
        \"REJECT_MESSAGE\"\
      ]\
    },\
    \"BlacklistEntries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BlacklistEntry\"}\
    },\
    \"BlacklistEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RblName\":{\
          \"shape\":\"RblName\",\
          \"documentation\":\"<p>The name of the blacklist that the IP address appears on.</p>\"\
        },\
        \"ListingTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time when the blacklisting event occurred, shown in Unix time format.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"BlacklistingDescription\",\
          \"documentation\":\"<p>Additional information about the blacklisting event, as provided by the blacklist maintainer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about a blacklisting event that impacts one of the dedicated IP addresses that is associated with your account.</p>\"\
    },\
    \"BlacklistItemName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>An IP address that you want to obtain blacklist information for.</p>\"\
    },\
    \"BlacklistItemNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BlacklistItemName\"}\
    },\
    \"BlacklistReport\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"BlacklistItemName\"},\
      \"value\":{\"shape\":\"BlacklistEntries\"}\
    },\
    \"BlacklistingDescription\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>A description of the blacklisting event.</p>\"\
    },\
    \"Body\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"Content\",\
          \"documentation\":\"<p>An object that represents the version of the message that is displayed in email clients that don't support HTML, or clients where the recipient has disabled HTML rendering.</p>\"\
        },\
        \"Html\":{\
          \"shape\":\"Content\",\
          \"documentation\":\"<p>An object that represents the version of the message that is displayed in email clients that support HTML. HTML messages can include formatted text, hyperlinks, images, and more. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the body of the email message.</p>\"\
    },\
    \"CampaignId\":{\"type\":\"string\"},\
    \"Charset\":{\"type\":\"string\"},\
    \"CloudWatchDestination\":{\
      \"type\":\"structure\",\
      \"required\":[\"DimensionConfigurations\"],\
      \"members\":{\
        \"DimensionConfigurations\":{\
          \"shape\":\"CloudWatchDimensionConfigurations\",\
          \"documentation\":\"<p>An array of objects that define the dimensions to use when you send email events to Amazon CloudWatch.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that defines an Amazon CloudWatch destination for email events. You can use Amazon CloudWatch to monitor and gain insights on your email sending metrics.</p>\"\
    },\
    \"CloudWatchDimensionConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DimensionName\",\
        \"DimensionValueSource\",\
        \"DefaultDimensionValue\"\
      ],\
      \"members\":{\
        \"DimensionName\":{\
          \"shape\":\"DimensionName\",\
          \"documentation\":\"<p>The name of an Amazon CloudWatch dimension associated with an email sending metric. The name has to meet the following criteria:</p> <ul> <li> <p>It can only contain ASCII letters (aâz, AâZ), numbers (0â9), underscores (_), or dashes (-).</p> </li> <li> <p>It can contain no more than 256 characters.</p> </li> </ul>\"\
        },\
        \"DimensionValueSource\":{\
          \"shape\":\"DimensionValueSource\",\
          \"documentation\":\"<p>The location where the Amazon SES API v2 finds the value of a dimension to publish to Amazon CloudWatch. If you want to use the message tags that you specify using an <code>X-SES-MESSAGE-TAGS</code> header or a parameter to the <code>SendEmail</code> or <code>SendRawEmail</code> API, choose <code>messageTag</code>. If you want to use your own email headers, choose <code>emailHeader</code>. If you want to use link tags, choose <code>linkTags</code>.</p>\"\
        },\
        \"DefaultDimensionValue\":{\
          \"shape\":\"DefaultDimensionValue\",\
          \"documentation\":\"<p>The default value of the dimension that is published to Amazon CloudWatch if you don't provide the value of the dimension when you send an email. This value has to meet the following criteria:</p> <ul> <li> <p>It can only contain ASCII letters (aâz, AâZ), numbers (0â9), underscores (_), or dashes (-).</p> </li> <li> <p>It can contain no more than 256 characters.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>An object that defines the dimension configuration to use when you send email events to Amazon CloudWatch.</p>\"\
    },\
    \"CloudWatchDimensionConfigurations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CloudWatchDimensionConfiguration\"}\
    },\
    \"ConcurrentModificationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The resource is being modified by another operation or thread.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true\
    },\
    \"ConfigurationSetName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The name of a configuration set.</p> <p> <i>Configuration sets</i> are groups of rules that you can apply to the emails you send. You apply a configuration set to an email by including a reference to the configuration set in the headers of the email. When you apply a configuration set to an email, all of the rules in that configuration set are applied to the email.</p>\"\
    },\
    \"ConfigurationSetNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ConfigurationSetName\"}\
    },\
    \"Content\":{\
      \"type\":\"structure\",\
      \"required\":[\"Data\"],\
      \"members\":{\
        \"Data\":{\
          \"shape\":\"MessageData\",\
          \"documentation\":\"<p>The content of the message itself.</p>\"\
        },\
        \"Charset\":{\
          \"shape\":\"Charset\",\
          \"documentation\":\"<p>The character set for the content. Because of the constraints of the SMTP protocol, Amazon SES uses 7-bit ASCII by default. If the text includes characters outside of the ASCII range, you have to specify a character set. For example, you could specify <code>UTF-8</code>, <code>ISO-8859-1</code>, or <code>Shift_JIS</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that represents the content of the email, and optionally a character set specification.</p>\"\
    },\
    \"CreateConfigurationSetEventDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConfigurationSetName\",\
        \"EventDestinationName\",\
        \"EventDestination\"\
      ],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that you want to add an event destination to.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationSetName\"\
        },\
        \"EventDestinationName\":{\
          \"shape\":\"EventDestinationName\",\
          \"documentation\":\"<p>A name that identifies the event destination within the configuration set.</p>\"\
        },\
        \"EventDestination\":{\
          \"shape\":\"EventDestinationDefinition\",\
          \"documentation\":\"<p>An object that defines the event destination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to add an event destination to a configuration set.</p>\"\
    },\
    \"CreateConfigurationSetEventDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"CreateConfigurationSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConfigurationSetName\"],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set.</p>\"\
        },\
        \"TrackingOptions\":{\
          \"shape\":\"TrackingOptions\",\
          \"documentation\":\"<p>An object that defines the open and click tracking options for emails that you send using the configuration set.</p>\"\
        },\
        \"DeliveryOptions\":{\
          \"shape\":\"DeliveryOptions\",\
          \"documentation\":\"<p>An object that defines the dedicated IP pool that is used to send emails that you send using the configuration set.</p>\"\
        },\
        \"ReputationOptions\":{\
          \"shape\":\"ReputationOptions\",\
          \"documentation\":\"<p>An object that defines whether or not Amazon SES collects reputation metrics for the emails that you send that use the configuration set.</p>\"\
        },\
        \"SendingOptions\":{\
          \"shape\":\"SendingOptions\",\
          \"documentation\":\"<p>An object that defines whether or not Amazon SES can send email that you send using the configuration set.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of objects that define the tags (keys and values) that you want to associate with the configuration set.</p>\"\
        },\
        \"SuppressionOptions\":{\"shape\":\"SuppressionOptions\"}\
      },\
      \"documentation\":\"<p>A request to create a configuration set.</p>\"\
    },\
    \"CreateConfigurationSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"CreateDedicatedIpPoolRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PoolName\"],\
      \"members\":{\
        \"PoolName\":{\
          \"shape\":\"PoolName\",\
          \"documentation\":\"<p>The name of the dedicated IP pool.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An object that defines the tags (keys and values) that you want to associate with the pool.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to create a new dedicated IP pool.</p>\"\
    },\
    \"CreateDedicatedIpPoolResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"CreateDeliverabilityTestReportRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FromEmailAddress\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"ReportName\":{\
          \"shape\":\"ReportName\",\
          \"documentation\":\"<p>A unique name that helps you to identify the predictive inbox placement test when you retrieve the results.</p>\"\
        },\
        \"FromEmailAddress\":{\
          \"shape\":\"EmailAddress\",\
          \"documentation\":\"<p>The email address that the predictive inbox placement test email was sent from.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"EmailContent\",\
          \"documentation\":\"<p>The HTML body of the message that you sent when you performed the predictive inbox placement test.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of objects that define the tags (keys and values) that you want to associate with the predictive inbox placement test.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to perform a predictive inbox placement test. Predictive inbox placement tests can help you predict how your messages will be handled by various email providers around the world. When you perform a predictive inbox placement test, you provide a sample message that contains the content that you plan to send to your customers. We send that message to special email addresses spread across several major email providers around the world. The test takes about 24 hours to complete. When the test is complete, you can use the <code>GetDeliverabilityTestReport</code> operation to view the results of the test.</p>\"\
    },\
    \"CreateDeliverabilityTestReportResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ReportId\",\
        \"DeliverabilityTestStatus\"\
      ],\
      \"members\":{\
        \"ReportId\":{\
          \"shape\":\"ReportId\",\
          \"documentation\":\"<p>A unique string that identifies the predictive inbox placement test.</p>\"\
        },\
        \"DeliverabilityTestStatus\":{\
          \"shape\":\"DeliverabilityTestStatus\",\
          \"documentation\":\"<p>The status of the predictive inbox placement test. If the status is <code>IN_PROGRESS</code>, then the predictive inbox placement test is currently running. Predictive inbox placement tests are usually complete within 24 hours of creating the test. If the status is <code>COMPLETE</code>, then the test is finished, and you can use the <code>GetDeliverabilityTestReport</code> to view the results of the test.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the predictive inbox placement test that you created.</p>\"\
    },\
    \"CreateEmailIdentityRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EmailIdentity\"],\
      \"members\":{\
        \"EmailIdentity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The email address or domain that you want to verify.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of objects that define the tags (keys and values) that you want to associate with the email identity.</p>\"\
        },\
        \"DkimSigningAttributes\":{\
          \"shape\":\"DkimSigningAttributes\",\
          \"documentation\":\"<p>If your request includes this object, Amazon SES configures the identity to use Bring Your Own DKIM (BYODKIM) for DKIM authentication purposes, as opposed to the default method, <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Easy DKIM</a>.</p> <p>You can only specify this object if the email identity is a domain, as opposed to an address.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to begin the verification process for an email identity (an email address or domain).</p>\"\
    },\
    \"CreateEmailIdentityResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityType\":{\
          \"shape\":\"IdentityType\",\
          \"documentation\":\"<p>The email identity type.</p>\"\
        },\
        \"VerifiedForSendingStatus\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Specifies whether or not the identity is verified. You can only send email from verified email addresses or domains. For more information about verifying identities, see the <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-email-manage-verify.html\\\">Amazon Pinpoint User Guide</a>.</p>\"\
        },\
        \"DkimAttributes\":{\
          \"shape\":\"DkimAttributes\",\
          \"documentation\":\"<p>An object that contains information about the DKIM attributes for the identity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>If the email identity is a domain, this object contains information about the DKIM verification status for the domain.</p> <p>If the email identity is an email address, this object is empty. </p>\"\
    },\
    \"CustomRedirectDomain\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The domain that you want to use for tracking open and click events.</p>\"\
    },\
    \"DailyVolume\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StartDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date that the DailyVolume metrics apply to, in Unix time.</p>\"\
        },\
        \"VolumeStatistics\":{\
          \"shape\":\"VolumeStatistics\",\
          \"documentation\":\"<p>An object that contains inbox placement metrics for a specific day in the analysis period.</p>\"\
        },\
        \"DomainIspPlacements\":{\
          \"shape\":\"DomainIspPlacements\",\
          \"documentation\":\"<p>An object that contains inbox placement metrics for a specified day in the analysis period, broken out by the recipient's email provider.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about the volume of email sent on each day of the analysis period.</p>\"\
    },\
    \"DailyVolumes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DailyVolume\"}\
    },\
    \"DedicatedIp\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Ip\",\
        \"WarmupStatus\",\
        \"WarmupPercentage\"\
      ],\
      \"members\":{\
        \"Ip\":{\
          \"shape\":\"Ip\",\
          \"documentation\":\"<p>An IPv4 address.</p>\"\
        },\
        \"WarmupStatus\":{\
          \"shape\":\"WarmupStatus\",\
          \"documentation\":\"<p>The warm-up status of a dedicated IP address. The status can have one of the following values:</p> <ul> <li> <p> <code>IN_PROGRESS</code> â The IP address isn't ready to use because the dedicated IP warm-up process is ongoing.</p> </li> <li> <p> <code>DONE</code> â The dedicated IP warm-up process is complete, and the IP address is ready to use.</p> </li> </ul>\"\
        },\
        \"WarmupPercentage\":{\
          \"shape\":\"Percentage100Wrapper\",\
          \"documentation\":\"<p>Indicates how complete the dedicated IP warm-up process is. When this value equals 1, the address has completed the warm-up process and is ready for use.</p>\"\
        },\
        \"PoolName\":{\
          \"shape\":\"PoolName\",\
          \"documentation\":\"<p>The name of the dedicated IP pool that the IP address is associated with.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a dedicated IP address that is associated with your Amazon SES account.</p> <p>To learn more about requesting dedicated IP addresses, see <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/dedicated-ip-case.html\\\">Requesting and Relinquishing Dedicated IP Addresses</a> in the <i>Amazon SES Developer Guide</i>.</p>\"\
    },\
    \"DedicatedIpList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DedicatedIp\"},\
      \"documentation\":\"<p>A list of dedicated IP addresses that are associated with your AWS account.</p>\"\
    },\
    \"DefaultDimensionValue\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The default value of the dimension that is published to Amazon CloudWatch if you don't provide the value of the dimension when you send an email. This value has to meet the following criteria:</p> <ul> <li> <p>It can only contain ASCII letters (aâz, AâZ), numbers (0â9), underscores (_), or dashes (-).</p> </li> <li> <p>It can contain no more than 256 characters.</p> </li> </ul>\"\
    },\
    \"DeleteConfigurationSetEventDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConfigurationSetName\",\
        \"EventDestinationName\"\
      ],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that contains the event destination that you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationSetName\"\
        },\
        \"EventDestinationName\":{\
          \"shape\":\"EventDestinationName\",\
          \"documentation\":\"<p>The name of the event destination that you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EventDestinationName\"\
        }\
      },\
      \"documentation\":\"<p>A request to delete an event destination from a configuration set.</p>\"\
    },\
    \"DeleteConfigurationSetEventDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"DeleteConfigurationSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConfigurationSetName\"],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationSetName\"\
        }\
      },\
      \"documentation\":\"<p>A request to delete a configuration set.</p>\"\
    },\
    \"DeleteConfigurationSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"DeleteDedicatedIpPoolRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PoolName\"],\
      \"members\":{\
        \"PoolName\":{\
          \"shape\":\"PoolName\",\
          \"documentation\":\"<p>The name of the dedicated IP pool that you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PoolName\"\
        }\
      },\
      \"documentation\":\"<p>A request to delete a dedicated IP pool.</p>\"\
    },\
    \"DeleteDedicatedIpPoolResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"DeleteEmailIdentityRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EmailIdentity\"],\
      \"members\":{\
        \"EmailIdentity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The identity (that is, the email address or domain) that you want to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EmailIdentity\"\
        }\
      },\
      \"documentation\":\"<p>A request to delete an existing email identity. When you delete an identity, you lose the ability to send email from that identity. You can restore your ability to send email by completing the verification process for the identity again.</p>\"\
    },\
    \"DeleteEmailIdentityResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"DeleteSuppressedDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EmailAddress\"],\
      \"members\":{\
        \"EmailAddress\":{\
          \"shape\":\"EmailAddress\",\
          \"documentation\":\"<p>The suppressed email destination to remove from the account suppression list.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EmailAddress\"\
        }\
      },\
      \"documentation\":\"<p>A request to remove an email address from the suppression list for your account.</p>\"\
    },\
    \"DeleteSuppressedDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"DeliverabilityDashboardAccountStatus\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The current status of your Deliverability dashboard subscription. If this value is <code>PENDING_EXPIRATION</code>, your subscription is scheduled to expire at the end of the current calendar month.</p>\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"PENDING_EXPIRATION\",\
        \"DISABLED\"\
      ]\
    },\
    \"DeliverabilityTestReport\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReportId\":{\
          \"shape\":\"ReportId\",\
          \"documentation\":\"<p>A unique string that identifies the predictive inbox placement test.</p>\"\
        },\
        \"ReportName\":{\
          \"shape\":\"ReportName\",\
          \"documentation\":\"<p>A name that helps you identify a predictive inbox placement test report.</p>\"\
        },\
        \"Subject\":{\
          \"shape\":\"DeliverabilityTestSubject\",\
          \"documentation\":\"<p>The subject line for an email that you submitted in a predictive inbox placement test.</p>\"\
        },\
        \"FromEmailAddress\":{\
          \"shape\":\"EmailAddress\",\
          \"documentation\":\"<p>The sender address that you specified for the predictive inbox placement test.</p>\"\
        },\
        \"CreateDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time when the predictive inbox placement test was created, in Unix time format.</p>\"\
        },\
        \"DeliverabilityTestStatus\":{\
          \"shape\":\"DeliverabilityTestStatus\",\
          \"documentation\":\"<p>The status of the predictive inbox placement test. If the status is <code>IN_PROGRESS</code>, then the predictive inbox placement test is currently running. Predictive inbox placement tests are usually complete within 24 hours of creating the test. If the status is <code>COMPLETE</code>, then the test is finished, and you can use the <code>GetDeliverabilityTestReport</code> to view the results of the test.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains metadata related to a predictive inbox placement test.</p>\"\
    },\
    \"DeliverabilityTestReports\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DeliverabilityTestReport\"}\
    },\
    \"DeliverabilityTestStatus\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The status of a predictive inbox placement test. If the status is <code>IN_PROGRESS</code>, then the predictive inbox placement test is currently running. Predictive inbox placement tests are usually complete within 24 hours of creating the test. If the status is <code>COMPLETE</code>, then the test is finished, and you can use the <code>GetDeliverabilityTestReport</code> operation to view the results of the test.</p>\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"COMPLETED\"\
      ]\
    },\
    \"DeliverabilityTestSubject\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The subject line for an email that you submitted in a predictive inbox placement test.</p>\"\
    },\
    \"DeliveryOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TlsPolicy\":{\
          \"shape\":\"TlsPolicy\",\
          \"documentation\":\"<p>Specifies whether messages that use the configuration set are required to use Transport Layer Security (TLS). If the value is <code>Require</code>, messages are only delivered if a TLS connection can be established. If the value is <code>Optional</code>, messages can be delivered in plain text if a TLS connection can't be established.</p>\"\
        },\
        \"SendingPoolName\":{\
          \"shape\":\"PoolName\",\
          \"documentation\":\"<p>The name of the dedicated IP pool that you want to associate with the configuration set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Used to associate a configuration set with a dedicated IP pool.</p>\"\
    },\
    \"Destination\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ToAddresses\":{\
          \"shape\":\"EmailAddressList\",\
          \"documentation\":\"<p>An array that contains the email addresses of the \\\"To\\\" recipients for the email.</p>\"\
        },\
        \"CcAddresses\":{\
          \"shape\":\"EmailAddressList\",\
          \"documentation\":\"<p>An array that contains the email addresses of the \\\"CC\\\" (carbon copy) recipients for the email.</p>\"\
        },\
        \"BccAddresses\":{\
          \"shape\":\"EmailAddressList\",\
          \"documentation\":\"<p>An array that contains the email addresses of the \\\"BCC\\\" (blind carbon copy) recipients for the email.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that describes the recipients for an email.</p>\"\
    },\
    \"DimensionName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The name of an Amazon CloudWatch dimension associated with an email sending metric. The name has to meet the following criteria:</p> <ul> <li> <p>It can only contain ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-).</p> </li> <li> <p>It can contain no more than 256 characters.</p> </li> </ul>\"\
    },\
    \"DimensionValueSource\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The location where the Amazon SES API v2 finds the value of a dimension to publish to Amazon CloudWatch. If you want to use the message tags that you specify using an <code>X-SES-MESSAGE-TAGS</code> header or a parameter to the <code>SendEmail</code> or <code>SendRawEmail</code> API, choose <code>messageTag</code>. If you want to use your own email headers, choose <code>emailHeader</code>. If you want to use link tags, choose <code>linkTags</code>.</p>\",\
      \"enum\":[\
        \"MESSAGE_TAG\",\
        \"EMAIL_HEADER\",\
        \"LINK_TAG\"\
      ]\
    },\
    \"DkimAttributes\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SigningEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>If the value is <code>true</code>, then the messages that you send from the identity are signed using DKIM. If the value is <code>false</code>, then the messages that you send from the identity aren't DKIM-signed.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"DkimStatus\",\
          \"documentation\":\"<p>Describes whether or not Amazon SES has successfully located the DKIM records in the DNS records for the domain. The status can be one of the following:</p> <ul> <li> <p> <code>PENDING</code> â The verification process was initiated, but Amazon SES hasn't yet detected the DKIM records in the DNS configuration for the domain.</p> </li> <li> <p> <code>SUCCESS</code> â The verification process completed successfully.</p> </li> <li> <p> <code>FAILED</code> â The verification process failed. This typically occurs when Amazon SES fails to find the DKIM records in the DNS configuration of the domain.</p> </li> <li> <p> <code>TEMPORARY_FAILURE</code> â A temporary issue is preventing Amazon SES from determining the DKIM authentication status of the domain.</p> </li> <li> <p> <code>NOT_STARTED</code> â The DKIM verification process hasn't been initiated for the domain.</p> </li> </ul>\"\
        },\
        \"Tokens\":{\
          \"shape\":\"DnsTokenList\",\
          \"documentation\":\"<p>If you used <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Easy DKIM</a> to configure DKIM authentication for the domain, then this object contains a set of unique strings that you use to create a set of CNAME records that you add to the DNS configuration for your domain. When Amazon SES detects these records in the DNS configuration for your domain, the DKIM authentication process is complete.</p> <p>If you configured DKIM authentication for the domain by providing your own public-private key pair, then this object contains the selector for the public key.</p> <p>Regardless of the DKIM authentication method you use, Amazon SES searches for the appropriate records in the DNS configuration of the domain for up to 72 hours.</p>\"\
        },\
        \"SigningAttributesOrigin\":{\
          \"shape\":\"DkimSigningAttributesOrigin\",\
          \"documentation\":\"<p>A string that indicates how DKIM was configured for the identity. There are two possible values:</p> <ul> <li> <p> <code>AWS_SES</code> â Indicates that DKIM was configured for the identity by using <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Easy DKIM</a>.</p> </li> <li> <p> <code>EXTERNAL</code> â Indicates that DKIM was configured for the identity by using Bring Your Own DKIM (BYODKIM).</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about the DKIM authentication status for an email identity.</p> <p>Amazon SES determines the authentication status by searching for specific records in the DNS configuration for the domain. If you used <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Easy DKIM</a> to set up DKIM authentication, Amazon SES tries to find three unique CNAME records in the DNS configuration for your domain. If you provided a public key to perform DKIM authentication, Amazon SES tries to find a TXT record that uses the selector that you specified. The value of the TXT record must be a public key that's paired with the private key that you specified in the process of creating the identity</p>\"\
    },\
    \"DkimSigningAttributes\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainSigningSelector\",\
        \"DomainSigningPrivateKey\"\
      ],\
      \"members\":{\
        \"DomainSigningSelector\":{\
          \"shape\":\"Selector\",\
          \"documentation\":\"<p>A string that's used to identify a public key in the DNS configuration for a domain.</p>\"\
        },\
        \"DomainSigningPrivateKey\":{\
          \"shape\":\"PrivateKey\",\
          \"documentation\":\"<p>A private key that's used to generate a DKIM signature.</p> <p>The private key must use 1024-bit RSA encryption, and must be encoded using base64 encoding.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about the tokens used for setting up Bring Your Own DKIM (BYODKIM).</p>\"\
    },\
    \"DkimSigningAttributesOrigin\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AWS_SES\",\
        \"EXTERNAL\"\
      ]\
    },\
    \"DkimStatus\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The DKIM authentication status of the identity. The status can be one of the following:</p> <ul> <li> <p> <code>PENDING</code> â The verification process was initiated, but Amazon SES hasn't yet detected the DKIM records in the DNS configuration for the domain.</p> </li> <li> <p> <code>SUCCESS</code> â The verification process completed successfully.</p> </li> <li> <p> <code>FAILED</code> â The verification process failed. This typically occurs when Amazon SES fails to find the DKIM records in the DNS configuration of the domain.</p> </li> <li> <p> <code>TEMPORARY_FAILURE</code> â A temporary issue is preventing Amazon SES from determining the DKIM authentication status of the domain.</p> </li> <li> <p> <code>NOT_STARTED</code> â The DKIM verification process hasn't been initiated for the domain.</p> </li> </ul>\",\
      \"enum\":[\
        \"PENDING\",\
        \"SUCCESS\",\
        \"FAILED\",\
        \"TEMPORARY_FAILURE\",\
        \"NOT_STARTED\"\
      ]\
    },\
    \"DnsToken\":{\"type\":\"string\"},\
    \"DnsTokenList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DnsToken\"}\
    },\
    \"Domain\":{\"type\":\"string\"},\
    \"DomainDeliverabilityCampaign\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CampaignId\":{\
          \"shape\":\"CampaignId\",\
          \"documentation\":\"<p>The unique identifier for the campaign. The Deliverability dashboard automatically generates and assigns this identifier to a campaign.</p>\"\
        },\
        \"ImageUrl\":{\
          \"shape\":\"ImageUrl\",\
          \"documentation\":\"<p>The URL of an image that contains a snapshot of the email message that was sent.</p>\"\
        },\
        \"Subject\":{\
          \"shape\":\"Subject\",\
          \"documentation\":\"<p>The subject line, or title, of the email message.</p>\"\
        },\
        \"FromAddress\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The verified email address that the email message was sent from.</p>\"\
        },\
        \"SendingIps\":{\
          \"shape\":\"IpList\",\
          \"documentation\":\"<p>The IP addresses that were used to send the email message.</p>\"\
        },\
        \"FirstSeenDateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The first time, in Unix time format, when the email message was delivered to any recipient's inbox. This value can help you determine how long it took for a campaign to deliver an email message.</p>\"\
        },\
        \"LastSeenDateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last time, in Unix time format, when the email message was delivered to any recipient's inbox. This value can help you determine how long it took for a campaign to deliver an email message.</p>\"\
        },\
        \"InboxCount\":{\
          \"shape\":\"Volume\",\
          \"documentation\":\"<p>The number of email messages that were delivered to recipientsâ inboxes.</p>\"\
        },\
        \"SpamCount\":{\
          \"shape\":\"Volume\",\
          \"documentation\":\"<p>The number of email messages that were delivered to recipients' spam or junk mail folders.</p>\"\
        },\
        \"ReadRate\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of email messages that were opened by recipients. Due to technical limitations, this value only includes recipients who opened the message by using an email client that supports images.</p>\"\
        },\
        \"DeleteRate\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of email messages that were deleted by recipients, without being opened first. Due to technical limitations, this value only includes recipients who opened the message by using an email client that supports images.</p>\"\
        },\
        \"ReadDeleteRate\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of email messages that were opened and then deleted by recipients. Due to technical limitations, this value only includes recipients who opened the message by using an email client that supports images.</p>\"\
        },\
        \"ProjectedVolume\":{\
          \"shape\":\"Volume\",\
          \"documentation\":\"<p>The projected number of recipients that the email message was sent to.</p>\"\
        },\
        \"Esps\":{\
          \"shape\":\"Esps\",\
          \"documentation\":\"<p>The major email providers who handled the email message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains the deliverability data for a specific campaign. This data is available for a campaign only if the campaign sent email by using a domain that the Deliverability dashboard is enabled for (<code>PutDeliverabilityDashboardOption</code> operation).</p>\"\
    },\
    \"DomainDeliverabilityCampaignList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DomainDeliverabilityCampaign\"},\
      \"documentation\":\"<p/>\"\
    },\
    \"DomainDeliverabilityTrackingOption\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Domain\":{\
          \"shape\":\"Domain\",\
          \"documentation\":\"<p>A verified domain thatâs associated with your AWS account and currently has an active Deliverability dashboard subscription.</p>\"\
        },\
        \"SubscriptionStartDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date, in Unix time format, when you enabled the Deliverability dashboard for the domain.</p>\"\
        },\
        \"InboxPlacementTrackingOption\":{\
          \"shape\":\"InboxPlacementTrackingOption\",\
          \"documentation\":\"<p>An object that contains information about the inbox placement data settings for the domain.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about the Deliverability dashboard subscription for a verified domain that you use to send email and currently has an active Deliverability dashboard subscription. If a Deliverability dashboard subscription is active for a domain, you gain access to reputation, inbox placement, and other metrics for the domain.</p>\"\
    },\
    \"DomainDeliverabilityTrackingOptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DomainDeliverabilityTrackingOption\"},\
      \"documentation\":\"<p>An object that contains information about the Deliverability dashboard subscription for a verified domain that you use to send email and currently has an active Deliverability dashboard subscription. If a Deliverability dashboard subscription is active for a domain, you gain access to reputation, inbox placement, and other metrics for the domain.</p>\"\
    },\
    \"DomainIspPlacement\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IspName\":{\
          \"shape\":\"IspName\",\
          \"documentation\":\"<p>The name of the email provider that the inbox placement data applies to.</p>\"\
        },\
        \"InboxRawCount\":{\
          \"shape\":\"Volume\",\
          \"documentation\":\"<p>The total number of messages that were sent from the selected domain to the specified email provider that arrived in recipients' inboxes.</p>\"\
        },\
        \"SpamRawCount\":{\
          \"shape\":\"Volume\",\
          \"documentation\":\"<p>The total number of messages that were sent from the selected domain to the specified email provider that arrived in recipients' spam or junk mail folders.</p>\"\
        },\
        \"InboxPercentage\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of messages that were sent from the selected domain to the specified email provider that arrived in recipients' inboxes.</p>\"\
        },\
        \"SpamPercentage\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of messages that were sent from the selected domain to the specified email provider that arrived in recipients' spam or junk mail folders.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains inbox placement data for email sent from one of your email domains to a specific email provider.</p>\"\
    },\
    \"DomainIspPlacements\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DomainIspPlacement\"}\
    },\
    \"EmailAddress\":{\"type\":\"string\"},\
    \"EmailAddressList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EmailAddress\"}\
    },\
    \"EmailContent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Simple\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The simple email message. The message consists of a subject and a message body.</p>\"\
        },\
        \"Raw\":{\
          \"shape\":\"RawMessage\",\
          \"documentation\":\"<p>The raw email message. The message has to meet the following criteria:</p> <ul> <li> <p>The message has to contain a header and a body, separated by one blank line.</p> </li> <li> <p>All of the required header fields must be present in the message.</p> </li> <li> <p>Each part of a multipart MIME message must be formatted properly.</p> </li> <li> <p>If you include attachments, they must be in a file format that the Amazon SES API v2 supports. </p> </li> <li> <p>The entire message must be Base64 encoded.</p> </li> <li> <p>If any of the MIME parts in your message contain content that is outside of the 7-bit ASCII character range, you should encode that content to ensure that recipients' email clients render the message properly.</p> </li> <li> <p>The length of any single line of text in the message can't exceed 1,000 characters. This restriction is defined in <a href=\\\"https://tools.ietf.org/html/rfc5321\\\">RFC 5321</a>.</p> </li> </ul>\"\
        },\
        \"Template\":{\
          \"shape\":\"Template\",\
          \"documentation\":\"<p>The template to use for the email message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that defines the entire content of the email, including the message headers and the body content. You can create a simple email message, in which you specify the subject and the text and HTML versions of the message body. You can also create raw messages, in which you specify a complete MIME-formatted message. Raw messages can include attachments and custom headers.</p>\"\
    },\
    \"Enabled\":{\"type\":\"boolean\"},\
    \"Esp\":{\"type\":\"string\"},\
    \"Esps\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Esp\"}\
    },\
    \"EventDestination\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"MatchingEventTypes\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"EventDestinationName\",\
          \"documentation\":\"<p>A name that identifies the event destination.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>If <code>true</code>, the event destination is enabled. When the event destination is enabled, the specified event types are sent to the destinations in this <code>EventDestinationDefinition</code>.</p> <p>If <code>false</code>, the event destination is disabled. When the event destination is disabled, events aren't sent to the specified destinations.</p>\"\
        },\
        \"MatchingEventTypes\":{\
          \"shape\":\"EventTypes\",\
          \"documentation\":\"<p>The types of events that Amazon SES sends to the specified event destinations.</p>\"\
        },\
        \"KinesisFirehoseDestination\":{\
          \"shape\":\"KinesisFirehoseDestination\",\
          \"documentation\":\"<p>An object that defines an Amazon Kinesis Data Firehose destination for email events. You can use Amazon Kinesis Data Firehose to stream data to other services, such as Amazon S3 and Amazon Redshift.</p>\"\
        },\
        \"CloudWatchDestination\":{\
          \"shape\":\"CloudWatchDestination\",\
          \"documentation\":\"<p>An object that defines an Amazon CloudWatch destination for email events. You can use Amazon CloudWatch to monitor and gain insights on your email sending metrics.</p>\"\
        },\
        \"SnsDestination\":{\
          \"shape\":\"SnsDestination\",\
          \"documentation\":\"<p>An object that defines an Amazon SNS destination for email events. You can use Amazon SNS to send notification when certain email events occur.</p>\"\
        },\
        \"PinpointDestination\":{\
          \"shape\":\"PinpointDestination\",\
          \"documentation\":\"<p>An object that defines an Amazon Pinpoint project destination for email events. You can send email event data to a Amazon Pinpoint project to view metrics using the Transactional Messaging dashboards that are built in to Amazon Pinpoint. For more information, see <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/userguide/analytics-transactional-messages.html\\\">Transactional Messaging Charts</a> in the <i>Amazon Pinpoint User Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>In the Amazon SES API v2, <i>events</i> include message sends, deliveries, opens, clicks, bounces, complaints and delivery delays. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p>\"\
    },\
    \"EventDestinationDefinition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>If <code>true</code>, the event destination is enabled. When the event destination is enabled, the specified event types are sent to the destinations in this <code>EventDestinationDefinition</code>.</p> <p>If <code>false</code>, the event destination is disabled. When the event destination is disabled, events aren't sent to the specified destinations.</p>\"\
        },\
        \"MatchingEventTypes\":{\
          \"shape\":\"EventTypes\",\
          \"documentation\":\"<p>An array that specifies which events the Amazon SES API v2 should send to the destinations in this <code>EventDestinationDefinition</code>.</p>\"\
        },\
        \"KinesisFirehoseDestination\":{\
          \"shape\":\"KinesisFirehoseDestination\",\
          \"documentation\":\"<p>An object that defines an Amazon Kinesis Data Firehose destination for email events. You can use Amazon Kinesis Data Firehose to stream data to other services, such as Amazon S3 and Amazon Redshift.</p>\"\
        },\
        \"CloudWatchDestination\":{\
          \"shape\":\"CloudWatchDestination\",\
          \"documentation\":\"<p>An object that defines an Amazon CloudWatch destination for email events. You can use Amazon CloudWatch to monitor and gain insights on your email sending metrics.</p>\"\
        },\
        \"SnsDestination\":{\
          \"shape\":\"SnsDestination\",\
          \"documentation\":\"<p>An object that defines an Amazon SNS destination for email events. You can use Amazon SNS to send notification when certain email events occur.</p>\"\
        },\
        \"PinpointDestination\":{\
          \"shape\":\"PinpointDestination\",\
          \"documentation\":\"<p>An object that defines an Amazon Pinpoint project destination for email events. You can send email event data to a Amazon Pinpoint project to view metrics using the Transactional Messaging dashboards that are built in to Amazon Pinpoint. For more information, see <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/userguide/analytics-transactional-messages.html\\\">Transactional Messaging Charts</a> in the <i>Amazon Pinpoint User Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that defines the event destination. Specifically, it defines which services receive events from emails sent using the configuration set that the event destination is associated with. Also defines the types of events that are sent to the event destination.</p>\"\
    },\
    \"EventDestinationName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The name of an event destination.</p> <p> <i>Events</i> include message sends, deliveries, opens, clicks, bounces, and complaints. <i>Event destinations</i> are places that you can send information about these events to. For example, you can send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.</p>\"\
    },\
    \"EventDestinations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EventDestination\"}\
    },\
    \"EventType\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>An email sending event type. For example, email sends, opens, and bounces are all email events.</p>\",\
      \"enum\":[\
        \"SEND\",\
        \"REJECT\",\
        \"BOUNCE\",\
        \"COMPLAINT\",\
        \"DELIVERY\",\
        \"OPEN\",\
        \"CLICK\",\
        \"RENDERING_FAILURE\",\
        \"DELIVERY_DELAY\"\
      ]\
    },\
    \"EventTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EventType\"}\
    },\
    \"FeedbackId\":{\"type\":\"string\"},\
    \"GeneralEnforcementStatus\":{\"type\":\"string\"},\
    \"GetAccountRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A request to obtain information about the email-sending capabilities of your Amazon SES account.</p>\"\
    },\
    \"GetAccountResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DedicatedIpAutoWarmupEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Indicates whether or not the automatic warm-up feature is enabled for dedicated IP addresses that are associated with your account.</p>\"\
        },\
        \"EnforcementStatus\":{\
          \"shape\":\"GeneralEnforcementStatus\",\
          \"documentation\":\"<p>The reputation status of your Amazon SES account. The status can be one of the following:</p> <ul> <li> <p> <code>HEALTHY</code> â There are no reputation-related issues that currently impact your account.</p> </li> <li> <p> <code>PROBATION</code> â We've identified potential issues with your Amazon SES account. We're placing your account under review while you work on correcting these issues.</p> </li> <li> <p> <code>SHUTDOWN</code> â Your account's ability to send email is currently paused because of an issue with the email sent from your account. When you correct the issue, you can contact us and request that your account's ability to send email is resumed.</p> </li> </ul>\"\
        },\
        \"ProductionAccessEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Indicates whether or not your account has production access in the current AWS Region.</p> <p>If the value is <code>false</code>, then your account is in the <i>sandbox</i>. When your account is in the sandbox, you can only send email to verified identities. Additionally, the maximum number of emails you can send in a 24-hour period (your sending quota) is 200, and the maximum number of emails you can send per second (your maximum sending rate) is 1.</p> <p>If the value is <code>true</code>, then your account has production access. When your account has production access, you can send email to any address. The sending quota and maximum sending rate for your account vary based on your specific use case.</p>\"\
        },\
        \"SendQuota\":{\
          \"shape\":\"SendQuota\",\
          \"documentation\":\"<p>An object that contains information about the per-day and per-second sending limits for your Amazon SES account in the current AWS Region.</p>\"\
        },\
        \"SendingEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Indicates whether or not email sending is enabled for your Amazon SES account in the current AWS Region.</p>\"\
        },\
        \"SuppressionAttributes\":{\
          \"shape\":\"SuppressionAttributes\",\
          \"documentation\":\"<p>An object that contains information about the email address suppression preferences for your account in the current AWS Region.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of details about the email-sending capabilities of your Amazon SES account in the current AWS Region.</p>\"\
    },\
    \"GetBlacklistReportsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"BlacklistItemNames\"],\
      \"members\":{\
        \"BlacklistItemNames\":{\
          \"shape\":\"BlacklistItemNames\",\
          \"documentation\":\"<p>A list of IP addresses that you want to retrieve blacklist information about. You can only specify the dedicated IP addresses that you use to send email using Amazon SES or Amazon Pinpoint.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"BlacklistItemNames\"\
        }\
      },\
      \"documentation\":\"<p>A request to retrieve a list of the blacklists that your dedicated IP addresses appear on.</p>\"\
    },\
    \"GetBlacklistReportsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"BlacklistReport\"],\
      \"members\":{\
        \"BlacklistReport\":{\
          \"shape\":\"BlacklistReport\",\
          \"documentation\":\"<p>An object that contains information about a blacklist that one of your dedicated IP addresses appears on.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about blacklist events.</p>\"\
    },\
    \"GetConfigurationSetEventDestinationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConfigurationSetName\"],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that contains the event destination.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationSetName\"\
        }\
      },\
      \"documentation\":\"<p>A request to obtain information about the event destinations for a configuration set.</p>\"\
    },\
    \"GetConfigurationSetEventDestinationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EventDestinations\":{\
          \"shape\":\"EventDestinations\",\
          \"documentation\":\"<p>An array that includes all of the events destinations that have been configured for the configuration set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an event destination for a configuration set.</p>\"\
    },\
    \"GetConfigurationSetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConfigurationSetName\"],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that you want to obtain more information about.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationSetName\"\
        }\
      },\
      \"documentation\":\"<p>A request to obtain information about a configuration set.</p>\"\
    },\
    \"GetConfigurationSetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set.</p>\"\
        },\
        \"TrackingOptions\":{\
          \"shape\":\"TrackingOptions\",\
          \"documentation\":\"<p>An object that defines the open and click tracking options for emails that you send using the configuration set.</p>\"\
        },\
        \"DeliveryOptions\":{\
          \"shape\":\"DeliveryOptions\",\
          \"documentation\":\"<p>An object that defines the dedicated IP pool that is used to send emails that you send using the configuration set.</p>\"\
        },\
        \"ReputationOptions\":{\
          \"shape\":\"ReputationOptions\",\
          \"documentation\":\"<p>An object that defines whether or not Amazon SES collects reputation metrics for the emails that you send that use the configuration set.</p>\"\
        },\
        \"SendingOptions\":{\
          \"shape\":\"SendingOptions\",\
          \"documentation\":\"<p>An object that defines whether or not Amazon SES can send email that you send using the configuration set.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of objects that define the tags (keys and values) that are associated with the configuration set.</p>\"\
        },\
        \"SuppressionOptions\":{\
          \"shape\":\"SuppressionOptions\",\
          \"documentation\":\"<p>An object that contains information about the suppression list preferences for your account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a configuration set.</p>\"\
    },\
    \"GetDedicatedIpRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Ip\"],\
      \"members\":{\
        \"Ip\":{\
          \"shape\":\"Ip\",\
          \"documentation\":\"<p>The IP address that you want to obtain more information about. The value you specify has to be a dedicated IP address that's assocaited with your AWS account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IP\"\
        }\
      },\
      \"documentation\":\"<p>A request to obtain more information about a dedicated IP address.</p>\"\
    },\
    \"GetDedicatedIpResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DedicatedIp\":{\
          \"shape\":\"DedicatedIp\",\
          \"documentation\":\"<p>An object that contains information about a dedicated IP address.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a dedicated IP address.</p>\"\
    },\
    \"GetDedicatedIpsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PoolName\":{\
          \"shape\":\"PoolName\",\
          \"documentation\":\"<p>The name of the IP pool that the dedicated IP address is associated with.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"PoolName\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token returned from a previous call to <code>GetDedicatedIps</code> to indicate the position of the dedicated IP pool in the list of IP pools.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        },\
        \"PageSize\":{\
          \"shape\":\"MaxItems\",\
          \"documentation\":\"<p>The number of results to show in a single call to <code>GetDedicatedIpsRequest</code>. If the number of results is larger than the number you specified in this parameter, then the response includes a <code>NextToken</code> element, which you can use to obtain additional results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"PageSize\"\
        }\
      },\
      \"documentation\":\"<p>A request to obtain more information about dedicated IP pools.</p>\"\
    },\
    \"GetDedicatedIpsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DedicatedIps\":{\
          \"shape\":\"DedicatedIpList\",\
          \"documentation\":\"<p>A list of dedicated IP addresses that are associated with your AWS account.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that indicates that there are additional dedicated IP addresses to list. To view additional addresses, issue another request to <code>GetDedicatedIps</code>, passing this token in the <code>NextToken</code> parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the dedicated IP addresses that are associated with your AWS account.</p>\"\
    },\
    \"GetDeliverabilityDashboardOptionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Retrieve information about the status of the Deliverability dashboard for your AWS account. When the Deliverability dashboard is enabled, you gain access to reputation, deliverability, and other metrics for your domains. You also gain the ability to perform predictive inbox placement tests.</p> <p>When you use the Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that you accrue by using Amazon SES and other AWS services. For more information about the features and cost of a Deliverability dashboard subscription, see <a href=\\\"http://aws.amazon.com/pinpoint/pricing/\\\">Amazon Pinpoint Pricing</a>.</p>\"\
    },\
    \"GetDeliverabilityDashboardOptionsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"DashboardEnabled\"],\
      \"members\":{\
        \"DashboardEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Specifies whether the Deliverability dashboard is enabled. If this value is <code>true</code>, the dashboard is enabled.</p>\"\
        },\
        \"SubscriptionExpiryDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date, in Unix time format, when your current subscription to the Deliverability dashboard is scheduled to expire, if your subscription is scheduled to expire at the end of the current calendar month. This value is null if you have an active subscription that isnât due to expire at the end of the month.</p>\"\
        },\
        \"AccountStatus\":{\
          \"shape\":\"DeliverabilityDashboardAccountStatus\",\
          \"documentation\":\"<p>The current status of your Deliverability dashboard subscription. If this value is <code>PENDING_EXPIRATION</code>, your subscription is scheduled to expire at the end of the current calendar month.</p>\"\
        },\
        \"ActiveSubscribedDomains\":{\
          \"shape\":\"DomainDeliverabilityTrackingOptions\",\
          \"documentation\":\"<p>An array of objects, one for each verified domain that you use to send email and currently has an active Deliverability dashboard subscription that isnât scheduled to expire at the end of the current calendar month.</p>\"\
        },\
        \"PendingExpirationSubscribedDomains\":{\
          \"shape\":\"DomainDeliverabilityTrackingOptions\",\
          \"documentation\":\"<p>An array of objects, one for each verified domain that you use to send email and currently has an active Deliverability dashboard subscription that's scheduled to expire at the end of the current calendar month.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that shows the status of the Deliverability dashboard.</p>\"\
    },\
    \"GetDeliverabilityTestReportRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ReportId\"],\
      \"members\":{\
        \"ReportId\":{\
          \"shape\":\"ReportId\",\
          \"documentation\":\"<p>A unique string that identifies the predictive inbox placement test.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ReportId\"\
        }\
      },\
      \"documentation\":\"<p>A request to retrieve the results of a predictive inbox placement test.</p>\"\
    },\
    \"GetDeliverabilityTestReportResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeliverabilityTestReport\",\
        \"OverallPlacement\",\
        \"IspPlacements\"\
      ],\
      \"members\":{\
        \"DeliverabilityTestReport\":{\
          \"shape\":\"DeliverabilityTestReport\",\
          \"documentation\":\"<p>An object that contains the results of the predictive inbox placement test.</p>\"\
        },\
        \"OverallPlacement\":{\
          \"shape\":\"PlacementStatistics\",\
          \"documentation\":\"<p>An object that specifies how many test messages that were sent during the predictive inbox placement test were delivered to recipients' inboxes, how many were sent to recipients' spam folders, and how many weren't delivered.</p>\"\
        },\
        \"IspPlacements\":{\
          \"shape\":\"IspPlacements\",\
          \"documentation\":\"<p>An object that describes how the test email was handled by several email providers, including Gmail, Hotmail, Yahoo, AOL, and others.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"MessageContent\",\
          \"documentation\":\"<p>An object that contains the message that you sent when you performed this predictive inbox placement test.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of objects that define the tags (keys and values) that are associated with the predictive inbox placement test.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The results of the predictive inbox placement test.</p>\"\
    },\
    \"GetDomainDeliverabilityCampaignRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CampaignId\"],\
      \"members\":{\
        \"CampaignId\":{\
          \"shape\":\"CampaignId\",\
          \"documentation\":\"<p>The unique identifier for the campaign. The Deliverability dashboard automatically generates and assigns this identifier to a campaign.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CampaignId\"\
        }\
      },\
      \"documentation\":\"<p>Retrieve all the deliverability data for a specific campaign. This data is available for a campaign only if the campaign sent email by using a domain that the Deliverability dashboard is enabled for (<code>PutDeliverabilityDashboardOption</code> operation).</p>\"\
    },\
    \"GetDomainDeliverabilityCampaignResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainDeliverabilityCampaign\"],\
      \"members\":{\
        \"DomainDeliverabilityCampaign\":{\
          \"shape\":\"DomainDeliverabilityCampaign\",\
          \"documentation\":\"<p>An object that contains the deliverability data for the campaign.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains all the deliverability data for a specific campaign. This data is available for a campaign only if the campaign sent email by using a domain that the Deliverability dashboard is enabled for.</p>\"\
    },\
    \"GetDomainStatisticsReportRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Domain\",\
        \"StartDate\",\
        \"EndDate\"\
      ],\
      \"members\":{\
        \"Domain\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The domain that you want to obtain deliverability metrics for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Domain\"\
        },\
        \"StartDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The first day (in Unix time) that you want to obtain domain deliverability metrics for.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"StartDate\"\
        },\
        \"EndDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last day (in Unix time) that you want to obtain domain deliverability metrics for. The <code>EndDate</code> that you specify has to be less than or equal to 30 days after the <code>StartDate</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"EndDate\"\
        }\
      },\
      \"documentation\":\"<p>A request to obtain deliverability metrics for a domain.</p>\"\
    },\
    \"GetDomainStatisticsReportResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"OverallVolume\",\
        \"DailyVolumes\"\
      ],\
      \"members\":{\
        \"OverallVolume\":{\
          \"shape\":\"OverallVolume\",\
          \"documentation\":\"<p>An object that contains deliverability metrics for the domain that you specified. The data in this object is a summary of all of the data that was collected from the <code>StartDate</code> to the <code>EndDate</code>.</p>\"\
        },\
        \"DailyVolumes\":{\
          \"shape\":\"DailyVolumes\",\
          \"documentation\":\"<p>An object that contains deliverability metrics for the domain that you specified. This object contains data for each day, starting on the <code>StartDate</code> and ending on the <code>EndDate</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that includes statistics that are related to the domain that you specified.</p>\"\
    },\
    \"GetEmailIdentityRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EmailIdentity\"],\
      \"members\":{\
        \"EmailIdentity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The email identity that you want to retrieve details for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EmailIdentity\"\
        }\
      },\
      \"documentation\":\"<p>A request to return details about an email identity.</p>\"\
    },\
    \"GetEmailIdentityResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityType\":{\
          \"shape\":\"IdentityType\",\
          \"documentation\":\"<p>The email identity type.</p>\"\
        },\
        \"FeedbackForwardingStatus\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>The feedback forwarding configuration for the identity.</p> <p>If the value is <code>true</code>, you receive email notifications when bounce or complaint events occur. These notifications are sent to the address that you specified in the <code>Return-Path</code> header of the original email.</p> <p>You're required to have a method of tracking bounces and complaints. If you haven't set up another mechanism for receiving bounce or complaint notifications (for example, by setting up an event destination), you receive an email notification when these events occur (even if this setting is disabled).</p>\"\
        },\
        \"VerifiedForSendingStatus\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Specifies whether or not the identity is verified. You can only send email from verified email addresses or domains. For more information about verifying identities, see the <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-email-manage-verify.html\\\">Amazon Pinpoint User Guide</a>.</p>\"\
        },\
        \"DkimAttributes\":{\
          \"shape\":\"DkimAttributes\",\
          \"documentation\":\"<p>An object that contains information about the DKIM attributes for the identity.</p>\"\
        },\
        \"MailFromAttributes\":{\
          \"shape\":\"MailFromAttributes\",\
          \"documentation\":\"<p>An object that contains information about the Mail-From attributes for the email identity.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of objects that define the tags (keys and values) that are associated with the email identity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about an email identity.</p>\"\
    },\
    \"GetSuppressedDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EmailAddress\"],\
      \"members\":{\
        \"EmailAddress\":{\
          \"shape\":\"EmailAddress\",\
          \"documentation\":\"<p>The email address that's on the account suppression list.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EmailAddress\"\
        }\
      },\
      \"documentation\":\"<p>A request to retrieve information about an email address that's on the suppression list for your account.</p>\"\
    },\
    \"GetSuppressedDestinationResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"SuppressedDestination\"],\
      \"members\":{\
        \"SuppressedDestination\":{\
          \"shape\":\"SuppressedDestination\",\
          \"documentation\":\"<p>An object containing information about the suppressed email address.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the suppressed email address.</p>\"\
    },\
    \"Identity\":{\"type\":\"string\"},\
    \"IdentityInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IdentityType\":{\
          \"shape\":\"IdentityType\",\
          \"documentation\":\"<p>The email identity type. The identity type can be one of the following:</p> <ul> <li> <p> <code>EMAIL_ADDRESS</code> â The identity is an email address.</p> </li> <li> <p> <code>DOMAIN</code> â The identity is a domain.</p> </li> <li> <p> <code>MANAGED_DOMAIN</code> â The identity is a domain that is managed by AWS.</p> </li> </ul>\"\
        },\
        \"IdentityName\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The address or domain of the identity.</p>\"\
        },\
        \"SendingEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Indicates whether or not you can send email from the identity.</p> <p>An <i>identity</i> is an email address or domain that you send email from. Before you can send email from an identity, you have to demostrate that you own the identity, and that you authorize Amazon SES to send email from that identity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an email identity.</p>\"\
    },\
    \"IdentityInfoList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IdentityInfo\"}\
    },\
    \"IdentityType\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The email identity type. The identity type can be one of the following:</p> <ul> <li> <p> <code>EMAIL_ADDRESS</code> â The identity is an email address.</p> </li> <li> <p> <code>DOMAIN</code> â The identity is a domain.</p> </li> </ul>\",\
      \"enum\":[\
        \"EMAIL_ADDRESS\",\
        \"DOMAIN\",\
        \"MANAGED_DOMAIN\"\
      ]\
    },\
    \"ImageUrl\":{\"type\":\"string\"},\
    \"InboxPlacementTrackingOption\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Global\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Specifies whether inbox placement data is being tracked for the domain.</p>\"\
        },\
        \"TrackedIsps\":{\
          \"shape\":\"IspNameList\",\
          \"documentation\":\"<p>An array of strings, one for each major email provider that the inbox placement data applies to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about the inbox placement data settings for a verified domain thatâs associated with your AWS account. This data is available only if you enabled the Deliverability dashboard for the domain.</p>\"\
    },\
    \"InvalidNextTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified request includes an invalid or expired token.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"Ip\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>An IPv4 address.</p>\"\
    },\
    \"IpList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Ip\"}\
    },\
    \"IspName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The name of an email provider.</p>\"\
    },\
    \"IspNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IspName\"}\
    },\
    \"IspPlacement\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IspName\":{\
          \"shape\":\"IspName\",\
          \"documentation\":\"<p>The name of the email provider that the inbox placement data applies to.</p>\"\
        },\
        \"PlacementStatistics\":{\
          \"shape\":\"PlacementStatistics\",\
          \"documentation\":\"<p>An object that contains inbox placement metrics for a specific email provider.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that describes how email sent during the predictive inbox placement test was handled by a certain email provider.</p>\"\
    },\
    \"IspPlacements\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IspPlacement\"}\
    },\
    \"KinesisFirehoseDestination\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IamRoleArn\",\
        \"DeliveryStreamArn\"\
      ],\
      \"members\":{\
        \"IamRoleArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that the Amazon SES API v2 uses to send email events to the Amazon Kinesis Data Firehose stream.</p>\"\
        },\
        \"DeliveryStreamArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Kinesis Data Firehose stream that the Amazon SES API v2 sends email events to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that defines an Amazon Kinesis Data Firehose destination for email events. You can use Amazon Kinesis Data Firehose to stream data to other services, such as Amazon S3 and Amazon Redshift.</p>\"\
    },\
    \"LastFreshStart\":{\
      \"type\":\"timestamp\",\
      \"documentation\":\"<p>The date and time (in Unix time) when the reputation metrics were last given a fresh start. When your account is given a fresh start, your reputation metrics are calculated starting from the date of the fresh start.</p>\"\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>There are too many instances of the specified resource type.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ListConfigurationSetsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token returned from a previous call to <code>ListConfigurationSets</code> to indicate the position in the list of configuration sets.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        },\
        \"PageSize\":{\
          \"shape\":\"MaxItems\",\
          \"documentation\":\"<p>The number of results to show in a single call to <code>ListConfigurationSets</code>. If the number of results is larger than the number you specified in this parameter, then the response includes a <code>NextToken</code> element, which you can use to obtain additional results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"PageSize\"\
        }\
      },\
      \"documentation\":\"<p>A request to obtain a list of configuration sets for your Amazon SES account in the current AWS Region.</p>\"\
    },\
    \"ListConfigurationSetsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConfigurationSets\":{\
          \"shape\":\"ConfigurationSetNameList\",\
          \"documentation\":\"<p>An array that contains all of the configuration sets in your Amazon SES account in the current AWS Region.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that indicates that there are additional configuration sets to list. To view additional configuration sets, issue another request to <code>ListConfigurationSets</code>, and pass this token in the <code>NextToken</code> parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of configuration sets in your Amazon SES account in the current AWS Region.</p>\"\
    },\
    \"ListDedicatedIpPoolsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token returned from a previous call to <code>ListDedicatedIpPools</code> to indicate the position in the list of dedicated IP pools.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        },\
        \"PageSize\":{\
          \"shape\":\"MaxItems\",\
          \"documentation\":\"<p>The number of results to show in a single call to <code>ListDedicatedIpPools</code>. If the number of results is larger than the number you specified in this parameter, then the response includes a <code>NextToken</code> element, which you can use to obtain additional results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"PageSize\"\
        }\
      },\
      \"documentation\":\"<p>A request to obtain a list of dedicated IP pools.</p>\"\
    },\
    \"ListDedicatedIpPoolsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DedicatedIpPools\":{\
          \"shape\":\"ListOfDedicatedIpPools\",\
          \"documentation\":\"<p>A list of all of the dedicated IP pools that are associated with your AWS account in the current Region.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that indicates that there are additional IP pools to list. To view additional IP pools, issue another request to <code>ListDedicatedIpPools</code>, passing this token in the <code>NextToken</code> parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of dedicated IP pools.</p>\"\
    },\
    \"ListDeliverabilityTestReportsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token returned from a previous call to <code>ListDeliverabilityTestReports</code> to indicate the position in the list of predictive inbox placement tests.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        },\
        \"PageSize\":{\
          \"shape\":\"MaxItems\",\
          \"documentation\":\"<p>The number of results to show in a single call to <code>ListDeliverabilityTestReports</code>. If the number of results is larger than the number you specified in this parameter, then the response includes a <code>NextToken</code> element, which you can use to obtain additional results.</p> <p>The value you specify has to be at least 0, and can be no more than 1000.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"PageSize\"\
        }\
      },\
      \"documentation\":\"<p>A request to list all of the predictive inbox placement tests that you've performed.</p>\"\
    },\
    \"ListDeliverabilityTestReportsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeliverabilityTestReports\"],\
      \"members\":{\
        \"DeliverabilityTestReports\":{\
          \"shape\":\"DeliverabilityTestReports\",\
          \"documentation\":\"<p>An object that contains a lists of predictive inbox placement tests that you've performed.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that indicates that there are additional predictive inbox placement tests to list. To view additional predictive inbox placement tests, issue another request to <code>ListDeliverabilityTestReports</code>, and pass this token in the <code>NextToken</code> parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of the predictive inbox placement test reports that are available for your account, regardless of whether or not those tests are complete.</p>\"\
    },\
    \"ListDomainDeliverabilityCampaignsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StartDate\",\
        \"EndDate\",\
        \"SubscribedDomain\"\
      ],\
      \"members\":{\
        \"StartDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The first day, in Unix time format, that you want to obtain deliverability data for.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"StartDate\"\
        },\
        \"EndDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last day, in Unix time format, that you want to obtain deliverability data for. This value has to be less than or equal to 30 days after the value of the <code>StartDate</code> parameter.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"EndDate\"\
        },\
        \"SubscribedDomain\":{\
          \"shape\":\"Domain\",\
          \"documentation\":\"<p>The domain to obtain deliverability data for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"SubscribedDomain\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token thatâs returned from a previous call to the <code>ListDomainDeliverabilityCampaigns</code> operation. This token indicates the position of a campaign in the list of campaigns.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        },\
        \"PageSize\":{\
          \"shape\":\"MaxItems\",\
          \"documentation\":\"<p>The maximum number of results to include in response to a single call to the <code>ListDomainDeliverabilityCampaigns</code> operation. If the number of results is larger than the number that you specify in this parameter, the response includes a <code>NextToken</code> element, which you can use to obtain additional results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"PageSize\"\
        }\
      },\
      \"documentation\":\"<p>Retrieve deliverability data for all the campaigns that used a specific domain to send email during a specified time range. This data is available for a domain only if you enabled the Deliverability dashboard.</p>\"\
    },\
    \"ListDomainDeliverabilityCampaignsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainDeliverabilityCampaigns\"],\
      \"members\":{\
        \"DomainDeliverabilityCampaigns\":{\
          \"shape\":\"DomainDeliverabilityCampaignList\",\
          \"documentation\":\"<p>An array of responses, one for each campaign that used the domain to send email during the specified time range.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token thatâs returned from a previous call to the <code>ListDomainDeliverabilityCampaigns</code> operation. This token indicates the position of the campaign in the list of campaigns.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An array of objects that provide deliverability data for all the campaigns that used a specific domain to send email during a specified time range. This data is available for a domain only if you enabled the Deliverability dashboard for the domain.</p>\"\
    },\
    \"ListEmailIdentitiesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token returned from a previous call to <code>ListEmailIdentities</code> to indicate the position in the list of identities.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        },\
        \"PageSize\":{\
          \"shape\":\"MaxItems\",\
          \"documentation\":\"<p>The number of results to show in a single call to <code>ListEmailIdentities</code>. If the number of results is larger than the number you specified in this parameter, then the response includes a <code>NextToken</code> element, which you can use to obtain additional results.</p> <p>The value you specify has to be at least 0, and can be no more than 1000.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"PageSize\"\
        }\
      },\
      \"documentation\":\"<p>A request to list all of the email identities associated with your AWS account. This list includes identities that you've already verified, identities that are unverified, and identities that were verified in the past, but are no longer verified.</p>\"\
    },\
    \"ListEmailIdentitiesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EmailIdentities\":{\
          \"shape\":\"IdentityInfoList\",\
          \"documentation\":\"<p>An array that includes all of the email identities associated with your AWS account.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that indicates that there are additional configuration sets to list. To view additional configuration sets, issue another request to <code>ListEmailIdentities</code>, and pass this token in the <code>NextToken</code> parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of all of the identities that you've attempted to verify, regardless of whether or not those identities were successfully verified.</p>\"\
    },\
    \"ListOfDedicatedIpPools\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PoolName\"},\
      \"documentation\":\"<p>A list of dedicated IP pools that are associated with your AWS account.</p>\"\
    },\
    \"ListSuppressedDestinationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Reasons\":{\
          \"shape\":\"SuppressionListReasons\",\
          \"documentation\":\"<p>The factors that caused the email address to be added to .</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Reason\"\
        },\
        \"StartDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Used to filter the list of suppressed email destinations so that it only includes addresses that were added to the list after a specific date. The date that you specify should be in Unix time format.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"StartDate\"\
        },\
        \"EndDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Used to filter the list of suppressed email destinations so that it only includes addresses that were added to the list before a specific date. The date that you specify should be in Unix time format.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"EndDate\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token returned from a previous call to <code>ListSuppressedDestinations</code> to indicate the position in the list of suppressed email addresses.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        },\
        \"PageSize\":{\
          \"shape\":\"MaxItems\",\
          \"documentation\":\"<p>The number of results to show in a single call to <code>ListSuppressedDestinations</code>. If the number of results is larger than the number you specified in this parameter, then the response includes a <code>NextToken</code> element, which you can use to obtain additional results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"PageSize\"\
        }\
      },\
      \"documentation\":\"<p>A request to obtain a list of email destinations that are on the suppression list for your account.</p>\"\
    },\
    \"ListSuppressedDestinationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SuppressedDestinationSummaries\":{\
          \"shape\":\"SuppressedDestinationSummaries\",\
          \"documentation\":\"<p>A list of summaries, each containing a summary for a suppressed email destination.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that indicates that there are additional email addresses on the suppression list for your account. To view additional suppressed addresses, issue another request to <code>ListSuppressedDestinations</code>, and pass this token in the <code>NextToken</code> parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of suppressed email addresses.</p>\"\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource that you want to retrieve tag information for.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"ResourceArn\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Tags\"],\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array that lists all the tags that are associated with the resource. Each tag consists of a required tag key (<code>Key</code>) and an associated tag value (<code>Value</code>)</p>\"\
        }\
      }\
    },\
    \"MailFromAttributes\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MailFromDomain\",\
        \"MailFromDomainStatus\",\
        \"BehaviorOnMxFailure\"\
      ],\
      \"members\":{\
        \"MailFromDomain\":{\
          \"shape\":\"MailFromDomainName\",\
          \"documentation\":\"<p>The name of a domain that an email identity uses as a custom MAIL FROM domain.</p>\"\
        },\
        \"MailFromDomainStatus\":{\
          \"shape\":\"MailFromDomainStatus\",\
          \"documentation\":\"<p>The status of the MAIL FROM domain. This status can have the following values:</p> <ul> <li> <p> <code>PENDING</code> â Amazon SES hasn't started searching for the MX record yet.</p> </li> <li> <p> <code>SUCCESS</code> â Amazon SES detected the required MX record for the MAIL FROM domain.</p> </li> <li> <p> <code>FAILED</code> â Amazon SES can't find the required MX record, or the record no longer exists.</p> </li> <li> <p> <code>TEMPORARY_FAILURE</code> â A temporary issue occurred, which prevented Amazon SES from determining the status of the MAIL FROM domain.</p> </li> </ul>\"\
        },\
        \"BehaviorOnMxFailure\":{\
          \"shape\":\"BehaviorOnMxFailure\",\
          \"documentation\":\"<p>The action that you want to take if the required MX record can't be found when you send an email. When you set this value to <code>UseDefaultValue</code>, the mail is sent using <i>amazonses.com</i> as the MAIL FROM domain. When you set this value to <code>RejectMessage</code>, the Amazon SES API v2 returns a <code>MailFromDomainNotVerified</code> error, and doesn't attempt to deliver the email.</p> <p>These behaviors are taken when the custom MAIL FROM domain configuration is in the <code>Pending</code>, <code>Failed</code>, and <code>TemporaryFailure</code> states.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of attributes that are associated with a MAIL FROM domain.</p>\"\
    },\
    \"MailFromDomainName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The domain that you want to use as a MAIL FROM domain.</p>\"\
    },\
    \"MailFromDomainNotVerifiedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The message can't be sent because the sending domain isn't verified.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"MailFromDomainStatus\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The status of the MAIL FROM domain. This status can have the following values:</p> <ul> <li> <p> <code>PENDING</code> â Amazon SES hasn't started searching for the MX record yet.</p> </li> <li> <p> <code>SUCCESS</code> â Amazon SES detected the required MX record for the MAIL FROM domain.</p> </li> <li> <p> <code>FAILED</code> â Amazon SES can't find the required MX record, or the record no longer exists.</p> </li> <li> <p> <code>TEMPORARY_FAILURE</code> â A temporary issue occurred, which prevented Amazon SES from determining the status of the MAIL FROM domain.</p> </li> </ul>\",\
      \"enum\":[\
        \"PENDING\",\
        \"SUCCESS\",\
        \"FAILED\",\
        \"TEMPORARY_FAILURE\"\
      ]\
    },\
    \"Max24HourSend\":{\"type\":\"double\"},\
    \"MaxItems\":{\"type\":\"integer\"},\
    \"MaxSendRate\":{\"type\":\"double\"},\
    \"Message\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Subject\",\
        \"Body\"\
      ],\
      \"members\":{\
        \"Subject\":{\
          \"shape\":\"Content\",\
          \"documentation\":\"<p>The subject line of the email. The subject line can only contain 7-bit ASCII characters. However, you can specify non-ASCII characters in the subject line by using encoded-word syntax, as described in <a href=\\\"https://tools.ietf.org/html/rfc2047\\\">RFC 2047</a>.</p>\"\
        },\
        \"Body\":{\
          \"shape\":\"Body\",\
          \"documentation\":\"<p>The body of the message. You can specify an HTML version of the message, a text-only version of the message, or both.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the email message that you're sending. The <code>Message</code> object consists of a subject line and a message body.</p>\"\
    },\
    \"MessageContent\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The body of an email message.</p>\"\
    },\
    \"MessageData\":{\"type\":\"string\"},\
    \"MessageRejected\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The message can't be sent because it contains invalid content.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"MessageTag\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"MessageTagName\",\
          \"documentation\":\"<p>The name of the message tag. The message tag name has to meet the following criteria:</p> <ul> <li> <p>It can only contain ASCII letters (aâz, AâZ), numbers (0â9), underscores (_), or dashes (-).</p> </li> <li> <p>It can contain no more than 256 characters.</p> </li> </ul>\"\
        },\
        \"Value\":{\
          \"shape\":\"MessageTagValue\",\
          \"documentation\":\"<p>The value of the message tag. The message tag value has to meet the following criteria:</p> <ul> <li> <p>It can only contain ASCII letters (aâz, AâZ), numbers (0â9), underscores (_), or dashes (-).</p> </li> <li> <p>It can contain no more than 256 characters.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the name and value of a tag that you apply to an email. You can use message tags when you publish email sending events. </p>\"\
    },\
    \"MessageTagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MessageTag\"},\
      \"documentation\":\"<p>A list of message tags.</p>\"\
    },\
    \"MessageTagName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The name of the message tag. The message tag name has to meet the following criteria:</p> <ul> <li> <p>It can only contain ASCII letters (aâz, AâZ), numbers (0â9), underscores (_), or dashes (-).</p> </li> <li> <p>It can contain no more than 256 characters.</p> </li> </ul>\"\
    },\
    \"MessageTagValue\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The value of the message tag. The message tag value has to meet the following criteria:</p> <ul> <li> <p>It can only contain ASCII letters (aâz, AâZ), numbers (0â9), underscores (_), or dashes (-).</p> </li> <li> <p>It can contain no more than 256 characters.</p> </li> </ul>\"\
    },\
    \"NextToken\":{\"type\":\"string\"},\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The resource you attempted to access doesn't exist.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"OutboundMessageId\":{\"type\":\"string\"},\
    \"OverallVolume\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VolumeStatistics\":{\
          \"shape\":\"VolumeStatistics\",\
          \"documentation\":\"<p>An object that contains information about the numbers of messages that arrived in recipients' inboxes and junk mail folders.</p>\"\
        },\
        \"ReadRatePercent\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of emails that were sent from the domain that were read by their recipients.</p>\"\
        },\
        \"DomainIspPlacements\":{\
          \"shape\":\"DomainIspPlacements\",\
          \"documentation\":\"<p>An object that contains inbox and junk mail placement metrics for individual email providers.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about email that was sent from the selected domain.</p>\"\
    },\
    \"Percentage\":{\
      \"type\":\"double\",\
      \"documentation\":\"<p>An object that contains information about inbox placement percentages.</p>\"\
    },\
    \"Percentage100Wrapper\":{\"type\":\"integer\"},\
    \"PinpointDestination\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ApplicationArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Pinpoint project that you want to send email events to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that defines an Amazon Pinpoint project destination for email events. You can send email event data to a Amazon Pinpoint project to view metrics using the Transactional Messaging dashboards that are built in to Amazon Pinpoint. For more information, see <a href=\\\"https://docs.aws.amazon.com/pinpoint/latest/userguide/analytics-transactional-messages.html\\\">Transactional Messaging Charts</a> in the <i>Amazon Pinpoint User Guide</i>.</p>\"\
    },\
    \"PlacementStatistics\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InboxPercentage\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of emails that arrived in recipients' inboxes during the predictive inbox placement test.</p>\"\
        },\
        \"SpamPercentage\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of emails that arrived in recipients' spam or junk mail folders during the predictive inbox placement test.</p>\"\
        },\
        \"MissingPercentage\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of emails that didn't arrive in recipients' inboxes at all during the predictive inbox placement test.</p>\"\
        },\
        \"SpfPercentage\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of emails that were authenticated by using Sender Policy Framework (SPF) during the predictive inbox placement test.</p>\"\
        },\
        \"DkimPercentage\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of emails that were authenticated by using DomainKeys Identified Mail (DKIM) during the predictive inbox placement test.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains inbox placement data for an email provider.</p>\"\
    },\
    \"PoolName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The name of a dedicated IP pool.</p>\"\
    },\
    \"PrivateKey\":{\
      \"type\":\"string\",\
      \"max\":20480,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9+\\\\/]+={0,2}$\",\
      \"sensitive\":true\
    },\
    \"PutAccountDedicatedIpWarmupAttributesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AutoWarmupEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Enables or disables the automatic warm-up feature for dedicated IP addresses that are associated with your Amazon SES account in the current AWS Region. Set to <code>true</code> to enable the automatic warm-up feature, or set to <code>false</code> to disable it.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to enable or disable the automatic IP address warm-up feature.</p>\"\
    },\
    \"PutAccountDedicatedIpWarmupAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"PutAccountSendingAttributesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SendingEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Enables or disables your account's ability to send email. Set to <code>true</code> to enable email sending, or set to <code>false</code> to disable email sending.</p> <note> <p>If AWS paused your account's ability to send email, you can't use this operation to resume your account's ability to send email.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>A request to change the ability of your account to send email.</p>\"\
    },\
    \"PutAccountSendingAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"PutAccountSuppressionAttributesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SuppressedReasons\":{\
          \"shape\":\"SuppressionListReasons\",\
          \"documentation\":\"<p>A list that contains the reasons that email addresses will be automatically added to the suppression list for your account. This list can contain any or all of the following:</p> <ul> <li> <p> <code>COMPLAINT</code> â Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a complaint.</p> </li> <li> <p> <code>BOUNCE</code> â Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a hard bounce.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>A request to change your account's suppression preferences.</p>\"\
    },\
    \"PutAccountSuppressionAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"PutConfigurationSetDeliveryOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConfigurationSetName\"],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that you want to associate with a dedicated IP pool.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationSetName\"\
        },\
        \"TlsPolicy\":{\
          \"shape\":\"TlsPolicy\",\
          \"documentation\":\"<p>Specifies whether messages that use the configuration set are required to use Transport Layer Security (TLS). If the value is <code>Require</code>, messages are only delivered if a TLS connection can be established. If the value is <code>Optional</code>, messages can be delivered in plain text if a TLS connection can't be established.</p>\"\
        },\
        \"SendingPoolName\":{\
          \"shape\":\"SendingPoolName\",\
          \"documentation\":\"<p>The name of the dedicated IP pool that you want to associate with the configuration set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to associate a configuration set with a dedicated IP pool.</p>\"\
    },\
    \"PutConfigurationSetDeliveryOptionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"PutConfigurationSetReputationOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConfigurationSetName\"],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that you want to enable or disable reputation metric tracking for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationSetName\"\
        },\
        \"ReputationMetricsEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>If <code>true</code>, tracking of reputation metrics is enabled for the configuration set. If <code>false</code>, tracking of reputation metrics is disabled for the configuration set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to enable or disable tracking of reputation metrics for a configuration set.</p>\"\
    },\
    \"PutConfigurationSetReputationOptionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"PutConfigurationSetSendingOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConfigurationSetName\"],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that you want to enable or disable email sending for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationSetName\"\
        },\
        \"SendingEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>If <code>true</code>, email sending is enabled for the configuration set. If <code>false</code>, email sending is disabled for the configuration set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to enable or disable the ability of Amazon SES to send emails that use a specific configuration set.</p>\"\
    },\
    \"PutConfigurationSetSendingOptionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"PutConfigurationSetSuppressionOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConfigurationSetName\"],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that you want to change the suppression list preferences for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationSetName\"\
        },\
        \"SuppressedReasons\":{\
          \"shape\":\"SuppressionListReasons\",\
          \"documentation\":\"<p>A list that contains the reasons that email addresses are automatically added to the suppression list for your account. This list can contain any or all of the following:</p> <ul> <li> <p> <code>COMPLAINT</code> â Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a complaint.</p> </li> <li> <p> <code>BOUNCE</code> â Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a hard bounce.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>A request to change the account suppression list preferences for a specific configuration set.</p>\"\
    },\
    \"PutConfigurationSetSuppressionOptionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"PutConfigurationSetTrackingOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConfigurationSetName\"],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that you want to add a custom tracking domain to.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationSetName\"\
        },\
        \"CustomRedirectDomain\":{\
          \"shape\":\"CustomRedirectDomain\",\
          \"documentation\":\"<p>The domain that you want to use to track open and click events.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to add a custom domain for tracking open and click events to a configuration set.</p>\"\
    },\
    \"PutConfigurationSetTrackingOptionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"PutDedicatedIpInPoolRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Ip\",\
        \"DestinationPoolName\"\
      ],\
      \"members\":{\
        \"Ip\":{\
          \"shape\":\"Ip\",\
          \"documentation\":\"<p>The IP address that you want to move to the dedicated IP pool. The value you specify has to be a dedicated IP address that's associated with your AWS account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IP\"\
        },\
        \"DestinationPoolName\":{\
          \"shape\":\"PoolName\",\
          \"documentation\":\"<p>The name of the IP pool that you want to add the dedicated IP address to. You have to specify an IP pool that already exists.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to move a dedicated IP address to a dedicated IP pool.</p>\"\
    },\
    \"PutDedicatedIpInPoolResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"PutDedicatedIpWarmupAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Ip\",\
        \"WarmupPercentage\"\
      ],\
      \"members\":{\
        \"Ip\":{\
          \"shape\":\"Ip\",\
          \"documentation\":\"<p>The dedicated IP address that you want to update the warm-up attributes for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IP\"\
        },\
        \"WarmupPercentage\":{\
          \"shape\":\"Percentage100Wrapper\",\
          \"documentation\":\"<p>The warm-up percentage that you want to associate with the dedicated IP address.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to change the warm-up attributes for a dedicated IP address. This operation is useful when you want to resume the warm-up process for an existing IP address.</p>\"\
    },\
    \"PutDedicatedIpWarmupAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"PutDeliverabilityDashboardOptionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DashboardEnabled\"],\
      \"members\":{\
        \"DashboardEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Specifies whether to enable the Deliverability dashboard. To enable the dashboard, set this value to <code>true</code>.</p>\"\
        },\
        \"SubscribedDomains\":{\
          \"shape\":\"DomainDeliverabilityTrackingOptions\",\
          \"documentation\":\"<p>An array of objects, one for each verified domain that you use to send email and enabled the Deliverability dashboard for.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Enable or disable the Deliverability dashboard. When you enable the Deliverability dashboard, you gain access to reputation, deliverability, and other metrics for the domains that you use to send email using Amazon SES API v2. You also gain the ability to perform predictive inbox placement tests.</p> <p>When you use the Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that you accrue by using Amazon SES and other AWS services. For more information about the features and cost of a Deliverability dashboard subscription, see <a href=\\\"http://aws.amazon.com/pinpoint/pricing/\\\">Amazon Pinpoint Pricing</a>.</p>\"\
    },\
    \"PutDeliverabilityDashboardOptionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A response that indicates whether the Deliverability dashboard is enabled.</p>\"\
    },\
    \"PutEmailIdentityDkimAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EmailIdentity\"],\
      \"members\":{\
        \"EmailIdentity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The email identity that you want to change the DKIM settings for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EmailIdentity\"\
        },\
        \"SigningEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Sets the DKIM signing configuration for the identity.</p> <p>When you set this value <code>true</code>, then the messages that are sent from the identity are signed using DKIM. If you set this value to <code>false</code>, your messages are sent without DKIM signing.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to enable or disable DKIM signing of email that you send from an email identity.</p>\"\
    },\
    \"PutEmailIdentityDkimAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"PutEmailIdentityDkimSigningAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EmailIdentity\",\
        \"SigningAttributesOrigin\"\
      ],\
      \"members\":{\
        \"EmailIdentity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The email identity that you want to configure DKIM for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EmailIdentity\"\
        },\
        \"SigningAttributesOrigin\":{\
          \"shape\":\"DkimSigningAttributesOrigin\",\
          \"documentation\":\"<p>The method that you want to use to configure DKIM for the identity. There are two possible values:</p> <ul> <li> <p> <code>AWS_SES</code> â Configure DKIM for the identity by using <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Easy DKIM</a>.</p> </li> <li> <p> <code>EXTERNAL</code> â Configure DKIM for the identity by using Bring Your Own DKIM (BYODKIM).</p> </li> </ul>\"\
        },\
        \"SigningAttributes\":{\
          \"shape\":\"DkimSigningAttributes\",\
          \"documentation\":\"<p>An object that contains information about the private key and selector that you want to use to configure DKIM for the identity. This object is only required if you want to configure Bring Your Own DKIM (BYODKIM) for the identity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to change the DKIM attributes for an email identity.</p>\"\
    },\
    \"PutEmailIdentityDkimSigningAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DkimStatus\":{\
          \"shape\":\"DkimStatus\",\
          \"documentation\":\"<p>The DKIM authentication status of the identity. Amazon SES determines the authentication status by searching for specific records in the DNS configuration for your domain. If you used <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Easy DKIM</a> to set up DKIM authentication, Amazon SES tries to find three unique CNAME records in the DNS configuration for your domain.</p> <p>If you provided a public key to perform DKIM authentication, Amazon SES tries to find a TXT record that uses the selector that you specified. The value of the TXT record must be a public key that's paired with the private key that you specified in the process of creating the identity.</p> <p>The status can be one of the following:</p> <ul> <li> <p> <code>PENDING</code> â The verification process was initiated, but Amazon SES hasn't yet detected the DKIM records in the DNS configuration for the domain.</p> </li> <li> <p> <code>SUCCESS</code> â The verification process completed successfully.</p> </li> <li> <p> <code>FAILED</code> â The verification process failed. This typically occurs when Amazon SES fails to find the DKIM records in the DNS configuration of the domain.</p> </li> <li> <p> <code>TEMPORARY_FAILURE</code> â A temporary issue is preventing Amazon SES from determining the DKIM authentication status of the domain.</p> </li> <li> <p> <code>NOT_STARTED</code> â The DKIM verification process hasn't been initiated for the domain.</p> </li> </ul>\"\
        },\
        \"DkimTokens\":{\
          \"shape\":\"DnsTokenList\",\
          \"documentation\":\"<p>If you used <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/easy-dkim.html\\\">Easy DKIM</a> to configure DKIM authentication for the domain, then this object contains a set of unique strings that you use to create a set of CNAME records that you add to the DNS configuration for your domain. When Amazon SES detects these records in the DNS configuration for your domain, the DKIM authentication process is complete.</p> <p>If you configured DKIM authentication for the domain by providing your own public-private key pair, then this object contains the selector that's associated with your public key.</p> <p>Regardless of the DKIM authentication method you use, Amazon SES searches for the appropriate records in the DNS configuration of the domain for up to 72 hours.</p>\"\
        }\
      },\
      \"documentation\":\"<p>If the action is successful, the service sends back an HTTP 200 response.</p> <p>The following data is returned in JSON format by the service.</p>\"\
    },\
    \"PutEmailIdentityFeedbackAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EmailIdentity\"],\
      \"members\":{\
        \"EmailIdentity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The email identity that you want to configure bounce and complaint feedback forwarding for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EmailIdentity\"\
        },\
        \"EmailForwardingEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Sets the feedback forwarding configuration for the identity.</p> <p>If the value is <code>true</code>, you receive email notifications when bounce or complaint events occur. These notifications are sent to the address that you specified in the <code>Return-Path</code> header of the original email.</p> <p>You're required to have a method of tracking bounces and complaints. If you haven't set up another mechanism for receiving bounce or complaint notifications (for example, by setting up an event destination), you receive an email notification when these events occur (even if this setting is disabled).</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to set the attributes that control how bounce and complaint events are processed.</p>\"\
    },\
    \"PutEmailIdentityFeedbackAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"PutEmailIdentityMailFromAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EmailIdentity\"],\
      \"members\":{\
        \"EmailIdentity\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The verified email identity that you want to set up the custom MAIL FROM domain for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EmailIdentity\"\
        },\
        \"MailFromDomain\":{\
          \"shape\":\"MailFromDomainName\",\
          \"documentation\":\"<p> The custom MAIL FROM domain that you want the verified identity to use. The MAIL FROM domain must meet the following criteria:</p> <ul> <li> <p>It has to be a subdomain of the verified identity.</p> </li> <li> <p>It can't be used to receive email.</p> </li> <li> <p>It can't be used in a \\\"From\\\" address if the MAIL FROM domain is a destination for feedback forwarding emails.</p> </li> </ul>\"\
        },\
        \"BehaviorOnMxFailure\":{\
          \"shape\":\"BehaviorOnMxFailure\",\
          \"documentation\":\"<p>The action that you want to take if the required MX record isn't found when you send an email. When you set this value to <code>UseDefaultValue</code>, the mail is sent using <i>amazonses.com</i> as the MAIL FROM domain. When you set this value to <code>RejectMessage</code>, the Amazon SES API v2 returns a <code>MailFromDomainNotVerified</code> error, and doesn't attempt to deliver the email.</p> <p>These behaviors are taken when the custom MAIL FROM domain configuration is in the <code>Pending</code>, <code>Failed</code>, and <code>TemporaryFailure</code> states.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to configure the custom MAIL FROM domain for a verified identity.</p>\"\
    },\
    \"PutEmailIdentityMailFromAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"PutSuppressedDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EmailAddress\",\
        \"Reason\"\
      ],\
      \"members\":{\
        \"EmailAddress\":{\
          \"shape\":\"EmailAddress\",\
          \"documentation\":\"<p>The email address that should be added to the suppression list for your account.</p>\"\
        },\
        \"Reason\":{\
          \"shape\":\"SuppressionListReason\",\
          \"documentation\":\"<p>The factors that should cause the email address to be added to the suppression list for your account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to add an email destination to the suppression list for your account.</p>\"\
    },\
    \"PutSuppressedDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"RawMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\"Data\"],\
      \"members\":{\
        \"Data\":{\
          \"shape\":\"RawMessageData\",\
          \"documentation\":\"<p>The raw email message. The message has to meet the following criteria:</p> <ul> <li> <p>The message has to contain a header and a body, separated by one blank line.</p> </li> <li> <p>All of the required header fields must be present in the message.</p> </li> <li> <p>Each part of a multipart MIME message must be formatted properly.</p> </li> <li> <p>Attachments must be in a file format that the Amazon SES supports.</p> </li> <li> <p>The entire message must be Base64 encoded.</p> </li> <li> <p>If any of the MIME parts in your message contain content that is outside of the 7-bit ASCII character range, you should encode that content to ensure that recipients' email clients render the message properly.</p> </li> <li> <p>The length of any single line of text in the message can't exceed 1,000 characters. This restriction is defined in <a href=\\\"https://tools.ietf.org/html/rfc5321\\\">RFC 5321</a>.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the raw content of an email message.</p>\"\
    },\
    \"RawMessageData\":{\
      \"type\":\"blob\",\
      \"documentation\":\"<p>The raw email message. The message has to meet the following criteria:</p> <ul> <li> <p>The message has to contain a header and a body, separated by one blank line.</p> </li> <li> <p>All of the required header fields must be present in the message.</p> </li> <li> <p>Each part of a multipart MIME message must be formatted properly.</p> </li> <li> <p>Attachments must be in a file format that the Amazon SES API v2 supports. </p> </li> <li> <p>The entire message must be Base64 encoded.</p> </li> <li> <p>If any of the MIME parts in your message contain content that is outside of the 7-bit ASCII character range, you should encode that content to ensure that recipients' email clients render the message properly.</p> </li> <li> <p>The length of any single line of text in the message can't exceed 1,000 characters. This restriction is defined in <a href=\\\"https://tools.ietf.org/html/rfc5321\\\">RFC 5321</a>.</p> </li> </ul>\"\
    },\
    \"RblName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The name of a blacklist that an IP address was found on.</p>\"\
    },\
    \"ReportId\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>A unique string that identifies a Deliverability dashboard report.</p>\"\
    },\
    \"ReportName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>A name that helps you identify a report generated by the Deliverability dashboard.</p>\"\
    },\
    \"ReputationOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReputationMetricsEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>If <code>true</code>, tracking of reputation metrics is enabled for the configuration set. If <code>false</code>, tracking of reputation metrics is disabled for the configuration set.</p>\"\
        },\
        \"LastFreshStart\":{\
          \"shape\":\"LastFreshStart\",\
          \"documentation\":\"<p>The date and time (in Unix time) when the reputation metrics were last given a fresh start. When your account is given a fresh start, your reputation metrics are calculated starting from the date of the fresh start.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Enable or disable collection of reputation metrics for emails that you send using this configuration set in the current AWS Region. </p>\"\
    },\
    \"Selector\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\\\\-]*[a-zA-Z0-9]))$\"\
    },\
    \"SendEmailRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Destination\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"FromEmailAddress\":{\
          \"shape\":\"EmailAddress\",\
          \"documentation\":\"<p>The email address that you want to use as the \\\"From\\\" address for the email. The address that you specify has to be verified. </p>\"\
        },\
        \"Destination\":{\
          \"shape\":\"Destination\",\
          \"documentation\":\"<p>An object that contains the recipients of the email message.</p>\"\
        },\
        \"ReplyToAddresses\":{\
          \"shape\":\"EmailAddressList\",\
          \"documentation\":\"<p>The \\\"Reply-to\\\" email addresses for the message. When the recipient replies to the message, each Reply-to address receives the reply.</p>\"\
        },\
        \"FeedbackForwardingEmailAddress\":{\
          \"shape\":\"EmailAddress\",\
          \"documentation\":\"<p>The address that you want bounce and complaint notifications to be sent to.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"EmailContent\",\
          \"documentation\":\"<p>An object that contains the body of the message. You can send either a Simple message or a Raw message.</p>\"\
        },\
        \"EmailTags\":{\
          \"shape\":\"MessageTagList\",\
          \"documentation\":\"<p>A list of tags, in the form of name/value pairs, to apply to an email that you send using the <code>SendEmail</code> operation. Tags correspond to characteristics of the email that you define, so that you can publish email sending events. </p>\"\
        },\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that you want to use when sending the email.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to send an email message.</p>\"\
    },\
    \"SendEmailResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MessageId\":{\
          \"shape\":\"OutboundMessageId\",\
          \"documentation\":\"<p>A unique identifier for the message that is generated when the message is accepted.</p> <note> <p>It's possible for Amazon SES to accept a message without sending it. This can happen when the message that you're trying to send has an attachment contains a virus, or when you send a templated email that contains invalid personalization content, for example.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>A unique message ID that you receive when an email is accepted for sending.</p>\"\
    },\
    \"SendQuota\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Max24HourSend\":{\
          \"shape\":\"Max24HourSend\",\
          \"documentation\":\"<p>The maximum number of emails that you can send in the current AWS Region over a 24-hour period. This value is also called your <i>sending quota</i>.</p>\"\
        },\
        \"MaxSendRate\":{\
          \"shape\":\"MaxSendRate\",\
          \"documentation\":\"<p>The maximum number of emails that you can send per second in the current AWS Region. This value is also called your <i>maximum sending rate</i> or your <i>maximum TPS (transactions per second) rate</i>.</p>\"\
        },\
        \"SentLast24Hours\":{\
          \"shape\":\"SentLast24Hours\",\
          \"documentation\":\"<p>The number of emails sent from your Amazon SES account in the current AWS Region over the past 24 hours.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about the per-day and per-second sending limits for your Amazon SES account in the current AWS Region.</p>\"\
    },\
    \"SendingOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SendingEnabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>If <code>true</code>, email sending is enabled for the configuration set. If <code>false</code>, email sending is disabled for the configuration set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Used to enable or disable email sending for messages that use this configuration set in the current AWS Region.</p>\"\
    },\
    \"SendingPausedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The message can't be sent because the account's ability to send email is currently paused.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"SendingPoolName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The name of the dedicated IP pool that you want to associate with the configuration set.</p>\"\
    },\
    \"SentLast24Hours\":{\"type\":\"double\"},\
    \"SnsDestination\":{\
      \"type\":\"structure\",\
      \"required\":[\"TopicArn\"],\
      \"members\":{\
        \"TopicArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic that you want to publish email events to. For more information about Amazon SNS topics, see the <a href=\\\"https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html\\\">Amazon SNS Developer Guide</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that defines an Amazon SNS destination for email events. You can use Amazon SNS to send notification when certain email events occur.</p>\"\
    },\
    \"Subject\":{\"type\":\"string\"},\
    \"SuppressedDestination\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EmailAddress\",\
        \"Reason\",\
        \"LastUpdateTime\"\
      ],\
      \"members\":{\
        \"EmailAddress\":{\
          \"shape\":\"EmailAddress\",\
          \"documentation\":\"<p>The email address that is on the suppression list for your account.</p>\"\
        },\
        \"Reason\":{\
          \"shape\":\"SuppressionListReason\",\
          \"documentation\":\"<p>The reason that the address was added to the suppression list for your account.</p>\"\
        },\
        \"LastUpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time when the suppressed destination was last updated, shown in Unix time format.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"SuppressedDestinationAttributes\",\
          \"documentation\":\"<p>An optional value that can contain additional information about the reasons that the address was added to the suppression list for your account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about an email address that is on the suppression list for your account.</p>\"\
    },\
    \"SuppressedDestinationAttributes\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MessageId\":{\
          \"shape\":\"OutboundMessageId\",\
          \"documentation\":\"<p>The unique identifier of the email message that caused the email address to be added to the suppression list for your account.</p>\"\
        },\
        \"FeedbackId\":{\
          \"shape\":\"FeedbackId\",\
          \"documentation\":\"<p>A unique identifier that's generated when an email address is added to the suppression list for your account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains additional attributes that are related an email address that is on the suppression list for your account.</p>\"\
    },\
    \"SuppressedDestinationSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SuppressedDestinationSummary\"}\
    },\
    \"SuppressedDestinationSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EmailAddress\",\
        \"Reason\",\
        \"LastUpdateTime\"\
      ],\
      \"members\":{\
        \"EmailAddress\":{\
          \"shape\":\"EmailAddress\",\
          \"documentation\":\"<p>The email address that's on the suppression list for your account.</p>\"\
        },\
        \"Reason\":{\
          \"shape\":\"SuppressionListReason\",\
          \"documentation\":\"<p>The reason that the address was added to the suppression list for your account.</p>\"\
        },\
        \"LastUpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time when the suppressed destination was last updated, shown in Unix time format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A summary that describes the suppressed email address.</p>\"\
    },\
    \"SuppressionAttributes\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SuppressedReasons\":{\
          \"shape\":\"SuppressionListReasons\",\
          \"documentation\":\"<p>A list that contains the reasons that email addresses will be automatically added to the suppression list for your account. This list can contain any or all of the following:</p> <ul> <li> <p> <code>COMPLAINT</code> â Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a complaint.</p> </li> <li> <p> <code>BOUNCE</code> â Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a hard bounce.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about the email address suppression preferences for your account in the current AWS Region.</p>\"\
    },\
    \"SuppressionListReason\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The reason that the address was added to the suppression list for your account. The value can be one of the following:</p> <ul> <li> <p> <code>COMPLAINT</code> â Amazon SES added an email address to the suppression list for your account because a message sent to that address results in a complaint.</p> </li> <li> <p> <code>BOUNCE</code> â Amazon SES added an email address to the suppression list for your account because a message sent to that address results in a hard bounce.</p> </li> </ul>\",\
      \"enum\":[\
        \"BOUNCE\",\
        \"COMPLAINT\"\
      ]\
    },\
    \"SuppressionListReasons\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SuppressionListReason\"}\
    },\
    \"SuppressionOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SuppressedReasons\":{\
          \"shape\":\"SuppressionListReasons\",\
          \"documentation\":\"<p>A list that contains the reasons that email addresses are automatically added to the suppression list for your account. This list can contain any or all of the following:</p> <ul> <li> <p> <code>COMPLAINT</code> â Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a complaint.</p> </li> <li> <p> <code>BOUNCE</code> â Amazon SES adds an email address to the suppression list for your account when a message sent to that address results in a hard bounce.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about the suppression list preferences for your account.</p>\"\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Key\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>One part of a key-value pair that defines a tag. The maximum length of a tag key is 128 characters. The minimum length is 1 character.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The optional part of a key-value pair that defines a tag. The maximum length of a tag value is 256 characters. The minimum length is 0 characters. If you don't want a resource to have a specific tag value, don't specify a value for thisÂ parameter. If you don't specify a value, Amazon SES sets the value to an empty string.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that defines the tags that are associated with a resource. AÂ <i>tag</i>Â is a label that you optionally define and associate with a resource. Tags can help you categorize and manage resources in different ways, such as by purpose, owner, environment, or other criteria. A resource can have as many as 50 tags.</p> <p>Each tag consists of a requiredÂ <i>tag key</i>Â and an associatedÂ <i>tag value</i>, both of which you define. A tag key is a general label that acts as a category for a more specific tag value. A tag value acts as a descriptor within a tag key. A tag key can contain as many as 128 characters. A tag value can contain as many as 256 characters. The characters can be Unicode letters, digits, white space, or one of the following symbols: _ . : / = + -. The following additional restrictions apply to tags:</p> <ul> <li> <p>Tag keys and values are case sensitive.</p> </li> <li> <p>For each associated resource, each tag key must be unique and it can have only one value.</p> </li> <li> <p>TheÂ <code>aws:</code>Â prefix is reserved for use by AWS; you canât use it in any tag keys or values that you define. In addition, you can't edit or remove tag keys or values that use this prefix. Tags that use this prefix donât count against the limit of 50 tags per resource.</p> </li> <li> <p>You can associate tags with public or shared resources, but the tags are available only for your AWS account, not any other accounts that share the resource. In addition, the tags are available only for resources that are located in the specified AWS Region for your AWS account.</p> </li> </ul>\"\
    },\
    \"TagKey\":{\"type\":\"string\"},\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"}\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"}\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource that you want to add one or more tags to.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of the tags that you want to add to the resource. A tag consists of a required tag key (<code>Key</code>) and an associated tag value (<code>Value</code>). The maximum length of a tag key is 128 characters. The maximum length of a tag value is 256 characters.</p>\"\
        }\
      }\
    },\
    \"TagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagValue\":{\"type\":\"string\"},\
    \"Template\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TemplateArn\":{\
          \"shape\":\"TemplateArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the template.</p>\"\
        },\
        \"TemplateData\":{\
          \"shape\":\"TemplateData\",\
          \"documentation\":\"<p>An object that defines the values to use for message variables in the template. This object is a set of key-value pairs. Each key defines a message variable in the template. The corresponding value defines the value to use for that variable.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that defines the email template to use for an email message, and the values to use for any message variables in that template. An <i>email template</i> is a type of message template that contains content that you want to define, save, and reuse in email messages that you send.</p>\"\
    },\
    \"TemplateArn\":{\"type\":\"string\"},\
    \"TemplateData\":{\
      \"type\":\"string\",\
      \"max\":262144\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TlsPolicy\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>Specifies whether messages that use the configuration set are required to use Transport Layer Security (TLS). If the value is <code>Require</code>, messages are only delivered if a TLS connection can be established. If the value is <code>Optional</code>, messages can be delivered in plain text if a TLS connection can't be established.</p>\",\
      \"enum\":[\
        \"REQUIRE\",\
        \"OPTIONAL\"\
      ]\
    },\
    \"TooManyRequestsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Too many requests have been made to the operation.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"TrackingOptions\":{\
      \"type\":\"structure\",\
      \"required\":[\"CustomRedirectDomain\"],\
      \"members\":{\
        \"CustomRedirectDomain\":{\
          \"shape\":\"CustomRedirectDomain\",\
          \"documentation\":\"<p>The domain that you want to use for tracking open and click events.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that defines the tracking options for a configuration set. When you use the Amazon SES API v2 to send an email, it contains an invisible image that's used to track when recipients open your email. If your email contains links, those links are changed slightly in order to track when recipients click them.</p> <p>These images and links include references to a domain operated by AWS. You can optionally configure the Amazon SES to use a domain that you operate for these images and links.</p>\"\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource that you want to remove one or more tags from.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"ResourceArn\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The tags (tag keys) that you want to remove from the resource. When you specify a tag key, the action removes both that key and its associated tag value.</p> <p>To remove more than one tag from the resource, append the <code>TagKeys</code> parameter and argument for each additional tag to remove, separated by an ampersand. For example: <code>/v2/email/tags?ResourceArn=ResourceArn&amp;TagKeys=Key1&amp;TagKeys=Key2</code> </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"TagKeys\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateConfigurationSetEventDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConfigurationSetName\",\
        \"EventDestinationName\",\
        \"EventDestination\"\
      ],\
      \"members\":{\
        \"ConfigurationSetName\":{\
          \"shape\":\"ConfigurationSetName\",\
          \"documentation\":\"<p>The name of the configuration set that contains the event destination that you want to modify.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConfigurationSetName\"\
        },\
        \"EventDestinationName\":{\
          \"shape\":\"EventDestinationName\",\
          \"documentation\":\"<p>The name of the event destination that you want to modify.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EventDestinationName\"\
        },\
        \"EventDestination\":{\
          \"shape\":\"EventDestinationDefinition\",\
          \"documentation\":\"<p>An object that defines the event destination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A request to change the settings for an event destination for a configuration set.</p>\"\
    },\
    \"UpdateConfigurationSetEventDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An HTTP 200 response if the request succeeds, or an error message if the request fails.</p>\"\
    },\
    \"Volume\":{\
      \"type\":\"long\",\
      \"documentation\":\"<p>An object that contains information about inbox placement volume.</p>\"\
    },\
    \"VolumeStatistics\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InboxRawCount\":{\
          \"shape\":\"Volume\",\
          \"documentation\":\"<p>The total number of emails that arrived in recipients' inboxes.</p>\"\
        },\
        \"SpamRawCount\":{\
          \"shape\":\"Volume\",\
          \"documentation\":\"<p>The total number of emails that arrived in recipients' spam or junk mail folders.</p>\"\
        },\
        \"ProjectedInbox\":{\
          \"shape\":\"Volume\",\
          \"documentation\":\"<p>An estimate of the percentage of emails sent from the current domain that will arrive in recipients' inboxes.</p>\"\
        },\
        \"ProjectedSpam\":{\
          \"shape\":\"Volume\",\
          \"documentation\":\"<p>An estimate of the percentage of emails sent from the current domain that will arrive in recipients' spam or junk mail folders.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains information about the amount of email that was delivered to recipients.</p>\"\
    },\
    \"WarmupStatus\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The warmup status of a dedicated IP.</p>\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"DONE\"\
      ]\
    }\
  },\
  \"documentation\":\"<fullname>Amazon SES API v2</fullname> <p>Welcome to the Amazon SES API v2 Reference. This guide provides information about the Amazon SES API v2, including supported operations, data types, parameters, and schemas.</p> <p> <a href=\\\"https://aws.amazon.com/pinpoint\\\">Amazon SES</a> is an AWS service that you can use to send email messages to your customers.</p> <p>If you're new to Amazon SES API v2, you might find it helpful to also review the <a href=\\\"https://docs.aws.amazon.com/ses/latest/DeveloperGuide/\\\">Amazon Simple Email Service Developer Guide</a>. The <i>Amazon SES Developer Guide</i> provides information and code samples that demonstrate how to use Amazon SES API v2 features programmatically.</p> <p>The Amazon SES API v2 is available in several AWS Regions and it provides an endpoint for each of these Regions. For a list of all the Regions and endpoints where the API is currently available, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/rande.html#ses_region\\\">AWS Service Endpoints</a> in the <i>Amazon Web Services General Reference</i>. To learn more about AWS Regions, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/rande-manage.html\\\">Managing AWS Regions</a> in the <i>Amazon Web Services General Reference</i>.</p> <p>In each Region, AWS maintains multiple Availability Zones. These Availability Zones are physically isolated from each other, but are united by private, low-latency, high-throughput, and highly redundant network connections. These Availability Zones enable us to provide very high levels of availability and redundancy, while also minimizing latency. To learn more about the number of Availability Zones that are available in each Region, see <a href=\\\"http://aws.amazon.com/about-aws/global-infrastructure/\\\">AWS Global Infrastructure</a>.</p>\"\
}\
";
}

@end
