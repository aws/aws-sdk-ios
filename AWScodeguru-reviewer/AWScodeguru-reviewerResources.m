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

#import "AWScodeguru-reviewerResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWScodeguru-reviewerResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWScodeguru-reviewerResources

+ (instancetype)sharedInstance {
    static AWScodeguru-reviewerResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWScodeguru-reviewerResources new];
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
    \"apiVersion\":\"2019-09-19\",\
    \"endpointPrefix\":\"codeguru-reviewer\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceAbbreviation\":\"CodeGuruReviewer\",\
    \"serviceFullName\":\"Amazon CodeGuru Reviewer\",\
    \"serviceId\":\"CodeGuru Reviewer\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"codeguru-reviewer\",\
    \"uid\":\"codeguru-reviewer-2019-09-19\"\
  },\
  \"operations\":{\
    \"AssociateRepository\":{\
      \"name\":\"AssociateRepository\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/associations\"\
      },\
      \"input\":{\"shape\":\"AssociateRepositoryRequest\"},\
      \"output\":{\"shape\":\"AssociateRepositoryResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Associates an AWS CodeCommit repository with Amazon CodeGuru Reviewer. When you associate an AWS CodeCommit repository with Amazon CodeGuru Reviewer, Amazon CodeGuru Reviewer will provide recommendations for each pull request raised within the repository. You can view recommendations in the AWS CodeCommit repository.</p> <p>You can associate a GitHub repository using the Amazon CodeGuru Reviewer console.</p>\"\
    },\
    \"DescribeCodeReview\":{\
      \"name\":\"DescribeCodeReview\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/codereviews/{CodeReviewArn}\"\
      },\
      \"input\":{\"shape\":\"DescribeCodeReviewRequest\"},\
      \"output\":{\"shape\":\"DescribeCodeReviewResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p> Returns the metadaata associated with the code review along with its status.</p>\"\
    },\
    \"DescribeRecommendationFeedback\":{\
      \"name\":\"DescribeRecommendationFeedback\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/feedback/{CodeReviewArn}\"\
      },\
      \"input\":{\"shape\":\"DescribeRecommendationFeedbackRequest\"},\
      \"output\":{\"shape\":\"DescribeRecommendationFeedbackResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p> Describes the customer feedback for a CodeGuru Reviewer recommendation. </p>\"\
    },\
    \"DescribeRepositoryAssociation\":{\
      \"name\":\"DescribeRepositoryAssociation\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/associations/{AssociationArn}\"\
      },\
      \"input\":{\"shape\":\"DescribeRepositoryAssociationRequest\"},\
      \"output\":{\"shape\":\"DescribeRepositoryAssociationResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Describes a repository association.</p>\"\
    },\
    \"DisassociateRepository\":{\
      \"name\":\"DisassociateRepository\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/associations/{AssociationArn}\"\
      },\
      \"input\":{\"shape\":\"DisassociateRepositoryRequest\"},\
      \"output\":{\"shape\":\"DisassociateRepositoryResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Removes the association between Amazon CodeGuru Reviewer and a repository.</p>\"\
    },\
    \"ListCodeReviews\":{\
      \"name\":\"ListCodeReviews\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/codereviews\"\
      },\
      \"input\":{\"shape\":\"ListCodeReviewsRequest\"},\
      \"output\":{\"shape\":\"ListCodeReviewsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p> Lists all the code reviews that the customer has created in the past 90 days. </p>\"\
    },\
    \"ListRecommendationFeedback\":{\
      \"name\":\"ListRecommendationFeedback\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/feedback/{CodeReviewArn}/RecommendationFeedback\"\
      },\
      \"input\":{\"shape\":\"ListRecommendationFeedbackRequest\"},\
      \"output\":{\"shape\":\"ListRecommendationFeedbackResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p> Lists the customer feedback for a CodeGuru Reviewer recommendation for all users. This API will be used from the console to extract the previously given feedback by the user to pre-populate the feedback emojis for all recommendations. </p>\"\
    },\
    \"ListRecommendations\":{\
      \"name\":\"ListRecommendations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/codereviews/{CodeReviewArn}/Recommendations\"\
      },\
      \"input\":{\"shape\":\"ListRecommendationsRequest\"},\
      \"output\":{\"shape\":\"ListRecommendationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p> Returns the list of all recommendations for a completed code review. </p>\"\
    },\
    \"ListRepositoryAssociations\":{\
      \"name\":\"ListRepositoryAssociations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/associations\"\
      },\
      \"input\":{\"shape\":\"ListRepositoryAssociationsRequest\"},\
      \"output\":{\"shape\":\"ListRepositoryAssociationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists repository associations. You can optionally filter on one or more of the following recommendation properties: provider types, states, names, and owners.</p>\"\
    },\
    \"PutRecommendationFeedback\":{\
      \"name\":\"PutRecommendationFeedback\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/feedback\"\
      },\
      \"input\":{\"shape\":\"PutRecommendationFeedbackRequest\"},\
      \"output\":{\"shape\":\"PutRecommendationFeedbackResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p> Stores customer feedback for a CodeGuru-Reviewer recommendation. When this API is called again with different reactions the previous feedback is overwritten. </p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>You do not have sufficient access to perform this action.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
    },\
    \"Arn\":{\
      \"type\":\"string\",\
      \"max\":1600,\
      \"min\":1,\
      \"pattern\":\"^arn:aws[^:\\\\s]*:codeguru-reviewer:[^:\\\\s]+:[\\\\d]{12}:[a-z-]+:[\\\\w-]+$\"\
    },\
    \"AssociateRepositoryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Repository\"],\
      \"members\":{\
        \"Repository\":{\
          \"shape\":\"Repository\",\
          \"documentation\":\"<p>The repository to associate.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p> <p>To add a new repository association, this parameter specifies a unique identifier for the new repository association that helps ensure idempotency.</p> <p>If you use the AWS CLI or one of the AWS SDKs to call this operation, you can leave this parameter empty. The CLI or SDK generates a random UUID for you and includes that in the request. If you don't use the SDK and instead generate a raw HTTP request to the Secrets Manager service endpoint, you must generate a ClientRequestToken yourself for new versions and include that value in the request.</p> <p>You typically interact with this value if you implement your own retry logic and want to ensure that a given repository association is not created twice. We recommend that you generate a UUID-type value to ensure uniqueness within the specified repository association.</p> <p>Amazon CodeGuru Reviewer uses this value to prevent the accidental creation of duplicate repository associations if there are failures and retries. </p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"AssociateRepositoryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RepositoryAssociation\":{\
          \"shape\":\"RepositoryAssociation\",\
          \"documentation\":\"<p>Information about the repository association.</p>\"\
        }\
      }\
    },\
    \"AssociationId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"ClientRequestToken\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[\\\\w-]+$\"\
    },\
    \"CodeCommitRepository\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the AWS CodeCommit repository.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an AWS CodeCommit repository.</p>\"\
    },\
    \"CodeReview\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p> The name of the code review. </p>\"\
        },\
        \"CodeReviewArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the code review to describe. </p>\"\
        },\
        \"RepositoryName\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p> The name of the repository. </p>\"\
        },\
        \"Owner\":{\
          \"shape\":\"Owner\",\
          \"documentation\":\"<p> The owner of the repository. </p>\"\
        },\
        \"ProviderType\":{\
          \"shape\":\"ProviderType\",\
          \"documentation\":\"<p> The provider type of the repository association. </p>\"\
        },\
        \"State\":{\
          \"shape\":\"JobState\",\
          \"documentation\":\"<p> The state of the code review. </p>\"\
        },\
        \"StateReason\":{\
          \"shape\":\"StateReason\",\
          \"documentation\":\"<p> The reason for the state of the code review. </p>\"\
        },\
        \"CreatedTimeStamp\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p> The time, in milliseconds since the epoch, when the code review was created. </p>\"\
        },\
        \"LastUpdatedTimeStamp\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p> The time, in milliseconds since the epoch, when the code review was last updated. </p>\"\
        },\
        \"Type\":{\
          \"shape\":\"Type\",\
          \"documentation\":\"<p> The type of code review. </p>\"\
        },\
        \"PullRequestId\":{\
          \"shape\":\"PullRequestId\",\
          \"documentation\":\"<p> The pull request ID for the code review. </p>\"\
        },\
        \"SourceCodeType\":{\
          \"shape\":\"SourceCodeType\",\
          \"documentation\":\"<p> The type of the source code for the code review. </p>\"\
        },\
        \"Metrics\":{\
          \"shape\":\"Metrics\",\
          \"documentation\":\"<p> The statistics from the code review. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Information about a code review. </p>\"\
    },\
    \"CodeReviewSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CodeReviewSummary\"}\
    },\
    \"CodeReviewSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p> The name of the code review. </p>\"\
        },\
        \"CodeReviewArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the code review to describe. </p>\"\
        },\
        \"RepositoryName\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p> The name of the repository. </p>\"\
        },\
        \"Owner\":{\
          \"shape\":\"Owner\",\
          \"documentation\":\"<p> The owner of the repository. </p>\"\
        },\
        \"ProviderType\":{\
          \"shape\":\"ProviderType\",\
          \"documentation\":\"<p> The provider type of the repository association. </p>\"\
        },\
        \"State\":{\
          \"shape\":\"JobState\",\
          \"documentation\":\"<p> The state of the code review. </p>\"\
        },\
        \"CreatedTimeStamp\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p> The time, in milliseconds since the epoch, when the code review was created. </p>\"\
        },\
        \"LastUpdatedTimeStamp\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p> The time, in milliseconds since the epoch, when the code review was last updated. </p>\"\
        },\
        \"Type\":{\
          \"shape\":\"Type\",\
          \"documentation\":\"<p> The type of the code review. </p>\"\
        },\
        \"PullRequestId\":{\
          \"shape\":\"PullRequestId\",\
          \"documentation\":\"<p> The pull request ID for the code review. </p>\"\
        },\
        \"MetricsSummary\":{\
          \"shape\":\"MetricsSummary\",\
          \"documentation\":\"<p> The statistics from the code review. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Information about the summary of the code review. </p>\"\
    },\
    \"CommitDiffSourceCodeType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SourceCommit\":{\
          \"shape\":\"CommitId\",\
          \"documentation\":\"<p> Source Commit SHA. </p>\"\
        },\
        \"DestinationCommit\":{\
          \"shape\":\"CommitId\",\
          \"documentation\":\"<p> Destination Commit SHA </p>\"\
        }\
      },\
      \"documentation\":\"<p> The commit diff for the pull request. </p>\"\
    },\
    \"CommitId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":6\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The requested operation would cause a conflict with the current state of a service resource associated with the request. Resolve the conflict before retrying this request. </p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"DescribeCodeReviewRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeReviewArn\"],\
      \"members\":{\
        \"CodeReviewArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the code review to describe. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CodeReviewArn\"\
        }\
      }\
    },\
    \"DescribeCodeReviewResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CodeReview\":{\
          \"shape\":\"CodeReview\",\
          \"documentation\":\"<p> Information about the code review. </p>\"\
        }\
      }\
    },\
    \"DescribeRecommendationFeedbackRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CodeReviewArn\",\
        \"RecommendationId\"\
      ],\
      \"members\":{\
        \"CodeReviewArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) that identifies the code review. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CodeReviewArn\"\
        },\
        \"RecommendationId\":{\
          \"shape\":\"RecommendationId\",\
          \"documentation\":\"<p> The recommendation ID that can be used to track the provided recommendations and then to collect the feedback. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"RecommendationId\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p> Optional parameter to describe the feedback for a given user. If this is not supplied, it defaults to the user making the request. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"UserId\"\
        }\
      }\
    },\
    \"DescribeRecommendationFeedbackResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RecommendationFeedback\":{\
          \"shape\":\"RecommendationFeedback\",\
          \"documentation\":\"<p> The recommendation feedback given by the user. </p>\"\
        }\
      }\
    },\
    \"DescribeRepositoryAssociationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AssociationArn\"],\
      \"members\":{\
        \"AssociationArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) identifying the association. You can retrieve this ARN by calling <code>ListRepositories</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AssociationArn\"\
        }\
      }\
    },\
    \"DescribeRepositoryAssociationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RepositoryAssociation\":{\
          \"shape\":\"RepositoryAssociation\",\
          \"documentation\":\"<p>Information about the repository association.</p>\"\
        }\
      }\
    },\
    \"DisassociateRepositoryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AssociationArn\"],\
      \"members\":{\
        \"AssociationArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) identifying the association.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AssociationArn\"\
        }\
      }\
    },\
    \"DisassociateRepositoryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RepositoryAssociation\":{\
          \"shape\":\"RepositoryAssociation\",\
          \"documentation\":\"<p>Information about the disassociated repository.</p>\"\
        }\
      }\
    },\
    \"ErrorMessage\":{\"type\":\"string\"},\
    \"FilePath\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"FindingsCount\":{\"type\":\"long\"},\
    \"InternalServerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The server encountered an internal error and is unable to complete the request.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"JobState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Completed\",\
        \"Pending\",\
        \"Failed\",\
        \"Deleting\"\
      ]\
    },\
    \"JobStates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"JobState\"},\
      \"max\":3,\
      \"min\":1\
    },\
    \"LineNumber\":{\"type\":\"integer\"},\
    \"ListCodeReviewsMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListCodeReviewsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Type\"],\
      \"members\":{\
        \"ProviderTypes\":{\
          \"shape\":\"ProviderTypes\",\
          \"documentation\":\"<p> List of provider types for filtering that needs to be applied before displaying the result. For example, \\\"providerTypes=[GitHub]\\\" will list code reviews from GitHub. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"ProviderTypes\"\
        },\
        \"States\":{\
          \"shape\":\"JobStates\",\
          \"documentation\":\"<p> List of states for filtering that needs to be applied before displaying the result. For example, \\\"states=[Pending]\\\" will list code reviews in the Pending state. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"States\"\
        },\
        \"RepositoryNames\":{\
          \"shape\":\"RepositoryNames\",\
          \"documentation\":\"<p> List of repository names for filtering that needs to be applied before displaying the result. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"RepositoryNames\"\
        },\
        \"Type\":{\
          \"shape\":\"Type\",\
          \"documentation\":\"<p> The type of code reviews to list in the response. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Type\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"ListCodeReviewsMaxResults\",\
          \"documentation\":\"<p> The maximum number of results that are returned per call. The default is 100. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxResults\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> If nextToken is returned, there are more results available. The value of nextToken is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        }\
      }\
    },\
    \"ListCodeReviewsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CodeReviewSummaries\":{\
          \"shape\":\"CodeReviewSummaries\",\
          \"documentation\":\"<p> A list of code reviews that meet the criteria of the request. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> Pagination token. </p>\"\
        }\
      }\
    },\
    \"ListRecommendationFeedbackRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeReviewArn\"],\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> If nextToken is returned, there are more results available. The value of nextToken is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of results that are returned per call. The default is 100. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxResults\"\
        },\
        \"CodeReviewArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) that identifies the code review. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CodeReviewArn\"\
        },\
        \"UserIds\":{\
          \"shape\":\"UserIds\",\
          \"documentation\":\"<p> Filter on userIds that need to be applied before displaying the result. This can be used to query all the recommendation feedback for a code review from a given user. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"UserIds\"\
        },\
        \"RecommendationIds\":{\
          \"shape\":\"RecommendationIds\",\
          \"documentation\":\"<p> Filter on recommendationIds that need to be applied before displaying the result. This can be used to query all the recommendation feedback for a given recommendation. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"RecommendationIds\"\
        }\
      }\
    },\
    \"ListRecommendationFeedbackResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RecommendationFeedbackSummaries\":{\
          \"shape\":\"RecommendationFeedbackSummaries\",\
          \"documentation\":\"<p> Recommendation feedback summaries corresponding to the code reivew ARN. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> If nextToken is returned, there are more results available. The value of nextToken is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. </p>\"\
        }\
      }\
    },\
    \"ListRecommendationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeReviewArn\"],\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> Pagination token. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of results that are returned per call. The default is 100. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxResults\"\
        },\
        \"CodeReviewArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the code review to describe. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CodeReviewArn\"\
        }\
      }\
    },\
    \"ListRecommendationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RecommendationSummaries\":{\
          \"shape\":\"RecommendationSummaries\",\
          \"documentation\":\"<p> List of recommendations for the requested code review. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> Pagination token. </p>\"\
        }\
      }\
    },\
    \"ListRepositoryAssociationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProviderTypes\":{\
          \"shape\":\"ProviderTypes\",\
          \"documentation\":\"<p>List of provider types to use as a filter.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"ProviderType\"\
        },\
        \"States\":{\
          \"shape\":\"RepositoryAssociationStates\",\
          \"documentation\":\"<p>List of states to use as a filter.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"State\"\
        },\
        \"Names\":{\
          \"shape\":\"Names\",\
          \"documentation\":\"<p>List of repository names to use as a filter.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Name\"\
        },\
        \"Owners\":{\
          \"shape\":\"Owners\",\
          \"documentation\":\"<p>List of owners to use as a filter. For GitHub, this is name of the GitHub account that was used to associate the repository. For AWS CodeCommit, it is the name of the CodeCommit account that was used to associate the repository.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Owner\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of repository association results returned by <code>ListRepositoryAssociations</code> in paginated output. When this parameter is used, <code>ListRepositoryAssociations</code> only returns <code>maxResults</code> results in a single page with a <code>nextToken</code> response element. The remaining results of the initial request can be seen by sending another <code>ListRepositoryAssociations</code> request with the returned <code>nextToken</code> value. This value can be between 1 and 25. If this parameter is not used, <code>ListRepositoryAssociations</code> returns up to 25 results and a <code>nextToken</code> value if applicable. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxResults\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>nextToken</code> value returned from a previous paginated <code>ListRepositoryAssociations</code> request where <code>maxResults</code> was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the <code>nextToken</code> value. </p> <note> <p>Treat this token as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes.</p> </note>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"NextToken\"\
        }\
      }\
    },\
    \"ListRepositoryAssociationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RepositoryAssociationSummaries\":{\
          \"shape\":\"RepositoryAssociationSummaries\",\
          \"documentation\":\"<p>A list of repository associations that meet the criteria of the request.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>nextToken</code> value to include in a future <code>ListRecommendations</code> request. When the results of a <code>ListRecommendations</code> request exceed <code>maxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return. </p>\"\
        }\
      }\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"MeteredLinesOfCodeCount\":{\"type\":\"long\"},\
    \"Metrics\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MeteredLinesOfCodeCount\":{\
          \"shape\":\"MeteredLinesOfCodeCount\",\
          \"documentation\":\"<p> Lines of code metered in the code review. </p>\"\
        },\
        \"FindingsCount\":{\
          \"shape\":\"FindingsCount\",\
          \"documentation\":\"<p> Total number of recommendations found in the code review. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Information about the statistics from the code review. </p>\"\
    },\
    \"MetricsSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MeteredLinesOfCodeCount\":{\
          \"shape\":\"MeteredLinesOfCodeCount\",\
          \"documentation\":\"<p> Lines of code metered in the code review. </p>\"\
        },\
        \"FindingsCount\":{\
          \"shape\":\"FindingsCount\",\
          \"documentation\":\"<p> Total number of recommendations found in the code review. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Information about metrics summaries. </p>\"\
    },\
    \"Name\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"^\\\\S[\\\\w.-]*$\"\
    },\
    \"Names\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Name\"},\
      \"max\":3,\
      \"min\":1\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The resource specified in the request was not found.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"Owner\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"^\\\\S(.*\\\\S)?$\"\
    },\
    \"Owners\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Owner\"},\
      \"max\":3,\
      \"min\":1\
    },\
    \"ProviderType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CodeCommit\",\
        \"GitHub\"\
      ]\
    },\
    \"ProviderTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProviderType\"},\
      \"max\":3,\
      \"min\":1\
    },\
    \"PullRequestId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"PutRecommendationFeedbackRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CodeReviewArn\",\
        \"RecommendationId\",\
        \"Reactions\"\
      ],\
      \"members\":{\
        \"CodeReviewArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) that identifies the code review. </p>\"\
        },\
        \"RecommendationId\":{\
          \"shape\":\"RecommendationId\",\
          \"documentation\":\"<p> The recommendation ID that can be used to track the provided recommendations and then to collect the feedback. </p>\"\
        },\
        \"Reactions\":{\
          \"shape\":\"Reactions\",\
          \"documentation\":\"<p> List for storing reactions. Reactions are utf-8 text code for emojis. If you send an empty list it clears all your feedback. </p>\"\
        }\
      }\
    },\
    \"PutRecommendationFeedbackResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"Reaction\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ThumbsUp\",\
        \"ThumbsDown\"\
      ]\
    },\
    \"Reactions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Reaction\"},\
      \"max\":1,\
      \"min\":0\
    },\
    \"RecommendationFeedback\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CodeReviewArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) that identifies the code review. </p>\"\
        },\
        \"RecommendationId\":{\
          \"shape\":\"RecommendationId\",\
          \"documentation\":\"<p> The recommendation ID that can be used to track the provided recommendations. Later on it can be used to collect the feedback. </p>\"\
        },\
        \"Reactions\":{\
          \"shape\":\"Reactions\",\
          \"documentation\":\"<p> List for storing reactions. Reactions are utf-8 text code for emojis. You can send an empty list to clear off all your feedback. </p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p> The user principal that made the API call. </p>\"\
        },\
        \"CreatedTimeStamp\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p> The time at which the feedback was created. </p>\"\
        },\
        \"LastUpdatedTimeStamp\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p> The time at which the feedback was last updated. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Information about the recommendation feedback. </p>\"\
    },\
    \"RecommendationFeedbackSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RecommendationFeedbackSummary\"}\
    },\
    \"RecommendationFeedbackSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RecommendationId\":{\
          \"shape\":\"RecommendationId\",\
          \"documentation\":\"<p> The recommendation ID that can be used to track the provided recommendations. Later on it can be used to collect the feedback. </p>\"\
        },\
        \"Reactions\":{\
          \"shape\":\"Reactions\",\
          \"documentation\":\"<p> List for storing reactions. Reactions are utf-8 text code for emojis. </p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p> The identifier for the user that gave the feedback. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Information about recommendation feedback summaries. </p>\"\
    },\
    \"RecommendationId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"RecommendationIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RecommendationId\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"RecommendationSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RecommendationSummary\"}\
    },\
    \"RecommendationSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FilePath\":{\
          \"shape\":\"FilePath\",\
          \"documentation\":\"<p>Name of the file on which a recommendation is provided.</p>\"\
        },\
        \"RecommendationId\":{\
          \"shape\":\"RecommendationId\",\
          \"documentation\":\"<p> The recommendation ID that can be used to track the provided recommendations. Later on it can be used to collect the feedback. </p>\"\
        },\
        \"StartLine\":{\
          \"shape\":\"LineNumber\",\
          \"documentation\":\"<p> Start line from where the recommendation is applicable in the source commit or source branch. </p>\"\
        },\
        \"EndLine\":{\
          \"shape\":\"LineNumber\",\
          \"documentation\":\"<p> Last line where the recommendation is applicable in the source commit or source branch. For a single line comment the start line and end line values will be the same. </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Text\",\
          \"documentation\":\"<p> A description of the recommendation generated by CodeGuru Reviewer for the lines of code between the start line and the end line. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Information about recommendations. </p>\"\
    },\
    \"Repository\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CodeCommit\":{\
          \"shape\":\"CodeCommitRepository\",\
          \"documentation\":\"<p>Information about an AWS CodeCommit repository.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a repository.</p>\"\
    },\
    \"RepositoryAssociation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The ID of the repository association.</p>\"\
        },\
        \"AssociationArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) identifying the repository association.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the repository.</p>\"\
        },\
        \"Owner\":{\
          \"shape\":\"Owner\",\
          \"documentation\":\"<p>The owner of the repository.</p>\"\
        },\
        \"ProviderType\":{\
          \"shape\":\"ProviderType\",\
          \"documentation\":\"<p>The provider type of the repository association.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"RepositoryAssociationState\",\
          \"documentation\":\"<p>The state of the repository association.</p>\"\
        },\
        \"StateReason\":{\
          \"shape\":\"StateReason\",\
          \"documentation\":\"<p>A description of why the repository association is in the current state.</p>\"\
        },\
        \"LastUpdatedTimeStamp\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p>The time, in milliseconds since the epoch, when the repository association was last updated.</p>\"\
        },\
        \"CreatedTimeStamp\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p>The time, in milliseconds since the epoch, when the repository association was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a repository association.</p>\"\
    },\
    \"RepositoryAssociationState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Associated\",\
        \"Associating\",\
        \"Failed\",\
        \"Disassociating\"\
      ]\
    },\
    \"RepositoryAssociationStates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RepositoryAssociationState\"},\
      \"max\":3,\
      \"min\":1\
    },\
    \"RepositoryAssociationSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RepositoryAssociationSummary\"}\
    },\
    \"RepositoryAssociationSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssociationArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) identifying the repository association.</p>\"\
        },\
        \"LastUpdatedTimeStamp\":{\
          \"shape\":\"TimeStamp\",\
          \"documentation\":\"<p>The time, in milliseconds since the epoch, since the repository association was last updated. </p>\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The repository association ID.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the repository association.</p>\"\
        },\
        \"Owner\":{\
          \"shape\":\"Owner\",\
          \"documentation\":\"<p>The owner of the repository association.</p>\"\
        },\
        \"ProviderType\":{\
          \"shape\":\"ProviderType\",\
          \"documentation\":\"<p>The provider type of the repository association.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"RepositoryAssociationState\",\
          \"documentation\":\"<p>The state of the repository association.</p> <dl> <dt>Associated</dt> <dd> <p>Amazon CodeGuru Reviewer is associated with the repository. </p> </dd> <dt>Associating</dt> <dd> <p>The association is in progress. </p> </dd> <dt>Failed</dt> <dd> <p>The association failed. </p> </dd> <dt>Disassociating</dt> <dd> <p>Amazon CodeGuru Reviewer is in the process of disassociating with the repository. </p> </dd> </dl>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a repository association.</p>\"\
    },\
    \"RepositoryNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Name\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p> The resource specified in the request was not found. </p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"SourceCodeType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CommitDiff\":{\
          \"shape\":\"CommitDiffSourceCodeType\",\
          \"documentation\":\"<p> The commit diff for the pull request. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Information about the source code type. </p>\"\
    },\
    \"StateReason\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"Text\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The request was denied due to request throttling.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"TimeStamp\":{\"type\":\"timestamp\"},\
    \"Type\":{\
      \"type\":\"string\",\
      \"enum\":[\"PullRequest\"]\
    },\
    \"UserId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"UserIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserId\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"ValidationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The input fails to satisfy the specified constraints.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    }\
  },\
  \"documentation\":\"<p>This section provides documentation for the Amazon CodeGuru Reviewer API operations.</p>\"\
}\
";
}

@end
