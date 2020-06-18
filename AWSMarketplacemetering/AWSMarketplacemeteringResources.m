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

#import "AWSMarketplacemeteringResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSMarketplacemeteringResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSMarketplacemeteringResources

+ (instancetype)sharedInstance {
    static AWSMarketplacemeteringResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSMarketplacemeteringResources new];
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
    \"apiVersion\":\"2016-01-14\",\
    \"endpointPrefix\":\"metering.marketplace\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"AWSMarketplace Metering\",\
    \"serviceId\":\"Marketplace Metering\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"aws-marketplace\",\
    \"targetPrefix\":\"AWSMPMeteringService\",\
    \"uid\":\"meteringmarketplace-2016-01-14\"\
  },\
  \"operations\":{\
    \"BatchMeterUsage\":{\
      \"name\":\"BatchMeterUsage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchMeterUsageRequest\"},\
      \"output\":{\"shape\":\"BatchMeterUsageResult\"},\
      \"errors\":[\
        {\"shape\":\"InternalServiceErrorException\"},\
        {\"shape\":\"InvalidProductCodeException\"},\
        {\"shape\":\"InvalidUsageDimensionException\"},\
        {\"shape\":\"InvalidCustomerIdentifierException\"},\
        {\"shape\":\"TimestampOutOfBoundsException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"DisabledApiException\"}\
      ],\
      \"documentation\":\"<p>BatchMeterUsage is called from a SaaS application listed on the AWS Marketplace to post metering records for a set of customers.</p> <p>For identical requests, the API is idempotent; requests can be retried with the same records or a subset of the input records.</p> <p>Every request to BatchMeterUsage is for one product. If you need to meter usage for multiple products, you must make multiple calls to BatchMeterUsage.</p> <p>BatchMeterUsage can process up to 25 UsageRecords at a time.</p>\"\
    },\
    \"MeterUsage\":{\
      \"name\":\"MeterUsage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"MeterUsageRequest\"},\
      \"output\":{\"shape\":\"MeterUsageResult\"},\
      \"errors\":[\
        {\"shape\":\"InternalServiceErrorException\"},\
        {\"shape\":\"InvalidProductCodeException\"},\
        {\"shape\":\"InvalidUsageDimensionException\"},\
        {\"shape\":\"InvalidEndpointRegionException\"},\
        {\"shape\":\"TimestampOutOfBoundsException\"},\
        {\"shape\":\"DuplicateRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"CustomerNotEntitledException\"}\
      ],\
      \"documentation\":\"<p>API to emit metering records. For identical requests, the API is idempotent. It simply returns the metering record ID.</p> <p>MeterUsage is authenticated on the buyer's AWS account using credentials from the EC2 instance, ECS task, or EKS pod.</p>\"\
    },\
    \"RegisterUsage\":{\
      \"name\":\"RegisterUsage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RegisterUsageRequest\"},\
      \"output\":{\"shape\":\"RegisterUsageResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidProductCodeException\"},\
        {\"shape\":\"InvalidRegionException\"},\
        {\"shape\":\"InvalidPublicKeyVersionException\"},\
        {\"shape\":\"PlatformNotSupportedException\"},\
        {\"shape\":\"CustomerNotEntitledException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceErrorException\"},\
        {\"shape\":\"DisabledApiException\"}\
      ],\
      \"documentation\":\"<p>Paid container software products sold through AWS Marketplace must integrate with the AWS Marketplace Metering Service and call the RegisterUsage operation for software entitlement and metering. Free and BYOL products for Amazon ECS or Amazon EKS aren't required to call RegisterUsage, but you may choose to do so if you would like to receive usage data in your seller reports. The sections below explain the behavior of RegisterUsage. RegisterUsage performs two primary functions: metering and entitlement.</p> <ul> <li> <p> <i>Entitlement</i>: RegisterUsage allows you to verify that the customer running your paid software is subscribed to your product on AWS Marketplace, enabling you to guard against unauthorized use. Your container image that integrates with RegisterUsage is only required to guard against unauthorized use at container startup, as such a CustomerNotSubscribedException/PlatformNotSupportedException will only be thrown on the initial call to RegisterUsage. Subsequent calls from the same Amazon ECS task instance (e.g. task-id) or Amazon EKS pod will not throw a CustomerNotSubscribedException, even if the customer unsubscribes while the Amazon ECS task or Amazon EKS pod is still running.</p> </li> <li> <p> <i>Metering</i>: RegisterUsage meters software use per ECS task, per hour, or per pod for Amazon EKS with usage prorated to the second. A minimum of 1 minute of usage applies to tasks that are short lived. For example, if a customer has a 10 node Amazon ECS or Amazon EKS cluster and a service configured as a Daemon Set, then Amazon ECS or Amazon EKS will launch a task on all 10 cluster nodes and the customer will be charged: (10 * hourly_rate). Metering for software use is automatically handled by the AWS Marketplace Metering Control Plane -- your software is not required to perform any metering specific actions, other than call RegisterUsage once for metering of software use to commence. The AWS Marketplace Metering Control Plane will also continue to bill customers for running ECS tasks and Amazon EKS pods, regardless of the customers subscription state, removing the need for your software to perform entitlement checks at runtime.</p> </li> </ul>\"\
    },\
    \"ResolveCustomer\":{\
      \"name\":\"ResolveCustomer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ResolveCustomerRequest\"},\
      \"output\":{\"shape\":\"ResolveCustomerResult\"},\
      \"errors\":[\
        {\"shape\":\"InvalidTokenException\"},\
        {\"shape\":\"ExpiredTokenException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceErrorException\"},\
        {\"shape\":\"DisabledApiException\"}\
      ],\
      \"documentation\":\"<p>ResolveCustomer is called by a SaaS application during the registration process. When a buyer visits your website during the registration process, the buyer submits a registration token through their browser. The registration token is resolved through this API to obtain a CustomerIdentifier and product code.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"BatchMeterUsageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UsageRecords\",\
        \"ProductCode\"\
      ],\
      \"members\":{\
        \"UsageRecords\":{\
          \"shape\":\"UsageRecordList\",\
          \"documentation\":\"<p>The set of UsageRecords to submit. BatchMeterUsage accepts up to 25 UsageRecords at a time.</p>\"\
        },\
        \"ProductCode\":{\
          \"shape\":\"ProductCode\",\
          \"documentation\":\"<p>Product code is used to uniquely identify a product in AWS Marketplace. The product code should be the same as the one used during the publishing of a new product.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A BatchMeterUsageRequest contains UsageRecords, which indicate quantities of usage within your application.</p>\"\
    },\
    \"BatchMeterUsageResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Results\":{\
          \"shape\":\"UsageRecordResultList\",\
          \"documentation\":\"<p>Contains all UsageRecords processed by BatchMeterUsage. These records were either honored by AWS Marketplace Metering Service or were invalid.</p>\"\
        },\
        \"UnprocessedRecords\":{\
          \"shape\":\"UsageRecordList\",\
          \"documentation\":\"<p>Contains all UsageRecords that were not processed by BatchMeterUsage. This is a list of UsageRecords. You can retry the failed request by making another BatchMeterUsage call with this list as input in the BatchMeterUsageRequest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the UsageRecords processed by BatchMeterUsage and any records that have failed due to transient error.</p>\"\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"CustomerIdentifier\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"CustomerNotEntitledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>Exception thrown when the customer does not have a valid subscription for the product.</p>\",\
      \"exception\":true\
    },\
    \"DisabledApiException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>The API is disabled in the Region.</p>\",\
      \"exception\":true\
    },\
    \"DuplicateRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>A metering record has already been emitted by the same EC2 instance, ECS task, or EKS pod for the given {usageDimension, timestamp} with a different usageQuantity.</p>\",\
      \"exception\":true\
    },\
    \"ExpiredTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>The submitted registration token has expired. This can happen if the buyer's browser takes too long to redirect to your page, the buyer has resubmitted the registration token, or your application has held on to the registration token for too long. Your SaaS registration website should redeem this token as soon as it is submitted by the buyer's browser.</p>\",\
      \"exception\":true\
    },\
    \"InternalServiceErrorException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>An internal error has occurred. Retry your request. If the problem persists, post a message with details on the AWS forums.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidCustomerIdentifierException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>You have metered usage for a CustomerIdentifier that does not exist.</p>\",\
      \"exception\":true\
    },\
    \"InvalidEndpointRegionException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>The endpoint being called is in a AWS Region different from your EC2 instance, ECS task, or EKS pod. The Region of the Metering Service endpoint and the AWS Region of the resource must match.</p>\",\
      \"exception\":true\
    },\
    \"InvalidProductCodeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>The product code passed does not match the product code used for publishing the product.</p>\",\
      \"exception\":true\
    },\
    \"InvalidPublicKeyVersionException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>Public Key version is invalid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidRegionException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>RegisterUsage must be called in the same AWS Region the ECS task was launched in. This prevents a container from hardcoding a Region (e.g. withRegion(âus-east-1â) when calling RegisterUsage.</p>\",\
      \"exception\":true\
    },\
    \"InvalidTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>Registration token is invalid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidUsageDimensionException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>The usage dimension does not match one of the UsageDimensions associated with products.</p>\",\
      \"exception\":true\
    },\
    \"MeterUsageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ProductCode\",\
        \"Timestamp\",\
        \"UsageDimension\"\
      ],\
      \"members\":{\
        \"ProductCode\":{\
          \"shape\":\"ProductCode\",\
          \"documentation\":\"<p>Product code is used to uniquely identify a product in AWS Marketplace. The product code should be the same as the one used during the publishing of a new product.</p>\"\
        },\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Timestamp, in UTC, for which the usage is being reported. Your application can meter usage for up to one hour in the past. Make sure the timestamp value is not before the start of the software usage.</p>\"\
        },\
        \"UsageDimension\":{\
          \"shape\":\"UsageDimension\",\
          \"documentation\":\"<p>It will be one of the fcp dimension name provided during the publishing of the product.</p>\"\
        },\
        \"UsageQuantity\":{\
          \"shape\":\"UsageQuantity\",\
          \"documentation\":\"<p>Consumption value for the hour. Defaults to <code>0</code> if not specified.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Checks whether you have the permissions required for the action, but does not make the request. If you have the permissions, the request returns DryRunOperation; otherwise, it returns UnauthorizedException. Defaults to <code>false</code> if not specified.</p>\"\
        }\
      }\
    },\
    \"MeterUsageResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MeteringRecordId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Metering record id.</p>\"\
        }\
      }\
    },\
    \"NonEmptyString\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\S+\"\
    },\
    \"Nonce\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"PlatformNotSupportedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>AWS Marketplace does not support metering usage from the underlying platform. Currently, Amazon ECS, Amazon EKS, and AWS Fargate are supported.</p>\",\
      \"exception\":true\
    },\
    \"ProductCode\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"RegisterUsageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ProductCode\",\
        \"PublicKeyVersion\"\
      ],\
      \"members\":{\
        \"ProductCode\":{\
          \"shape\":\"ProductCode\",\
          \"documentation\":\"<p>Product code is used to uniquely identify a product in AWS Marketplace. The product code should be the same as the one used during the publishing of a new product.</p>\"\
        },\
        \"PublicKeyVersion\":{\
          \"shape\":\"VersionInteger\",\
          \"documentation\":\"<p>Public Key Version provided by AWS Marketplace</p>\"\
        },\
        \"Nonce\":{\
          \"shape\":\"Nonce\",\
          \"documentation\":\"<p>(Optional) To scope down the registration to a specific running software instance and guard against replay attacks.</p>\"\
        }\
      }\
    },\
    \"RegisterUsageResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PublicKeyRotationTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>(Optional) Only included when public key version has expired</p>\"\
        },\
        \"Signature\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>JWT Token</p>\"\
        }\
      }\
    },\
    \"ResolveCustomerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"RegistrationToken\"],\
      \"members\":{\
        \"RegistrationToken\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>When a buyer visits your website during the registration process, the buyer submits a registration token through the browser. The registration token is resolved to obtain a CustomerIdentifier and product code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains input to the ResolveCustomer operation.</p>\"\
    },\
    \"ResolveCustomerResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CustomerIdentifier\":{\
          \"shape\":\"CustomerIdentifier\",\
          \"documentation\":\"<p>The CustomerIdentifier is used to identify an individual customer in your application. Calls to BatchMeterUsage require CustomerIdentifiers for each UsageRecord.</p>\"\
        },\
        \"ProductCode\":{\
          \"shape\":\"ProductCode\",\
          \"documentation\":\"<p>The product code is returned to confirm that the buyer is registering for your product. Subsequent BatchMeterUsage calls should be made using this product code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of the ResolveCustomer operation. Contains the CustomerIdentifier and product code.</p>\"\
    },\
    \"String\":{\"type\":\"string\"},\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>The calls to the API are throttled.</p>\",\
      \"exception\":true\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TimestampOutOfBoundsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"errorMessage\"}\
      },\
      \"documentation\":\"<p>The timestamp value passed in the meterUsage() is out of allowed range.</p>\",\
      \"exception\":true\
    },\
    \"UsageDimension\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"UsageQuantity\":{\
      \"type\":\"integer\",\
      \"max\":2147483647,\
      \"min\":0\
    },\
    \"UsageRecord\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Timestamp\",\
        \"CustomerIdentifier\",\
        \"Dimension\"\
      ],\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Timestamp, in UTC, for which the usage is being reported.</p> <p>Your application can meter usage for up to one hour in the past. Make sure the timestamp value is not before the start of the software usage.</p>\"\
        },\
        \"CustomerIdentifier\":{\
          \"shape\":\"CustomerIdentifier\",\
          \"documentation\":\"<p>The CustomerIdentifier is obtained through the ResolveCustomer operation and represents an individual buyer in your application.</p>\"\
        },\
        \"Dimension\":{\
          \"shape\":\"UsageDimension\",\
          \"documentation\":\"<p>During the process of registering a product on AWS Marketplace, up to eight dimensions are specified. These represent different units of value in your application.</p>\"\
        },\
        \"Quantity\":{\
          \"shape\":\"UsageQuantity\",\
          \"documentation\":\"<p>The quantity of usage consumed by the customer for the given dimension and time. Defaults to <code>0</code> if not specified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A UsageRecord indicates a quantity of usage for a given product, customer, dimension and time.</p> <p>Multiple requests with the same UsageRecords as input will be deduplicated to prevent double charges.</p>\"\
    },\
    \"UsageRecordList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UsageRecord\"},\
      \"max\":25,\
      \"min\":0\
    },\
    \"UsageRecordResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UsageRecord\":{\
          \"shape\":\"UsageRecord\",\
          \"documentation\":\"<p>The UsageRecord that was part of the BatchMeterUsage request.</p>\"\
        },\
        \"MeteringRecordId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The MeteringRecordId is a unique identifier for this metering event.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"UsageRecordResultStatus\",\
          \"documentation\":\"<p>The UsageRecordResult Status indicates the status of an individual UsageRecord processed by BatchMeterUsage.</p> <ul> <li> <p> <i>Success</i>- The UsageRecord was accepted and honored by BatchMeterUsage.</p> </li> <li> <p> <i>CustomerNotSubscribed</i>- The CustomerIdentifier specified is not subscribed to your product. The UsageRecord was not honored. Future UsageRecords for this customer will fail until the customer subscribes to your product.</p> </li> <li> <p> <i>DuplicateRecord</i>- Indicates that the UsageRecord was invalid and not honored. A previously metered UsageRecord had the same customer, dimension, and time, but a different quantity.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>A UsageRecordResult indicates the status of a given UsageRecord processed by BatchMeterUsage.</p>\"\
    },\
    \"UsageRecordResultList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UsageRecordResult\"}\
    },\
    \"UsageRecordResultStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Success\",\
        \"CustomerNotSubscribed\",\
        \"DuplicateRecord\"\
      ]\
    },\
    \"VersionInteger\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"errorMessage\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<fullname>AWS Marketplace Metering Service</fullname> <p>This reference provides descriptions of the low-level AWS Marketplace Metering Service API.</p> <p>AWS Marketplace sellers can use this API to submit usage data for custom usage dimensions.</p> <p>For information on the permissions you need to use this API, see <a href=\\\"https://docs.aws.amazon.com/marketplace/latest/userguide/iam-user-policy-for-aws-marketplace-actions.html\\\">AWS Marketing metering and entitlement API permissions</a> in the <i>AWS Marketplace Seller Guide.</i> </p> <p> <b>Submitting Metering Records</b> </p> <ul> <li> <p> <i>MeterUsage</i>- Submits the metering record for a Marketplace product. MeterUsage is called from an EC2 instance or a container running on EKS or ECS.</p> </li> <li> <p> <i>BatchMeterUsage</i>- Submits the metering record for a set of customers. BatchMeterUsage is called from a software-as-a-service (SaaS) application.</p> </li> </ul> <p> <b>Accepting New Customers</b> </p> <ul> <li> <p> <i>ResolveCustomer</i>- Called by a SaaS application during the registration process. When a buyer visits your website during the registration process, the buyer submits a Registration Token through the browser. The Registration Token is resolved through this API to obtain a CustomerIdentifier and Product Code.</p> </li> </ul> <p> <b>Entitlement and Metering for Paid Container Products</b> </p> <ul> <li> <p> Paid container software products sold through AWS Marketplace must integrate with the AWS Marketplace Metering Service and call the RegisterUsage operation for software entitlement and metering. Free and BYOL products for Amazon ECS or Amazon EKS aren't required to call RegisterUsage, but you can do so if you want to receive usage data in your seller reports. For more information on using the RegisterUsage operation, see <a href=\\\"https://docs.aws.amazon.com/marketplace/latest/userguide/container-based-products.html\\\">Container-Based Products</a>. </p> </li> </ul> <p>BatchMeterUsage API calls are captured by AWS CloudTrail. You can use Cloudtrail to verify that the SaaS metering records that you sent are accurate by searching for records with the eventName of BatchMeterUsage. You can also use CloudTrail to audit records over time. For more information, see the <i> <a href=\\\"http://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html\\\">AWS CloudTrail User Guide</a> </i>.</p>\"\
}\
";
}

@end
