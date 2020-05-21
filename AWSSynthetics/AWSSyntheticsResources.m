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

#import "AWSSyntheticsResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSSyntheticsResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSSyntheticsResources

+ (instancetype)sharedInstance {
    static AWSSyntheticsResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSSyntheticsResources new];
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
    \"apiVersion\":\"2017-10-11\",\
    \"endpointPrefix\":\"synthetics\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceAbbreviation\":\"Synthetics\",\
    \"serviceFullName\":\"Synthetics\",\
    \"serviceId\":\"synthetics\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"synthetics\",\
    \"uid\":\"synthetics-2017-10-11\"\
  },\
  \"operations\":{\
    \"CreateCanary\":{\
      \"name\":\"CreateCanary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/canary\"\
      },\
      \"input\":{\"shape\":\"CreateCanaryRequest\"},\
      \"output\":{\"shape\":\"CreateCanaryResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"}\
      ],\
      \"documentation\":\"<p>Creates a canary. Canaries are scripts that monitor your endpoints and APIs from the outside-in. Canaries help you check the availability and latency of your web services and troubleshoot anomalies by investigating load time data, screenshots of the UI, logs, and metrics. You can set up a canary to run continuously or just once. </p> <p>Do not use <code>CreateCanary</code> to modify an existing canary. Use <a href=\\\"https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_UpdateCanary.html\\\">UpdateCanary</a> instead.</p> <p>To create canaries, you must have the <code>CloudWatchSyntheticsFullAccess</code> policy. If you are creating a new IAM role for the canary, you also need the the <code>iam:CreateRole</code>, <code>iam:CreatePolicy</code> and <code>iam:AttachRolePolicy</code> permissions. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Roles\\\">Necessary Roles and Permissions</a>.</p> <p>Do not include secrets or proprietary information in your canary names. The canary name makes up part of the Amazon Resource Name (ARN) for the canary, and the ARN is included in outbound calls over the internet. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/servicelens_canaries_security.html\\\">Security Considerations for Synthetics Canaries</a>.</p>\"\
    },\
    \"DeleteCanary\":{\
      \"name\":\"DeleteCanary\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/canary/{name}\"\
      },\
      \"input\":{\"shape\":\"DeleteCanaryRequest\"},\
      \"output\":{\"shape\":\"DeleteCanaryResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Permanently deletes the specified canary.</p> <p>When you delete a canary, resources used and created by the canary are not automatically deleted. After you delete a canary that you do not intend to use again, you should also delete the following:</p> <ul> <li> <p>The Lambda functions and layers used by this canary. These have the prefix <code>cwsyn-<i>MyCanaryName</i> </code>.</p> </li> <li> <p>The CloudWatch alarms created for this canary. These alarms have a name of <code>Synthetics-SharpDrop-Alarm-<i>MyCanaryName</i> </code>.</p> </li> <li> <p>Amazon S3 objects and buckets, such as the canary's artifact location.</p> </li> <li> <p>IAM roles created for the canary. If they were created in the console, these roles have the name <code> role/service-role/CloudWatchSyntheticsRole-<i>MyCanaryName</i> </code>.</p> </li> <li> <p>CloudWatch Logs log groups created for the canary. These logs groups have the name <code>/aws/lambda/cwsyn-<i>MyCanaryName</i> </code>. </p> </li> </ul> <p>Before you delete a canary, you might want to use <code>GetCanary</code> to display the information about this canary. Make note of the information returned by this operation so that you can delete these resources after you delete the canary.</p>\"\
    },\
    \"DescribeCanaries\":{\
      \"name\":\"DescribeCanaries\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/canaries\"\
      },\
      \"input\":{\"shape\":\"DescribeCanariesRequest\"},\
      \"output\":{\"shape\":\"DescribeCanariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"}\
      ],\
      \"documentation\":\"<p>This operation returns a list of the canaries in your account, along with full details about each canary.</p> <p>This operation does not have resource-level authorization, so if a user is able to use <code>DescribeCanaries</code>, the user can see all of the canaries in the account. A deny policy can only be used to restrict access to all canaries. It cannot be used on specific resources. </p>\"\
    },\
    \"DescribeCanariesLastRun\":{\
      \"name\":\"DescribeCanariesLastRun\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/canaries/last-run\"\
      },\
      \"input\":{\"shape\":\"DescribeCanariesLastRunRequest\"},\
      \"output\":{\"shape\":\"DescribeCanariesLastRunResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"}\
      ],\
      \"documentation\":\"<p>Use this operation to see information from the most recent run of each canary that you have created.</p>\"\
    },\
    \"DescribeRuntimeVersions\":{\
      \"name\":\"DescribeRuntimeVersions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/runtime-versions\"\
      },\
      \"input\":{\"shape\":\"DescribeRuntimeVersionsRequest\"},\
      \"output\":{\"shape\":\"DescribeRuntimeVersionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of Synthetics canary runtime versions. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html\\\"> Canary Runtime Versions</a>.</p>\"\
    },\
    \"GetCanary\":{\
      \"name\":\"GetCanary\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/canary/{name}\"\
      },\
      \"input\":{\"shape\":\"GetCanaryRequest\"},\
      \"output\":{\"shape\":\"GetCanaryResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"}\
      ],\
      \"documentation\":\"<p>Retrieves complete information about one canary. You must specify the name of the canary that you want. To get a list of canaries and their names, use <a href=\\\"https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html\\\">DescribeCanaries</a>.</p>\"\
    },\
    \"GetCanaryRuns\":{\
      \"name\":\"GetCanaryRuns\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/canary/{name}/runs\"\
      },\
      \"input\":{\"shape\":\"GetCanaryRunsRequest\"},\
      \"output\":{\"shape\":\"GetCanaryRunsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a list of runs for a specified canary.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tags/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ValidationException\"}\
      ],\
      \"documentation\":\"<p>Displays the tags associated with a canary.</p>\"\
    },\
    \"StartCanary\":{\
      \"name\":\"StartCanary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/canary/{name}/start\"\
      },\
      \"input\":{\"shape\":\"StartCanaryRequest\"},\
      \"output\":{\"shape\":\"StartCanaryResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Use this operation to run a canary that has already been created. The frequency of the canary runs is determined by the value of the canary's <code>Schedule</code>. To see a canary's schedule, use <a href=\\\"https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_GetCanary.html\\\">GetCanary</a>.</p>\"\
    },\
    \"StopCanary\":{\
      \"name\":\"StopCanary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/canary/{name}/stop\"\
      },\
      \"input\":{\"shape\":\"StopCanaryRequest\"},\
      \"output\":{\"shape\":\"StopCanaryResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Stops the canary to prevent all future runs. If the canary is currently running, Synthetics stops waiting for the current run of the specified canary to complete. The run that is in progress completes on its own, publishes metrics, and uploads artifacts, but it is not recorded in Synthetics as a completed run.</p> <p>You can use <code>StartCanary</code> to start it running again with the canaryâs current schedule at any point in the future. </p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tags/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ValidationException\"}\
      ],\
      \"documentation\":\"<p>Assigns one or more tags (key-value pairs) to the specified canary. </p> <p>Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only resources with certain tag values.</p> <p>Tags don't have any semantic meaning to AWS and are interpreted strictly as strings of characters.</p> <p>You can use the <code>TagResource</code> action with a canary that already has tags. If you specify a new tag key for the alarm, this tag is appended to the list of tags associated with the alarm. If you specify a tag key that is already associated with the alarm, the new tag value that you specify replaces the previous value for that tag.</p> <p>You can associate as many as 50 tags with a canary.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/tags/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ValidationException\"}\
      ],\
      \"documentation\":\"<p>Removes one or more tags from the specified canary.</p>\"\
    },\
    \"UpdateCanary\":{\
      \"name\":\"UpdateCanary\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/canary/{name}\"\
      },\
      \"input\":{\"shape\":\"UpdateCanaryRequest\"},\
      \"output\":{\"shape\":\"UpdateCanaryResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Use this operation to change the settings of a canary that has already been created.</p> <p>You can't use this operation to update the tags of an existing canary. To change the tags of an existing canary, use <a href=\\\"https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_TagResource.html\\\">TagResource</a>.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"Arn\":{\
      \"type\":\"string\",\
      \"pattern\":\"^arn:(aws|aws-cn|aws-us-gov|aws-iso-{0,1}[a-z]{0,1}):[A-Za-z0-9][A-Za-z0-9_/.-]{0,62}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9_/.-]{0,63}:[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,1023}$\"\
    },\
    \"Blob\":{\
      \"type\":\"blob\",\
      \"max\":10000000,\
      \"min\":1\
    },\
    \"Canaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Canary\"}\
    },\
    \"CanariesLastRun\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CanaryLastRun\"}\
    },\
    \"Canary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"UUID\",\
          \"documentation\":\"<p>The unique ID of this canary.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"CanaryName\",\
          \"documentation\":\"<p>The name of the canary.</p>\"\
        },\
        \"Code\":{\"shape\":\"CanaryCodeOutput\"},\
        \"ExecutionRoleArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the IAM role used to run the canary. This role must include <code>lambda.amazonaws.com</code> as a principal in the trust policy.</p>\"\
        },\
        \"Schedule\":{\
          \"shape\":\"CanaryScheduleOutput\",\
          \"documentation\":\"<p>A structure that contains information about how often the canary is to run, and when these runs are to stop.</p>\"\
        },\
        \"RunConfig\":{\"shape\":\"CanaryRunConfigOutput\"},\
        \"SuccessRetentionPeriodInDays\":{\
          \"shape\":\"MaxSize1024\",\
          \"documentation\":\"<p>The number of days to retain data about successful runs of this canary.</p>\"\
        },\
        \"FailureRetentionPeriodInDays\":{\
          \"shape\":\"MaxSize1024\",\
          \"documentation\":\"<p>The number of days to retain data about failed runs of this canary.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"CanaryStatus\",\
          \"documentation\":\"<p>A structure that contains information about the canary's status.</p>\"\
        },\
        \"Timeline\":{\
          \"shape\":\"CanaryTimeline\",\
          \"documentation\":\"<p>A structure that contains information about when the canary was created, modified, and most recently run.</p>\"\
        },\
        \"ArtifactS3Location\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The location in Amazon S3 where Synthetics stores artifacts from the runs of this canary. Artifacts include the log file, screenshots, and HAR files.</p>\"\
        },\
        \"EngineArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the Lambda function that is used as your canary's engine. For more information about Lambda ARN format, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/lambda-api-permissions-ref.html\\\">Resources and Conditions for Lambda Actions</a>.</p>\"\
        },\
        \"RuntimeVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the runtime version to use for the canary. Currently, the only valid value is <code>syn-1.0</code>. For more information about runtime versions, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html\\\"> Canary Runtime Versions</a>.</p>\"\
        },\
        \"VpcConfig\":{\"shape\":\"VpcConfigOutput\"},\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The list of key-value pairs that are associated with the canary.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure contains all information about one canary in your account.</p>\"\
    },\
    \"CanaryCodeInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Handler\"],\
      \"members\":{\
        \"S3Bucket\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If your canary script is located in S3, specify the full bucket name here. The bucket must already exist. Specify the full bucket name, including <code>s3://</code> as the start of the bucket name.</p>\"\
        },\
        \"S3Key\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The S3 key of your script. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingObjects.html\\\">Working with Amazon S3 Objects</a>.</p>\"\
        },\
        \"S3Version\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The S3 version ID of your script.</p>\"\
        },\
        \"ZipFile\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>If you input your canary script directly into the canary instead of referring to an S3 location, the value of this parameter is the .zip file that contains the script. It can be up to 5 MB.</p>\"\
        },\
        \"Handler\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The entry point to use for the source code when running the canary. This value must end with the string <code>.handler</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Use this structure to input your script code for the canary. This structure contains the Lambda handler with the location where the canary should start running the script. If the script is stored in an S3 bucket, the bucket name, key, and version are also included. If the script was passed into the canary directly, the script code is contained in the value of <code>Zipfile</code>. </p>\"\
    },\
    \"CanaryCodeOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SourceLocationArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The ARN of the Lambda layer where Synthetics stores the canary script code.</p>\"\
        },\
        \"Handler\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The entry point to use for the source code when running the canary.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure contains information about the canary's Lambda handler and where its code is stored by CloudWatch Synthetics.</p>\"\
    },\
    \"CanaryLastRun\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CanaryName\":{\
          \"shape\":\"CanaryName\",\
          \"documentation\":\"<p>The name of the canary.</p>\"\
        },\
        \"LastRun\":{\
          \"shape\":\"CanaryRun\",\
          \"documentation\":\"<p>The results from this canary's most recent run.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure contains information about the most recent run of a single canary.</p>\"\
    },\
    \"CanaryName\":{\
      \"type\":\"string\",\
      \"max\":21,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-z_\\\\-]+$\"\
    },\
    \"CanaryRun\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CanaryName\",\
          \"documentation\":\"<p>The name of the canary.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"CanaryRunStatus\",\
          \"documentation\":\"<p>The status of this run.</p>\"\
        },\
        \"Timeline\":{\
          \"shape\":\"CanaryRunTimeline\",\
          \"documentation\":\"<p>A structure that contains the start and end times of this run.</p>\"\
        },\
        \"ArtifactS3Location\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The location where the canary stored artifacts from the run. Artifacts include the log file, screenshots, and HAR files.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure contains the details about one run of one canary.</p>\"\
    },\
    \"CanaryRunConfigInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"TimeoutInSeconds\"],\
      \"members\":{\
        \"TimeoutInSeconds\":{\
          \"shape\":\"MaxFifteenMinutesInSeconds\",\
          \"documentation\":\"<p>How long the canary is allowed to run before it must stop. If you omit this field, the frequency of the canary is used as this value, up to a maximum of 14 minutes.</p>\"\
        },\
        \"MemoryInMB\":{\
          \"shape\":\"MaxSize3008\",\
          \"documentation\":\"<p>The maximum amount of memory available to the canary while it is running, in MB. The value you specify must be a multiple of 64.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure that contains input information for a canary run.</p>\"\
    },\
    \"CanaryRunConfigOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TimeoutInSeconds\":{\
          \"shape\":\"MaxFifteenMinutesInSeconds\",\
          \"documentation\":\"<p>How long the canary is allowed to run before it must stop.</p>\"\
        },\
        \"MemoryInMB\":{\
          \"shape\":\"MaxSize3008\",\
          \"documentation\":\"<p>The maximum amount of memory available to the canary while it is running, in MB. The value you must be a multiple of 64.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure that contains information for a canary run.</p>\"\
    },\
    \"CanaryRunState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RUNNING\",\
        \"PASSED\",\
        \"FAILED\"\
      ]\
    },\
    \"CanaryRunStateReasonCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CANARY_FAILURE\",\
        \"EXECUTION_FAILURE\"\
      ]\
    },\
    \"CanaryRunStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"State\":{\
          \"shape\":\"CanaryRunState\",\
          \"documentation\":\"<p>The current state of the run.</p>\"\
        },\
        \"StateReason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If run of the canary failed, this field contains the reason for the error.</p>\"\
        },\
        \"StateReasonCode\":{\
          \"shape\":\"CanaryRunStateReasonCode\",\
          \"documentation\":\"<p>If this value is <code>CANARY_FAILURE</code>, an exception occurred in the canary code. If this value is <code>EXECUTION_FAILURE</code>, an exception occurred in CloudWatch Synthetics.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure contains the status information about a canary run.</p>\"\
    },\
    \"CanaryRunTimeline\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Started\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start time of the run.</p>\"\
        },\
        \"Completed\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end time of the run.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure contains the start and end times of a single canary run.</p>\"\
    },\
    \"CanaryRuns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CanaryRun\"}\
    },\
    \"CanaryScheduleInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Expression\"],\
      \"members\":{\
        \"Expression\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A rate expression that defines how often the canary is to run. The syntax is <code>rate(<i>number unit</i>)</code>. <i>unit</i> can be <code>minute</code>, <code>minutes</code>, or <code>hour</code>. </p> <p>For example, <code>rate(1 minute)</code> runs the canary once a minute, <code>rate(10 minutes)</code> runs it once every 10 minutes, and <code>rate(1 hour)</code> runs it once every hour. You can specify a frequency between <code>rate(1 minute)</code> and <code>rate(1 hour)</code>.</p> <p>Specifying <code>rate(0 minute)</code> or <code>rate(0 hour)</code> is a special value that causes the canary to run only once when it is started.</p>\"\
        },\
        \"DurationInSeconds\":{\
          \"shape\":\"MaxOneYearInSeconds\",\
          \"documentation\":\"<p>How long, in seconds, for the canary to continue making regular runs according to the schedule in the <code>Expression</code> value. If you specify 0, the canary continues making runs until you stop it. If you omit this field, the default of 0 is used.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure specifies how often a canary is to make runs and the date and time when it should stop making runs.</p>\"\
    },\
    \"CanaryScheduleOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Expression\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A rate expression that defines how often the canary is to run. The syntax is <code>rate(<i>number unit</i>)</code>. <i>unit</i> can be <code>minute</code>, <code>minutes</code>, or <code>hour</code>. </p> <p>For example, <code>rate(1 minute)</code> runs the canary once a minute, <code>rate(10 minutes)</code> runs it once every 10 minutes, and <code>rate(1 hour)</code> runs it once every hour.</p> <p>Specifying <code>rate(0 minute)</code> or <code>rate(0 hour)</code> is a special value that causes the canary to run only once when it is started.</p>\"\
        },\
        \"DurationInSeconds\":{\
          \"shape\":\"MaxOneYearInSeconds\",\
          \"documentation\":\"<p>How long, in seconds, for the canary to continue making regular runs after it was created. The runs are performed according to the schedule in the <code>Expression</code> value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>How long, in seconds, for the canary to continue making regular runs according to the schedule in the <code>Expression</code> value.</p>\"\
    },\
    \"CanaryState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATING\",\
        \"READY\",\
        \"STARTING\",\
        \"RUNNING\",\
        \"UPDATING\",\
        \"STOPPING\",\
        \"STOPPED\",\
        \"ERROR\",\
        \"DELETING\"\
      ]\
    },\
    \"CanaryStateReasonCode\":{\
      \"type\":\"string\",\
      \"enum\":[\"INVALID_PERMISSIONS\"]\
    },\
    \"CanaryStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"State\":{\
          \"shape\":\"CanaryState\",\
          \"documentation\":\"<p>The current state of the canary.</p>\"\
        },\
        \"StateReason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If the canary has insufficient permissions to run, this field provides more details.</p>\"\
        },\
        \"StateReasonCode\":{\
          \"shape\":\"CanaryStateReasonCode\",\
          \"documentation\":\"<p>If the canary cannot run or has failed, this field displays the reason.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure that contains the current state of the canary.</p>\"\
    },\
    \"CanaryTimeline\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Created\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time the canary was created.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time the canary was most recently modified.</p>\"\
        },\
        \"LastStarted\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the canary's most recent run started.</p>\"\
        },\
        \"LastStopped\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the canary's most recent run ended.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure contains information about when the canary was created and modified.</p>\"\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>A conflicting operation is already in progress.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"CreateCanaryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Code\",\
        \"ArtifactS3Location\",\
        \"ExecutionRoleArn\",\
        \"Schedule\",\
        \"RuntimeVersion\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CanaryName\",\
          \"documentation\":\"<p>The name for this canary. Be sure to give it a descriptive name that distinguishes it from other canaries in your account.</p> <p>Do not include secrets or proprietary information in your canary names. The canary name makes up part of the canary ARN, and the ARN is included in outbound calls over the internet. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/servicelens_canaries_security.html\\\">Security Considerations for Synthetics Canaries</a>.</p>\"\
        },\
        \"Code\":{\
          \"shape\":\"CanaryCodeInput\",\
          \"documentation\":\"<p>A structure that includes the entry point from which the canary should start running your script. If the script is stored in an S3 bucket, the bucket name, key, and version are also included. </p>\"\
        },\
        \"ArtifactS3Location\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The location in Amazon S3 where Synthetics stores artifacts from the test runs of this canary. Artifacts include the log file, screenshots, and HAR files.</p>\"\
        },\
        \"ExecutionRoleArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the IAM role to be used to run the canary. This role must already exist, and must include <code>lambda.amazonaws.com</code> as a principal in the trust policy. The role must also have the following permissions:</p> <ul> <li> <p> <code>s3:PutObject</code> </p> </li> <li> <p> <code>s3:GetBucketLocation</code> </p> </li> <li> <p> <code>s3:ListAllMyBuckets</code> </p> </li> <li> <p> <code>cloudwatch:PutMetricData</code> </p> </li> <li> <p> <code>logs:CreateLogGroup</code> </p> </li> <li> <p> <code>logs:CreateLogStream</code> </p> </li> <li> <p> <code>logs:CreateLogStream</code> </p> </li> </ul>\"\
        },\
        \"Schedule\":{\
          \"shape\":\"CanaryScheduleInput\",\
          \"documentation\":\"<p>A structure that contains information about how often the canary is to run and when these test runs are to stop.</p>\"\
        },\
        \"RunConfig\":{\
          \"shape\":\"CanaryRunConfigInput\",\
          \"documentation\":\"<p>A structure that contains the configuration for individual canary runs, such as timeout value.</p>\"\
        },\
        \"SuccessRetentionPeriodInDays\":{\
          \"shape\":\"MaxSize1024\",\
          \"documentation\":\"<p>The number of days to retain data about successful runs of this canary. If you omit this field, the default of 31 days is used. The valid range is 1 to 455 days.</p>\"\
        },\
        \"FailureRetentionPeriodInDays\":{\
          \"shape\":\"MaxSize1024\",\
          \"documentation\":\"<p>The number of days to retain data about failed runs of this canary. If you omit this field, the default of 31 days is used. The valid range is 1 to 455 days.</p>\"\
        },\
        \"RuntimeVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the runtime version to use for the canary. Currently, the only valid value is <code>syn-1.0</code>. For more information about runtime versions, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html\\\"> Canary Runtime Versions</a>.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfigInput\",\
          \"documentation\":\"<p>If this canary is to test an endpoint in a VPC, this structure contains information about the subnet and security groups of the VPC endpoint. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html\\\"> Running a Canary in a VPC</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>A list of key-value pairs to associate with the canary. You can associate as many as 50 tags with a canary.</p> <p>Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only the resources that have certain tag values.</p>\"\
        }\
      }\
    },\
    \"CreateCanaryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Canary\":{\
          \"shape\":\"Canary\",\
          \"documentation\":\"<p>The full details about the canary you have created.</p>\"\
        }\
      }\
    },\
    \"DeleteCanaryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CanaryName\",\
          \"documentation\":\"<p>The name of the canary that you want to delete. To find the names of your canaries, use <a href=\\\"https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html\\\">DescribeCanaries</a>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"name\"\
        }\
      }\
    },\
    \"DeleteCanaryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeCanariesLastRunRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A token that indicates that there is more data available. You can use this token in a subsequent <code>DescribeCanaries</code> operation to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxSize100\",\
          \"documentation\":\"<p>Specify this parameter to limit how many runs are returned each time you use the <code>DescribeLastRun</code> operation. If you omit this parameter, the default of 100 is used.</p>\"\
        }\
      }\
    },\
    \"DescribeCanariesLastRunResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CanariesLastRun\":{\
          \"shape\":\"CanariesLastRun\",\
          \"documentation\":\"<p>An array that contains the information from the most recent run of each canary.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A token that indicates that there is more data available. You can use this token in a subsequent <code>DescribeCanariesLastRun</code> operation to retrieve the next set of results.</p>\"\
        }\
      }\
    },\
    \"DescribeCanariesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A token that indicates that there is more data available. You can use this token in a subsequent operation to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxCanaryResults\",\
          \"documentation\":\"<p>Specify this parameter to limit how many canaries are returned each time you use the <code>DescribeCanaries</code> operation. If you omit this parameter, the default of 100 is used.</p>\"\
        }\
      }\
    },\
    \"DescribeCanariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Canaries\":{\
          \"shape\":\"Canaries\",\
          \"documentation\":\"<p>Returns an array. Each item in the array contains the full information about one canary.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A token that indicates that there is more data available. You can use this token in a subsequent <code>DescribeCanaries</code> operation to retrieve the next set of results.</p>\"\
        }\
      }\
    },\
    \"DescribeRuntimeVersionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A token that indicates that there is more data available. You can use this token in a subsequent <code>DescribeRuntimeVersions</code> operation to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxSize100\",\
          \"documentation\":\"<p>Specify this parameter to limit how many runs are returned each time you use the <code>DescribeRuntimeVersions</code> operation. If you omit this parameter, the default of 100 is used.</p>\"\
        }\
      }\
    },\
    \"DescribeRuntimeVersionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RuntimeVersions\":{\
          \"shape\":\"RuntimeVersionList\",\
          \"documentation\":\"<p>An array of objects that display the details about each Synthetics canary runtime version.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A token that indicates that there is more data available. You can use this token in a subsequent <code>DescribeRuntimeVersions</code> operation to retrieve the next set of results.</p>\"\
        }\
      }\
    },\
    \"ErrorMessage\":{\"type\":\"string\"},\
    \"GetCanaryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CanaryName\",\
          \"documentation\":\"<p>The name of the canary that you want details for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"name\"\
        }\
      }\
    },\
    \"GetCanaryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Canary\":{\
          \"shape\":\"Canary\",\
          \"documentation\":\"<p>A strucure that contains the full information about the canary.</p>\"\
        }\
      }\
    },\
    \"GetCanaryRunsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CanaryName\",\
          \"documentation\":\"<p>The name of the canary that you want to see runs for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"name\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A token that indicates that there is more data available. You can use this token in a subsequent <code>GetCanaryRuns</code> operation to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxSize100\",\
          \"documentation\":\"<p>Specify this parameter to limit how many runs are returned each time you use the <code>GetCanaryRuns</code> operation. If you omit this parameter, the default of 100 is used.</p>\"\
        }\
      }\
    },\
    \"GetCanaryRunsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CanaryRuns\":{\
          \"shape\":\"CanaryRuns\",\
          \"documentation\":\"<p>An array of structures. Each structure contains the details of one of the retrieved canary runs.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A token that indicates that there is more data available. You can use this token in a subsequent <code>GetCanaryRuns</code> operation to retrieve the next set of results.</p>\"\
        }\
      }\
    },\
    \"InternalServerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>An unknown internal error occurred.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the canary that you want to view tags for.</p> <p>The ARN format of a canary is <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:canary:<i>canary-name</i> </code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The list of tag keys and values associated with the canary that you specified.</p>\"\
        }\
      }\
    },\
    \"MaxCanaryResults\":{\
      \"type\":\"integer\",\
      \"max\":20,\
      \"min\":1\
    },\
    \"MaxFifteenMinutesInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":900,\
      \"min\":60\
    },\
    \"MaxOneYearInSeconds\":{\
      \"type\":\"long\",\
      \"max\":31622400,\
      \"min\":0\
    },\
    \"MaxSize100\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"MaxSize1024\":{\
      \"type\":\"integer\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"MaxSize3008\":{\
      \"type\":\"integer\",\
      \"max\":3008,\
      \"min\":960\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>One of the specified resources was not found.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"RuntimeVersion\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VersionName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the runtime version. Currently, the only valid value is <code>syn-1.0</code>. </p> <p>Specifies the runtime version to use for the canary. Currently, the only valid value is <code>syn-1.0</code>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A description of the runtime version, created by Amazon.</p>\"\
        },\
        \"ReleaseDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date that the runtime version was released.</p>\"\
        },\
        \"DeprecationDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>If this runtime version is deprecated, this value is the date of deprecation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure contains information about one canary runtime version. For more information about runtime versions, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html\\\"> Canary Runtime Versions</a>.</p>\"\
    },\
    \"RuntimeVersionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RuntimeVersion\"}\
    },\
    \"SecurityGroupId\":{\"type\":\"string\"},\
    \"SecurityGroupIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityGroupId\"},\
      \"max\":5,\
      \"min\":0\
    },\
    \"StartCanaryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CanaryName\",\
          \"documentation\":\"<p>The name of the canary that you want to run. To find canary names, use <a href=\\\"https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html\\\">DescribeCanaries</a>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"name\"\
        }\
      }\
    },\
    \"StartCanaryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StopCanaryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CanaryName\",\
          \"documentation\":\"<p>The name of the canary that you want to stop. To find the names of your canaries, use <a href=\\\"https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html\\\">DescribeCanaries</a>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"name\"\
        }\
      }\
    },\
    \"StopCanaryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"String\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"SubnetId\":{\"type\":\"string\"},\
    \"SubnetIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubnetId\"},\
      \"max\":16,\
      \"min\":0\
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
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the canary that you're adding tags to.</p> <p>The ARN format of a canary is <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:canary:<i>canary-name</i> </code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The list of key-value pairs to associate with the canary.</p>\"\
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
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"Token\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[a-zA-Z0-9=/+_.-]{4,252}$\"\
    },\
    \"UUID\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$\"\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the canary that you're removing tags from.</p> <p>The ARN format of a canary is <code>arn:aws:synthetics:<i>Region</i>:<i>account-id</i>:canary:<i>canary-name</i> </code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The list of tag keys to remove from the resource.</p>\",\
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
    \"UpdateCanaryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CanaryName\",\
          \"documentation\":\"<p>The name of the canary that you want to update. To find the names of your canaries, use <a href=\\\"https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html\\\">DescribeCanaries</a>.</p> <p>You cannot change the name of a canary that has already been created.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"name\"\
        },\
        \"Code\":{\
          \"shape\":\"CanaryCodeInput\",\
          \"documentation\":\"<p>A structure that includes the entry point from which the canary should start running your script. If the script is stored in an S3 bucket, the bucket name, key, and version are also included. </p>\"\
        },\
        \"ExecutionRoleArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the IAM role to be used to run the canary. This role must already exist, and must include <code>lambda.amazonaws.com</code> as a principal in the trust policy. The role must also have the following permissions:</p> <ul> <li> <p> <code>s3:PutObject</code> </p> </li> <li> <p> <code>s3:GetBucketLocation</code> </p> </li> <li> <p> <code>s3:ListAllMyBuckets</code> </p> </li> <li> <p> <code>cloudwatch:PutMetricData</code> </p> </li> <li> <p> <code>logs:CreateLogGroup</code> </p> </li> <li> <p> <code>logs:CreateLogStream</code> </p> </li> <li> <p> <code>logs:CreateLogStream</code> </p> </li> </ul>\"\
        },\
        \"RuntimeVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the runtime version to use for the canary. Currently, the only valid value is <code>syn-1.0</code>. For more information about runtime versions, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html\\\"> Canary Runtime Versions</a>.</p>\"\
        },\
        \"Schedule\":{\
          \"shape\":\"CanaryScheduleInput\",\
          \"documentation\":\"<p>A structure that contains information about how often the canary is to run, and when these runs are to stop.</p>\"\
        },\
        \"RunConfig\":{\
          \"shape\":\"CanaryRunConfigInput\",\
          \"documentation\":\"<p>A structure that contains the timeout value that is used for each individual run of the canary.</p>\"\
        },\
        \"SuccessRetentionPeriodInDays\":{\
          \"shape\":\"MaxSize1024\",\
          \"documentation\":\"<p>The number of days to retain data about successful runs of this canary.</p>\"\
        },\
        \"FailureRetentionPeriodInDays\":{\
          \"shape\":\"MaxSize1024\",\
          \"documentation\":\"<p>The number of days to retain data about failed runs of this canary.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfigInput\",\
          \"documentation\":\"<p>If this canary is to test an endpoint in a VPC, this structure contains information about the subnet and security groups of the VPC endpoint. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html\\\"> Running a Canary in a VPC</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateCanaryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"ValidationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>A parameter could not be validated.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"VpcConfigInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIds\",\
          \"documentation\":\"<p>The IDs of the subnets where this canary is to run.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>The IDs of the security groups for this canary.</p>\"\
        }\
      },\
      \"documentation\":\"<p>If this canary is to test an endpoint in a VPC, this structure contains information about the subnets and security groups of the VPC endpoint. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html\\\"> Running a Canary in a VPC</a>.</p>\"\
    },\
    \"VpcConfigOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VpcId\":{\
          \"shape\":\"VpcId\",\
          \"documentation\":\"<p>The IDs of the VPC where this canary is to run.</p>\"\
        },\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIds\",\
          \"documentation\":\"<p>The IDs of the subnets where this canary is to run.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>The IDs of the security groups for this canary.</p>\"\
        }\
      },\
      \"documentation\":\"<p>If this canary is to test an endpoint in a VPC, this structure contains information about the subnets and security groups of the VPC endpoint. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_VPC.html\\\"> Running a Canary in a VPC</a>.</p>\"\
    },\
    \"VpcId\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<fullname>Amazon CloudWatch Synthetics</fullname> <p>You can use Amazon CloudWatch Synthetics to continually monitor your services. You can create and manage <i>canaries</i>, which are modular, lightweight scripts that monitor your endpoints and APIs from the outside-in. You can set up your canaries to run 24 hours a day, once per minute. The canaries help you check the availability and latency of your web services and troubleshoot anomalies by investigating load time data, screenshots of the UI, logs, and metrics. The canaries seamlessly integrate with CloudWatch ServiceLens to help you trace the causes of impacted nodes in your applications. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ServiceLens.html\\\">Using ServiceLens to Monitor the Health of Your Applications</a> in the <i>Amazon CloudWatch User Guide</i>.</p> <p>Before you create and manage canaries, be aware of the security considerations. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/servicelens_canaries_security.html\\\">Security Considerations for Synthetics Canaries</a>.</p>\"\
}\
";
}

@end