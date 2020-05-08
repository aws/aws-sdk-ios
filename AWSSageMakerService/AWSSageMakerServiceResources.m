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

#import "AWSSageMakerServiceResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSSageMakerServiceResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSSageMakerServiceResources

+ (instancetype)sharedInstance {
    static AWSSageMakerServiceResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSSageMakerServiceResources new];
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
    \"apiVersion\":\"2017-07-24\",\
    \"endpointPrefix\":\"api.sagemaker\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceAbbreviation\":\"SageMaker\",\
    \"serviceFullName\":\"Amazon SageMaker Service\",\
    \"serviceId\":\"SageMaker\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"sagemaker\",\
    \"targetPrefix\":\"SageMaker\",\
    \"uid\":\"sagemaker-2017-07-24\"\
  },\
  \"operations\":{\
    \"AddTags\":{\
      \"name\":\"AddTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddTagsInput\"},\
      \"output\":{\"shape\":\"AddTagsOutput\"},\
      \"documentation\":\"<p>Adds or overwrites one or more tags for the specified Amazon SageMaker resource. You can add tags to notebook instances, training jobs, hyperparameter tuning jobs, batch transform jobs, models, labeling jobs, work teams, endpoint configurations, and endpoints.</p> <p>Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see For more information, see <a href=\\\"https://aws.amazon.com/answers/account-management/aws-tagging-strategies/\\\">AWS Tagging Strategies</a>.</p> <note> <p>Tags that you add to a hyperparameter tuning job by calling this API are also added to any training jobs that the hyperparameter tuning job launches after you call this API, but not to training jobs that the hyperparameter tuning job launched before you called this API. To make sure that the tags associated with a hyperparameter tuning job are also added to all training jobs that the hyperparameter tuning job launches, add the tags when you first create the tuning job by specifying them in the <code>Tags</code> parameter of <a>CreateHyperParameterTuningJob</a> </p> </note>\"\
    },\
    \"AssociateTrialComponent\":{\
      \"name\":\"AssociateTrialComponent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AssociateTrialComponentRequest\"},\
      \"output\":{\"shape\":\"AssociateTrialComponentResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"},\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Associates a trial component with a trial. A trial component can be associated with multiple trials. To disassociate a trial component from a trial, call the <a>DisassociateTrialComponent</a> API.</p>\"\
    },\
    \"CreateAlgorithm\":{\
      \"name\":\"CreateAlgorithm\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateAlgorithmInput\"},\
      \"output\":{\"shape\":\"CreateAlgorithmOutput\"},\
      \"documentation\":\"<p>Create a machine learning algorithm that you can use in Amazon SageMaker and list in the AWS Marketplace.</p>\"\
    },\
    \"CreateApp\":{\
      \"name\":\"CreateApp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateAppRequest\"},\
      \"output\":{\"shape\":\"CreateAppResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"},\
        {\"shape\":\"ResourceInUse\"}\
      ],\
      \"documentation\":\"<p>Creates a running App for the specified UserProfile. Supported Apps are <code>JupyterServer</code>, <code>KernelGateway</code>, and <code>TensorBoard</code>. This operation is automatically invoked by Amazon SageMaker Studio upon access to the associated Studio Domain, and when new kernel configurations are selected by the user. A user may have multiple Apps active simultaneously. Apps will automatically terminate and be deleted when stopped from within Studio, or when the DeleteApp API is manually called. UserProfiles are limited to 5 concurrently running Apps at a time.</p>\"\
    },\
    \"CreateAutoMLJob\":{\
      \"name\":\"CreateAutoMLJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateAutoMLJobRequest\"},\
      \"output\":{\"shape\":\"CreateAutoMLJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUse\"},\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Creates an AutoPilot job.</p> <p>After you run an AutoPilot job, you can find the best performing model by calling , and then deploy that model by following the steps described in <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html\\\">Step 6.1: Deploy the Model to Amazon SageMaker Hosting Services</a>.</p> <p>For information about how to use AutoPilot, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html\\\">Use AutoPilot to Automate Model Development</a>.</p>\"\
    },\
    \"CreateCodeRepository\":{\
      \"name\":\"CreateCodeRepository\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCodeRepositoryInput\"},\
      \"output\":{\"shape\":\"CreateCodeRepositoryOutput\"},\
      \"documentation\":\"<p>Creates a Git repository as a resource in your Amazon SageMaker account. You can associate the repository with notebook instances so that you can use Git source control for the notebooks you create. The Git repository is a resource in your Amazon SageMaker account, so it can be associated with more than one notebook instance, and it persists independently from the lifecycle of any notebook instances it is associated with.</p> <p>The repository can be hosted either in <a href=\\\"https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html\\\">AWS CodeCommit</a> or in any other Git repository.</p>\"\
    },\
    \"CreateCompilationJob\":{\
      \"name\":\"CreateCompilationJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCompilationJobRequest\"},\
      \"output\":{\"shape\":\"CreateCompilationJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUse\"},\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Starts a model compilation job. After the model has been compiled, Amazon SageMaker saves the resulting model artifacts to an Amazon Simple Storage Service (Amazon S3) bucket that you specify. </p> <p>If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts with AWS IoT Greengrass. In that case, deploy them as an ML resource.</p> <p>In the request body, you provide the following:</p> <ul> <li> <p>A name for the compilation job</p> </li> <li> <p> Information about the input model artifacts </p> </li> <li> <p>The output location for the compiled model and the device (target) that the model runs on </p> </li> <li> <p> <code>The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker assumes to perform the model compilation job</code> </p> </li> </ul> <p>You can also provide a <code>Tag</code> to track the model compilation job's resource use and costs. The response body contains the <code>CompilationJobArn</code> for the compiled job.</p> <p>To stop a model compilation job, use <a>StopCompilationJob</a>. To get information about a particular model compilation job, use <a>DescribeCompilationJob</a>. To get information about multiple model compilation jobs, use <a>ListCompilationJobs</a>.</p>\"\
    },\
    \"CreateDomain\":{\
      \"name\":\"CreateDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateDomainRequest\"},\
      \"output\":{\"shape\":\"CreateDomainResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"},\
        {\"shape\":\"ResourceInUse\"}\
      ],\
      \"documentation\":\"<p>Creates a Domain for Amazon SageMaker Studio, which can be accessed by end-users in a web browser. A Domain has an associated directory, list of authorized users, and a variety of security, application, policies, and Amazon Virtual Private Cloud configurations. An AWS account is limited to one Domain, per region. Users within a domain can share notebook files and other artifacts with each other. When a Domain is created, an Amazon Elastic File System (EFS) is also created for use by all of the users within the Domain. Each user receives a private home directory within the EFS for notebooks, Git repositories, and data files. </p>\"\
    },\
    \"CreateEndpoint\":{\
      \"name\":\"CreateEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateEndpointInput\"},\
      \"output\":{\"shape\":\"CreateEndpointOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Creates an endpoint using the endpoint configuration specified in the request. Amazon SageMaker uses the endpoint to provision resources and deploy models. You create the endpoint configuration with the <a>CreateEndpointConfig</a> API. </p> <p> Use this API to deploy models using Amazon SageMaker hosting services. </p> <p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto\\\">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a> </p> <note> <p> You must not delete an <code>EndpointConfig</code> that is in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. To update an endpoint, you must create a new <code>EndpointConfig</code>.</p> </note> <p>The endpoint name must be unique within an AWS Region in your AWS account. </p> <p>When it receives the request, Amazon SageMaker creates the endpoint, launches the resources (ML compute instances), and deploys the model(s) on them. </p> <p>When Amazon SageMaker receives the request, it sets the endpoint status to <code>Creating</code>. After it creates the endpoint, it sets the status to <code>InService</code>. Amazon SageMaker can then process incoming requests for inferences. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API.</p> <p>If any of the models hosted at this endpoint get model data from an Amazon S3 location, Amazon SageMaker uses AWS Security Token Service to download model artifacts from the S3 path you provided. AWS STS is activated in your IAM user account by default. If you previously deactivated AWS STS for a region, you need to reactivate AWS STS for that region. For more information, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html\\\">Activating and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p>\"\
    },\
    \"CreateEndpointConfig\":{\
      \"name\":\"CreateEndpointConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateEndpointConfigInput\"},\
      \"output\":{\"shape\":\"CreateEndpointConfigOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Creates an endpoint configuration that Amazon SageMaker hosting services uses to deploy models. In the configuration, you identify one or more models, created using the <code>CreateModel</code> API, to deploy and the resources that you want Amazon SageMaker to provision. Then you call the <a>CreateEndpoint</a> API.</p> <note> <p> Use this API if you want to use Amazon SageMaker hosting services to deploy models into production. </p> </note> <p>In the request, you define a <code>ProductionVariant</code>, for each model that you want to deploy. Each <code>ProductionVariant</code> parameter also describes the resources that you want Amazon SageMaker to provision. This includes the number and type of ML compute instances to deploy. </p> <p>If you are hosting multiple models, you also assign a <code>VariantWeight</code> to specify how much traffic you want to allocate to each model. For example, suppose that you want to host two models, A and B, and you assign traffic weight 2 for model A and 1 for model B. Amazon SageMaker distributes two-thirds of the traffic to Model A, and one-third to model B. </p> <p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto\\\">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a> </p>\"\
    },\
    \"CreateExperiment\":{\
      \"name\":\"CreateExperiment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateExperimentRequest\"},\
      \"output\":{\"shape\":\"CreateExperimentResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Creates an Amazon SageMaker <i>experiment</i>. An experiment is a collection of <i>trials</i> that are observed, compared and evaluated as a group. A trial is a set of steps, called <i>trial components</i>, that produce a machine learning model.</p> <p>The goal of an experiment is to determine the components that produce the best model. Multiple trials are performed, each one isolating and measuring the impact of a change to one or more inputs, while keeping the remaining inputs constant.</p> <p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p> <p>You can add tags to experiments, trials, trial components and then use the <a>Search</a> API to search for the tags.</p> <p>To add a description to an experiment, specify the optional <code>Description</code> parameter. To add a description later, or to change the description, call the <a>UpdateExperiment</a> API.</p> <p>To get a list of all your experiments, call the <a>ListExperiments</a> API. To view an experiment's properties, call the <a>DescribeExperiment</a> API. To get a list of all the trials associated with an experiment, call the <a>ListTrials</a> API. To create a trial call the <a>CreateTrial</a> API.</p>\"\
    },\
    \"CreateFlowDefinition\":{\
      \"name\":\"CreateFlowDefinition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateFlowDefinitionRequest\"},\
      \"output\":{\"shape\":\"CreateFlowDefinitionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"},\
        {\"shape\":\"ResourceInUse\"}\
      ],\
      \"documentation\":\"<p>Creates a flow definition.</p>\"\
    },\
    \"CreateHumanTaskUi\":{\
      \"name\":\"CreateHumanTaskUi\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateHumanTaskUiRequest\"},\
      \"output\":{\"shape\":\"CreateHumanTaskUiResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"},\
        {\"shape\":\"ResourceInUse\"}\
      ],\
      \"documentation\":\"<p>Defines the settings you will use for the human review workflow user interface. Reviewers will see a three-panel interface with an instruction area, the item to review, and an input area.</p>\"\
    },\
    \"CreateHyperParameterTuningJob\":{\
      \"name\":\"CreateHyperParameterTuningJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateHyperParameterTuningJobRequest\"},\
      \"output\":{\"shape\":\"CreateHyperParameterTuningJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUse\"},\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Starts a hyperparameter tuning job. A hyperparameter tuning job finds the best version of a model by running many training jobs on your dataset using the algorithm you choose and values for hyperparameters within ranges that you specify. It then chooses the hyperparameter values that result in a model that performs the best, as measured by an objective metric that you choose.</p>\"\
    },\
    \"CreateLabelingJob\":{\
      \"name\":\"CreateLabelingJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLabelingJobRequest\"},\
      \"output\":{\"shape\":\"CreateLabelingJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUse\"},\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Creates a job that uses workers to label the data objects in your input dataset. You can use the labeled data to train machine learning models.</p> <p>You can select your workforce from one of three providers:</p> <ul> <li> <p>A private workforce that you create. It can include employees, contractors, and outside experts. Use a private workforce when want the data to stay within your organization or when a specific set of skills is required.</p> </li> <li> <p>One or more vendors that you select from the AWS Marketplace. Vendors provide expertise in specific areas. </p> </li> <li> <p>The Amazon Mechanical Turk workforce. This is the largest workforce, but it should only be used for public data or data that has been stripped of any personally identifiable information.</p> </li> </ul> <p>You can also use <i>automated data labeling</i> to reduce the number of data objects that need to be labeled by a human. Automated data labeling uses <i>active learning</i> to determine if a data object can be labeled by machine or if it needs to be sent to a human worker. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sms-automated-labeling.html\\\">Using Automated Data Labeling</a>.</p> <p>The data objects to be labeled are contained in an Amazon S3 bucket. You create a <i>manifest file</i> that describes the location of each object. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sms-data.html\\\">Using Input and Output Data</a>.</p> <p>The output can be used as the manifest file for another labeling job or as training data for your machine learning models.</p>\"\
    },\
    \"CreateModel\":{\
      \"name\":\"CreateModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateModelInput\"},\
      \"output\":{\"shape\":\"CreateModelOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Creates a model in Amazon SageMaker. In the request, you name the model and describe a primary container. For the primary container, you specify the Docker image that contains inference code, artifacts (from prior training), and a custom environment map that the inference code uses when you deploy the model for predictions.</p> <p>Use this API to create a model if you want to use Amazon SageMaker hosting services or run a batch transform job.</p> <p>To host your model, you create an endpoint configuration with the <code>CreateEndpointConfig</code> API, and then create an endpoint with the <code>CreateEndpoint</code> API. Amazon SageMaker then deploys all of the containers that you defined for the model in the hosting environment. </p> <p>For an example that calls this method when deploying a model to Amazon SageMaker hosting services, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto\\\">Deploy the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto 3)).</a> </p> <p>To run a batch transform using your model, you start a job with the <code>CreateTransformJob</code> API. Amazon SageMaker uses your model and your dataset to get inferences which are then saved to a specified S3 location.</p> <p>In the <code>CreateModel</code> request, you must define a container with the <code>PrimaryContainer</code> parameter.</p> <p>In the request, you also provide an IAM role that Amazon SageMaker can assume to access model artifacts and docker image for deployment on ML compute hosting instances or for batch transform jobs. In addition, you also use the IAM role to manage permissions the inference code needs. For example, if the inference code access any other AWS resources, you grant necessary permissions via this role.</p>\"\
    },\
    \"CreateModelPackage\":{\
      \"name\":\"CreateModelPackage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateModelPackageInput\"},\
      \"output\":{\"shape\":\"CreateModelPackageOutput\"},\
      \"documentation\":\"<p>Creates a model package that you can use to create Amazon SageMaker models or list on AWS Marketplace. Buyers can subscribe to model packages listed on AWS Marketplace to create models in Amazon SageMaker.</p> <p>To create a model package by specifying a Docker container that contains your inference code and the Amazon S3 location of your model artifacts, provide values for <code>InferenceSpecification</code>. To create a model from an algorithm resource that you created or subscribed to in AWS Marketplace, provide a value for <code>SourceAlgorithmSpecification</code>.</p>\"\
    },\
    \"CreateMonitoringSchedule\":{\
      \"name\":\"CreateMonitoringSchedule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateMonitoringScheduleRequest\"},\
      \"output\":{\"shape\":\"CreateMonitoringScheduleResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"},\
        {\"shape\":\"ResourceInUse\"}\
      ],\
      \"documentation\":\"<p>Creates a schedule that regularly starts Amazon SageMaker Processing Jobs to monitor the data captured for an Amazon SageMaker Endoint.</p>\"\
    },\
    \"CreateNotebookInstance\":{\
      \"name\":\"CreateNotebookInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateNotebookInstanceInput\"},\
      \"output\":{\"shape\":\"CreateNotebookInstanceOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Creates an Amazon SageMaker notebook instance. A notebook instance is a machine learning (ML) compute instance running on a Jupyter notebook. </p> <p>In a <code>CreateNotebookInstance</code> request, specify the type of ML compute instance that you want to run. Amazon SageMaker launches the instance, installs common libraries that you can use to explore datasets for model training, and attaches an ML storage volume to the notebook instance. </p> <p>Amazon SageMaker also provides a set of example notebooks. Each notebook demonstrates how to use Amazon SageMaker with a specific algorithm or with a machine learning framework. </p> <p>After receiving the request, Amazon SageMaker does the following:</p> <ol> <li> <p>Creates a network interface in the Amazon SageMaker VPC.</p> </li> <li> <p>(Option) If you specified <code>SubnetId</code>, Amazon SageMaker creates a network interface in your own VPC, which is inferred from the subnet ID that you provide in the input. When creating this network interface, Amazon SageMaker attaches the security group that you specified in the request to the network interface that it creates in your VPC.</p> </li> <li> <p>Launches an EC2 instance of the type specified in the request in the Amazon SageMaker VPC. If you specified <code>SubnetId</code> of your VPC, Amazon SageMaker specifies both network interfaces when launching this instance. This enables inbound traffic from your own VPC to the notebook instance, assuming that the security groups allow it.</p> </li> </ol> <p>After creating the notebook instance, Amazon SageMaker returns its Amazon Resource Name (ARN). You can't change the name of a notebook instance after you create it.</p> <p>After Amazon SageMaker creates the notebook instance, you can connect to the Jupyter server and work in Jupyter notebooks. For example, you can write code to explore a dataset that you can use for model training, train a model, host models by creating Amazon SageMaker endpoints, and validate hosted models. </p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html\\\">How It Works</a>. </p>\"\
    },\
    \"CreateNotebookInstanceLifecycleConfig\":{\
      \"name\":\"CreateNotebookInstanceLifecycleConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateNotebookInstanceLifecycleConfigInput\"},\
      \"output\":{\"shape\":\"CreateNotebookInstanceLifecycleConfigOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Creates a lifecycle configuration that you can associate with a notebook instance. A <i>lifecycle configuration</i> is a collection of shell scripts that run when you create or start a notebook instance.</p> <p>Each lifecycle configuration script has a limit of 16384 characters.</p> <p>The value of the <code>$PATH</code> environment variable that is available to both scripts is <code>/sbin:bin:/usr/sbin:/usr/bin</code>.</p> <p>View CloudWatch Logs for notebook instance lifecycle configurations in log group <code>/aws/sagemaker/NotebookInstances</code> in log stream <code>[notebook-instance-name]/[LifecycleConfigHook]</code>.</p> <p>Lifecycle configuration scripts cannot run for longer than 5 minutes. If a script runs for longer than 5 minutes, it fails and the notebook instance is not created or started.</p> <p>For information about notebook instance lifestyle configurations, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html\\\">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>\"\
    },\
    \"CreatePresignedDomainUrl\":{\
      \"name\":\"CreatePresignedDomainUrl\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreatePresignedDomainUrlRequest\"},\
      \"output\":{\"shape\":\"CreatePresignedDomainUrlResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Creates a URL for a specified UserProfile in a Domain. When accessed in a web browser, the user will be automatically signed in to Amazon SageMaker Studio, and granted access to all of the Apps and files associated with that Amazon Elastic File System (EFS). This operation can only be called when AuthMode equals IAM. </p>\"\
    },\
    \"CreatePresignedNotebookInstanceUrl\":{\
      \"name\":\"CreatePresignedNotebookInstanceUrl\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreatePresignedNotebookInstanceUrlInput\"},\
      \"output\":{\"shape\":\"CreatePresignedNotebookInstanceUrlOutput\"},\
      \"documentation\":\"<p>Returns a URL that you can use to connect to the Jupyter server from a notebook instance. In the Amazon SageMaker console, when you choose <code>Open</code> next to a notebook instance, Amazon SageMaker opens a new tab showing the Jupyter server home page from the notebook instance. The console uses this API to get the URL and show the page.</p> <p>IAM authorization policies for this API are also enforced for every HTTP request and WebSocket frame that attempts to connect to the notebook instance.For example, you can restrict access to this API and to the URL that it returns to a list of IP addresses that you specify. Use the <code>NotIpAddress</code> condition operator and the <code>aws:SourceIP</code> condition context key to specify the list of IP addresses that you want to have access to the notebook instance. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/security_iam_id-based-policy-examples.html#nbi-ip-filter\\\">Limit Access to a Notebook Instance by IP Address</a>.</p> <note> <p>The URL that you get from a call to <a>CreatePresignedNotebookInstanceUrl</a> is valid only for 5 minutes. If you try to use the URL after the 5-minute limit expires, you are directed to the AWS console sign-in page.</p> </note>\"\
    },\
    \"CreateProcessingJob\":{\
      \"name\":\"CreateProcessingJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateProcessingJobRequest\"},\
      \"output\":{\"shape\":\"CreateProcessingJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUse\"},\
        {\"shape\":\"ResourceLimitExceeded\"},\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Creates a processing job.</p>\"\
    },\
    \"CreateTrainingJob\":{\
      \"name\":\"CreateTrainingJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateTrainingJobRequest\"},\
      \"output\":{\"shape\":\"CreateTrainingJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUse\"},\
        {\"shape\":\"ResourceLimitExceeded\"},\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Starts a model training job. After training completes, Amazon SageMaker saves the resulting model artifacts to an Amazon S3 location that you specify. </p> <p>If you choose to host your model using Amazon SageMaker hosting services, you can use the resulting model artifacts as part of the model. You can also use the artifacts in a machine learning service other than Amazon SageMaker, provided that you know how to use them for inferences. </p> <p>In the request body, you provide the following: </p> <ul> <li> <p> <code>AlgorithmSpecification</code> - Identifies the training algorithm to use. </p> </li> <li> <p> <code>HyperParameters</code> - Specify these algorithm-specific parameters to enable the estimation of model parameters during training. Hyperparameters can be tuned to optimize this learning process. For a list of hyperparameters for each training algorithm provided by Amazon SageMaker, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html\\\">Algorithms</a>. </p> </li> <li> <p> <code>InputDataConfig</code> - Describes the training dataset and the Amazon S3, EFS, or FSx location where it is stored.</p> </li> <li> <p> <code>OutputDataConfig</code> - Identifies the Amazon S3 bucket where you want Amazon SageMaker to save the results of model training. </p> <p/> </li> <li> <p> <code>ResourceConfig</code> - Identifies the resources, ML compute instances, and ML storage volumes to deploy for model training. In distributed training, you specify more than one instance. </p> </li> <li> <p> <code>EnableManagedSpotTraining</code> - Optimize the cost of training machine learning models by up to 80% by using Amazon EC2 Spot instances. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html\\\">Managed Spot Training</a>. </p> </li> <li> <p> <code>RoleARN</code> - The Amazon Resource Number (ARN) that Amazon SageMaker assumes to perform tasks on your behalf during model training. You must grant this role the necessary permissions so that Amazon SageMaker can successfully complete model training. </p> </li> <li> <p> <code>StoppingCondition</code> - To help cap training costs, use <code>MaxRuntimeInSeconds</code> to set a time limit for training. Use <code>MaxWaitTimeInSeconds</code> to specify how long you are willing to wait for a managed spot training job to complete. </p> </li> </ul> <p> For more information about Amazon SageMaker, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html\\\">How It Works</a>. </p>\"\
    },\
    \"CreateTransformJob\":{\
      \"name\":\"CreateTransformJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateTransformJobRequest\"},\
      \"output\":{\"shape\":\"CreateTransformJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUse\"},\
        {\"shape\":\"ResourceLimitExceeded\"},\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Starts a transform job. A transform job uses a trained model to get inferences on a dataset and saves these results to an Amazon S3 location that you specify.</p> <p>To perform batch transformations, you create a transform job and use the data that you have readily available.</p> <p>In the request body, you provide the following:</p> <ul> <li> <p> <code>TransformJobName</code> - Identifies the transform job. The name must be unique within an AWS Region in an AWS account.</p> </li> <li> <p> <code>ModelName</code> - Identifies the model to use. <code>ModelName</code> must be the name of an existing Amazon SageMaker model in the same AWS Region and AWS account. For information on creating a model, see <a>CreateModel</a>.</p> </li> <li> <p> <code>TransformInput</code> - Describes the dataset to be transformed and the Amazon S3 location where it is stored.</p> </li> <li> <p> <code>TransformOutput</code> - Identifies the Amazon S3 location where you want Amazon SageMaker to save the results from the transform job.</p> </li> <li> <p> <code>TransformResources</code> - Identifies the ML compute instances for the transform job.</p> </li> </ul> <p>For more information about how batch transformation works, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html\\\">Batch Transform</a>.</p>\"\
    },\
    \"CreateTrial\":{\
      \"name\":\"CreateTrial\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateTrialRequest\"},\
      \"output\":{\"shape\":\"CreateTrialResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"},\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Creates an Amazon SageMaker <i>trial</i>. A trial is a set of steps called <i>trial components</i> that produce a machine learning model. A trial is part of a single Amazon SageMaker <i>experiment</i>.</p> <p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p> <p>You can add tags to a trial and then use the <a>Search</a> API to search for the tags.</p> <p>To get a list of all your trials, call the <a>ListTrials</a> API. To view a trial's properties, call the <a>DescribeTrial</a> API. To create a trial component, call the <a>CreateTrialComponent</a> API.</p>\"\
    },\
    \"CreateTrialComponent\":{\
      \"name\":\"CreateTrialComponent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateTrialComponentRequest\"},\
      \"output\":{\"shape\":\"CreateTrialComponentResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Creates a <i>trial component</i>, which is a stage of a machine learning <i>trial</i>. A trial is composed of one or more trial components. A trial component can be used in multiple trials.</p> <p>Trial components include pre-processing jobs, training jobs, and batch transform jobs.</p> <p>When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked, logged, and indexed. When you use the AWS SDK for Python (Boto), you must use the logging APIs provided by the SDK.</p> <p>You can add tags to a trial component and then use the <a>Search</a> API to search for the tags.</p> <note> <p> <code>CreateTrialComponent</code> can only be invoked from within an Amazon SageMaker managed environment. This includes Amazon SageMaker training jobs, processing jobs, transform jobs, and Amazon SageMaker notebooks. A call to <code>CreateTrialComponent</code> from outside one of these environments results in an error.</p> </note>\"\
    },\
    \"CreateUserProfile\":{\
      \"name\":\"CreateUserProfile\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateUserProfileRequest\"},\
      \"output\":{\"shape\":\"CreateUserProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"},\
        {\"shape\":\"ResourceInUse\"}\
      ],\
      \"documentation\":\"<p>Creates a user profile. A user profile represents a single user within a Domain, and is the main way to reference a \\\"person\\\" for the purposes of sharing, reporting and other user-oriented features. This entity is created during on-boarding to Amazon SageMaker Studio. If an administrator invites a person by email or imports them from SSO, a UserProfile is automatically created. </p> <p> This entity is the primary holder of settings for an individual user and, through the domain, has a reference to the user's private Amazon Elastic File System (EFS) home directory. </p>\"\
    },\
    \"CreateWorkteam\":{\
      \"name\":\"CreateWorkteam\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateWorkteamRequest\"},\
      \"output\":{\"shape\":\"CreateWorkteamResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUse\"},\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Creates a new work team for labeling your data. A work team is defined by one or more Amazon Cognito user pools. You must first create the user pools before you can create a work team.</p> <p>You cannot create more than 25 work teams in an account and region.</p>\"\
    },\
    \"DeleteAlgorithm\":{\
      \"name\":\"DeleteAlgorithm\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteAlgorithmInput\"},\
      \"documentation\":\"<p>Removes the specified algorithm from your account.</p>\"\
    },\
    \"DeleteApp\":{\
      \"name\":\"DeleteApp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteAppRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUse\"},\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Used to stop and delete an app.</p>\"\
    },\
    \"DeleteCodeRepository\":{\
      \"name\":\"DeleteCodeRepository\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCodeRepositoryInput\"},\
      \"documentation\":\"<p>Deletes the specified Git repository from your account.</p>\"\
    },\
    \"DeleteDomain\":{\
      \"name\":\"DeleteDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDomainRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUse\"},\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Used to delete a domain. Use with caution. If <code>RetentionPolicy</code> is set to <code>Delete</code>, all of the members of the domain will lose access to their EFS volume, including data, notebooks, and other artifacts. </p>\"\
    },\
    \"DeleteEndpoint\":{\
      \"name\":\"DeleteEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteEndpointInput\"},\
      \"documentation\":\"<p>Deletes an endpoint. Amazon SageMaker frees up all of the resources that were deployed when the endpoint was created. </p> <p>Amazon SageMaker retires any custom KMS key grants associated with the endpoint, meaning you don't need to use the <a href=\\\"http://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html\\\">RevokeGrant</a> API call.</p>\"\
    },\
    \"DeleteEndpointConfig\":{\
      \"name\":\"DeleteEndpointConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteEndpointConfigInput\"},\
      \"documentation\":\"<p>Deletes an endpoint configuration. The <code>DeleteEndpointConfig</code> API deletes only the specified configuration. It does not delete endpoints created using the configuration. </p>\"\
    },\
    \"DeleteExperiment\":{\
      \"name\":\"DeleteExperiment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteExperimentRequest\"},\
      \"output\":{\"shape\":\"DeleteExperimentResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Deletes an Amazon SageMaker experiment. All trials associated with the experiment must be deleted first. Use the <a>ListTrials</a> API to get a list of the trials associated with the experiment.</p>\"\
    },\
    \"DeleteFlowDefinition\":{\
      \"name\":\"DeleteFlowDefinition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteFlowDefinitionRequest\"},\
      \"output\":{\"shape\":\"DeleteFlowDefinitionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified flow definition.</p>\"\
    },\
    \"DeleteModel\":{\
      \"name\":\"DeleteModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteModelInput\"},\
      \"documentation\":\"<p>Deletes a model. The <code>DeleteModel</code> API deletes only the model entry that was created in Amazon SageMaker when you called the <a>CreateModel</a> API. It does not delete model artifacts, inference code, or the IAM role that you specified when creating the model. </p>\"\
    },\
    \"DeleteModelPackage\":{\
      \"name\":\"DeleteModelPackage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteModelPackageInput\"},\
      \"documentation\":\"<p>Deletes a model package.</p> <p>A model package is used to create Amazon SageMaker models or list on AWS Marketplace. Buyers can subscribe to model packages listed on AWS Marketplace to create models in Amazon SageMaker.</p>\"\
    },\
    \"DeleteMonitoringSchedule\":{\
      \"name\":\"DeleteMonitoringSchedule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteMonitoringScheduleRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Deletes a monitoring schedule. Also stops the schedule had not already been stopped. This does not delete the job execution history of the monitoring schedule. </p>\"\
    },\
    \"DeleteNotebookInstance\":{\
      \"name\":\"DeleteNotebookInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteNotebookInstanceInput\"},\
      \"documentation\":\"<p> Deletes an Amazon SageMaker notebook instance. Before you can delete a notebook instance, you must call the <code>StopNotebookInstance</code> API. </p> <important> <p>When you delete a notebook instance, you lose all of your data. Amazon SageMaker removes the ML compute instance, and deletes the ML storage volume and the network interface associated with the notebook instance. </p> </important>\"\
    },\
    \"DeleteNotebookInstanceLifecycleConfig\":{\
      \"name\":\"DeleteNotebookInstanceLifecycleConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteNotebookInstanceLifecycleConfigInput\"},\
      \"documentation\":\"<p>Deletes a notebook instance lifecycle configuration.</p>\"\
    },\
    \"DeleteTags\":{\
      \"name\":\"DeleteTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTagsInput\"},\
      \"output\":{\"shape\":\"DeleteTagsOutput\"},\
      \"documentation\":\"<p>Deletes the specified tags from an Amazon SageMaker resource.</p> <p>To list a resource's tags, use the <code>ListTags</code> API. </p> <note> <p>When you call this API to delete tags from a hyperparameter tuning job, the deleted tags are not removed from training jobs that the hyperparameter tuning job launched before you called this API.</p> </note>\"\
    },\
    \"DeleteTrial\":{\
      \"name\":\"DeleteTrial\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTrialRequest\"},\
      \"output\":{\"shape\":\"DeleteTrialResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified trial. All trial components that make up the trial must be deleted first. Use the <a>DescribeTrialComponent</a> API to get the list of trial components.</p>\"\
    },\
    \"DeleteTrialComponent\":{\
      \"name\":\"DeleteTrialComponent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTrialComponentRequest\"},\
      \"output\":{\"shape\":\"DeleteTrialComponentResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified trial component. A trial component must be disassociated from all trials before the trial component can be deleted. To disassociate a trial component from a trial, call the <a>DisassociateTrialComponent</a> API.</p>\"\
    },\
    \"DeleteUserProfile\":{\
      \"name\":\"DeleteUserProfile\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteUserProfileRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUse\"},\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Deletes a user profile.</p>\"\
    },\
    \"DeleteWorkteam\":{\
      \"name\":\"DeleteWorkteam\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteWorkteamRequest\"},\
      \"output\":{\"shape\":\"DeleteWorkteamResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Deletes an existing work team. This operation can't be undone.</p>\"\
    },\
    \"DescribeAlgorithm\":{\
      \"name\":\"DescribeAlgorithm\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAlgorithmInput\"},\
      \"output\":{\"shape\":\"DescribeAlgorithmOutput\"},\
      \"documentation\":\"<p>Returns a description of the specified algorithm that is in your account.</p>\"\
    },\
    \"DescribeApp\":{\
      \"name\":\"DescribeApp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAppRequest\"},\
      \"output\":{\"shape\":\"DescribeAppResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Describes the app.</p>\"\
    },\
    \"DescribeAutoMLJob\":{\
      \"name\":\"DescribeAutoMLJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAutoMLJobRequest\"},\
      \"output\":{\"shape\":\"DescribeAutoMLJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Returns information about an Amazon SageMaker job.</p>\"\
    },\
    \"DescribeCodeRepository\":{\
      \"name\":\"DescribeCodeRepository\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeCodeRepositoryInput\"},\
      \"output\":{\"shape\":\"DescribeCodeRepositoryOutput\"},\
      \"documentation\":\"<p>Gets details about the specified Git repository.</p>\"\
    },\
    \"DescribeCompilationJob\":{\
      \"name\":\"DescribeCompilationJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeCompilationJobRequest\"},\
      \"output\":{\"shape\":\"DescribeCompilationJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Returns information about a model compilation job.</p> <p>To create a model compilation job, use <a>CreateCompilationJob</a>. To get information about multiple model compilation jobs, use <a>ListCompilationJobs</a>.</p>\"\
    },\
    \"DescribeDomain\":{\
      \"name\":\"DescribeDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDomainRequest\"},\
      \"output\":{\"shape\":\"DescribeDomainResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>The desciption of the domain.</p>\"\
    },\
    \"DescribeEndpoint\":{\
      \"name\":\"DescribeEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeEndpointInput\"},\
      \"output\":{\"shape\":\"DescribeEndpointOutput\"},\
      \"documentation\":\"<p>Returns the description of an endpoint.</p>\"\
    },\
    \"DescribeEndpointConfig\":{\
      \"name\":\"DescribeEndpointConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeEndpointConfigInput\"},\
      \"output\":{\"shape\":\"DescribeEndpointConfigOutput\"},\
      \"documentation\":\"<p>Returns the description of an endpoint configuration created using the <code>CreateEndpointConfig</code> API.</p>\"\
    },\
    \"DescribeExperiment\":{\
      \"name\":\"DescribeExperiment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeExperimentRequest\"},\
      \"output\":{\"shape\":\"DescribeExperimentResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Provides a list of an experiment's properties.</p>\"\
    },\
    \"DescribeFlowDefinition\":{\
      \"name\":\"DescribeFlowDefinition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeFlowDefinitionRequest\"},\
      \"output\":{\"shape\":\"DescribeFlowDefinitionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Returns information about the specified flow definition.</p>\"\
    },\
    \"DescribeHumanTaskUi\":{\
      \"name\":\"DescribeHumanTaskUi\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeHumanTaskUiRequest\"},\
      \"output\":{\"shape\":\"DescribeHumanTaskUiResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Returns information about the requested human task user interface.</p>\"\
    },\
    \"DescribeHyperParameterTuningJob\":{\
      \"name\":\"DescribeHyperParameterTuningJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeHyperParameterTuningJobRequest\"},\
      \"output\":{\"shape\":\"DescribeHyperParameterTuningJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Gets a description of a hyperparameter tuning job.</p>\"\
    },\
    \"DescribeLabelingJob\":{\
      \"name\":\"DescribeLabelingJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLabelingJobRequest\"},\
      \"output\":{\"shape\":\"DescribeLabelingJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Gets information about a labeling job.</p>\"\
    },\
    \"DescribeModel\":{\
      \"name\":\"DescribeModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeModelInput\"},\
      \"output\":{\"shape\":\"DescribeModelOutput\"},\
      \"documentation\":\"<p>Describes a model that you created using the <code>CreateModel</code> API.</p>\"\
    },\
    \"DescribeModelPackage\":{\
      \"name\":\"DescribeModelPackage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeModelPackageInput\"},\
      \"output\":{\"shape\":\"DescribeModelPackageOutput\"},\
      \"documentation\":\"<p>Returns a description of the specified model package, which is used to create Amazon SageMaker models or list them on AWS Marketplace.</p> <p>To create models in Amazon SageMaker, buyers can subscribe to model packages listed on AWS Marketplace.</p>\"\
    },\
    \"DescribeMonitoringSchedule\":{\
      \"name\":\"DescribeMonitoringSchedule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeMonitoringScheduleRequest\"},\
      \"output\":{\"shape\":\"DescribeMonitoringScheduleResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Describes the schedule for a monitoring job.</p>\"\
    },\
    \"DescribeNotebookInstance\":{\
      \"name\":\"DescribeNotebookInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeNotebookInstanceInput\"},\
      \"output\":{\"shape\":\"DescribeNotebookInstanceOutput\"},\
      \"documentation\":\"<p>Returns information about a notebook instance.</p>\"\
    },\
    \"DescribeNotebookInstanceLifecycleConfig\":{\
      \"name\":\"DescribeNotebookInstanceLifecycleConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeNotebookInstanceLifecycleConfigInput\"},\
      \"output\":{\"shape\":\"DescribeNotebookInstanceLifecycleConfigOutput\"},\
      \"documentation\":\"<p>Returns a description of a notebook instance lifecycle configuration.</p> <p>For information about notebook instance lifestyle configurations, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html\\\">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>\"\
    },\
    \"DescribeProcessingJob\":{\
      \"name\":\"DescribeProcessingJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeProcessingJobRequest\"},\
      \"output\":{\"shape\":\"DescribeProcessingJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Returns a description of a processing job.</p>\"\
    },\
    \"DescribeSubscribedWorkteam\":{\
      \"name\":\"DescribeSubscribedWorkteam\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSubscribedWorkteamRequest\"},\
      \"output\":{\"shape\":\"DescribeSubscribedWorkteamResponse\"},\
      \"documentation\":\"<p>Gets information about a work team provided by a vendor. It returns details about the subscription with a vendor in the AWS Marketplace.</p>\"\
    },\
    \"DescribeTrainingJob\":{\
      \"name\":\"DescribeTrainingJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTrainingJobRequest\"},\
      \"output\":{\"shape\":\"DescribeTrainingJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Returns information about a training job.</p>\"\
    },\
    \"DescribeTransformJob\":{\
      \"name\":\"DescribeTransformJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTransformJobRequest\"},\
      \"output\":{\"shape\":\"DescribeTransformJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Returns information about a transform job.</p>\"\
    },\
    \"DescribeTrial\":{\
      \"name\":\"DescribeTrial\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTrialRequest\"},\
      \"output\":{\"shape\":\"DescribeTrialResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Provides a list of a trial's properties.</p>\"\
    },\
    \"DescribeTrialComponent\":{\
      \"name\":\"DescribeTrialComponent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTrialComponentRequest\"},\
      \"output\":{\"shape\":\"DescribeTrialComponentResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Provides a list of a trials component's properties.</p>\"\
    },\
    \"DescribeUserProfile\":{\
      \"name\":\"DescribeUserProfile\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeUserProfileRequest\"},\
      \"output\":{\"shape\":\"DescribeUserProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Describes the user profile.</p>\"\
    },\
    \"DescribeWorkforce\":{\
      \"name\":\"DescribeWorkforce\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeWorkforceRequest\"},\
      \"output\":{\"shape\":\"DescribeWorkforceResponse\"},\
      \"documentation\":\"<p>Lists private workforce information, including workforce name, Amazon Resource Name (ARN), and, if applicable, allowed IP address ranges (<a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html\\\">CIDRs</a>). Allowable IP address ranges are the IP addresses that workers can use to access tasks. </p> <important> <p>This operation applies only to private workforces.</p> </important>\"\
    },\
    \"DescribeWorkteam\":{\
      \"name\":\"DescribeWorkteam\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeWorkteamRequest\"},\
      \"output\":{\"shape\":\"DescribeWorkteamResponse\"},\
      \"documentation\":\"<p>Gets information about a specific work team. You can see information such as the create date, the last updated date, membership information, and the work team's Amazon Resource Name (ARN).</p>\"\
    },\
    \"DisassociateTrialComponent\":{\
      \"name\":\"DisassociateTrialComponent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisassociateTrialComponentRequest\"},\
      \"output\":{\"shape\":\"DisassociateTrialComponentResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Disassociates a trial component from a trial. This doesn't effect other trials the component is associated with. Before you can delete a component, you must disassociate the component from all trials it is associated with. To associate a trial component with a trial, call the <a>AssociateTrialComponent</a> API.</p> <p>To get a list of the trials a component is associated with, use the <a>Search</a> API. Specify <code>ExperimentTrialComponent</code> for the <code>Resource</code> parameter. The list appears in the response under <code>Results.TrialComponent.Parents</code>.</p>\"\
    },\
    \"GetSearchSuggestions\":{\
      \"name\":\"GetSearchSuggestions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetSearchSuggestionsRequest\"},\
      \"output\":{\"shape\":\"GetSearchSuggestionsResponse\"},\
      \"documentation\":\"<p>An auto-complete API for the search functionality in the Amazon SageMaker console. It returns suggestions of possible matches for the property name to use in <code>Search</code> queries. Provides suggestions for <code>HyperParameters</code>, <code>Tags</code>, and <code>Metrics</code>.</p>\"\
    },\
    \"ListAlgorithms\":{\
      \"name\":\"ListAlgorithms\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListAlgorithmsInput\"},\
      \"output\":{\"shape\":\"ListAlgorithmsOutput\"},\
      \"documentation\":\"<p>Lists the machine learning algorithms that have been created.</p>\"\
    },\
    \"ListApps\":{\
      \"name\":\"ListApps\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListAppsRequest\"},\
      \"output\":{\"shape\":\"ListAppsResponse\"},\
      \"documentation\":\"<p>Lists apps.</p>\"\
    },\
    \"ListAutoMLJobs\":{\
      \"name\":\"ListAutoMLJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListAutoMLJobsRequest\"},\
      \"output\":{\"shape\":\"ListAutoMLJobsResponse\"},\
      \"documentation\":\"<p>Request a list of jobs.</p>\"\
    },\
    \"ListCandidatesForAutoMLJob\":{\
      \"name\":\"ListCandidatesForAutoMLJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListCandidatesForAutoMLJobRequest\"},\
      \"output\":{\"shape\":\"ListCandidatesForAutoMLJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>List the Candidates created for the job.</p>\"\
    },\
    \"ListCodeRepositories\":{\
      \"name\":\"ListCodeRepositories\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListCodeRepositoriesInput\"},\
      \"output\":{\"shape\":\"ListCodeRepositoriesOutput\"},\
      \"documentation\":\"<p>Gets a list of the Git repositories in your account.</p>\"\
    },\
    \"ListCompilationJobs\":{\
      \"name\":\"ListCompilationJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListCompilationJobsRequest\"},\
      \"output\":{\"shape\":\"ListCompilationJobsResponse\"},\
      \"documentation\":\"<p>Lists model compilation jobs that satisfy various filters.</p> <p>To create a model compilation job, use <a>CreateCompilationJob</a>. To get information about a particular model compilation job you have created, use <a>DescribeCompilationJob</a>.</p>\"\
    },\
    \"ListDomains\":{\
      \"name\":\"ListDomains\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDomainsRequest\"},\
      \"output\":{\"shape\":\"ListDomainsResponse\"},\
      \"documentation\":\"<p>Lists the domains.</p>\"\
    },\
    \"ListEndpointConfigs\":{\
      \"name\":\"ListEndpointConfigs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListEndpointConfigsInput\"},\
      \"output\":{\"shape\":\"ListEndpointConfigsOutput\"},\
      \"documentation\":\"<p>Lists endpoint configurations.</p>\"\
    },\
    \"ListEndpoints\":{\
      \"name\":\"ListEndpoints\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListEndpointsInput\"},\
      \"output\":{\"shape\":\"ListEndpointsOutput\"},\
      \"documentation\":\"<p>Lists endpoints.</p>\"\
    },\
    \"ListExperiments\":{\
      \"name\":\"ListExperiments\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListExperimentsRequest\"},\
      \"output\":{\"shape\":\"ListExperimentsResponse\"},\
      \"documentation\":\"<p>Lists all the experiments in your account. The list can be filtered to show only experiments that were created in a specific time range. The list can be sorted by experiment name or creation time.</p>\"\
    },\
    \"ListFlowDefinitions\":{\
      \"name\":\"ListFlowDefinitions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListFlowDefinitionsRequest\"},\
      \"output\":{\"shape\":\"ListFlowDefinitionsResponse\"},\
      \"documentation\":\"<p>Returns information about the flow definitions in your account.</p>\"\
    },\
    \"ListHumanTaskUis\":{\
      \"name\":\"ListHumanTaskUis\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListHumanTaskUisRequest\"},\
      \"output\":{\"shape\":\"ListHumanTaskUisResponse\"},\
      \"documentation\":\"<p>Returns information about the human task user interfaces in your account.</p>\"\
    },\
    \"ListHyperParameterTuningJobs\":{\
      \"name\":\"ListHyperParameterTuningJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListHyperParameterTuningJobsRequest\"},\
      \"output\":{\"shape\":\"ListHyperParameterTuningJobsResponse\"},\
      \"documentation\":\"<p>Gets a list of <a>HyperParameterTuningJobSummary</a> objects that describe the hyperparameter tuning jobs launched in your account.</p>\"\
    },\
    \"ListLabelingJobs\":{\
      \"name\":\"ListLabelingJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListLabelingJobsRequest\"},\
      \"output\":{\"shape\":\"ListLabelingJobsResponse\"},\
      \"documentation\":\"<p>Gets a list of labeling jobs.</p>\"\
    },\
    \"ListLabelingJobsForWorkteam\":{\
      \"name\":\"ListLabelingJobsForWorkteam\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListLabelingJobsForWorkteamRequest\"},\
      \"output\":{\"shape\":\"ListLabelingJobsForWorkteamResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Gets a list of labeling jobs assigned to a specified work team.</p>\"\
    },\
    \"ListModelPackages\":{\
      \"name\":\"ListModelPackages\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListModelPackagesInput\"},\
      \"output\":{\"shape\":\"ListModelPackagesOutput\"},\
      \"documentation\":\"<p>Lists the model packages that have been created.</p>\"\
    },\
    \"ListModels\":{\
      \"name\":\"ListModels\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListModelsInput\"},\
      \"output\":{\"shape\":\"ListModelsOutput\"},\
      \"documentation\":\"<p>Lists models created with the <a>CreateModel</a> API.</p>\"\
    },\
    \"ListMonitoringExecutions\":{\
      \"name\":\"ListMonitoringExecutions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListMonitoringExecutionsRequest\"},\
      \"output\":{\"shape\":\"ListMonitoringExecutionsResponse\"},\
      \"documentation\":\"<p>Returns list of all monitoring job executions.</p>\"\
    },\
    \"ListMonitoringSchedules\":{\
      \"name\":\"ListMonitoringSchedules\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListMonitoringSchedulesRequest\"},\
      \"output\":{\"shape\":\"ListMonitoringSchedulesResponse\"},\
      \"documentation\":\"<p>Returns list of all monitoring schedules.</p>\"\
    },\
    \"ListNotebookInstanceLifecycleConfigs\":{\
      \"name\":\"ListNotebookInstanceLifecycleConfigs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListNotebookInstanceLifecycleConfigsInput\"},\
      \"output\":{\"shape\":\"ListNotebookInstanceLifecycleConfigsOutput\"},\
      \"documentation\":\"<p>Lists notebook instance lifestyle configurations created with the <a>CreateNotebookInstanceLifecycleConfig</a> API.</p>\"\
    },\
    \"ListNotebookInstances\":{\
      \"name\":\"ListNotebookInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListNotebookInstancesInput\"},\
      \"output\":{\"shape\":\"ListNotebookInstancesOutput\"},\
      \"documentation\":\"<p>Returns a list of the Amazon SageMaker notebook instances in the requester's account in an AWS Region. </p>\"\
    },\
    \"ListProcessingJobs\":{\
      \"name\":\"ListProcessingJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListProcessingJobsRequest\"},\
      \"output\":{\"shape\":\"ListProcessingJobsResponse\"},\
      \"documentation\":\"<p>Lists processing jobs that satisfy various filters.</p>\"\
    },\
    \"ListSubscribedWorkteams\":{\
      \"name\":\"ListSubscribedWorkteams\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListSubscribedWorkteamsRequest\"},\
      \"output\":{\"shape\":\"ListSubscribedWorkteamsResponse\"},\
      \"documentation\":\"<p>Gets a list of the work teams that you are subscribed to in the AWS Marketplace. The list may be empty if no work team satisfies the filter specified in the <code>NameContains</code> parameter.</p>\"\
    },\
    \"ListTags\":{\
      \"name\":\"ListTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTagsInput\"},\
      \"output\":{\"shape\":\"ListTagsOutput\"},\
      \"documentation\":\"<p>Returns the tags for the specified Amazon SageMaker resource.</p>\"\
    },\
    \"ListTrainingJobs\":{\
      \"name\":\"ListTrainingJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTrainingJobsRequest\"},\
      \"output\":{\"shape\":\"ListTrainingJobsResponse\"},\
      \"documentation\":\"<p>Lists training jobs.</p>\"\
    },\
    \"ListTrainingJobsForHyperParameterTuningJob\":{\
      \"name\":\"ListTrainingJobsForHyperParameterTuningJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTrainingJobsForHyperParameterTuningJobRequest\"},\
      \"output\":{\"shape\":\"ListTrainingJobsForHyperParameterTuningJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Gets a list of <a>TrainingJobSummary</a> objects that describe the training jobs that a hyperparameter tuning job launched.</p>\"\
    },\
    \"ListTransformJobs\":{\
      \"name\":\"ListTransformJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTransformJobsRequest\"},\
      \"output\":{\"shape\":\"ListTransformJobsResponse\"},\
      \"documentation\":\"<p>Lists transform jobs.</p>\"\
    },\
    \"ListTrialComponents\":{\
      \"name\":\"ListTrialComponents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTrialComponentsRequest\"},\
      \"output\":{\"shape\":\"ListTrialComponentsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Lists the trial components in your account. You can sort the list by trial component name or creation time. You can filter the list to show only components that were created in a specific time range. You can also filter on one of the following:</p> <ul> <li> <p> <code>ExperimentName</code> </p> </li> <li> <p> <code>SourceArn</code> </p> </li> <li> <p> <code>TrialName</code> </p> </li> </ul>\"\
    },\
    \"ListTrials\":{\
      \"name\":\"ListTrials\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTrialsRequest\"},\
      \"output\":{\"shape\":\"ListTrialsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Lists the trials in your account. Specify an experiment name to limit the list to the trials that are part of that experiment. Specify a trial component name to limit the list to the trials that associated with that trial component. The list can be filtered to show only trials that were created in a specific time range. The list can be sorted by trial name or creation time.</p>\"\
    },\
    \"ListUserProfiles\":{\
      \"name\":\"ListUserProfiles\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListUserProfilesRequest\"},\
      \"output\":{\"shape\":\"ListUserProfilesResponse\"},\
      \"documentation\":\"<p>Lists user profiles.</p>\"\
    },\
    \"ListWorkteams\":{\
      \"name\":\"ListWorkteams\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListWorkteamsRequest\"},\
      \"output\":{\"shape\":\"ListWorkteamsResponse\"},\
      \"documentation\":\"<p>Gets a list of work teams that you have defined in a region. The list may be empty if no work team satisfies the filter specified in the <code>NameContains</code> parameter.</p>\"\
    },\
    \"RenderUiTemplate\":{\
      \"name\":\"RenderUiTemplate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RenderUiTemplateRequest\"},\
      \"output\":{\"shape\":\"RenderUiTemplateResponse\"},\
      \"documentation\":\"<p>Renders the UI template so that you can preview the worker's experience. </p>\"\
    },\
    \"Search\":{\
      \"name\":\"Search\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SearchRequest\"},\
      \"output\":{\"shape\":\"SearchResponse\"},\
      \"documentation\":\"<p>Finds Amazon SageMaker resources that match a search query. Matching resources are returned as a list of <code>SearchRecord</code> objects in the response. You can sort the search results by any resource property in a ascending or descending order.</p> <p>You can query against the following value types: numeric, text, Boolean, and timestamp.</p>\"\
    },\
    \"StartMonitoringSchedule\":{\
      \"name\":\"StartMonitoringSchedule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartMonitoringScheduleRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Starts a previously stopped monitoring schedule.</p> <note> <p>New monitoring schedules are immediately started after creation.</p> </note>\"\
    },\
    \"StartNotebookInstance\":{\
      \"name\":\"StartNotebookInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartNotebookInstanceInput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Launches an ML compute instance with the latest version of the libraries and attaches your ML storage volume. After configuring the notebook instance, Amazon SageMaker sets the notebook instance status to <code>InService</code>. A notebook instance's status must be <code>InService</code> before you can connect to your Jupyter notebook. </p>\"\
    },\
    \"StopAutoMLJob\":{\
      \"name\":\"StopAutoMLJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopAutoMLJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>A method for forcing the termination of a running job.</p>\"\
    },\
    \"StopCompilationJob\":{\
      \"name\":\"StopCompilationJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopCompilationJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Stops a model compilation job.</p> <p> To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal. This gracefully shuts the job down. If the job hasn't stopped, it sends the SIGKILL signal.</p> <p>When it receives a <code>StopCompilationJob</code> request, Amazon SageMaker changes the <a>CompilationJobSummary$CompilationJobStatus</a> of the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it sets the <a>CompilationJobSummary$CompilationJobStatus</a> to <code>Stopped</code>. </p>\"\
    },\
    \"StopHyperParameterTuningJob\":{\
      \"name\":\"StopHyperParameterTuningJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopHyperParameterTuningJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Stops a running hyperparameter tuning job and all running training jobs that the tuning job launched.</p> <p>All model artifacts output from the training jobs are stored in Amazon Simple Storage Service (Amazon S3). All data that the training jobs write to Amazon CloudWatch Logs are still available in CloudWatch. After the tuning job moves to the <code>Stopped</code> state, it releases all reserved resources for the tuning job.</p>\"\
    },\
    \"StopLabelingJob\":{\
      \"name\":\"StopLabelingJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopLabelingJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Stops a running labeling job. A job that is stopped cannot be restarted. Any results obtained before the job is stopped are placed in the Amazon S3 output bucket.</p>\"\
    },\
    \"StopMonitoringSchedule\":{\
      \"name\":\"StopMonitoringSchedule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopMonitoringScheduleRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Stops a previously started monitoring schedule.</p>\"\
    },\
    \"StopNotebookInstance\":{\
      \"name\":\"StopNotebookInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopNotebookInstanceInput\"},\
      \"documentation\":\"<p>Terminates the ML compute instance. Before terminating the instance, Amazon SageMaker disconnects the ML storage volume from it. Amazon SageMaker preserves the ML storage volume. Amazon SageMaker stops charging you for the ML compute instance when you call <code>StopNotebookInstance</code>.</p> <p>To access data on the ML storage volume for a notebook instance that has been terminated, call the <code>StartNotebookInstance</code> API. <code>StartNotebookInstance</code> launches another ML compute instance, configures it, and attaches the preserved ML storage volume so you can continue your work. </p>\"\
    },\
    \"StopProcessingJob\":{\
      \"name\":\"StopProcessingJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopProcessingJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Stops a processing job.</p>\"\
    },\
    \"StopTrainingJob\":{\
      \"name\":\"StopTrainingJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopTrainingJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Stops a training job. To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms might use this 120-second window to save the model artifacts, so the results of the training is not lost. </p> <p>When it receives a <code>StopTrainingJob</code> request, Amazon SageMaker changes the status of the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it sets the status to <code>Stopped</code>.</p>\"\
    },\
    \"StopTransformJob\":{\
      \"name\":\"StopTransformJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopTransformJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Stops a transform job.</p> <p>When Amazon SageMaker receives a <code>StopTransformJob</code> request, the status of the job changes to <code>Stopping</code>. After Amazon SageMaker stops the job, the status is set to <code>Stopped</code>. When you stop a transform job before it is completed, Amazon SageMaker doesn't store the job's output in Amazon S3.</p>\"\
    },\
    \"UpdateCodeRepository\":{\
      \"name\":\"UpdateCodeRepository\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateCodeRepositoryInput\"},\
      \"output\":{\"shape\":\"UpdateCodeRepositoryOutput\"},\
      \"documentation\":\"<p>Updates the specified Git repository with the specified values.</p>\"\
    },\
    \"UpdateDomain\":{\
      \"name\":\"UpdateDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateDomainRequest\"},\
      \"output\":{\"shape\":\"UpdateDomainResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"},\
        {\"shape\":\"ResourceInUse\"},\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Updates a domain. Changes will impact all of the people in the domain.</p>\"\
    },\
    \"UpdateEndpoint\":{\
      \"name\":\"UpdateEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateEndpointInput\"},\
      \"output\":{\"shape\":\"UpdateEndpointOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Deploys the new <code>EndpointConfig</code> specified in the request, switches to using newly created endpoint, and then deletes resources provisioned for the endpoint using the previous <code>EndpointConfig</code> (there is no availability loss). </p> <p>When Amazon SageMaker receives the request, it sets the endpoint status to <code>Updating</code>. After updating the endpoint, it sets the status to <code>InService</code>. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API. </p> <note> <p>You must not delete an <code>EndpointConfig</code> in use by an endpoint that is live or while the <code>UpdateEndpoint</code> or <code>CreateEndpoint</code> operations are being performed on the endpoint. To update an endpoint, you must create a new <code>EndpointConfig</code>.</p> </note>\"\
    },\
    \"UpdateEndpointWeightsAndCapacities\":{\
      \"name\":\"UpdateEndpointWeightsAndCapacities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateEndpointWeightsAndCapacitiesInput\"},\
      \"output\":{\"shape\":\"UpdateEndpointWeightsAndCapacitiesOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Updates variant weight of one or more variants associated with an existing endpoint, or capacity of one variant associated with an existing endpoint. When it receives the request, Amazon SageMaker sets the endpoint status to <code>Updating</code>. After updating the endpoint, it sets the status to <code>InService</code>. To check the status of an endpoint, use the <a>DescribeEndpoint</a> API. </p>\"\
    },\
    \"UpdateExperiment\":{\
      \"name\":\"UpdateExperiment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateExperimentRequest\"},\
      \"output\":{\"shape\":\"UpdateExperimentResponse\"},\
      \"errors\":[\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Adds, updates, or removes the description of an experiment. Updates the display name of an experiment.</p>\"\
    },\
    \"UpdateMonitoringSchedule\":{\
      \"name\":\"UpdateMonitoringSchedule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateMonitoringScheduleRequest\"},\
      \"output\":{\"shape\":\"UpdateMonitoringScheduleResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"},\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Updates a previously created schedule.</p>\"\
    },\
    \"UpdateNotebookInstance\":{\
      \"name\":\"UpdateNotebookInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateNotebookInstanceInput\"},\
      \"output\":{\"shape\":\"UpdateNotebookInstanceOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Updates a notebook instance. NotebookInstance updates include upgrading or downgrading the ML compute instance used for your notebook instance to accommodate changes in your workload requirements.</p>\"\
    },\
    \"UpdateNotebookInstanceLifecycleConfig\":{\
      \"name\":\"UpdateNotebookInstanceLifecycleConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateNotebookInstanceLifecycleConfigInput\"},\
      \"output\":{\"shape\":\"UpdateNotebookInstanceLifecycleConfigOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Updates a notebook instance lifecycle configuration created with the <a>CreateNotebookInstanceLifecycleConfig</a> API.</p>\"\
    },\
    \"UpdateTrial\":{\
      \"name\":\"UpdateTrial\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateTrialRequest\"},\
      \"output\":{\"shape\":\"UpdateTrialResponse\"},\
      \"errors\":[\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Updates the display name of a trial.</p>\"\
    },\
    \"UpdateTrialComponent\":{\
      \"name\":\"UpdateTrialComponent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateTrialComponentRequest\"},\
      \"output\":{\"shape\":\"UpdateTrialComponentResponse\"},\
      \"errors\":[\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Updates one or more properties of a trial component.</p>\"\
    },\
    \"UpdateUserProfile\":{\
      \"name\":\"UpdateUserProfile\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateUserProfileRequest\"},\
      \"output\":{\"shape\":\"UpdateUserProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"},\
        {\"shape\":\"ResourceInUse\"},\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Updates a user profile.</p>\"\
    },\
    \"UpdateWorkforce\":{\
      \"name\":\"UpdateWorkforce\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateWorkforceRequest\"},\
      \"output\":{\"shape\":\"UpdateWorkforceResponse\"},\
      \"documentation\":\"<p>Restricts access to tasks assigned to workers in the specified workforce to those within specific ranges of IP addresses. You specify allowed IP addresses by creating a list of up to four <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html\\\">CIDRs</a>.</p> <p>By default, a workforce isn't restricted to specific IP addresses. If you specify a range of IP addresses, workers who attempt to access tasks using any IP address outside the specified range are denied access and get a <code>Not Found</code> error message on the worker portal. After restricting access with this operation, you can see the allowed IP values for a private workforce with the operation.</p> <important> <p>This operation applies only to private workforces.</p> </important>\"\
    },\
    \"UpdateWorkteam\":{\
      \"name\":\"UpdateWorkteam\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateWorkteamRequest\"},\
      \"output\":{\"shape\":\"UpdateWorkteamResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceLimitExceeded\"}\
      ],\
      \"documentation\":\"<p>Updates an existing work team with new member definitions or description.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"Accept\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\".*\"\
    },\
    \"AccountId\":{\
      \"type\":\"string\",\
      \"pattern\":\"^\\\\d+$\"\
    },\
    \"AddTagsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource that you want to tag.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of <code>Tag</code> objects. Each tag is a key-value pair. Only the <code>key</code> parameter is required. If you don't specify a value, Amazon SageMaker sets the value to an empty string. </p>\"\
        }\
      }\
    },\
    \"AddTagsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of tags associated with the Amazon SageMaker resource.</p>\"\
        }\
      }\
    },\
    \"AdditionalCodeRepositoryNamesOrUrls\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CodeRepositoryNameOrUrl\"},\
      \"max\":3\
    },\
    \"AlgorithmArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:algorithm/.*\"\
    },\
    \"AlgorithmImage\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"pattern\":\".*\"\
    },\
    \"AlgorithmSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\"\
      ]\
    },\
    \"AlgorithmSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrainingInputMode\"],\
      \"members\":{\
        \"TrainingImage\":{\
          \"shape\":\"AlgorithmImage\",\
          \"documentation\":\"<p>The registry path of the Docker image that contains the training algorithm. For information about docker registry paths for built-in algorithms, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-algo-docker-registry-paths.html\\\">Algorithms Provided by Amazon SageMaker: Common Parameters</a>. Amazon SageMaker supports both <code>registry/repository[:tag]</code> and <code>registry/repository[@digest]</code> image path formats. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html\\\">Using Your Own Algorithms with Amazon SageMaker</a>.</p>\"\
        },\
        \"AlgorithmName\":{\
          \"shape\":\"ArnOrName\",\
          \"documentation\":\"<p>The name of the algorithm resource to use for the training job. This must be an algorithm resource that you created or subscribe to on AWS Marketplace. If you specify a value for this parameter, you can't specify a value for <code>TrainingImage</code>.</p>\"\
        },\
        \"TrainingInputMode\":{\
          \"shape\":\"TrainingInputMode\",\
          \"documentation\":\"<p>The input mode that the algorithm supports. For the input modes that Amazon SageMaker algorithms support, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html\\\">Algorithms</a>. If an algorithm supports the <code>File</code> input mode, Amazon SageMaker downloads the training data from S3 to the provisioned ML storage Volume, and mounts the directory to docker volume for training container. If an algorithm supports the <code>Pipe</code> input mode, Amazon SageMaker streams data directly from S3 to the container. </p> <p> In File mode, make sure you provision ML storage volume with sufficient capacity to accommodate the data download from S3. In addition to the training data, the ML storage volume also stores the output model. The algorithm container use ML storage volume to also store intermediate information, if any. </p> <p> For distributed algorithms using File mode, training data is distributed uniformly, and your training duration is predictable if the input data objects size is approximately same. Amazon SageMaker does not split the files any further for model training. If the object sizes are skewed, training won't be optimal as the data distribution is also skewed where one host in a training cluster is overloaded, thus becoming bottleneck in training. </p>\"\
        },\
        \"MetricDefinitions\":{\
          \"shape\":\"MetricDefinitionList\",\
          \"documentation\":\"<p>A list of metric definition objects. Each object specifies the metric name and regular expressions used to parse algorithm logs. Amazon SageMaker publishes each metric to Amazon CloudWatch.</p>\"\
        },\
        \"EnableSageMakerMetricsTimeSeries\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>To generate and save time-series metrics during training, set to <code>true</code>. The default is <code>false</code> and time-series metrics aren't generated except in the following cases:</p> <ul> <li> <p>You use one of the Amazon SageMaker built-in algorithms</p> </li> <li> <p>You use one of the following <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/pre-built-containers-frameworks-deep-learning.html\\\">Prebuilt Amazon SageMaker Docker Images</a>:</p> <ul> <li> <p>Tensorflow (version &gt;= 1.15)</p> </li> <li> <p>MXNet (version &gt;= 1.6)</p> </li> <li> <p>PyTorch (version &gt;= 1.3)</p> </li> </ul> </li> <li> <p>You specify at least one <a>MetricDefinition</a> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the training algorithm to use in a <a>CreateTrainingJob</a> request.</p> <p>For more information about algorithms provided by Amazon SageMaker, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html\\\">Algorithms</a>. For information about using your own algorithms, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html\\\">Using Your Own Algorithms with Amazon SageMaker</a>. </p>\"\
    },\
    \"AlgorithmStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pending\",\
        \"InProgress\",\
        \"Completed\",\
        \"Failed\",\
        \"Deleting\"\
      ]\
    },\
    \"AlgorithmStatusDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ValidationStatuses\":{\
          \"shape\":\"AlgorithmStatusItemList\",\
          \"documentation\":\"<p>The status of algorithm validation.</p>\"\
        },\
        \"ImageScanStatuses\":{\
          \"shape\":\"AlgorithmStatusItemList\",\
          \"documentation\":\"<p>The status of the scan of the algorithm's Docker image container.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the validation and image scan statuses of the algorithm.</p>\"\
    },\
    \"AlgorithmStatusItem\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Status\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the algorithm for which the overall status is being reported.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"DetailedAlgorithmStatus\",\
          \"documentation\":\"<p>The current status.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>if the overall status is <code>Failed</code>, the reason for the failure.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the overall status of an algorithm.</p>\"\
    },\
    \"AlgorithmStatusItemList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AlgorithmStatusItem\"}\
    },\
    \"AlgorithmSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AlgorithmName\",\
        \"AlgorithmArn\",\
        \"CreationTime\",\
        \"AlgorithmStatus\"\
      ],\
      \"members\":{\
        \"AlgorithmName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the algorithm that is described by the summary.</p>\"\
        },\
        \"AlgorithmArn\":{\
          \"shape\":\"AlgorithmArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the algorithm.</p>\"\
        },\
        \"AlgorithmDescription\":{\
          \"shape\":\"EntityDescription\",\
          \"documentation\":\"<p>A brief description of the algorithm.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A timestamp that shows when the algorithm was created.</p>\"\
        },\
        \"AlgorithmStatus\":{\
          \"shape\":\"AlgorithmStatus\",\
          \"documentation\":\"<p>The overall status of the algorithm.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information about an algorithm.</p>\"\
    },\
    \"AlgorithmSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AlgorithmSummary\"}\
    },\
    \"AlgorithmValidationProfile\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ProfileName\",\
        \"TrainingJobDefinition\"\
      ],\
      \"members\":{\
        \"ProfileName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the profile for the algorithm. The name must have 1 to 63 characters. Valid characters are a-z, A-Z, 0-9, and - (hyphen).</p>\"\
        },\
        \"TrainingJobDefinition\":{\
          \"shape\":\"TrainingJobDefinition\",\
          \"documentation\":\"<p>The <code>TrainingJobDefinition</code> object that describes the training job that Amazon SageMaker runs to validate your algorithm.</p>\"\
        },\
        \"TransformJobDefinition\":{\
          \"shape\":\"TransformJobDefinition\",\
          \"documentation\":\"<p>The <code>TransformJobDefinition</code> object that describes the transform job that Amazon SageMaker runs to validate your algorithm.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines a training job and a batch transform job that Amazon SageMaker runs to validate your algorithm.</p> <p>The data provided in the validation profile is made available to your buyers on AWS Marketplace.</p>\"\
    },\
    \"AlgorithmValidationProfiles\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AlgorithmValidationProfile\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"AlgorithmValidationSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ValidationRole\",\
        \"ValidationProfiles\"\
      ],\
      \"members\":{\
        \"ValidationRole\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The IAM roles that Amazon SageMaker uses to run the training jobs.</p>\"\
        },\
        \"ValidationProfiles\":{\
          \"shape\":\"AlgorithmValidationProfiles\",\
          \"documentation\":\"<p>An array of <code>AlgorithmValidationProfile</code> objects, each of which specifies a training job and batch transform job that Amazon SageMaker runs to validate your algorithm.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies configurations for one or more training jobs that Amazon SageMaker runs to test the algorithm.</p>\"\
    },\
    \"AnnotationConsolidationConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"AnnotationConsolidationLambdaArn\"],\
      \"members\":{\
        \"AnnotationConsolidationLambdaArn\":{\
          \"shape\":\"LambdaFunctionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of a Lambda function implements the logic for annotation consolidation.</p> <p>For the built-in bounding box, image classification, semantic segmentation, and text classification task types, Amazon SageMaker Ground Truth provides the following Lambda functions:</p> <ul> <li> <p> <i>Bounding box</i> - Finds the most similar boxes from different workers based on the Jaccard index of the boxes.</p> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-BoundingBox</code> </p> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-BoundingBox</code> </p> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-BoundingBox</code> </p> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-BoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-BoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-BoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-BoundingBox</code> </p> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-BoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-BoundingBox</code> </p> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-BoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-BoundingBox</code> </p> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-BoundingBox</code> </p> </li> <li> <p> <i>Image classification</i> - Uses a variant of the Expectation Maximization approach to estimate the true class of an image based on annotations from individual workers.</p> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-ImageMultiClass</code> </p> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-ImageMultiClass</code> </p> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-ImageMultiClass</code> </p> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-ImageMultiClass</code> </p> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-ImageMultiClass</code> </p> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-ImageMultiClass</code> </p> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-ImageMultiClass</code> </p> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-ImageMultiClass</code> </p> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-ImageMultiClass</code> </p> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-ImageMultiClass</code> </p> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-ImageMultiClass</code> </p> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-ImageMultiClass</code> </p> </li> <li> <p> <i>Multi-label image classification</i> - Uses a variant of the Expectation Maximization approach to estimate the true classes of an image based on annotations from individual workers.</p> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-ImageMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-ImageMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-ImageMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-ImageMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-ImageMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-ImageMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-ImageMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-ImageMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-ImageMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-ImageMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-ImageMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-ImageMultiClassMultiLabel</code> </p> </li> <li> <p> <i>Semantic segmentation</i> - Treats each pixel in an image as a multi-class classification and treats pixel annotations from workers as \\\"votes\\\" for the correct label.</p> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-SemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-SemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-SemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-SemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-SemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-SemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-SemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-SemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-SemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-SemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-SemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-SemanticSegmentation</code> </p> </li> <li> <p> <i>Text classification</i> - Uses a variant of the Expectation Maximization approach to estimate the true class of text based on annotations from individual workers.</p> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-TextMultiClass</code> </p> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-TextMultiClass</code> </p> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-TextMultiClass</code> </p> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-TextMultiClass</code> </p> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-TextMultiClass</code> </p> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-TextMultiClass</code> </p> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-TextMultiClass</code> </p> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-TextMultiClass</code> </p> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-TextMultiClass</code> </p> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-TextMultiClass</code> </p> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-TextMultiClass</code> </p> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-TextMultiClass</code> </p> </li> <li> <p> <i>Multi-label text classification</i> - Uses a variant of the Expectation Maximization approach to estimate the true classes of text based on annotations from individual workers.</p> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-TextMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-TextMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-TextMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-TextMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-TextMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-TextMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-TextMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-TextMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-TextMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-TextMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-TextMultiClassMultiLabel</code> </p> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-TextMultiClassMultiLabel</code> </p> </li> <li> <p> <i>Named entity recognition</i> - Groups similar selections and calculates aggregate boundaries, resolving to most-assigned label.</p> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-NamedEntityRecognition</code> </p> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-NamedEntityRecognition</code> </p> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-NamedEntityRecognition</code> </p> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-NamedEntityRecognition</code> </p> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-NamedEntityRecognition</code> </p> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-NamedEntityRecognition</code> </p> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-NamedEntityRecognition</code> </p> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-NamedEntityRecognition</code> </p> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-NamedEntityRecognition</code> </p> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-NamedEntityRecognition</code> </p> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-NamedEntityRecognition</code> </p> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-NamedEntityRecognition</code> </p> </li> <li> <p> <i>Bounding box verification</i> - Uses a variant of the Expectation Maximization approach to estimate the true class of verification judgement for bounding box labels based on annotations from individual workers.</p> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-VerificationBoundingBox</code> </p> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-VerificationBoundingBox</code> </p> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-VerificationBoundingBox</code> </p> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-VerificationBoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-VerificationBoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-VerificationBoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-VerificationBoundingBox</code> </p> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-VerificationBoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-VerificationBoundingBox</code> </p> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-VerificationBoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-VerificationBoundingBox</code> </p> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-VerificationBoundingBox</code> </p> </li> <li> <p> <i>Semantic segmentation verification</i> - Uses a variant of the Expectation Maximization approach to estimate the true class of verification judgment for semantic segmentation labels based on annotations from individual workers.</p> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-VerificationSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-VerificationSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-VerificationSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-VerificationSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-VerificationSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-VerificationSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-VerificationSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-VerificationSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-VerificationSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-VerificationSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-VerificationSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-VerificationSemanticSegmentation</code> </p> </li> <li> <p> <i>Bounding box adjustment</i> - Finds the most similar boxes from different workers based on the Jaccard index of the adjusted annotations.</p> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-AdjustmentBoundingBox</code> </p> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-AdjustmentBoundingBox</code> </p> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-AdjustmentBoundingBox</code> </p> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-AdjustmentBoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-AdjustmentBoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-AdjustmentBoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-AdjustmentBoundingBox</code> </p> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-AdjustmentBoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-AdjustmentBoundingBox</code> </p> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-AdjustmentBoundingBox</code> </p> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-AdjustmentBoundingBox</code> </p> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-AdjustmentBoundingBox</code> </p> </li> <li> <p> <i>Semantic segmentation adjustment</i> - Treats each pixel in an image as a multi-class classification and treats pixel adjusted annotations from workers as \\\"votes\\\" for the correct label.</p> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-AdjustmentSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-AdjustmentSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-AdjustmentSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-AdjustmentSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-AdjustmentSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-AdjustmentSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-AdjustmentSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-AdjustmentSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-AdjustmentSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-AdjustmentSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-AdjustmentSemanticSegmentation</code> </p> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-AdjustmentSemanticSegmentation</code> </p> </li> </ul> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sms-annotation-consolidation.html\\\">Annotation Consolidation</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configures how labels are consolidated across human workers.</p>\"\
    },\
    \"AppArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:app/.*\"\
    },\
    \"AppDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"UserProfileName\":{\
          \"shape\":\"UserProfileName\",\
          \"documentation\":\"<p>The user profile name.</p>\"\
        },\
        \"AppType\":{\
          \"shape\":\"AppType\",\
          \"documentation\":\"<p>The type of app.</p>\"\
        },\
        \"AppName\":{\
          \"shape\":\"AppName\",\
          \"documentation\":\"<p>The name of the app.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"AppStatus\",\
          \"documentation\":\"<p>The status.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The creation time.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The app's details.</p>\"\
    },\
    \"AppInstanceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"system\",\
        \"ml.t3.micro\",\
        \"ml.t3.small\",\
        \"ml.t3.medium\",\
        \"ml.t3.large\",\
        \"ml.t3.xlarge\",\
        \"ml.t3.2xlarge\",\
        \"ml.m5.large\",\
        \"ml.m5.xlarge\",\
        \"ml.m5.2xlarge\",\
        \"ml.m5.4xlarge\",\
        \"ml.m5.8xlarge\",\
        \"ml.m5.12xlarge\",\
        \"ml.m5.16xlarge\",\
        \"ml.m5.24xlarge\",\
        \"ml.c5.large\",\
        \"ml.c5.xlarge\",\
        \"ml.c5.2xlarge\",\
        \"ml.c5.4xlarge\",\
        \"ml.c5.9xlarge\",\
        \"ml.c5.12xlarge\",\
        \"ml.c5.18xlarge\",\
        \"ml.c5.24xlarge\",\
        \"ml.p3.2xlarge\",\
        \"ml.p3.8xlarge\",\
        \"ml.p3.16xlarge\",\
        \"ml.g4dn.xlarge\",\
        \"ml.g4dn.2xlarge\",\
        \"ml.g4dn.4xlarge\",\
        \"ml.g4dn.8xlarge\",\
        \"ml.g4dn.12xlarge\",\
        \"ml.g4dn.16xlarge\"\
      ]\
    },\
    \"AppList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AppDetails\"}\
    },\
    \"AppName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"AppSortKey\":{\
      \"type\":\"string\",\
      \"enum\":[\"CreationTime\"]\
    },\
    \"AppSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\"ImageUri\"],\
      \"members\":{\
        \"ImageUri\":{\
          \"shape\":\"ImageUri\",\
          \"documentation\":\"<p>The container image to be run by the processing job.</p>\"\
        },\
        \"ContainerEntrypoint\":{\
          \"shape\":\"ContainerEntrypoint\",\
          \"documentation\":\"<p>The entrypoint for a container used to run a processing job.</p>\"\
        },\
        \"ContainerArguments\":{\
          \"shape\":\"ContainerArguments\",\
          \"documentation\":\"<p>The arguments for a container used to run a processing job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration to run a processing job in a specified container image.</p>\"\
    },\
    \"AppStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Deleted\",\
        \"Deleting\",\
        \"Failed\",\
        \"InService\",\
        \"Pending\"\
      ]\
    },\
    \"AppType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"JupyterServer\",\
        \"KernelGateway\",\
        \"TensorBoard\"\
      ]\
    },\
    \"ArnOrName\":{\
      \"type\":\"string\",\
      \"max\":170,\
      \"min\":1,\
      \"pattern\":\"(arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:[a-z\\\\-]*\\\\/)?([a-zA-Z0-9]([a-zA-Z0-9-]){0,62})(?<!-)$\"\
    },\
    \"AssemblyType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"None\",\
        \"Line\"\
      ]\
    },\
    \"AssociateTrialComponentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrialComponentName\",\
        \"TrialName\"\
      ],\
      \"members\":{\
        \"TrialComponentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the component to associated with the trial.</p>\"\
        },\
        \"TrialName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial to associate with.</p>\"\
        }\
      }\
    },\
    \"AssociateTrialComponentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialComponentArn\":{\
          \"shape\":\"TrialComponentArn\",\
          \"documentation\":\"<p>The ARN of the trial component.</p>\"\
        },\
        \"TrialArn\":{\
          \"shape\":\"TrialArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trial.</p>\"\
        }\
      }\
    },\
    \"AttributeName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\".+\"\
    },\
    \"AttributeNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AttributeName\"},\
      \"max\":16\
    },\
    \"AuthMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SSO\",\
        \"IAM\"\
      ]\
    },\
    \"AutoMLCandidate\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CandidateName\",\
        \"ObjectiveStatus\",\
        \"CandidateSteps\",\
        \"CandidateStatus\",\
        \"CreationTime\",\
        \"LastModifiedTime\"\
      ],\
      \"members\":{\
        \"CandidateName\":{\
          \"shape\":\"CandidateName\",\
          \"documentation\":\"<p>The candidate name.</p>\"\
        },\
        \"FinalAutoMLJobObjectiveMetric\":{\"shape\":\"FinalAutoMLJobObjectiveMetric\"},\
        \"ObjectiveStatus\":{\
          \"shape\":\"ObjectiveStatus\",\
          \"documentation\":\"<p>The objective status.</p>\"\
        },\
        \"CandidateSteps\":{\
          \"shape\":\"CandidateSteps\",\
          \"documentation\":\"<p>The candidate's steps.</p>\"\
        },\
        \"CandidateStatus\":{\
          \"shape\":\"CandidateStatus\",\
          \"documentation\":\"<p>The candidate's status.</p>\"\
        },\
        \"InferenceContainers\":{\
          \"shape\":\"AutoMLContainerDefinitions\",\
          \"documentation\":\"<p>The inference containers.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end time.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last modified time.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"AutoMLFailureReason\",\
          \"documentation\":\"<p>The failure reason.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An AutoPilot job will return recommendations, or candidates. Each candidate has futher details about the steps involed, and the status.</p>\"\
    },\
    \"AutoMLCandidateStep\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CandidateStepType\",\
        \"CandidateStepArn\",\
        \"CandidateStepName\"\
      ],\
      \"members\":{\
        \"CandidateStepType\":{\
          \"shape\":\"CandidateStepType\",\
          \"documentation\":\"<p>Whether the Candidate is at the transform, training, or processing step.</p>\"\
        },\
        \"CandidateStepArn\":{\
          \"shape\":\"CandidateStepArn\",\
          \"documentation\":\"<p>The ARN for the Candidate's step.</p>\"\
        },\
        \"CandidateStepName\":{\
          \"shape\":\"CandidateStepName\",\
          \"documentation\":\"<p>The name for the Candidate's step.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the steps for a Candidate, and what step it is working on.</p>\"\
    },\
    \"AutoMLCandidates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AutoMLCandidate\"}\
    },\
    \"AutoMLChannel\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSource\",\
        \"TargetAttributeName\"\
      ],\
      \"members\":{\
        \"DataSource\":{\
          \"shape\":\"AutoMLDataSource\",\
          \"documentation\":\"<p>The data source.</p>\"\
        },\
        \"CompressionType\":{\
          \"shape\":\"CompressionType\",\
          \"documentation\":\"<p>You can use Gzip or None. The default value is None.</p>\"\
        },\
        \"TargetAttributeName\":{\
          \"shape\":\"TargetAttributeName\",\
          \"documentation\":\"<p>The name of the target variable in supervised learning, a.k.a. 'y'.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Similar to Channel. A channel is a named input source that training algorithms can consume. Refer to Channel for detailed descriptions.</p>\"\
    },\
    \"AutoMLContainerDefinition\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Image\",\
        \"ModelDataUrl\"\
      ],\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The ECR path of the container. Refer to ContainerDefinition for more details.</p>\"\
        },\
        \"ModelDataUrl\":{\
          \"shape\":\"Url\",\
          \"documentation\":\"<p>The location of the model artifacts. Refer to ContainerDefinition for more details.</p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"EnvironmentMap\",\
          \"documentation\":\"<p>Environment variables to set in the container. Refer to ContainerDefinition for more details.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of container definitions that describe the different containers that make up one AutoML candidate. Refer to ContainerDefinition for more details.</p>\"\
    },\
    \"AutoMLContainerDefinitions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AutoMLContainerDefinition\"},\
      \"max\":5\
    },\
    \"AutoMLDataSource\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3DataSource\"],\
      \"members\":{\
        \"S3DataSource\":{\
          \"shape\":\"AutoMLS3DataSource\",\
          \"documentation\":\"<p>The Amazon S3 location of the input data.</p> <note> <p>The input data must be in CSV format and contain at least 1000 rows.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The data source for the AutoPilot job.</p>\"\
    },\
    \"AutoMLFailureReason\":{\
      \"type\":\"string\",\
      \"max\":1024\
    },\
    \"AutoMLInputDataConfig\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AutoMLChannel\"},\
      \"max\":20,\
      \"min\":1\
    },\
    \"AutoMLJobArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:automl-job/.*\"\
    },\
    \"AutoMLJobArtifacts\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CandidateDefinitionNotebookLocation\":{\
          \"shape\":\"CandidateDefinitionNotebookLocation\",\
          \"documentation\":\"<p>The URL to the notebook location.</p>\"\
        },\
        \"DataExplorationNotebookLocation\":{\
          \"shape\":\"DataExplorationNotebookLocation\",\
          \"documentation\":\"<p>The URL to the notebook location.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Artifacts that are generation during a job.</p>\"\
    },\
    \"AutoMLJobCompletionCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxCandidates\":{\
          \"shape\":\"MaxCandidates\",\
          \"documentation\":\"<p>The maximum number of times a training job is allowed to run.</p>\"\
        },\
        \"MaxRuntimePerTrainingJobInSeconds\":{\
          \"shape\":\"MaxRuntimePerTrainingJobInSeconds\",\
          \"documentation\":\"<p>The maximum time, in seconds, a job is allowed to run.</p>\"\
        },\
        \"MaxAutoMLJobRuntimeInSeconds\":{\
          \"shape\":\"MaxAutoMLJobRuntimeInSeconds\",\
          \"documentation\":\"<p>The maximum time, in seconds, an AutoML job is allowed to wait for a trial to complete. It must be equal to or greater than MaxRuntimePerTrainingJobInSeconds.</p>\"\
        }\
      },\
      \"documentation\":\"<p>How long a job is allowed to run, or how many candidates a job is allowed to generate.</p>\"\
    },\
    \"AutoMLJobConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CompletionCriteria\":{\
          \"shape\":\"AutoMLJobCompletionCriteria\",\
          \"documentation\":\"<p>How long a job is allowed to run, or how many candidates a job is allowed to generate.</p>\"\
        },\
        \"SecurityConfig\":{\
          \"shape\":\"AutoMLSecurityConfig\",\
          \"documentation\":\"<p>Security configuration for traffic encryption or Amazon VPC settings.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A collection of settings used for a job.</p>\"\
    },\
    \"AutoMLJobName\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"AutoMLJobObjective\":{\
      \"type\":\"structure\",\
      \"required\":[\"MetricName\"],\
      \"members\":{\
        \"MetricName\":{\
          \"shape\":\"AutoMLMetricEnum\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Applies a metric to minimize or maximize for the job's objective.</p>\"\
    },\
    \"AutoMLJobObjectiveType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Maximize\",\
        \"Minimize\"\
      ]\
    },\
    \"AutoMLJobSecondaryStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Starting\",\
        \"AnalyzingData\",\
        \"FeatureEngineering\",\
        \"ModelTuning\",\
        \"MaxCandidatesReached\",\
        \"Failed\",\
        \"Stopped\",\
        \"MaxAutoMLJobRuntimeReached\",\
        \"Stopping\",\
        \"CandidateDefinitionsGenerated\"\
      ]\
    },\
    \"AutoMLJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Completed\",\
        \"InProgress\",\
        \"Failed\",\
        \"Stopped\",\
        \"Stopping\"\
      ]\
    },\
    \"AutoMLJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AutoMLJobSummary\"}\
    },\
    \"AutoMLJobSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoMLJobName\",\
        \"AutoMLJobArn\",\
        \"AutoMLJobStatus\",\
        \"AutoMLJobSecondaryStatus\",\
        \"CreationTime\",\
        \"LastModifiedTime\"\
      ],\
      \"members\":{\
        \"AutoMLJobName\":{\
          \"shape\":\"AutoMLJobName\",\
          \"documentation\":\"<p>The name of the object you are requesting.</p>\"\
        },\
        \"AutoMLJobArn\":{\
          \"shape\":\"AutoMLJobArn\",\
          \"documentation\":\"<p>The ARN of the job.</p>\"\
        },\
        \"AutoMLJobStatus\":{\
          \"shape\":\"AutoMLJobStatus\",\
          \"documentation\":\"<p>The job's status.</p>\"\
        },\
        \"AutoMLJobSecondaryStatus\":{\
          \"shape\":\"AutoMLJobSecondaryStatus\",\
          \"documentation\":\"<p>The job's secondary status.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the job was created.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end time.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the job was last modified.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"AutoMLFailureReason\",\
          \"documentation\":\"<p>The failure reason.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides a summary about a job.</p>\"\
    },\
    \"AutoMLMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"AutoMLMetricEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Accuracy\",\
        \"MSE\",\
        \"F1\",\
        \"F1macro\"\
      ]\
    },\
    \"AutoMLNameContains\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"[a-zA-Z0-9\\\\-]+\"\
    },\
    \"AutoMLOutputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3OutputPath\"],\
      \"members\":{\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS KMS encryption key ID.</p>\"\
        },\
        \"S3OutputPath\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 output path. Must be 128 characters or less.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output data configuration.</p>\"\
    },\
    \"AutoMLS3DataSource\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"S3DataType\",\
        \"S3Uri\"\
      ],\
      \"members\":{\
        \"S3DataType\":{\
          \"shape\":\"AutoMLS3DataType\",\
          \"documentation\":\"<p>The data type.</p>\"\
        },\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The URL to the Amazon S3 data source.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon S3 data source.</p>\"\
    },\
    \"AutoMLS3DataType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ManifestFile\",\
        \"S3Prefix\"\
      ]\
    },\
    \"AutoMLSecurityConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The key used to encrypt stored data.</p>\"\
        },\
        \"EnableInterContainerTrafficEncryption\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether to use traffic encryption between the container layers.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>VPC configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Security options.</p>\"\
    },\
    \"AutoMLSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\",\
        \"Status\"\
      ]\
    },\
    \"AutoMLSortOrder\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Ascending\",\
        \"Descending\"\
      ]\
    },\
    \"AwsManagedHumanLoopRequestSource\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AWS/Rekognition/DetectModerationLabels/Image/V3\",\
        \"AWS/Textract/AnalyzeDocument/Forms/V1\"\
      ]\
    },\
    \"BatchStrategy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MultiRecord\",\
        \"SingleRecord\"\
      ]\
    },\
    \"BillableTimeInSeconds\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"BooleanOperator\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"And\",\
        \"Or\"\
      ]\
    },\
    \"Branch\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"[^ ~^:?*\\\\[]+\"\
    },\
    \"CandidateDefinitionNotebookLocation\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"CandidateName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"CandidateSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CreationTime\",\
        \"Status\",\
        \"FinalObjectiveMetricValue\"\
      ]\
    },\
    \"CandidateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Completed\",\
        \"InProgress\",\
        \"Failed\",\
        \"Stopped\",\
        \"Stopping\"\
      ]\
    },\
    \"CandidateStepArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:.*/.*\"\
    },\
    \"CandidateStepName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"CandidateStepType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AWS::SageMaker::TrainingJob\",\
        \"AWS::SageMaker::TransformJob\",\
        \"AWS::SageMaker::ProcessingJob\"\
      ]\
    },\
    \"CandidateSteps\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AutoMLCandidateStep\"}\
    },\
    \"CaptureContentTypeHeader\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CsvContentTypes\":{\
          \"shape\":\"CsvContentTypes\",\
          \"documentation\":\"<p/>\"\
        },\
        \"JsonContentTypes\":{\
          \"shape\":\"JsonContentTypes\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p/>\"\
    },\
    \"CaptureMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Input\",\
        \"Output\"\
      ]\
    },\
    \"CaptureOption\":{\
      \"type\":\"structure\",\
      \"required\":[\"CaptureMode\"],\
      \"members\":{\
        \"CaptureMode\":{\
          \"shape\":\"CaptureMode\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p/>\"\
    },\
    \"CaptureOptionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CaptureOption\"},\
      \"max\":2,\
      \"min\":1\
    },\
    \"CaptureStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Started\",\
        \"Stopped\"\
      ]\
    },\
    \"CategoricalParameterRange\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Values\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ParameterKey\",\
          \"documentation\":\"<p>The name of the categorical hyperparameter to tune.</p>\"\
        },\
        \"Values\":{\
          \"shape\":\"ParameterValues\",\
          \"documentation\":\"<p>A list of the categories for the hyperparameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of categorical hyperparameters to tune.</p>\"\
    },\
    \"CategoricalParameterRangeSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\"Values\"],\
      \"members\":{\
        \"Values\":{\
          \"shape\":\"ParameterValues\",\
          \"documentation\":\"<p>The allowed categories for the hyperparameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines the possible values for a categorical hyperparameter.</p>\"\
    },\
    \"CategoricalParameterRanges\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CategoricalParameterRange\"},\
      \"max\":20,\
      \"min\":0\
    },\
    \"Cents\":{\
      \"type\":\"integer\",\
      \"max\":99,\
      \"min\":0\
    },\
    \"CertifyForMarketplace\":{\"type\":\"boolean\"},\
    \"Channel\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ChannelName\",\
        \"DataSource\"\
      ],\
      \"members\":{\
        \"ChannelName\":{\
          \"shape\":\"ChannelName\",\
          \"documentation\":\"<p>The name of the channel. </p>\"\
        },\
        \"DataSource\":{\
          \"shape\":\"DataSource\",\
          \"documentation\":\"<p>The location of the channel data.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>The MIME type of the data.</p>\"\
        },\
        \"CompressionType\":{\
          \"shape\":\"CompressionType\",\
          \"documentation\":\"<p>If training data is compressed, the compression type. The default value is <code>None</code>. <code>CompressionType</code> is used only in Pipe input mode. In File mode, leave this field unset or set it to None.</p>\"\
        },\
        \"RecordWrapperType\":{\
          \"shape\":\"RecordWrapper\",\
          \"documentation\":\"<p/> <p>Specify RecordIO as the value when input data is in raw format but the training algorithm requires the RecordIO format. In this case, Amazon SageMaker wraps each individual S3 object in a RecordIO record. If the input data is already in RecordIO format, you don't need to set this attribute. For more information, see <a href=\\\"https://mxnet.apache.org/api/architecture/note_data_loading#data-format\\\">Create a Dataset Using RecordIO</a>. </p> <p>In File mode, leave this field unset or set it to None.</p>\"\
        },\
        \"InputMode\":{\
          \"shape\":\"TrainingInputMode\",\
          \"documentation\":\"<p>(Optional) The input mode to use for the data channel in a training job. If you don't set a value for <code>InputMode</code>, Amazon SageMaker uses the value set for <code>TrainingInputMode</code>. Use this parameter to override the <code>TrainingInputMode</code> setting in a <a>AlgorithmSpecification</a> request when you have a channel that needs a different input mode from the training job's general setting. To download the data from Amazon Simple Storage Service (Amazon S3) to the provisioned ML storage volume, and mount the directory to a Docker volume, use <code>File</code> input mode. To stream data directly from Amazon S3 to the container, choose <code>Pipe</code> input mode.</p> <p>To use a model for incremental training, choose <code>File</code> input model.</p>\"\
        },\
        \"ShuffleConfig\":{\
          \"shape\":\"ShuffleConfig\",\
          \"documentation\":\"<p>A configuration for a shuffle option for input data in a channel. If you use <code>S3Prefix</code> for <code>S3DataType</code>, this shuffles the results of the S3 key prefix matches. If you use <code>ManifestFile</code>, the order of the S3 object references in the <code>ManifestFile</code> is shuffled. If you use <code>AugmentedManifestFile</code>, the order of the JSON lines in the <code>AugmentedManifestFile</code> is shuffled. The shuffling order is determined using the <code>Seed</code> value.</p> <p>For Pipe input mode, shuffling is done at the start of every epoch. With large datasets this ensures that the order of the training data is different for each epoch, it helps reduce bias and possible overfitting. In a multi-node training job when ShuffleConfig is combined with <code>S3DataDistributionType</code> of <code>ShardedByS3Key</code>, the data is shuffled across nodes so that the content sent to a particular node on the first epoch might be sent to a different node on the second epoch.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A channel is a named input source that training algorithms can consume. </p>\"\
    },\
    \"ChannelName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[A-Za-z0-9\\\\.\\\\-_]+\"\
    },\
    \"ChannelSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"SupportedContentTypes\",\
        \"SupportedInputModes\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ChannelName\",\
          \"documentation\":\"<p>The name of the channel.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"EntityDescription\",\
          \"documentation\":\"<p>A brief description of the channel.</p>\"\
        },\
        \"IsRequired\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the channel is required by the algorithm.</p>\"\
        },\
        \"SupportedContentTypes\":{\
          \"shape\":\"ContentTypes\",\
          \"documentation\":\"<p>The supported MIME types for the data.</p>\"\
        },\
        \"SupportedCompressionTypes\":{\
          \"shape\":\"CompressionTypes\",\
          \"documentation\":\"<p>The allowed compression types, if data compression is used.</p>\"\
        },\
        \"SupportedInputModes\":{\
          \"shape\":\"InputModes\",\
          \"documentation\":\"<p>The allowed input mode, either FILE or PIPE.</p> <p>In FILE mode, Amazon SageMaker copies the data from the input source onto the local Amazon Elastic Block Store (Amazon EBS) volumes before starting your training algorithm. This is the most commonly used input mode.</p> <p>In PIPE mode, Amazon SageMaker streams input data from the source directly to your algorithm without using the EBS volume.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines a named input source, called a channel, to be used by an algorithm.</p>\"\
    },\
    \"ChannelSpecifications\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChannelSpecification\"},\
      \"max\":8,\
      \"min\":1\
    },\
    \"CheckpointConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>Identifies the S3 path where you want Amazon SageMaker to store checkpoints. For example, <code>s3://bucket-name/key-name-prefix</code>.</p>\"\
        },\
        \"LocalPath\":{\
          \"shape\":\"DirectoryPath\",\
          \"documentation\":\"<p>(Optional) The local directory where checkpoints are written. The default directory is <code>/opt/ml/checkpoints/</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the output location for managed spot training checkpoint data. </p>\"\
    },\
    \"Cidr\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":4,\
      \"pattern\":\"(^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\\\\/(3[0-2]|[1-2][0-9]|[0-9]))$)|(^s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]d|1dd|[1-9]?d)(.(25[0-5]|2[0-4]d|1dd|[1-9]?d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]d|1dd|[1-9]?d)(.(25[0-5]|2[0-4]d|1dd|[1-9]?d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]d|1dd|[1-9]?d)(.(25[0-5]|2[0-4]d|1dd|[1-9]?d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]d|1dd|[1-9]?d)(.(25[0-5]|2[0-4]d|1dd|[1-9]?d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]d|1dd|[1-9]?d)(.(25[0-5]|2[0-4]d|1dd|[1-9]?d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]d|1dd|[1-9]?d)(.(25[0-5]|2[0-4]d|1dd|[1-9]?d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]d|1dd|[1-9]?d)(.(25[0-5]|2[0-4]d|1dd|[1-9]?d)){3}))|:)))(%.+)?s*(\\\\/(12[0-8]|1[0-1][0-9]|[1-9][0-9]|[0-9]))$)\"\
    },\
    \"Cidrs\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Cidr\"}\
    },\
    \"CodeRepositoryArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:code-repository/.*\"\
    },\
    \"CodeRepositoryContains\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"[a-zA-Z0-9-]+\"\
    },\
    \"CodeRepositoryNameContains\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"[a-zA-Z0-9-]+\"\
    },\
    \"CodeRepositoryNameOrUrl\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"^https://([^/]+)/?(.*)$|^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"CodeRepositorySortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\",\
        \"LastModifiedTime\"\
      ]\
    },\
    \"CodeRepositorySortOrder\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Ascending\",\
        \"Descending\"\
      ]\
    },\
    \"CodeRepositorySummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CodeRepositoryName\",\
        \"CodeRepositoryArn\",\
        \"CreationTime\",\
        \"LastModifiedTime\"\
      ],\
      \"members\":{\
        \"CodeRepositoryName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the Git repository.</p>\"\
        },\
        \"CodeRepositoryArn\":{\
          \"shape\":\"CodeRepositoryArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Git repository.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The date and time that the Git repository was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>The date and time that the Git repository was last modified.</p>\"\
        },\
        \"GitConfig\":{\
          \"shape\":\"GitConfig\",\
          \"documentation\":\"<p>Configuration details for the Git repository, including the URL where it is located and the ARN of the AWS Secrets Manager secret that contains the credentials used to access the repository.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies summary information about a Git repository.</p>\"\
    },\
    \"CodeRepositorySummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CodeRepositorySummary\"}\
    },\
    \"CognitoClientId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w+]+\"\
    },\
    \"CognitoMemberDefinition\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPool\",\
        \"UserGroup\",\
        \"ClientId\"\
      ],\
      \"members\":{\
        \"UserPool\":{\
          \"shape\":\"CognitoUserPool\",\
          \"documentation\":\"<p>An identifier for a user pool. The user pool must be in the same region as the service that you are calling.</p>\"\
        },\
        \"UserGroup\":{\
          \"shape\":\"CognitoUserGroup\",\
          \"documentation\":\"<p>An identifier for a user group.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"CognitoClientId\",\
          \"documentation\":\"<p>An identifier for an application client. You must create the app client ID using Amazon Cognito.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies a Amazon Cognito user group. A user group can be used in on or more work teams.</p>\"\
    },\
    \"CognitoUserGroup\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}]+\"\
    },\
    \"CognitoUserPool\":{\
      \"type\":\"string\",\
      \"max\":55,\
      \"min\":1,\
      \"pattern\":\"[\\\\w-]+_[0-9a-zA-Z]+\"\
    },\
    \"CollectionConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"CollectionName\",\
          \"documentation\":\"<p>The name of the tensor collection. The name must be unique relative to other rule configuration names.</p>\"\
        },\
        \"CollectionParameters\":{\
          \"shape\":\"CollectionParameters\",\
          \"documentation\":\"<p>Parameter values for the tensor collection. The allowed parameters are <code>\\\"name\\\"</code>, <code>\\\"include_regex\\\"</code>, <code>\\\"reduction_config\\\"</code>, <code>\\\"save_config\\\"</code>, <code>\\\"tensor_names\\\"</code>, and <code>\\\"save_histogram\\\"</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information for tensor collections.</p>\"\
    },\
    \"CollectionConfigurations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CollectionConfiguration\"},\
      \"max\":20,\
      \"min\":0\
    },\
    \"CollectionName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\".*\"\
    },\
    \"CollectionParameters\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ConfigKey\"},\
      \"value\":{\"shape\":\"ConfigValue\"},\
      \"max\":20,\
      \"min\":0\
    },\
    \"CompilationJobArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:compilation-job/.*\"\
    },\
    \"CompilationJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INPROGRESS\",\
        \"COMPLETED\",\
        \"FAILED\",\
        \"STARTING\",\
        \"STOPPING\",\
        \"STOPPED\"\
      ]\
    },\
    \"CompilationJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CompilationJobSummary\"}\
    },\
    \"CompilationJobSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CompilationJobName\",\
        \"CompilationJobArn\",\
        \"CreationTime\",\
        \"CompilationTargetDevice\",\
        \"CompilationJobStatus\"\
      ],\
      \"members\":{\
        \"CompilationJobName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the model compilation job that you want a summary for.</p>\"\
        },\
        \"CompilationJobArn\":{\
          \"shape\":\"CompilationJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the model compilation job.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The time when the model compilation job was created.</p>\"\
        },\
        \"CompilationStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time when the model compilation job started.</p>\"\
        },\
        \"CompilationEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time when the model compilation job completed.</p>\"\
        },\
        \"CompilationTargetDevice\":{\
          \"shape\":\"TargetDevice\",\
          \"documentation\":\"<p>The type of device that the model will run on after compilation has completed.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>The time when the model compilation job was last modified.</p>\"\
        },\
        \"CompilationJobStatus\":{\
          \"shape\":\"CompilationJobStatus\",\
          \"documentation\":\"<p>The status of the model compilation job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A summary of a model compilation job.</p>\"\
    },\
    \"CompressionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"None\",\
        \"Gzip\"\
      ]\
    },\
    \"CompressionTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CompressionType\"}\
    },\
    \"ConfigKey\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\".*\"\
    },\
    \"ConfigValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\".*\"\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"FailureReason\"}\
      },\
      \"documentation\":\"<p>There was a conflict when you attempted to modify an experiment, trial, or trial component.</p>\",\
      \"exception\":true\
    },\
    \"ContainerArgument\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\".*\"\
    },\
    \"ContainerArguments\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContainerArgument\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"ContainerDefinition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContainerHostname\":{\
          \"shape\":\"ContainerHostname\",\
          \"documentation\":\"<p>This parameter is ignored for models that contain only a <code>PrimaryContainer</code>.</p> <p>When a <code>ContainerDefinition</code> is part of an inference pipeline, the value of the parameter uniquely identifies the container for the purposes of logging and metrics. For information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/inference-pipeline-logs-metrics.html\\\">Use Logs and Metrics to Monitor an Inference Pipeline</a>. If you don't specify a value for this parameter for a <code>ContainerDefinition</code> that is part of an inference pipeline, a unique name is automatically assigned based on the position of the <code>ContainerDefinition</code> in the pipeline. If you specify a value for the <code>ContainerHostName</code> for any <code>ContainerDefinition</code> that is part of an inference pipeline, you must specify a value for the <code>ContainerHostName</code> parameter of every <code>ContainerDefinition</code> in that pipeline.</p>\"\
        },\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The Amazon EC2 Container Registry (Amazon ECR) path where inference code is stored. If you are using your own custom algorithm instead of an algorithm provided by Amazon SageMaker, the inference code must meet Amazon SageMaker requirements. Amazon SageMaker supports both <code>registry/repository[:tag]</code> and <code>registry/repository[@digest]</code> image path formats. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html\\\">Using Your Own Algorithms with Amazon SageMaker</a> </p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"ContainerMode\",\
          \"documentation\":\"<p>Whether the container hosts a single model or multiple models.</p>\"\
        },\
        \"ModelDataUrl\":{\
          \"shape\":\"Url\",\
          \"documentation\":\"<p>The S3 path where the model artifacts, which result from model training, are stored. This path must point to a single gzip compressed tar archive (.tar.gz suffix). The S3 path is required for Amazon SageMaker built-in algorithms, but not if you use your own algorithms. For more information on built-in algorithms, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-algo-docker-registry-paths.html\\\">Common Parameters</a>. </p> <p>If you provide a value for this parameter, Amazon SageMaker uses AWS Security Token Service to download model artifacts from the S3 path you provide. AWS STS is activated in your IAM user account by default. If you previously deactivated AWS STS for a region, you need to reactivate AWS STS for that region. For more information, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html\\\">Activating and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p> <important> <p>If you use a built-in algorithm to create a model, Amazon SageMaker requires that you provide a S3 path to the model artifacts in <code>ModelDataUrl</code>.</p> </important>\"\
        },\
        \"Environment\":{\
          \"shape\":\"EnvironmentMap\",\
          \"documentation\":\"<p>The environment variables to set in the Docker container. Each key and value in the <code>Environment</code> string to string map can have length of up to 1024. We support up to 16 entries in the map. </p>\"\
        },\
        \"ModelPackageName\":{\
          \"shape\":\"ArnOrName\",\
          \"documentation\":\"<p>The name or Amazon Resource Name (ARN) of the model package to use to create the model.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the container, as part of model definition.</p>\"\
    },\
    \"ContainerDefinitionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContainerDefinition\"},\
      \"max\":5\
    },\
    \"ContainerEntrypoint\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContainerEntrypointString\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"ContainerEntrypointString\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\".*\"\
    },\
    \"ContainerHostname\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"ContainerMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SingleModel\",\
        \"MultiModel\"\
      ]\
    },\
    \"ContentClassifier\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FreeOfPersonallyIdentifiableInformation\",\
        \"FreeOfAdultContent\"\
      ]\
    },\
    \"ContentClassifiers\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContentClassifier\"},\
      \"max\":256\
    },\
    \"ContentType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\".*\"\
    },\
    \"ContentTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContentType\"}\
    },\
    \"ContinuousParameterRange\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"MinValue\",\
        \"MaxValue\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ParameterKey\",\
          \"documentation\":\"<p>The name of the continuous hyperparameter to tune.</p>\"\
        },\
        \"MinValue\":{\
          \"shape\":\"ParameterValue\",\
          \"documentation\":\"<p>The minimum value for the hyperparameter. The tuning job uses floating-point values between this value and <code>MaxValue</code>for tuning.</p>\"\
        },\
        \"MaxValue\":{\
          \"shape\":\"ParameterValue\",\
          \"documentation\":\"<p>The maximum value for the hyperparameter. The tuning job uses floating-point values between <code>MinValue</code> value and this value for tuning.</p>\"\
        },\
        \"ScalingType\":{\
          \"shape\":\"HyperParameterScalingType\",\
          \"documentation\":\"<p>The scale that hyperparameter tuning uses to search the hyperparameter range. For information about choosing a hyperparameter scale, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-ranges.html#scaling-type\\\">Hyperparameter Scaling</a>. One of the following values:</p> <dl> <dt>Auto</dt> <dd> <p>Amazon SageMaker hyperparameter tuning chooses the best scale for the hyperparameter.</p> </dd> <dt>Linear</dt> <dd> <p>Hyperparameter tuning searches the values in the hyperparameter range by using a linear scale.</p> </dd> <dt>Logarithmic</dt> <dd> <p>Hyperparameter tuning searches the values in the hyperparameter range by using a logarithmic scale.</p> <p>Logarithmic scaling works only for ranges that have only values greater than 0.</p> </dd> <dt>ReverseLogarithmic</dt> <dd> <p>Hyperparameter tuning searches the values in the hyperparameter range by using a reverse logarithmic scale.</p> <p>Reverse logarithmic scaling works only for ranges that are entirely within the range 0&lt;=x&lt;1.0.</p> </dd> </dl>\"\
        }\
      },\
      \"documentation\":\"<p>A list of continuous hyperparameters to tune.</p>\"\
    },\
    \"ContinuousParameterRangeSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MinValue\",\
        \"MaxValue\"\
      ],\
      \"members\":{\
        \"MinValue\":{\
          \"shape\":\"ParameterValue\",\
          \"documentation\":\"<p>The minimum floating-point value allowed.</p>\"\
        },\
        \"MaxValue\":{\
          \"shape\":\"ParameterValue\",\
          \"documentation\":\"<p>The maximum floating-point value allowed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines the possible values for a continuous hyperparameter.</p>\"\
    },\
    \"ContinuousParameterRanges\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContinuousParameterRange\"},\
      \"max\":20,\
      \"min\":0\
    },\
    \"CreateAlgorithmInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AlgorithmName\",\
        \"TrainingSpecification\"\
      ],\
      \"members\":{\
        \"AlgorithmName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the algorithm.</p>\"\
        },\
        \"AlgorithmDescription\":{\
          \"shape\":\"EntityDescription\",\
          \"documentation\":\"<p>A description of the algorithm.</p>\"\
        },\
        \"TrainingSpecification\":{\
          \"shape\":\"TrainingSpecification\",\
          \"documentation\":\"<p>Specifies details about training jobs run by this algorithm, including the following:</p> <ul> <li> <p>The Amazon ECR path of the container and the version digest of the algorithm.</p> </li> <li> <p>The hyperparameters that the algorithm supports.</p> </li> <li> <p>The instance types that the algorithm supports for training.</p> </li> <li> <p>Whether the algorithm supports distributed training.</p> </li> <li> <p>The metrics that the algorithm emits to Amazon CloudWatch.</p> </li> <li> <p>Which metrics that the algorithm emits can be used as the objective metric for hyperparameter tuning jobs.</p> </li> <li> <p>The input channels that the algorithm supports for training data. For example, an algorithm might support <code>train</code>, <code>validation</code>, and <code>test</code> channels.</p> </li> </ul>\"\
        },\
        \"InferenceSpecification\":{\
          \"shape\":\"InferenceSpecification\",\
          \"documentation\":\"<p>Specifies details about inference jobs that the algorithm runs, including the following:</p> <ul> <li> <p>The Amazon ECR paths of containers that contain the inference code and model artifacts.</p> </li> <li> <p>The instance types that the algorithm supports for transform jobs and real-time endpoints used for inference.</p> </li> <li> <p>The input and output content formats that the algorithm supports for inference.</p> </li> </ul>\"\
        },\
        \"ValidationSpecification\":{\
          \"shape\":\"AlgorithmValidationSpecification\",\
          \"documentation\":\"<p>Specifies configurations for one or more training jobs and that Amazon SageMaker runs to test the algorithm's training code and, optionally, one or more batch transform jobs that Amazon SageMaker runs to test the algorithm's inference code.</p>\"\
        },\
        \"CertifyForMarketplace\":{\
          \"shape\":\"CertifyForMarketplace\",\
          \"documentation\":\"<p>Whether to certify the algorithm so that it can be listed in AWS Marketplace.</p>\"\
        }\
      }\
    },\
    \"CreateAlgorithmOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"AlgorithmArn\"],\
      \"members\":{\
        \"AlgorithmArn\":{\
          \"shape\":\"AlgorithmArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the new algorithm.</p>\"\
        }\
      }\
    },\
    \"CreateAppRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainId\",\
        \"UserProfileName\",\
        \"AppType\",\
        \"AppName\"\
      ],\
      \"members\":{\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"UserProfileName\":{\
          \"shape\":\"UserProfileName\",\
          \"documentation\":\"<p>The user profile name.</p>\"\
        },\
        \"AppType\":{\
          \"shape\":\"AppType\",\
          \"documentation\":\"<p>The type of app.</p>\"\
        },\
        \"AppName\":{\
          \"shape\":\"AppName\",\
          \"documentation\":\"<p>The name of the app.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Each tag consists of a key and an optional value. Tag keys must be unique per resource.</p>\"\
        },\
        \"ResourceSpec\":{\
          \"shape\":\"ResourceSpec\",\
          \"documentation\":\"<p>The instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance.</p>\"\
        }\
      }\
    },\
    \"CreateAppResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppArn\":{\
          \"shape\":\"AppArn\",\
          \"documentation\":\"<p>The app's Amazon Resource Name (ARN).</p>\"\
        }\
      }\
    },\
    \"CreateAutoMLJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoMLJobName\",\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"RoleArn\"\
      ],\
      \"members\":{\
        \"AutoMLJobName\":{\
          \"shape\":\"AutoMLJobName\",\
          \"documentation\":\"<p>Identifies an AutoPilot job. Must be unique to your account and is case-insensitive.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"AutoMLInputDataConfig\",\
          \"documentation\":\"<p>Similar to InputDataConfig supported by Tuning. Format(s) supported: CSV. Minimum of 1000 rows.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"AutoMLOutputDataConfig\",\
          \"documentation\":\"<p>Similar to OutputDataConfig supported by Tuning. Format(s) supported: CSV.</p>\"\
        },\
        \"ProblemType\":{\
          \"shape\":\"ProblemType\",\
          \"documentation\":\"<p>Defines the kind of preprocessing and algorithms intended for the candidates. Options include: BinaryClassification, MulticlassClassification, and Regression.</p>\"\
        },\
        \"AutoMLJobObjective\":{\
          \"shape\":\"AutoMLJobObjective\",\
          \"documentation\":\"<p>Defines the job's objective. You provide a MetricName and AutoML will infer minimize or maximize. If this is not provided, the most commonly used ObjectiveMetric for problem type will be selected.</p>\"\
        },\
        \"AutoMLJobConfig\":{\
          \"shape\":\"AutoMLJobConfig\",\
          \"documentation\":\"<p>Contains CompletionCriteria and SecurityConfig.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of the role that will be used to access the data.</p>\"\
        },\
        \"GenerateCandidateDefinitionsOnly\":{\
          \"shape\":\"GenerateCandidateDefinitionsOnly\",\
          \"documentation\":\"<p>This will generate possible candidates without training a model. A candidate is a combination of data preprocessors, algorithms, and algorithm parameter settings.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Each tag consists of a key and an optional value. Tag keys must be unique per resource.</p>\"\
        }\
      }\
    },\
    \"CreateAutoMLJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoMLJobArn\"],\
      \"members\":{\
        \"AutoMLJobArn\":{\
          \"shape\":\"AutoMLJobArn\",\
          \"documentation\":\"<p>When a job is created, it is assigned a unique ARN.</p>\"\
        }\
      }\
    },\
    \"CreateCodeRepositoryInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CodeRepositoryName\",\
        \"GitConfig\"\
      ],\
      \"members\":{\
        \"CodeRepositoryName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the Git repository. The name must have 1 to 63 characters. Valid characters are a-z, A-Z, 0-9, and - (hyphen).</p>\"\
        },\
        \"GitConfig\":{\
          \"shape\":\"GitConfig\",\
          \"documentation\":\"<p>Specifies details about the repository, including the URL where the repository is located, the default branch, and credentials to use to access the repository.</p>\"\
        }\
      }\
    },\
    \"CreateCodeRepositoryOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeRepositoryArn\"],\
      \"members\":{\
        \"CodeRepositoryArn\":{\
          \"shape\":\"CodeRepositoryArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the new repository.</p>\"\
        }\
      }\
    },\
    \"CreateCompilationJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CompilationJobName\",\
        \"RoleArn\",\
        \"InputConfig\",\
        \"OutputConfig\",\
        \"StoppingCondition\"\
      ],\
      \"members\":{\
        \"CompilationJobName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>A name for the model compilation job. The name must be unique within the AWS Region and within your AWS account. </p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an IAM role that enables Amazon SageMaker to perform tasks on your behalf. </p> <p>During model compilation, Amazon SageMaker needs your permission to:</p> <ul> <li> <p>Read input data from an S3 bucket</p> </li> <li> <p>Write model artifacts to an S3 bucket</p> </li> <li> <p>Write logs to Amazon CloudWatch Logs</p> </li> <li> <p>Publish metrics to Amazon CloudWatch</p> </li> </ul> <p>You grant permissions for all of these tasks to an IAM role. To pass this role to Amazon SageMaker, the caller of this API must have the <code>iam:PassRole</code> permission. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html\\\">Amazon SageMaker Roles.</a> </p>\"\
        },\
        \"InputConfig\":{\
          \"shape\":\"InputConfig\",\
          \"documentation\":\"<p>Provides information about the location of input model artifacts, the name and shape of the expected data inputs, and the framework in which the model was trained.</p>\"\
        },\
        \"OutputConfig\":{\
          \"shape\":\"OutputConfig\",\
          \"documentation\":\"<p>Provides information about the output location for the compiled model and the target device the model runs on.</p>\"\
        },\
        \"StoppingCondition\":{\
          \"shape\":\"StoppingCondition\",\
          \"documentation\":\"<p>Specifies a limit to how long a model compilation job can run. When the job reaches the time limit, Amazon SageMaker ends the compilation job. Use this API to cap model training costs.</p>\"\
        }\
      }\
    },\
    \"CreateCompilationJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"CompilationJobArn\"],\
      \"members\":{\
        \"CompilationJobArn\":{\
          \"shape\":\"CompilationJobArn\",\
          \"documentation\":\"<p>If the action is successful, the service sends back an HTTP 200 response. Amazon SageMaker returns the following data in JSON format:</p> <ul> <li> <p> <code>CompilationJobArn</code>: The Amazon Resource Name (ARN) of the compiled job.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"CreateDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainName\",\
        \"AuthMode\",\
        \"DefaultUserSettings\",\
        \"SubnetIds\",\
        \"VpcId\"\
      ],\
      \"members\":{\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>A name for the domain.</p>\"\
        },\
        \"AuthMode\":{\
          \"shape\":\"AuthMode\",\
          \"documentation\":\"<p>The mode of authentication that member use to access the domain.</p>\"\
        },\
        \"DefaultUserSettings\":{\
          \"shape\":\"UserSettings\",\
          \"documentation\":\"<p>The default user settings.</p>\"\
        },\
        \"SubnetIds\":{\
          \"shape\":\"Subnets\",\
          \"documentation\":\"<p>Security setting to limit to a set of subnets.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"VpcId\",\
          \"documentation\":\"<p>Security setting to limit the domain's communication to a Amazon Virtual Private Cloud.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Each tag consists of a key and an optional value. Tag keys must be unique per resource.</p>\"\
        },\
        \"HomeEfsFileSystemKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS Key Management Service (KMS) encryption key ID. Encryption with a customer master key (CMK) is not supported.</p>\"\
        }\
      }\
    },\
    \"CreateDomainResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DomainArn\":{\
          \"shape\":\"DomainArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the created domain.</p>\"\
        },\
        \"Url\":{\
          \"shape\":\"String1024\",\
          \"documentation\":\"<p>The URL to the created domain.</p>\"\
        }\
      }\
    },\
    \"CreateEndpointConfigInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointConfigName\",\
        \"ProductionVariants\"\
      ],\
      \"members\":{\
        \"EndpointConfigName\":{\
          \"shape\":\"EndpointConfigName\",\
          \"documentation\":\"<p>The name of the endpoint configuration. You specify this name in a <a>CreateEndpoint</a> request. </p>\"\
        },\
        \"ProductionVariants\":{\
          \"shape\":\"ProductionVariantList\",\
          \"documentation\":\"<p>An list of <code>ProductionVariant</code> objects, one for each model that you want to host at this endpoint.</p>\"\
        },\
        \"DataCaptureConfig\":{\"shape\":\"DataCaptureConfig\"},\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of key-value pairs. For more information, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what\\\">Using Cost Allocation Tags</a> in the <i> AWS Billing and Cost Management User Guide</i>. </p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of a AWS Key Management Service key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance that hosts the endpoint.</p> <p>The KmsKeyId can be any of the following formats: </p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias name ARN: <code>arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>The KMS key policy must grant permission to the IAM role that you specify in your <code>CreateEndpoint</code>, <code>UpdateEndpoint</code> requests. For more information, refer to the AWS Key Management Service section<a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html\\\"> Using Key Policies in AWS KMS </a> </p> <note> <p>Certain Nitro-based instances include local storage, dependent on the instance type. Local storage volumes are encrypted using a hardware module on the instance. You can't request a <code>KmsKeyId</code> when using an instance type with local storage. If any of the models that you specify in the <code>ProductionVariants</code> parameter use nitro-based instances with local storage, do not specify a value for the <code>KmsKeyId</code> parameter. If you specify a value for <code>KmsKeyId</code> when using any nitro-based instances with local storage, the call to <code>CreateEndpointConfig</code> fails.</p> <p>For a list of instance types that support local instance storage, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html#instance-store-volumes\\\">Instance Store Volumes</a>.</p> <p>For more information about local instance storage encryption, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ssd-instance-store.html\\\">SSD Instance Store Volumes</a>.</p> </note>\"\
        }\
      }\
    },\
    \"CreateEndpointConfigOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointConfigArn\"],\
      \"members\":{\
        \"EndpointConfigArn\":{\
          \"shape\":\"EndpointConfigArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the endpoint configuration. </p>\"\
        }\
      }\
    },\
    \"CreateEndpointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointName\",\
        \"EndpointConfigName\"\
      ],\
      \"members\":{\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p>The name of the endpoint. The name must be unique within an AWS Region in your AWS account.</p>\"\
        },\
        \"EndpointConfigName\":{\
          \"shape\":\"EndpointConfigName\",\
          \"documentation\":\"<p>The name of an endpoint configuration. For more information, see <a>CreateEndpointConfig</a>. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of key-value pairs. For more information, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what\\\">Using Cost Allocation Tags</a>in the <i>AWS Billing and Cost Management User Guide</i>. </p>\"\
        }\
      }\
    },\
    \"CreateEndpointOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointArn\"],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"EndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the endpoint.</p>\"\
        }\
      }\
    },\
    \"CreateExperimentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ExperimentName\"],\
      \"members\":{\
        \"ExperimentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment. The name must be unique in your AWS account and is not case-sensitive.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment as displayed. The name doesn't need to be unique. If you don't specify <code>DisplayName</code>, the value in <code>ExperimentName</code> is displayed.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ExperimentDescription\",\
          \"documentation\":\"<p>The description of the experiment.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of tags to associate with the experiment. You can use <a>Search</a> API to search on the tags.</p>\"\
        }\
      }\
    },\
    \"CreateExperimentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExperimentArn\":{\
          \"shape\":\"ExperimentArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the experiment.</p>\"\
        }\
      }\
    },\
    \"CreateFlowDefinitionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FlowDefinitionName\",\
        \"HumanLoopConfig\",\
        \"OutputConfig\",\
        \"RoleArn\"\
      ],\
      \"members\":{\
        \"FlowDefinitionName\":{\
          \"shape\":\"FlowDefinitionName\",\
          \"documentation\":\"<p>The name of your flow definition.</p>\"\
        },\
        \"HumanLoopRequestSource\":{\
          \"shape\":\"HumanLoopRequestSource\",\
          \"documentation\":\"<p>Container for configuring the source of human task requests. Use to specify if Amazon Rekognition or Amazon Textract is used as an integration source.</p>\"\
        },\
        \"HumanLoopActivationConfig\":{\
          \"shape\":\"HumanLoopActivationConfig\",\
          \"documentation\":\"<p>An object containing information about the events that trigger a human workflow.</p>\"\
        },\
        \"HumanLoopConfig\":{\
          \"shape\":\"HumanLoopConfig\",\
          \"documentation\":\"<p>An object containing information about the tasks the human reviewers will perform.</p>\"\
        },\
        \"OutputConfig\":{\
          \"shape\":\"FlowDefinitionOutputConfig\",\
          \"documentation\":\"<p>An object containing information about where the human review results will be uploaded.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the role needed to call other services on your behalf. For example, <code>arn:aws:iam::1234567890:role/service-role/AmazonSageMaker-ExecutionRole-20180111T151298</code>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of key-value pairs that contain metadata to help you categorize and organize a flow definition. Each tag consists of a key and a value, both of which you define.</p>\"\
        }\
      }\
    },\
    \"CreateFlowDefinitionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"FlowDefinitionArn\"],\
      \"members\":{\
        \"FlowDefinitionArn\":{\
          \"shape\":\"FlowDefinitionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the flow definition you create.</p>\"\
        }\
      }\
    },\
    \"CreateHumanTaskUiRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HumanTaskUiName\",\
        \"UiTemplate\"\
      ],\
      \"members\":{\
        \"HumanTaskUiName\":{\
          \"shape\":\"HumanTaskUiName\",\
          \"documentation\":\"<p>The name of the user interface you are creating.</p>\"\
        },\
        \"UiTemplate\":{\"shape\":\"UiTemplate\"},\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of key-value pairs that contain metadata to help you categorize and organize a human review workflow user interface. Each tag consists of a key and a value, both of which you define.</p>\"\
        }\
      }\
    },\
    \"CreateHumanTaskUiResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"HumanTaskUiArn\"],\
      \"members\":{\
        \"HumanTaskUiArn\":{\
          \"shape\":\"HumanTaskUiArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the human review workflow user interface you create.</p>\"\
        }\
      }\
    },\
    \"CreateHyperParameterTuningJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HyperParameterTuningJobName\",\
        \"HyperParameterTuningJobConfig\"\
      ],\
      \"members\":{\
        \"HyperParameterTuningJobName\":{\
          \"shape\":\"HyperParameterTuningJobName\",\
          \"documentation\":\"<p>The name of the tuning job. This name is the prefix for the names of all training jobs that this tuning job launches. The name must be unique within the same AWS account and AWS Region. The name must have { } to { } characters. Valid characters are a-z, A-Z, 0-9, and : + = @ _ % - (hyphen). The name is not case sensitive.</p>\"\
        },\
        \"HyperParameterTuningJobConfig\":{\
          \"shape\":\"HyperParameterTuningJobConfig\",\
          \"documentation\":\"<p>The <a>HyperParameterTuningJobConfig</a> object that describes the tuning job, including the search strategy, the objective metric used to evaluate training jobs, ranges of parameters to search, and resource limits for the tuning job. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-how-it-works.html\\\">How Hyperparameter Tuning Works</a>.</p>\"\
        },\
        \"TrainingJobDefinition\":{\
          \"shape\":\"HyperParameterTrainingJobDefinition\",\
          \"documentation\":\"<p>The <a>HyperParameterTrainingJobDefinition</a> object that describes the training jobs that this tuning job launches, including static hyperparameters, input data configuration, output data configuration, resource configuration, and stopping condition.</p>\"\
        },\
        \"TrainingJobDefinitions\":{\
          \"shape\":\"HyperParameterTrainingJobDefinitions\",\
          \"documentation\":\"<p/>\"\
        },\
        \"WarmStartConfig\":{\
          \"shape\":\"HyperParameterTuningJobWarmStartConfig\",\
          \"documentation\":\"<p>Specifies the configuration for starting the hyperparameter tuning job using one or more previous tuning jobs as a starting point. The results of previous tuning jobs are used to inform which combinations of hyperparameters to search over in the new tuning job.</p> <p>All training jobs launched by the new hyperparameter tuning job are evaluated by using the objective metric. If you specify <code>IDENTICAL_DATA_AND_ALGORITHM</code> as the <code>WarmStartType</code> value for the warm start configuration, the training job that performs the best in the new tuning job is compared to the best training jobs from the parent tuning jobs. From these, the training job that performs the best as measured by the objective metric is returned as the overall best training job.</p> <note> <p>All training jobs launched by parent hyperparameter tuning jobs and the new hyperparameter tuning jobs count against the limit of training jobs for the tuning job.</p> </note>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of key-value pairs. You can use tags to categorize your AWS resources in different ways, for example, by purpose, owner, or environment. For more information, see <a href=\\\"https://aws.amazon.com/answers/account-management/aws-tagging-strategies/\\\">AWS Tagging Strategies</a>.</p> <p>Tags that you specify for the tuning job are also added to all training jobs that the tuning job launches.</p>\"\
        }\
      }\
    },\
    \"CreateHyperParameterTuningJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"HyperParameterTuningJobArn\"],\
      \"members\":{\
        \"HyperParameterTuningJobArn\":{\
          \"shape\":\"HyperParameterTuningJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the tuning job. Amazon SageMaker assigns an ARN to a hyperparameter tuning job when you create it.</p>\"\
        }\
      }\
    },\
    \"CreateLabelingJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LabelingJobName\",\
        \"LabelAttributeName\",\
        \"InputConfig\",\
        \"OutputConfig\",\
        \"RoleArn\",\
        \"HumanTaskConfig\"\
      ],\
      \"members\":{\
        \"LabelingJobName\":{\
          \"shape\":\"LabelingJobName\",\
          \"documentation\":\"<p>The name of the labeling job. This name is used to identify the job in a list of labeling jobs.</p>\"\
        },\
        \"LabelAttributeName\":{\
          \"shape\":\"LabelAttributeName\",\
          \"documentation\":\"<p>The attribute name to use for the label in the output manifest file. This is the key for the key/value pair formed with the label that a worker assigns to the object. The name can't end with \\\"-metadata\\\". If you are running a semantic segmentation labeling job, the attribute name must end with \\\"-ref\\\". If you are running any other kind of labeling job, the attribute name must not end with \\\"-ref\\\".</p>\"\
        },\
        \"InputConfig\":{\
          \"shape\":\"LabelingJobInputConfig\",\
          \"documentation\":\"<p>Input data for the labeling job, such as the Amazon S3 location of the data objects and the location of the manifest file that describes the data objects.</p>\"\
        },\
        \"OutputConfig\":{\
          \"shape\":\"LabelingJobOutputConfig\",\
          \"documentation\":\"<p>The location of the output data and the AWS Key Management Service key ID for the key used to encrypt the output data, if any.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) that Amazon SageMaker assumes to perform tasks on your behalf during data labeling. You must grant this role the necessary permissions so that Amazon SageMaker can successfully complete data labeling.</p>\"\
        },\
        \"LabelCategoryConfigS3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The S3 URL of the file that defines the categories used to label the data objects.</p> <p>The file is a JSON structure in the following format:</p> <p> <code>{</code> </p> <p> <code> \\\"document-version\\\": \\\"2018-11-28\\\"</code> </p> <p> <code> \\\"labels\\\": [</code> </p> <p> <code> {</code> </p> <p> <code> \\\"label\\\": \\\"<i>label 1</i>\\\"</code> </p> <p> <code> },</code> </p> <p> <code> {</code> </p> <p> <code> \\\"label\\\": \\\"<i>label 2</i>\\\"</code> </p> <p> <code> },</code> </p> <p> <code> ...</code> </p> <p> <code> {</code> </p> <p> <code> \\\"label\\\": \\\"<i>label n</i>\\\"</code> </p> <p> <code> }</code> </p> <p> <code> ]</code> </p> <p> <code>}</code> </p>\"\
        },\
        \"StoppingConditions\":{\
          \"shape\":\"LabelingJobStoppingConditions\",\
          \"documentation\":\"<p>A set of conditions for stopping the labeling job. If any of the conditions are met, the job is automatically stopped. You can use these conditions to control the cost of data labeling.</p>\"\
        },\
        \"LabelingJobAlgorithmsConfig\":{\
          \"shape\":\"LabelingJobAlgorithmsConfig\",\
          \"documentation\":\"<p>Configures the information required to perform automated data labeling.</p>\"\
        },\
        \"HumanTaskConfig\":{\
          \"shape\":\"HumanTaskConfig\",\
          \"documentation\":\"<p>Configures the labeling task and how it is presented to workers; including, but not limited to price, keywords, and batch size (task count).</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of key/value pairs. For more information, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what\\\">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>\"\
        }\
      }\
    },\
    \"CreateLabelingJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"LabelingJobArn\"],\
      \"members\":{\
        \"LabelingJobArn\":{\
          \"shape\":\"LabelingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the labeling job. You use this ARN to identify the labeling job.</p>\"\
        }\
      }\
    },\
    \"CreateModelInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ModelName\",\
        \"ExecutionRoleArn\"\
      ],\
      \"members\":{\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the new model.</p>\"\
        },\
        \"PrimaryContainer\":{\
          \"shape\":\"ContainerDefinition\",\
          \"documentation\":\"<p>The location of the primary docker image containing inference code, associated artifacts, and custom environment map that the inference code uses when the model is deployed for predictions. </p>\"\
        },\
        \"Containers\":{\
          \"shape\":\"ContainerDefinitionList\",\
          \"documentation\":\"<p>Specifies the containers in the inference pipeline.</p>\"\
        },\
        \"ExecutionRoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker can assume to access model artifacts and docker image for deployment on ML compute instances or for batch transform jobs. Deploying on ML compute instances is part of model hosting. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html\\\">Amazon SageMaker Roles</a>. </p> <note> <p>To be able to pass this role to Amazon SageMaker, the caller of this API must have the <code>iam:PassRole</code> permission.</p> </note>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of key-value pairs. For more information, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what\\\">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>. </p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>A <a>VpcConfig</a> object that specifies the VPC that you want your model to connect to. Control access to and from your model container by configuring the VPC. <code>VpcConfig</code> is used in hosting services and in batch transform. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/host-vpc.html\\\">Protect Endpoints by Using an Amazon Virtual Private Cloud</a> and <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/batch-vpc.html\\\">Protect Data in Batch Transform Jobs by Using an Amazon Virtual Private Cloud</a>.</p>\"\
        },\
        \"EnableNetworkIsolation\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Isolates the model container. No inbound or outbound network calls can be made to or from the model container.</p>\"\
        }\
      }\
    },\
    \"CreateModelOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ModelArn\"],\
      \"members\":{\
        \"ModelArn\":{\
          \"shape\":\"ModelArn\",\
          \"documentation\":\"<p>The ARN of the model created in Amazon SageMaker.</p>\"\
        }\
      }\
    },\
    \"CreateModelPackageInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ModelPackageName\"],\
      \"members\":{\
        \"ModelPackageName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the model package. The name must have 1 to 63 characters. Valid characters are a-z, A-Z, 0-9, and - (hyphen).</p>\"\
        },\
        \"ModelPackageDescription\":{\
          \"shape\":\"EntityDescription\",\
          \"documentation\":\"<p>A description of the model package.</p>\"\
        },\
        \"InferenceSpecification\":{\
          \"shape\":\"InferenceSpecification\",\
          \"documentation\":\"<p>Specifies details about inference jobs that can be run with models based on this model package, including the following:</p> <ul> <li> <p>The Amazon ECR paths of containers that contain the inference code and model artifacts.</p> </li> <li> <p>The instance types that the model package supports for transform jobs and real-time endpoints used for inference.</p> </li> <li> <p>The input and output content formats that the model package supports for inference.</p> </li> </ul>\"\
        },\
        \"ValidationSpecification\":{\
          \"shape\":\"ModelPackageValidationSpecification\",\
          \"documentation\":\"<p>Specifies configurations for one or more transform jobs that Amazon SageMaker runs to test the model package.</p>\"\
        },\
        \"SourceAlgorithmSpecification\":{\
          \"shape\":\"SourceAlgorithmSpecification\",\
          \"documentation\":\"<p>Details about the algorithm that was used to create the model package.</p>\"\
        },\
        \"CertifyForMarketplace\":{\
          \"shape\":\"CertifyForMarketplace\",\
          \"documentation\":\"<p>Whether to certify the model package for listing on AWS Marketplace.</p>\"\
        }\
      }\
    },\
    \"CreateModelPackageOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ModelPackageArn\"],\
      \"members\":{\
        \"ModelPackageArn\":{\
          \"shape\":\"ModelPackageArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the new model package.</p>\"\
        }\
      }\
    },\
    \"CreateMonitoringScheduleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MonitoringScheduleName\",\
        \"MonitoringScheduleConfig\"\
      ],\
      \"members\":{\
        \"MonitoringScheduleName\":{\
          \"shape\":\"MonitoringScheduleName\",\
          \"documentation\":\"<p>The name of the monitoring schedule. The name must be unique within an AWS Region within an AWS account.</p>\"\
        },\
        \"MonitoringScheduleConfig\":{\
          \"shape\":\"MonitoringScheduleConfig\",\
          \"documentation\":\"<p>The configuration object that specifies the monitoring schedule and defines the monitoring job.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>(Optional) An array of key-value pairs. For more information, see <a href=\\\" https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL\\\">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>\"\
        }\
      }\
    },\
    \"CreateMonitoringScheduleResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"MonitoringScheduleArn\"],\
      \"members\":{\
        \"MonitoringScheduleArn\":{\
          \"shape\":\"MonitoringScheduleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the monitoring schedule.</p>\"\
        }\
      }\
    },\
    \"CreateNotebookInstanceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"NotebookInstanceName\",\
        \"InstanceType\",\
        \"RoleArn\"\
      ],\
      \"members\":{\
        \"NotebookInstanceName\":{\
          \"shape\":\"NotebookInstanceName\",\
          \"documentation\":\"<p>The name of the new notebook instance.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The type of ML compute instance to launch for the notebook instance.</p>\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"SubnetId\",\
          \"documentation\":\"<p>The ID of the subnet in a VPC to which you would like to have a connectivity from your ML compute instance. </p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>The VPC security group IDs, in the form sg-xxxxxxxx. The security groups must be for the same VPC as specified in the subnet. </p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p> When you send any requests to AWS resources from the notebook instance, Amazon SageMaker assumes this role to perform tasks on your behalf. You must grant this role necessary permissions so Amazon SageMaker can perform these tasks. The policy must allow the Amazon SageMaker service principal (sagemaker.amazonaws.com) permissions to assume this role. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html\\\">Amazon SageMaker Roles</a>. </p> <note> <p>To be able to pass this role to Amazon SageMaker, the caller of this API must have the <code>iam:PassRole</code> permission.</p> </note>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of a AWS Key Management Service key that Amazon SageMaker uses to encrypt data on the storage volume attached to your notebook instance. The KMS key you provide must be enabled. For information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/enabling-keys.html\\\">Enabling and Disabling Keys</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of tags to associate with the notebook instance. You can add tags later by using the <code>CreateTags</code> API.</p>\"\
        },\
        \"LifecycleConfigName\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigName\",\
          \"documentation\":\"<p>The name of a lifecycle configuration to associate with the notebook instance. For information about lifestyle configurations, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html\\\">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>\"\
        },\
        \"DirectInternetAccess\":{\
          \"shape\":\"DirectInternetAccess\",\
          \"documentation\":\"<p>Sets whether Amazon SageMaker provides internet access to the notebook instance. If you set this to <code>Disabled</code> this notebook instance will be able to access resources only in your VPC, and will not be able to connect to Amazon SageMaker training and endpoint services unless your configure a NAT Gateway in your VPC.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/appendix-additional-considerations.html#appendix-notebook-and-internet-access\\\">Notebook Instances Are Internet-Enabled by Default</a>. You can set the value of this parameter to <code>Disabled</code> only if you set a value for the <code>SubnetId</code> parameter.</p>\"\
        },\
        \"VolumeSizeInGB\":{\
          \"shape\":\"NotebookInstanceVolumeSizeInGB\",\
          \"documentation\":\"<p>The size, in GB, of the ML storage volume to attach to the notebook instance. The default value is 5 GB.</p>\"\
        },\
        \"AcceleratorTypes\":{\
          \"shape\":\"NotebookInstanceAcceleratorTypes\",\
          \"documentation\":\"<p>A list of Elastic Inference (EI) instance types to associate with this notebook instance. Currently, only one instance type can be associated with a notebook instance. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html\\\">Using Elastic Inference in Amazon SageMaker</a>.</p>\"\
        },\
        \"DefaultCodeRepository\":{\
          \"shape\":\"CodeRepositoryNameOrUrl\",\
          \"documentation\":\"<p>A Git repository to associate with the notebook instance as its default code repository. This can be either the name of a Git repository stored as a resource in your account, or the URL of a Git repository in <a href=\\\"https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html\\\">AWS CodeCommit</a> or in any other Git repository. When you open a notebook instance, it opens in the directory that contains this repository. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html\\\">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>\"\
        },\
        \"AdditionalCodeRepositories\":{\
          \"shape\":\"AdditionalCodeRepositoryNamesOrUrls\",\
          \"documentation\":\"<p>An array of up to three Git repositories to associate with the notebook instance. These can be either the names of Git repositories stored as resources in your account, or the URL of Git repositories in <a href=\\\"https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html\\\">AWS CodeCommit</a> or in any other Git repository. These repositories are cloned at the same level as the default repository of your notebook instance. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html\\\">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>\"\
        },\
        \"RootAccess\":{\
          \"shape\":\"RootAccess\",\
          \"documentation\":\"<p>Whether root access is enabled or disabled for users of the notebook instance. The default value is <code>Enabled</code>.</p> <note> <p>Lifecycle configurations need root access to be able to set up a notebook instance. Because of this, lifecycle configurations associated with a notebook instance always run with root access even if you disable root access for users.</p> </note>\"\
        }\
      }\
    },\
    \"CreateNotebookInstanceLifecycleConfigInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"NotebookInstanceLifecycleConfigName\"],\
      \"members\":{\
        \"NotebookInstanceLifecycleConfigName\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigName\",\
          \"documentation\":\"<p>The name of the lifecycle configuration.</p>\"\
        },\
        \"OnCreate\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigList\",\
          \"documentation\":\"<p>A shell script that runs only once, when you create a notebook instance. The shell script must be a base64-encoded string.</p>\"\
        },\
        \"OnStart\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigList\",\
          \"documentation\":\"<p>A shell script that runs every time you start a notebook instance, including when you create the notebook instance. The shell script must be a base64-encoded string.</p>\"\
        }\
      }\
    },\
    \"CreateNotebookInstanceLifecycleConfigOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NotebookInstanceLifecycleConfigArn\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the lifecycle configuration.</p>\"\
        }\
      }\
    },\
    \"CreateNotebookInstanceOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NotebookInstanceArn\":{\
          \"shape\":\"NotebookInstanceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the notebook instance. </p>\"\
        }\
      }\
    },\
    \"CreatePresignedDomainUrlRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainId\",\
        \"UserProfileName\"\
      ],\
      \"members\":{\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"UserProfileName\":{\
          \"shape\":\"UserProfileName\",\
          \"documentation\":\"<p>The name of the UserProfile to sign-in as.</p>\"\
        },\
        \"SessionExpirationDurationInSeconds\":{\
          \"shape\":\"SessionExpirationDurationInSeconds\",\
          \"documentation\":\"<p>The session expiration duration in seconds.</p>\"\
        }\
      }\
    },\
    \"CreatePresignedDomainUrlResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AuthorizedUrl\":{\
          \"shape\":\"PresignedDomainUrl\",\
          \"documentation\":\"<p>The presigned URL.</p>\"\
        }\
      }\
    },\
    \"CreatePresignedNotebookInstanceUrlInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"NotebookInstanceName\"],\
      \"members\":{\
        \"NotebookInstanceName\":{\
          \"shape\":\"NotebookInstanceName\",\
          \"documentation\":\"<p>The name of the notebook instance.</p>\"\
        },\
        \"SessionExpirationDurationInSeconds\":{\
          \"shape\":\"SessionExpirationDurationInSeconds\",\
          \"documentation\":\"<p>The duration of the session, in seconds. The default is 12 hours.</p>\"\
        }\
      }\
    },\
    \"CreatePresignedNotebookInstanceUrlOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AuthorizedUrl\":{\
          \"shape\":\"NotebookInstanceUrl\",\
          \"documentation\":\"<p>A JSON object that contains the URL string. </p>\"\
        }\
      }\
    },\
    \"CreateProcessingJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ProcessingJobName\",\
        \"ProcessingResources\",\
        \"AppSpecification\",\
        \"RoleArn\"\
      ],\
      \"members\":{\
        \"ProcessingInputs\":{\
          \"shape\":\"ProcessingInputs\",\
          \"documentation\":\"<p>For each input, data is downloaded from S3 into the processing container before the processing job begins running if \\\"S3InputMode\\\" is set to <code>File</code>.</p>\"\
        },\
        \"ProcessingOutputConfig\":{\
          \"shape\":\"ProcessingOutputConfig\",\
          \"documentation\":\"<p>Output configuration for the processing job.</p>\"\
        },\
        \"ProcessingJobName\":{\
          \"shape\":\"ProcessingJobName\",\
          \"documentation\":\"<p> The name of the processing job. The name must be unique within an AWS Region in the AWS account.</p>\"\
        },\
        \"ProcessingResources\":{\
          \"shape\":\"ProcessingResources\",\
          \"documentation\":\"<p>Identifies the resources, ML compute instances, and ML storage volumes to deploy for a processing job. In distributed training, you specify more than one instance.</p>\"\
        },\
        \"StoppingCondition\":{\
          \"shape\":\"ProcessingStoppingCondition\",\
          \"documentation\":\"<p>The time limit for how long the processing job is allowed to run.</p>\"\
        },\
        \"AppSpecification\":{\
          \"shape\":\"AppSpecification\",\
          \"documentation\":\"<p>Configures the processing job to run a specified Docker container image.</p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"ProcessingEnvironmentMap\",\
          \"documentation\":\"<p>Sets the environment variables in the Docker container.</p>\"\
        },\
        \"NetworkConfig\":{\
          \"shape\":\"NetworkConfig\",\
          \"documentation\":\"<p>Networking options for a processing job.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker can assume to perform tasks on your behalf.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>(Optional) An array of key-value pairs. For more information, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL\\\">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>\"\
        },\
        \"ExperimentConfig\":{\"shape\":\"ExperimentConfig\"}\
      }\
    },\
    \"CreateProcessingJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ProcessingJobArn\"],\
      \"members\":{\
        \"ProcessingJobArn\":{\
          \"shape\":\"ProcessingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the processing job.</p>\"\
        }\
      }\
    },\
    \"CreateTrainingJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrainingJobName\",\
        \"AlgorithmSpecification\",\
        \"RoleArn\",\
        \"OutputDataConfig\",\
        \"ResourceConfig\",\
        \"StoppingCondition\"\
      ],\
      \"members\":{\
        \"TrainingJobName\":{\
          \"shape\":\"TrainingJobName\",\
          \"documentation\":\"<p>The name of the training job. The name must be unique within an AWS Region in an AWS account. </p>\"\
        },\
        \"HyperParameters\":{\
          \"shape\":\"HyperParameters\",\
          \"documentation\":\"<p>Algorithm-specific parameters that influence the quality of the model. You set hyperparameters before you start the learning process. For a list of hyperparameters for each training algorithm provided by Amazon SageMaker, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html\\\">Algorithms</a>. </p> <p>You can specify a maximum of 100 hyperparameters. Each hyperparameter is a key-value pair. Each key and value is limited to 256 characters, as specified by the <code>Length Constraint</code>. </p>\"\
        },\
        \"AlgorithmSpecification\":{\
          \"shape\":\"AlgorithmSpecification\",\
          \"documentation\":\"<p>The registry path of the Docker image that contains the training algorithm and algorithm-specific metadata, including the input mode. For more information about algorithms provided by Amazon SageMaker, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html\\\">Algorithms</a>. For information about providing your own algorithms, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html\\\">Using Your Own Algorithms with Amazon SageMaker</a>. </p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker can assume to perform tasks on your behalf. </p> <p>During model training, Amazon SageMaker needs your permission to read input data from an S3 bucket, download a Docker image that contains training code, write model artifacts to an S3 bucket, write logs to Amazon CloudWatch Logs, and publish metrics to Amazon CloudWatch. You grant permissions for all of these tasks to an IAM role. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html\\\">Amazon SageMaker Roles</a>. </p> <note> <p>To be able to pass this role to Amazon SageMaker, the caller of this API must have the <code>iam:PassRole</code> permission.</p> </note>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>An array of <code>Channel</code> objects. Each channel is a named input source. <code>InputDataConfig</code> describes the input data and its location. </p> <p>Algorithms can accept input data from one or more channels. For example, an algorithm might have two channels of input data, <code>training_data</code> and <code>validation_data</code>. The configuration for each channel provides the S3, EFS, or FSx location where the input data is stored. It also provides information about the stored data: the MIME type, compression method, and whether the data is wrapped in RecordIO format. </p> <p>Depending on the input mode that the algorithm supports, Amazon SageMaker either copies input data files from an S3 bucket to a local directory in the Docker container, or makes it available as input streams. For example, if you specify an EFS location, input data files will be made available as input streams. They do not need to be downloaded.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies the path to the S3 location where you want to store model artifacts. Amazon SageMaker creates subfolders for the artifacts. </p>\"\
        },\
        \"ResourceConfig\":{\
          \"shape\":\"ResourceConfig\",\
          \"documentation\":\"<p>The resources, including the ML compute instances and ML storage volumes, to use for model training. </p> <p>ML storage volumes store model artifacts and incremental states. Training algorithms might also use ML storage volumes for scratch space. If you want Amazon SageMaker to use the ML storage volume to store the training data, choose <code>File</code> as the <code>TrainingInputMode</code> in the algorithm specification. For distributed training algorithms, specify an instance count greater than 1.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>A <a>VpcConfig</a> object that specifies the VPC that you want your training job to connect to. Control access to and from your training container by configuring the VPC. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html\\\">Protect Training Jobs by Using an Amazon Virtual Private Cloud</a>.</p>\"\
        },\
        \"StoppingCondition\":{\
          \"shape\":\"StoppingCondition\",\
          \"documentation\":\"<p>Specifies a limit to how long a model training job can run. When the job reaches the time limit, Amazon SageMaker ends the training job. Use this API to cap model training costs.</p> <p>To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms can use this 120-second window to save the model artifacts, so the results of training are not lost. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of key-value pairs. For more information, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what\\\">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>. </p>\"\
        },\
        \"EnableNetworkIsolation\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Isolates the training container. No inbound or outbound network calls can be made, except for calls between peers within a training cluster for distributed training. If you enable network isolation for training jobs that are configured to use a VPC, Amazon SageMaker downloads and uploads customer data and model artifacts through the specified VPC, but the training container does not have network access.</p>\"\
        },\
        \"EnableInterContainerTrafficEncryption\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>To encrypt all communications between ML compute instances in distributed training, choose <code>True</code>. Encryption provides greater security for distributed training, but training might take longer. How long it takes depends on the amount of communication between compute instances, especially if you use a deep learning algorithm in distributed training. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/train-encrypt.html\\\">Protect Communications Between ML Compute Instances in a Distributed Training Job</a>.</p>\"\
        },\
        \"EnableManagedSpotTraining\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>To train models using managed spot training, choose <code>True</code>. Managed spot training provides a fully managed and scalable infrastructure for training machine learning models. this option is useful when training jobs can be interrupted and when there is flexibility when the training job is run. </p> <p>The complete and intermediate results of jobs are stored in an Amazon S3 bucket, and can be used as a starting point to train models incrementally. Amazon SageMaker provides metrics and logs in CloudWatch. They can be used to see when managed spot training jobs are running, interrupted, resumed, or completed. </p>\"\
        },\
        \"CheckpointConfig\":{\
          \"shape\":\"CheckpointConfig\",\
          \"documentation\":\"<p>Contains information about the output location for managed spot training checkpoint data.</p>\"\
        },\
        \"DebugHookConfig\":{\"shape\":\"DebugHookConfig\"},\
        \"DebugRuleConfigurations\":{\
          \"shape\":\"DebugRuleConfigurations\",\
          \"documentation\":\"<p>Configuration information for debugging rules.</p>\"\
        },\
        \"TensorBoardOutputConfig\":{\"shape\":\"TensorBoardOutputConfig\"},\
        \"ExperimentConfig\":{\"shape\":\"ExperimentConfig\"}\
      }\
    },\
    \"CreateTrainingJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrainingJobArn\"],\
      \"members\":{\
        \"TrainingJobArn\":{\
          \"shape\":\"TrainingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the training job.</p>\"\
        }\
      }\
    },\
    \"CreateTransformJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TransformJobName\",\
        \"ModelName\",\
        \"TransformInput\",\
        \"TransformOutput\",\
        \"TransformResources\"\
      ],\
      \"members\":{\
        \"TransformJobName\":{\
          \"shape\":\"TransformJobName\",\
          \"documentation\":\"<p>The name of the transform job. The name must be unique within an AWS Region in an AWS account. </p>\"\
        },\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the model that you want to use for the transform job. <code>ModelName</code> must be the name of an existing Amazon SageMaker model within an AWS Region in an AWS account.</p>\"\
        },\
        \"MaxConcurrentTransforms\":{\
          \"shape\":\"MaxConcurrentTransforms\",\
          \"documentation\":\"<p>The maximum number of parallel requests that can be sent to each instance in a transform job. If <code>MaxConcurrentTransforms</code> is set to <code>0</code> or left unset, Amazon SageMaker checks the optional execution-parameters to determine the settings for your chosen algorithm. If the execution-parameters endpoint is not enabled, the default value is <code>1</code>. For more information on execution-parameters, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms-batch-code.html#your-algorithms-batch-code-how-containe-serves-requests\\\">How Containers Serve Requests</a>. For built-in algorithms, you don't need to set a value for <code>MaxConcurrentTransforms</code>.</p>\"\
        },\
        \"MaxPayloadInMB\":{\
          \"shape\":\"MaxPayloadInMB\",\
          \"documentation\":\"<p>The maximum allowed size of the payload, in MB. A <i>payload</i> is the data portion of a record (without metadata). The value in <code>MaxPayloadInMB</code> must be greater than, or equal to, the size of a single record. To estimate the size of a record in MB, divide the size of your dataset by the number of records. To ensure that the records fit within the maximum payload size, we recommend using a slightly larger value. The default value is <code>6</code> MB. </p> <p>For cases where the payload might be arbitrarily large and is transmitted using HTTP chunked encoding, set the value to <code>0</code>. This feature works only in supported algorithms. Currently, Amazon SageMaker built-in algorithms do not support HTTP chunked encoding.</p>\"\
        },\
        \"BatchStrategy\":{\
          \"shape\":\"BatchStrategy\",\
          \"documentation\":\"<p>Specifies the number of records to include in a mini-batch for an HTTP inference request. A <i>record</i> <i/> is a single unit of input data that inference can be made on. For example, a single line in a CSV file is a record. </p> <p>To enable the batch strategy, you must set the <code>SplitType</code> property to <code>Line</code>, <code>RecordIO</code>, or <code>TFRecord</code>.</p> <p>To use only one record when making an HTTP invocation request to a container, set <code>BatchStrategy</code> to <code>SingleRecord</code> and <code>SplitType</code> to <code>Line</code>.</p> <p>To fit as many records in a mini-batch as can fit within the <code>MaxPayloadInMB</code> limit, set <code>BatchStrategy</code> to <code>MultiRecord</code> and <code>SplitType</code> to <code>Line</code>.</p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"TransformEnvironmentMap\",\
          \"documentation\":\"<p>The environment variables to set in the Docker container. We support up to 16 key and values entries in the map.</p>\"\
        },\
        \"TransformInput\":{\
          \"shape\":\"TransformInput\",\
          \"documentation\":\"<p>Describes the input source and the way the transform job consumes it.</p>\"\
        },\
        \"TransformOutput\":{\
          \"shape\":\"TransformOutput\",\
          \"documentation\":\"<p>Describes the results of the transform job.</p>\"\
        },\
        \"TransformResources\":{\
          \"shape\":\"TransformResources\",\
          \"documentation\":\"<p>Describes the resources, including ML instance types and ML instance count, to use for the transform job.</p>\"\
        },\
        \"DataProcessing\":{\
          \"shape\":\"DataProcessing\",\
          \"documentation\":\"<p>The data structure used to specify the data to be used for inference in a batch transform job and to associate the data that is relevant to the prediction results in the output. The input filter provided allows you to exclude input data that is not needed for inference in a batch transform job. The output filter provided allows you to include input data relevant to interpreting the predictions in the output from the job. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html\\\">Associate Prediction Results with their Corresponding Input Records</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>(Optional) An array of key-value pairs. For more information, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what\\\">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>\"\
        },\
        \"ExperimentConfig\":{\"shape\":\"ExperimentConfig\"}\
      }\
    },\
    \"CreateTransformJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"TransformJobArn\"],\
      \"members\":{\
        \"TransformJobArn\":{\
          \"shape\":\"TransformJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the transform job.</p>\"\
        }\
      }\
    },\
    \"CreateTrialComponentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrialComponentName\"],\
      \"members\":{\
        \"TrialComponentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the component. The name must be unique in your AWS account and is not case-sensitive.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the component as displayed. The name doesn't need to be unique. If <code>DisplayName</code> isn't specified, <code>TrialComponentName</code> is displayed.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"TrialComponentStatus\",\
          \"documentation\":\"<p>The status of the component. States include:</p> <ul> <li> <p>InProgress</p> </li> <li> <p>Completed</p> </li> <li> <p>Failed</p> </li> </ul>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component started.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component ended.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"TrialComponentParameters\",\
          \"documentation\":\"<p>The hyperparameters for the component.</p>\"\
        },\
        \"InputArtifacts\":{\
          \"shape\":\"TrialComponentArtifacts\",\
          \"documentation\":\"<p>The input artifacts for the component. Examples of input artifacts are datasets, algorithms, hyperparameters, source code, and instance types.</p>\"\
        },\
        \"OutputArtifacts\":{\
          \"shape\":\"TrialComponentArtifacts\",\
          \"documentation\":\"<p>The output artifacts for the component. Examples of output artifacts are metrics, snapshots, logs, and images.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of tags to associate with the component. You can use <a>Search</a> API to search on the tags.</p>\"\
        }\
      }\
    },\
    \"CreateTrialComponentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialComponentArn\":{\
          \"shape\":\"TrialComponentArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trial component.</p>\"\
        }\
      }\
    },\
    \"CreateTrialRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrialName\",\
        \"ExperimentName\"\
      ],\
      \"members\":{\
        \"TrialName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial. The name must be unique in your AWS account and is not case-sensitive.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial as displayed. The name doesn't need to be unique. If <code>DisplayName</code> isn't specified, <code>TrialName</code> is displayed.</p>\"\
        },\
        \"ExperimentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment to associate the trial with.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A list of tags to associate with the trial. You can use <a>Search</a> API to search on the tags.</p>\"\
        }\
      }\
    },\
    \"CreateTrialResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialArn\":{\
          \"shape\":\"TrialArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trial.</p>\"\
        }\
      }\
    },\
    \"CreateUserProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainId\",\
        \"UserProfileName\"\
      ],\
      \"members\":{\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The ID of the associated Domain.</p>\"\
        },\
        \"UserProfileName\":{\
          \"shape\":\"UserProfileName\",\
          \"documentation\":\"<p>A name for the UserProfile.</p>\"\
        },\
        \"SingleSignOnUserIdentifier\":{\
          \"shape\":\"SingleSignOnUserIdentifier\",\
          \"documentation\":\"<p>A specifier for the type of value specified in SingleSignOnUserValue. Currently, the only supported value is \\\"UserName\\\". If the Domain's AuthMode is SSO, this field is required. If the Domain's AuthMode is not SSO, this field cannot be specified. </p>\"\
        },\
        \"SingleSignOnUserValue\":{\
          \"shape\":\"String256\",\
          \"documentation\":\"<p>The username of the associated AWS Single Sign-On User for this UserProfile. If the Domain's AuthMode is SSO, this field is required, and must match a valid username of a user in your directory. If the Domain's AuthMode is not SSO, this field cannot be specified. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Each tag consists of a key and an optional value. Tag keys must be unique per resource.</p>\"\
        },\
        \"UserSettings\":{\
          \"shape\":\"UserSettings\",\
          \"documentation\":\"<p>A collection of settings.</p>\"\
        }\
      }\
    },\
    \"CreateUserProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserProfileArn\":{\
          \"shape\":\"UserProfileArn\",\
          \"documentation\":\"<p>The user profile Amazon Resource Name (ARN).</p>\"\
        }\
      }\
    },\
    \"CreateWorkteamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"WorkteamName\",\
        \"MemberDefinitions\",\
        \"Description\"\
      ],\
      \"members\":{\
        \"WorkteamName\":{\
          \"shape\":\"WorkteamName\",\
          \"documentation\":\"<p>The name of the work team. Use this name to identify the work team.</p>\"\
        },\
        \"MemberDefinitions\":{\
          \"shape\":\"MemberDefinitions\",\
          \"documentation\":\"<p>A list of <code>MemberDefinition</code> objects that contains objects that identify the Amazon Cognito user pool that makes up the work team. For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html\\\">Amazon Cognito User Pools</a>.</p> <p>All of the <code>CognitoMemberDefinition</code> objects that make up the member definition must have the same <code>ClientId</code> and <code>UserPool</code> values.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String200\",\
          \"documentation\":\"<p>A description of the work team.</p>\"\
        },\
        \"NotificationConfiguration\":{\
          \"shape\":\"NotificationConfiguration\",\
          \"documentation\":\"<p>Configures notification of workers regarding available or expiring work items.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of key-value pairs.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-resource-tags.html\\\">Resource Tag</a> and <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what\\\">Using Cost Allocation Tags</a> in the <i> AWS Billing and Cost Management User Guide</i>.</p>\"\
        }\
      }\
    },\
    \"CreateWorkteamResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"WorkteamArn\":{\
          \"shape\":\"WorkteamArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the work team. You can use this ARN to identify the work team.</p>\"\
        }\
      }\
    },\
    \"CreationTime\":{\"type\":\"timestamp\"},\
    \"CsvContentType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\\\\/[a-zA-Z0-9](-*[a-zA-Z0-9.])*\"\
    },\
    \"CsvContentTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CsvContentType\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"DataCaptureConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InitialSamplingPercentage\",\
        \"DestinationS3Uri\",\
        \"CaptureOptions\"\
      ],\
      \"members\":{\
        \"EnableCapture\":{\
          \"shape\":\"EnableCapture\",\
          \"documentation\":\"<p/>\"\
        },\
        \"InitialSamplingPercentage\":{\
          \"shape\":\"SamplingPercentage\",\
          \"documentation\":\"<p/>\"\
        },\
        \"DestinationS3Uri\":{\
          \"shape\":\"DestinationS3Uri\",\
          \"documentation\":\"<p/>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p/>\"\
        },\
        \"CaptureOptions\":{\
          \"shape\":\"CaptureOptionList\",\
          \"documentation\":\"<p/>\"\
        },\
        \"CaptureContentTypeHeader\":{\
          \"shape\":\"CaptureContentTypeHeader\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p/>\"\
    },\
    \"DataCaptureConfigSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EnableCapture\",\
        \"CaptureStatus\",\
        \"CurrentSamplingPercentage\",\
        \"DestinationS3Uri\",\
        \"KmsKeyId\"\
      ],\
      \"members\":{\
        \"EnableCapture\":{\
          \"shape\":\"EnableCapture\",\
          \"documentation\":\"<p/>\"\
        },\
        \"CaptureStatus\":{\
          \"shape\":\"CaptureStatus\",\
          \"documentation\":\"<p/>\"\
        },\
        \"CurrentSamplingPercentage\":{\
          \"shape\":\"SamplingPercentage\",\
          \"documentation\":\"<p/>\"\
        },\
        \"DestinationS3Uri\":{\
          \"shape\":\"DestinationS3Uri\",\
          \"documentation\":\"<p/>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p/>\"\
    },\
    \"DataExplorationNotebookLocation\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"DataInputConfig\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"[\\\\S\\\\s]+\"\
    },\
    \"DataProcessing\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InputFilter\":{\
          \"shape\":\"JsonPath\",\
          \"documentation\":\"<p>A <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html#data-processing-operators\\\">JSONPath</a> expression used to select a portion of the input data to pass to the algorithm. Use the <code>InputFilter</code> parameter to exclude fields, such as an ID column, from the input. If you want Amazon SageMaker to pass the entire input dataset to the algorithm, accept the default value <code>$</code>.</p> <p>Examples: <code>\\\"$\\\"</code>, <code>\\\"$[1:]\\\"</code>, <code>\\\"$.features\\\"</code> </p>\"\
        },\
        \"OutputFilter\":{\
          \"shape\":\"JsonPath\",\
          \"documentation\":\"<p>A <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html#data-processing-operators\\\">JSONPath</a> expression used to select a portion of the joined dataset to save in the output file for a batch transform job. If you want Amazon SageMaker to store the entire input dataset in the output file, leave the default value, <code>$</code>. If you specify indexes that aren't within the dimension size of the joined dataset, you get an error.</p> <p>Examples: <code>\\\"$\\\"</code>, <code>\\\"$[0,5:]\\\"</code>, <code>\\\"$['id','SageMakerOutput']\\\"</code> </p>\"\
        },\
        \"JoinSource\":{\
          \"shape\":\"JoinSource\",\
          \"documentation\":\"<p>Specifies the source of the data to join with the transformed data. The valid values are <code>None</code> and <code>Input</code>. The default value is <code>None</code>, which specifies not to join the input with the transformed data. If you want the batch transform job to join the original input data with the transformed data, set <code>JoinSource</code> to <code>Input</code>. </p> <p>For JSON or JSONLines objects, such as a JSON array, Amazon SageMaker adds the transformed data to the input JSON object in an attribute called <code>SageMakerOutput</code>. The joined result for JSON must be a key-value pair object. If the input is not a key-value pair object, Amazon SageMaker creates a new JSON file. In the new JSON file, and the input data is stored under the <code>SageMakerInput</code> key and the results are stored in <code>SageMakerOutput</code>.</p> <p>For CSV files, Amazon SageMaker combines the transformed data with the input data at the end of the input data and stores it in the output file. The joined data has the joined input data followed by the transformed data and the output is a CSV file. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The data structure used to specify the data to be used for inference in a batch transform job and to associate the data that is relevant to the prediction results in the output. The input filter provided allows you to exclude input data that is not needed for inference in a batch transform job. The output filter provided allows you to include input data relevant to interpreting the predictions in the output from the job. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html\\\">Associate Prediction Results with their Corresponding Input Records</a>.</p>\"\
    },\
    \"DataSource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3DataSource\":{\
          \"shape\":\"S3DataSource\",\
          \"documentation\":\"<p>The S3 location of the data source that is associated with a channel.</p>\"\
        },\
        \"FileSystemDataSource\":{\
          \"shape\":\"FileSystemDataSource\",\
          \"documentation\":\"<p>The file system that is associated with a channel.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the location of the channel data.</p>\"\
    },\
    \"DebugHookConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3OutputPath\"],\
      \"members\":{\
        \"LocalPath\":{\
          \"shape\":\"DirectoryPath\",\
          \"documentation\":\"<p>Path to local storage location for tensors. Defaults to <code>/opt/ml/output/tensors/</code>.</p>\"\
        },\
        \"S3OutputPath\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>Path to Amazon S3 storage location for tensors.</p>\"\
        },\
        \"HookParameters\":{\
          \"shape\":\"HookParameters\",\
          \"documentation\":\"<p>Configuration information for the debug hook parameters.</p>\"\
        },\
        \"CollectionConfigurations\":{\
          \"shape\":\"CollectionConfigurations\",\
          \"documentation\":\"<p>Configuration information for tensor collections.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information for the debug hook parameters, collection configuration, and storage paths.</p>\"\
    },\
    \"DebugRuleConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RuleConfigurationName\",\
        \"RuleEvaluatorImage\"\
      ],\
      \"members\":{\
        \"RuleConfigurationName\":{\
          \"shape\":\"RuleConfigurationName\",\
          \"documentation\":\"<p>The name of the rule configuration. It must be unique relative to other rule configuration names.</p>\"\
        },\
        \"LocalPath\":{\
          \"shape\":\"DirectoryPath\",\
          \"documentation\":\"<p>Path to local storage location for output of rules. Defaults to <code>/opt/ml/processing/output/rule/</code>.</p>\"\
        },\
        \"S3OutputPath\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>Path to Amazon S3 storage location for rules.</p>\"\
        },\
        \"RuleEvaluatorImage\":{\
          \"shape\":\"AlgorithmImage\",\
          \"documentation\":\"<p>The Amazon Elastic Container (ECR) Image for the managed rule evaluation.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"ProcessingInstanceType\",\
          \"documentation\":\"<p>The instance type to deploy for a training job.</p>\"\
        },\
        \"VolumeSizeInGB\":{\
          \"shape\":\"OptionalVolumeSizeInGB\",\
          \"documentation\":\"<p>The size, in GB, of the ML storage volume attached to the processing instance.</p>\"\
        },\
        \"RuleParameters\":{\
          \"shape\":\"RuleParameters\",\
          \"documentation\":\"<p> Runtime configuration for rule container.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information for debugging rules.</p>\"\
    },\
    \"DebugRuleConfigurations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DebugRuleConfiguration\"},\
      \"max\":20,\
      \"min\":0\
    },\
    \"DebugRuleEvaluationStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RuleConfigurationName\":{\
          \"shape\":\"RuleConfigurationName\",\
          \"documentation\":\"<p>The name of the rule configuration</p>\"\
        },\
        \"RuleEvaluationJobArn\":{\
          \"shape\":\"ProcessingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the rule evaluation job.</p>\"\
        },\
        \"RuleEvaluationStatus\":{\
          \"shape\":\"RuleEvaluationStatus\",\
          \"documentation\":\"<p>Status of the rule evaluation.</p>\"\
        },\
        \"StatusDetails\":{\
          \"shape\":\"StatusDetails\",\
          \"documentation\":\"<p>Details from the rule evaluation.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Timestamp when the rule evaluation status was last modified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the status of the rule evaluation.</p>\"\
    },\
    \"DebugRuleEvaluationStatuses\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DebugRuleEvaluationStatus\"},\
      \"max\":20,\
      \"min\":0\
    },\
    \"DeleteAlgorithmInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"AlgorithmName\"],\
      \"members\":{\
        \"AlgorithmName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the algorithm to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteAppRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainId\",\
        \"UserProfileName\",\
        \"AppType\",\
        \"AppName\"\
      ],\
      \"members\":{\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"UserProfileName\":{\
          \"shape\":\"UserProfileName\",\
          \"documentation\":\"<p>The user profile name.</p>\"\
        },\
        \"AppType\":{\
          \"shape\":\"AppType\",\
          \"documentation\":\"<p>The type of app.</p>\"\
        },\
        \"AppName\":{\
          \"shape\":\"AppName\",\
          \"documentation\":\"<p>The name of the app.</p>\"\
        }\
      }\
    },\
    \"DeleteCodeRepositoryInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeRepositoryName\"],\
      \"members\":{\
        \"CodeRepositoryName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the Git repository to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainId\"],\
      \"members\":{\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"RetentionPolicy\":{\
          \"shape\":\"RetentionPolicy\",\
          \"documentation\":\"<p>The retention policy for this domain, which specifies whether resources will be retained after the Domain is deleted. By default, all resources are retained (not automatically deleted). </p>\"\
        }\
      }\
    },\
    \"DeleteEndpointConfigInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointConfigName\"],\
      \"members\":{\
        \"EndpointConfigName\":{\
          \"shape\":\"EndpointConfigName\",\
          \"documentation\":\"<p>The name of the endpoint configuration that you want to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteEndpointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointName\"],\
      \"members\":{\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p>The name of the endpoint that you want to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteExperimentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ExperimentName\"],\
      \"members\":{\
        \"ExperimentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteExperimentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExperimentArn\":{\
          \"shape\":\"ExperimentArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the experiment that is being deleted.</p>\"\
        }\
      }\
    },\
    \"DeleteFlowDefinitionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FlowDefinitionName\"],\
      \"members\":{\
        \"FlowDefinitionName\":{\
          \"shape\":\"FlowDefinitionName\",\
          \"documentation\":\"<p>The name of the flow definition you are deleting.</p>\"\
        }\
      }\
    },\
    \"DeleteFlowDefinitionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteModelInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ModelName\"],\
      \"members\":{\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the model to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteModelPackageInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ModelPackageName\"],\
      \"members\":{\
        \"ModelPackageName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the model package. The name must have 1 to 63 characters. Valid characters are a-z, A-Z, 0-9, and - (hyphen).</p>\"\
        }\
      }\
    },\
    \"DeleteMonitoringScheduleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MonitoringScheduleName\"],\
      \"members\":{\
        \"MonitoringScheduleName\":{\
          \"shape\":\"MonitoringScheduleName\",\
          \"documentation\":\"<p>The name of the monitoring schedule to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteNotebookInstanceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"NotebookInstanceName\"],\
      \"members\":{\
        \"NotebookInstanceName\":{\
          \"shape\":\"NotebookInstanceName\",\
          \"documentation\":\"<p>The name of the Amazon SageMaker notebook instance to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteNotebookInstanceLifecycleConfigInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"NotebookInstanceLifecycleConfigName\"],\
      \"members\":{\
        \"NotebookInstanceLifecycleConfigName\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigName\",\
          \"documentation\":\"<p>The name of the lifecycle configuration to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteTagsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource whose tags you want to delete.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>An array or one or more tag keys to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteTagsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteTrialComponentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrialComponentName\"],\
      \"members\":{\
        \"TrialComponentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the component to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteTrialComponentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialComponentArn\":{\
          \"shape\":\"TrialComponentArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the component is being deleted.</p>\"\
        }\
      }\
    },\
    \"DeleteTrialRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrialName\"],\
      \"members\":{\
        \"TrialName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteTrialResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialArn\":{\
          \"shape\":\"TrialArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trial that is being deleted.</p>\"\
        }\
      }\
    },\
    \"DeleteUserProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainId\",\
        \"UserProfileName\"\
      ],\
      \"members\":{\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"UserProfileName\":{\
          \"shape\":\"UserProfileName\",\
          \"documentation\":\"<p>The user profile name.</p>\"\
        }\
      }\
    },\
    \"DeleteWorkteamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"WorkteamName\"],\
      \"members\":{\
        \"WorkteamName\":{\
          \"shape\":\"WorkteamName\",\
          \"documentation\":\"<p>The name of the work team to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteWorkteamResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Success\"],\
      \"members\":{\
        \"Success\":{\
          \"shape\":\"Success\",\
          \"documentation\":\"<p>Returns <code>true</code> if the work team was successfully deleted; otherwise, returns <code>false</code>.</p>\"\
        }\
      }\
    },\
    \"DeployedImage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SpecifiedImage\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The image path you specified when you created the model.</p>\"\
        },\
        \"ResolvedImage\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The specific digest path of the image hosted in this <code>ProductionVariant</code>.</p>\"\
        },\
        \"ResolutionTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time when the image path for the model resolved to the <code>ResolvedImage</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Gets the Amazon EC2 Container Registry path of the docker image of the model that is hosted in this <a>ProductionVariant</a>.</p> <p>If you used the <code>registry/repository[:tag]</code> form to specify the image path of the primary container when you created the model hosted in this <code>ProductionVariant</code>, the path resolves to a path of the form <code>registry/repository[@digest]</code>. A digest is a hash value that identifies a specific version of an image. For information about Amazon ECR paths, see <a href=\\\"https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-pull-ecr-image.html\\\">Pulling an Image</a> in the <i>Amazon ECR User Guide</i>.</p>\"\
    },\
    \"DeployedImages\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DeployedImage\"}\
    },\
    \"DescribeAlgorithmInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"AlgorithmName\"],\
      \"members\":{\
        \"AlgorithmName\":{\
          \"shape\":\"ArnOrName\",\
          \"documentation\":\"<p>The name of the algorithm to describe.</p>\"\
        }\
      }\
    },\
    \"DescribeAlgorithmOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AlgorithmName\",\
        \"AlgorithmArn\",\
        \"CreationTime\",\
        \"TrainingSpecification\",\
        \"AlgorithmStatus\",\
        \"AlgorithmStatusDetails\"\
      ],\
      \"members\":{\
        \"AlgorithmName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the algorithm being described.</p>\"\
        },\
        \"AlgorithmArn\":{\
          \"shape\":\"AlgorithmArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the algorithm.</p>\"\
        },\
        \"AlgorithmDescription\":{\
          \"shape\":\"EntityDescription\",\
          \"documentation\":\"<p>A brief summary about the algorithm.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A timestamp specifying when the algorithm was created.</p>\"\
        },\
        \"TrainingSpecification\":{\
          \"shape\":\"TrainingSpecification\",\
          \"documentation\":\"<p>Details about training jobs run by this algorithm.</p>\"\
        },\
        \"InferenceSpecification\":{\
          \"shape\":\"InferenceSpecification\",\
          \"documentation\":\"<p>Details about inference jobs that the algorithm runs.</p>\"\
        },\
        \"ValidationSpecification\":{\
          \"shape\":\"AlgorithmValidationSpecification\",\
          \"documentation\":\"<p>Details about configurations for one or more training jobs that Amazon SageMaker runs to test the algorithm.</p>\"\
        },\
        \"AlgorithmStatus\":{\
          \"shape\":\"AlgorithmStatus\",\
          \"documentation\":\"<p>The current status of the algorithm.</p>\"\
        },\
        \"AlgorithmStatusDetails\":{\
          \"shape\":\"AlgorithmStatusDetails\",\
          \"documentation\":\"<p>Details about the current status of the algorithm.</p>\"\
        },\
        \"ProductId\":{\
          \"shape\":\"ProductId\",\
          \"documentation\":\"<p>The product identifier of the algorithm.</p>\"\
        },\
        \"CertifyForMarketplace\":{\
          \"shape\":\"CertifyForMarketplace\",\
          \"documentation\":\"<p>Whether the algorithm is certified to be listed in AWS Marketplace.</p>\"\
        }\
      }\
    },\
    \"DescribeAppRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainId\",\
        \"UserProfileName\",\
        \"AppType\",\
        \"AppName\"\
      ],\
      \"members\":{\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"UserProfileName\":{\
          \"shape\":\"UserProfileName\",\
          \"documentation\":\"<p>The user profile name.</p>\"\
        },\
        \"AppType\":{\
          \"shape\":\"AppType\",\
          \"documentation\":\"<p>The type of app.</p>\"\
        },\
        \"AppName\":{\
          \"shape\":\"AppName\",\
          \"documentation\":\"<p>The name of the app.</p>\"\
        }\
      }\
    },\
    \"DescribeAppResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppArn\":{\
          \"shape\":\"AppArn\",\
          \"documentation\":\"<p>The app's Amazon Resource Name (ARN).</p>\"\
        },\
        \"AppType\":{\
          \"shape\":\"AppType\",\
          \"documentation\":\"<p>The type of app.</p>\"\
        },\
        \"AppName\":{\
          \"shape\":\"AppName\",\
          \"documentation\":\"<p>The name of the app.</p>\"\
        },\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"UserProfileName\":{\
          \"shape\":\"UserProfileName\",\
          \"documentation\":\"<p>The user profile name.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"AppStatus\",\
          \"documentation\":\"<p>The status.</p>\"\
        },\
        \"LastHealthCheckTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp of the last health check.</p>\"\
        },\
        \"LastUserActivityTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp of the last user's activity.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The creation time.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>The failure reason.</p>\"\
        },\
        \"ResourceSpec\":{\
          \"shape\":\"ResourceSpec\",\
          \"documentation\":\"<p>The instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance.</p>\"\
        }\
      }\
    },\
    \"DescribeAutoMLJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoMLJobName\"],\
      \"members\":{\
        \"AutoMLJobName\":{\
          \"shape\":\"AutoMLJobName\",\
          \"documentation\":\"<p>Request information about a job using that job's unique name.</p>\"\
        }\
      }\
    },\
    \"DescribeAutoMLJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoMLJobName\",\
        \"AutoMLJobArn\",\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"RoleArn\",\
        \"CreationTime\",\
        \"LastModifiedTime\",\
        \"AutoMLJobStatus\",\
        \"AutoMLJobSecondaryStatus\"\
      ],\
      \"members\":{\
        \"AutoMLJobName\":{\
          \"shape\":\"AutoMLJobName\",\
          \"documentation\":\"<p>Returns the name of a job.</p>\"\
        },\
        \"AutoMLJobArn\":{\
          \"shape\":\"AutoMLJobArn\",\
          \"documentation\":\"<p>Returns the job's ARN.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"AutoMLInputDataConfig\",\
          \"documentation\":\"<p>Returns the job's input data config.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"AutoMLOutputDataConfig\",\
          \"documentation\":\"<p>Returns the job's output data config.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that has read permission to the input data location and write permission to the output data location in Amazon S3.</p>\"\
        },\
        \"AutoMLJobObjective\":{\
          \"shape\":\"AutoMLJobObjective\",\
          \"documentation\":\"<p>Returns the job's objective.</p>\"\
        },\
        \"ProblemType\":{\
          \"shape\":\"ProblemType\",\
          \"documentation\":\"<p>Returns the job's problem type.</p>\"\
        },\
        \"AutoMLJobConfig\":{\
          \"shape\":\"AutoMLJobConfig\",\
          \"documentation\":\"<p>Returns the job's config.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Returns the job's creation time.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Returns the job's end time.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Returns the job's last modified time.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"AutoMLFailureReason\",\
          \"documentation\":\"<p>Returns the job's FailureReason.</p>\"\
        },\
        \"BestCandidate\":{\
          \"shape\":\"AutoMLCandidate\",\
          \"documentation\":\"<p>Returns the job's BestCandidate.</p>\"\
        },\
        \"AutoMLJobStatus\":{\
          \"shape\":\"AutoMLJobStatus\",\
          \"documentation\":\"<p>Returns the job's AutoMLJobStatus.</p>\"\
        },\
        \"AutoMLJobSecondaryStatus\":{\
          \"shape\":\"AutoMLJobSecondaryStatus\",\
          \"documentation\":\"<p>Returns the job's AutoMLJobSecondaryStatus.</p>\"\
        },\
        \"GenerateCandidateDefinitionsOnly\":{\
          \"shape\":\"GenerateCandidateDefinitionsOnly\",\
          \"documentation\":\"<p>Returns the job's output from GenerateCandidateDefinitionsOnly.</p>\"\
        },\
        \"AutoMLJobArtifacts\":{\
          \"shape\":\"AutoMLJobArtifacts\",\
          \"documentation\":\"<p>Returns information on the job's artifacts found in AutoMLJobArtifacts.</p>\"\
        },\
        \"ResolvedAttributes\":{\
          \"shape\":\"ResolvedAttributes\",\
          \"documentation\":\"<p>This contains ProblemType, AutoMLJobObjective and CompletionCriteria. They're auto-inferred values, if not provided by you. If you do provide them, then they'll be the same as provided.</p>\"\
        }\
      }\
    },\
    \"DescribeCodeRepositoryInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeRepositoryName\"],\
      \"members\":{\
        \"CodeRepositoryName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the Git repository to describe.</p>\"\
        }\
      }\
    },\
    \"DescribeCodeRepositoryOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CodeRepositoryName\",\
        \"CodeRepositoryArn\",\
        \"CreationTime\",\
        \"LastModifiedTime\"\
      ],\
      \"members\":{\
        \"CodeRepositoryName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the Git repository.</p>\"\
        },\
        \"CodeRepositoryArn\":{\
          \"shape\":\"CodeRepositoryArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Git repository.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The date and time that the repository was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>The date and time that the repository was last changed.</p>\"\
        },\
        \"GitConfig\":{\
          \"shape\":\"GitConfig\",\
          \"documentation\":\"<p>Configuration details about the repository, including the URL where the repository is located, the default branch, and the Amazon Resource Name (ARN) of the AWS Secrets Manager secret that contains the credentials used to access the repository.</p>\"\
        }\
      }\
    },\
    \"DescribeCompilationJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CompilationJobName\"],\
      \"members\":{\
        \"CompilationJobName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the model compilation job that you want information about.</p>\"\
        }\
      }\
    },\
    \"DescribeCompilationJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CompilationJobName\",\
        \"CompilationJobArn\",\
        \"CompilationJobStatus\",\
        \"StoppingCondition\",\
        \"CreationTime\",\
        \"LastModifiedTime\",\
        \"FailureReason\",\
        \"ModelArtifacts\",\
        \"RoleArn\",\
        \"InputConfig\",\
        \"OutputConfig\"\
      ],\
      \"members\":{\
        \"CompilationJobName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the model compilation job.</p>\"\
        },\
        \"CompilationJobArn\":{\
          \"shape\":\"CompilationJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker assumes to perform the model compilation job.</p>\"\
        },\
        \"CompilationJobStatus\":{\
          \"shape\":\"CompilationJobStatus\",\
          \"documentation\":\"<p>The status of the model compilation job.</p>\"\
        },\
        \"CompilationStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time when the model compilation job started the <code>CompilationJob</code> instances. </p> <p>You are billed for the time between this timestamp and the timestamp in the <a>DescribeCompilationJobResponse$CompilationEndTime</a> field. In Amazon CloudWatch Logs, the start time might be later than this time. That's because it takes time to download the compilation job, which depends on the size of the compilation job container. </p>\"\
        },\
        \"CompilationEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time when the model compilation job on a compilation job instance ended. For a successful or stopped job, this is when the job's model artifacts have finished uploading. For a failed job, this is when Amazon SageMaker detected that the job failed. </p>\"\
        },\
        \"StoppingCondition\":{\
          \"shape\":\"StoppingCondition\",\
          \"documentation\":\"<p>Specifies a limit to how long a model compilation job can run. When the job reaches the time limit, Amazon SageMaker ends the compilation job. Use this API to cap model training costs.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The time that the model compilation job was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>The time that the status of the model compilation job was last modified.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If a model compilation job failed, the reason it failed. </p>\"\
        },\
        \"ModelArtifacts\":{\
          \"shape\":\"ModelArtifacts\",\
          \"documentation\":\"<p>Information about the location in Amazon S3 that has been configured for storing the model artifacts used in the compilation job.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the model compilation job.</p>\"\
        },\
        \"InputConfig\":{\
          \"shape\":\"InputConfig\",\
          \"documentation\":\"<p>Information about the location in Amazon S3 of the input model artifacts, the name and shape of the expected data inputs, and the framework in which the model was trained.</p>\"\
        },\
        \"OutputConfig\":{\
          \"shape\":\"OutputConfig\",\
          \"documentation\":\"<p>Information about the output location for the compiled model and the target device that the model runs on.</p>\"\
        }\
      }\
    },\
    \"DescribeDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainId\"],\
      \"members\":{\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        }\
      }\
    },\
    \"DescribeDomainResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DomainArn\":{\
          \"shape\":\"DomainArn\",\
          \"documentation\":\"<p>The domain's Amazon Resource Name (ARN).</p>\"\
        },\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain name.</p>\"\
        },\
        \"HomeEfsFileSystemId\":{\
          \"shape\":\"ResourceId\",\
          \"documentation\":\"<p>The ID of the Amazon Elastic File System (EFS) managed by this Domain.</p>\"\
        },\
        \"SingleSignOnManagedApplicationInstanceId\":{\
          \"shape\":\"String256\",\
          \"documentation\":\"<p>The SSO managed application instance ID.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"DomainStatus\",\
          \"documentation\":\"<p>The status.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The creation time.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>The last modified time.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>The failure reason.</p>\"\
        },\
        \"AuthMode\":{\
          \"shape\":\"AuthMode\",\
          \"documentation\":\"<p>The domain's authentication mode.</p>\"\
        },\
        \"DefaultUserSettings\":{\
          \"shape\":\"UserSettings\",\
          \"documentation\":\"<p>Settings which are applied to all UserProfile in this domain, if settings are not explicitly specified in a given UserProfile. </p>\"\
        },\
        \"HomeEfsFileSystemKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS Key Management Service encryption key ID.</p>\"\
        },\
        \"SubnetIds\":{\
          \"shape\":\"Subnets\",\
          \"documentation\":\"<p>Security setting to limit to a set of subnets.</p>\"\
        },\
        \"Url\":{\
          \"shape\":\"String1024\",\
          \"documentation\":\"<p>The domain's URL.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"VpcId\",\
          \"documentation\":\"<p>The ID of the Amazon Virtual Private Cloud.</p>\"\
        }\
      }\
    },\
    \"DescribeEndpointConfigInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointConfigName\"],\
      \"members\":{\
        \"EndpointConfigName\":{\
          \"shape\":\"EndpointConfigName\",\
          \"documentation\":\"<p>The name of the endpoint configuration.</p>\"\
        }\
      }\
    },\
    \"DescribeEndpointConfigOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointConfigName\",\
        \"EndpointConfigArn\",\
        \"ProductionVariants\",\
        \"CreationTime\"\
      ],\
      \"members\":{\
        \"EndpointConfigName\":{\
          \"shape\":\"EndpointConfigName\",\
          \"documentation\":\"<p>Name of the Amazon SageMaker endpoint configuration.</p>\"\
        },\
        \"EndpointConfigArn\":{\
          \"shape\":\"EndpointConfigArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the endpoint configuration.</p>\"\
        },\
        \"ProductionVariants\":{\
          \"shape\":\"ProductionVariantList\",\
          \"documentation\":\"<p>An array of <code>ProductionVariant</code> objects, one for each model that you want to host at this endpoint.</p>\"\
        },\
        \"DataCaptureConfig\":{\"shape\":\"DataCaptureConfig\"},\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>AWS KMS key ID Amazon SageMaker uses to encrypt data when storing it on the ML storage volume attached to the instance.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that shows when the endpoint configuration was created.</p>\"\
        }\
      }\
    },\
    \"DescribeEndpointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointName\"],\
      \"members\":{\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p>The name of the endpoint.</p>\"\
        }\
      }\
    },\
    \"DescribeEndpointOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointName\",\
        \"EndpointArn\",\
        \"EndpointConfigName\",\
        \"EndpointStatus\",\
        \"CreationTime\",\
        \"LastModifiedTime\"\
      ],\
      \"members\":{\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p>Name of the endpoint.</p>\"\
        },\
        \"EndpointArn\":{\
          \"shape\":\"EndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the endpoint.</p>\"\
        },\
        \"EndpointConfigName\":{\
          \"shape\":\"EndpointConfigName\",\
          \"documentation\":\"<p>The name of the endpoint configuration associated with this endpoint.</p>\"\
        },\
        \"ProductionVariants\":{\
          \"shape\":\"ProductionVariantSummaryList\",\
          \"documentation\":\"<p> An array of <a>ProductionVariantSummary</a> objects, one for each model hosted behind this endpoint. </p>\"\
        },\
        \"DataCaptureConfig\":{\"shape\":\"DataCaptureConfigSummary\"},\
        \"EndpointStatus\":{\
          \"shape\":\"EndpointStatus\",\
          \"documentation\":\"<p>The status of the endpoint.</p> <ul> <li> <p> <code>OutOfService</code>: Endpoint is not available to take incoming requests.</p> </li> <li> <p> <code>Creating</code>: <a>CreateEndpoint</a> is executing.</p> </li> <li> <p> <code>Updating</code>: <a>UpdateEndpoint</a> or <a>UpdateEndpointWeightsAndCapacities</a> is executing.</p> </li> <li> <p> <code>SystemUpdating</code>: Endpoint is undergoing maintenance and cannot be updated or deleted or re-scaled until it has completed. This maintenance operation does not change any customer-specified values such as VPC config, KMS encryption, model, instance type, or instance count.</p> </li> <li> <p> <code>RollingBack</code>: Endpoint fails to scale up or down or change its variant weight and is in the process of rolling back to its previous configuration. Once the rollback completes, endpoint returns to an <code>InService</code> status. This transitional status only applies to an endpoint that has autoscaling enabled and is undergoing variant weight or capacity changes as part of an <a>UpdateEndpointWeightsAndCapacities</a> call or when the <a>UpdateEndpointWeightsAndCapacities</a> operation is called explicitly.</p> </li> <li> <p> <code>InService</code>: Endpoint is available to process incoming requests.</p> </li> <li> <p> <code>Deleting</code>: <a>DeleteEndpoint</a> is executing.</p> </li> <li> <p> <code>Failed</code>: Endpoint could not be created, updated, or re-scaled. Use <a>DescribeEndpointOutput$FailureReason</a> for information about the failure. <a>DeleteEndpoint</a> is the only operation that can be performed on a failed endpoint.</p> </li> </ul>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the status of the endpoint is <code>Failed</code>, the reason why it failed. </p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that shows when the endpoint was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that shows when the endpoint was last modified.</p>\"\
        }\
      }\
    },\
    \"DescribeExperimentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ExperimentName\"],\
      \"members\":{\
        \"ExperimentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment to describe.</p>\"\
        }\
      }\
    },\
    \"DescribeExperimentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExperimentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment.</p>\"\
        },\
        \"ExperimentArn\":{\
          \"shape\":\"ExperimentArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the experiment.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment as displayed. If <code>DisplayName</code> isn't specified, <code>ExperimentName</code> is displayed.</p>\"\
        },\
        \"Source\":{\
          \"shape\":\"ExperimentSource\",\
          \"documentation\":\"<p>The ARN of the source and, optionally, the type.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ExperimentDescription\",\
          \"documentation\":\"<p>The description of the experiment.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the experiment was created.</p>\"\
        },\
        \"CreatedBy\":{\
          \"shape\":\"UserContext\",\
          \"documentation\":\"<p>Who created the experiment.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the experiment was last modified.</p>\"\
        },\
        \"LastModifiedBy\":{\
          \"shape\":\"UserContext\",\
          \"documentation\":\"<p>Who last modified the experiment.</p>\"\
        }\
      }\
    },\
    \"DescribeFlowDefinitionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FlowDefinitionName\"],\
      \"members\":{\
        \"FlowDefinitionName\":{\
          \"shape\":\"FlowDefinitionName\",\
          \"documentation\":\"<p>The name of the flow definition.</p>\"\
        }\
      }\
    },\
    \"DescribeFlowDefinitionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FlowDefinitionArn\",\
        \"FlowDefinitionName\",\
        \"FlowDefinitionStatus\",\
        \"CreationTime\",\
        \"HumanLoopConfig\",\
        \"OutputConfig\",\
        \"RoleArn\"\
      ],\
      \"members\":{\
        \"FlowDefinitionArn\":{\
          \"shape\":\"FlowDefinitionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the flow defintion.</p>\"\
        },\
        \"FlowDefinitionName\":{\
          \"shape\":\"FlowDefinitionName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the flow definition.</p>\"\
        },\
        \"FlowDefinitionStatus\":{\
          \"shape\":\"FlowDefinitionStatus\",\
          \"documentation\":\"<p>The status of the flow definition. Valid values are listed below.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp when the flow definition was created.</p>\"\
        },\
        \"HumanLoopRequestSource\":{\
          \"shape\":\"HumanLoopRequestSource\",\
          \"documentation\":\"<p>Container for configuring the source of human task requests. Used to specify if Amazon Rekognition or Amazon Textract is used as an integration source.</p>\"\
        },\
        \"HumanLoopActivationConfig\":{\
          \"shape\":\"HumanLoopActivationConfig\",\
          \"documentation\":\"<p>An object containing information about what triggers a human review workflow.</p>\"\
        },\
        \"HumanLoopConfig\":{\
          \"shape\":\"HumanLoopConfig\",\
          \"documentation\":\"<p>An object containing information about who works on the task, the workforce task price, and other task details.</p>\"\
        },\
        \"OutputConfig\":{\
          \"shape\":\"FlowDefinitionOutputConfig\",\
          \"documentation\":\"<p>An object containing information about the output file.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) execution role for the flow definition.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p/>\"\
        }\
      }\
    },\
    \"DescribeHumanTaskUiRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"HumanTaskUiName\"],\
      \"members\":{\
        \"HumanTaskUiName\":{\
          \"shape\":\"HumanTaskUiName\",\
          \"documentation\":\"<p>The name of the human task user interface you want information about.</p>\"\
        }\
      }\
    },\
    \"DescribeHumanTaskUiResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HumanTaskUiArn\",\
        \"HumanTaskUiName\",\
        \"CreationTime\",\
        \"UiTemplate\"\
      ],\
      \"members\":{\
        \"HumanTaskUiArn\":{\
          \"shape\":\"HumanTaskUiArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the human task user interface.</p>\"\
        },\
        \"HumanTaskUiName\":{\
          \"shape\":\"HumanTaskUiName\",\
          \"documentation\":\"<p>The name of the human task user interface.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp when the human task user interface was created.</p>\"\
        },\
        \"UiTemplate\":{\"shape\":\"UiTemplateInfo\"}\
      }\
    },\
    \"DescribeHyperParameterTuningJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"HyperParameterTuningJobName\"],\
      \"members\":{\
        \"HyperParameterTuningJobName\":{\
          \"shape\":\"HyperParameterTuningJobName\",\
          \"documentation\":\"<p>The name of the tuning job to describe.</p>\"\
        }\
      }\
    },\
    \"DescribeHyperParameterTuningJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HyperParameterTuningJobName\",\
        \"HyperParameterTuningJobArn\",\
        \"HyperParameterTuningJobConfig\",\
        \"HyperParameterTuningJobStatus\",\
        \"CreationTime\",\
        \"TrainingJobStatusCounters\",\
        \"ObjectiveStatusCounters\"\
      ],\
      \"members\":{\
        \"HyperParameterTuningJobName\":{\
          \"shape\":\"HyperParameterTuningJobName\",\
          \"documentation\":\"<p>The name of the tuning job.</p>\"\
        },\
        \"HyperParameterTuningJobArn\":{\
          \"shape\":\"HyperParameterTuningJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the tuning job.</p>\"\
        },\
        \"HyperParameterTuningJobConfig\":{\
          \"shape\":\"HyperParameterTuningJobConfig\",\
          \"documentation\":\"<p>The <a>HyperParameterTuningJobConfig</a> object that specifies the configuration of the tuning job.</p>\"\
        },\
        \"TrainingJobDefinition\":{\
          \"shape\":\"HyperParameterTrainingJobDefinition\",\
          \"documentation\":\"<p>The <a>HyperParameterTrainingJobDefinition</a> object that specifies the definition of the training jobs that this tuning job launches.</p>\"\
        },\
        \"TrainingJobDefinitions\":{\
          \"shape\":\"HyperParameterTrainingJobDefinitions\",\
          \"documentation\":\"<p/>\"\
        },\
        \"HyperParameterTuningJobStatus\":{\
          \"shape\":\"HyperParameterTuningJobStatus\",\
          \"documentation\":\"<p>The status of the tuning job: InProgress, Completed, Failed, Stopping, or Stopped.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the tuning job started.</p>\"\
        },\
        \"HyperParameterTuningEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the tuning job ended.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the status of the tuning job was modified. </p>\"\
        },\
        \"TrainingJobStatusCounters\":{\
          \"shape\":\"TrainingJobStatusCounters\",\
          \"documentation\":\"<p>The <a>TrainingJobStatusCounters</a> object that specifies the number of training jobs, categorized by status, that this tuning job launched.</p>\"\
        },\
        \"ObjectiveStatusCounters\":{\
          \"shape\":\"ObjectiveStatusCounters\",\
          \"documentation\":\"<p>The <a>ObjectiveStatusCounters</a> object that specifies the number of training jobs, categorized by the status of their final objective metric, that this tuning job launched.</p>\"\
        },\
        \"BestTrainingJob\":{\
          \"shape\":\"HyperParameterTrainingJobSummary\",\
          \"documentation\":\"<p>A <a>TrainingJobSummary</a> object that describes the training job that completed with the best current <a>HyperParameterTuningJobObjective</a>.</p>\"\
        },\
        \"OverallBestTrainingJob\":{\
          \"shape\":\"HyperParameterTrainingJobSummary\",\
          \"documentation\":\"<p>If the hyperparameter tuning job is an warm start tuning job with a <code>WarmStartType</code> of <code>IDENTICAL_DATA_AND_ALGORITHM</code>, this is the <a>TrainingJobSummary</a> for the training job with the best objective metric value of all training jobs launched by this tuning job and all parent jobs specified for the warm start tuning job.</p>\"\
        },\
        \"WarmStartConfig\":{\
          \"shape\":\"HyperParameterTuningJobWarmStartConfig\",\
          \"documentation\":\"<p>The configuration for starting the hyperparameter parameter tuning job using one or more previous tuning jobs as a starting point. The results of previous tuning jobs are used to inform which combinations of hyperparameters to search over in the new tuning job.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the tuning job failed, the reason it failed.</p>\"\
        }\
      }\
    },\
    \"DescribeLabelingJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"LabelingJobName\"],\
      \"members\":{\
        \"LabelingJobName\":{\
          \"shape\":\"LabelingJobName\",\
          \"documentation\":\"<p>The name of the labeling job to return information for.</p>\"\
        }\
      }\
    },\
    \"DescribeLabelingJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LabelingJobStatus\",\
        \"LabelCounters\",\
        \"CreationTime\",\
        \"LastModifiedTime\",\
        \"JobReferenceCode\",\
        \"LabelingJobName\",\
        \"LabelingJobArn\",\
        \"InputConfig\",\
        \"OutputConfig\",\
        \"RoleArn\",\
        \"HumanTaskConfig\"\
      ],\
      \"members\":{\
        \"LabelingJobStatus\":{\
          \"shape\":\"LabelingJobStatus\",\
          \"documentation\":\"<p>The processing status of the labeling job. </p>\"\
        },\
        \"LabelCounters\":{\
          \"shape\":\"LabelCounters\",\
          \"documentation\":\"<p>Provides a breakdown of the number of data objects labeled by humans, the number of objects labeled by machine, the number of objects than couldn't be labeled, and the total number of objects labeled. </p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the job failed, the reason that it failed. </p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the labeling job was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the labeling job was last updated.</p>\"\
        },\
        \"JobReferenceCode\":{\
          \"shape\":\"JobReferenceCode\",\
          \"documentation\":\"<p>A unique identifier for work done as part of a labeling job.</p>\"\
        },\
        \"LabelingJobName\":{\
          \"shape\":\"LabelingJobName\",\
          \"documentation\":\"<p>The name assigned to the labeling job when it was created.</p>\"\
        },\
        \"LabelingJobArn\":{\
          \"shape\":\"LabelingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the labeling job.</p>\"\
        },\
        \"LabelAttributeName\":{\
          \"shape\":\"LabelAttributeName\",\
          \"documentation\":\"<p>The attribute used as the label in the output manifest file.</p>\"\
        },\
        \"InputConfig\":{\
          \"shape\":\"LabelingJobInputConfig\",\
          \"documentation\":\"<p>Input configuration information for the labeling job, such as the Amazon S3 location of the data objects and the location of the manifest file that describes the data objects.</p>\"\
        },\
        \"OutputConfig\":{\
          \"shape\":\"LabelingJobOutputConfig\",\
          \"documentation\":\"<p>The location of the job's output data and the AWS Key Management Service key ID for the key used to encrypt the output data, if any.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that Amazon SageMaker assumes to perform tasks on your behalf during data labeling.</p>\"\
        },\
        \"LabelCategoryConfigS3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The S3 location of the JSON file that defines the categories used to label data objects. Please note the following label-category limits:</p> <ul> <li> <p>Semantic segmentation labeling jobs using automated labeling: 20 labels</p> </li> <li> <p>Box bounding labeling jobs (all): 10 labels</p> </li> </ul> <p>The file is a JSON structure in the following format:</p> <p> <code>{</code> </p> <p> <code> \\\"document-version\\\": \\\"2018-11-28\\\"</code> </p> <p> <code> \\\"labels\\\": [</code> </p> <p> <code> {</code> </p> <p> <code> \\\"label\\\": \\\"<i>label 1</i>\\\"</code> </p> <p> <code> },</code> </p> <p> <code> {</code> </p> <p> <code> \\\"label\\\": \\\"<i>label 2</i>\\\"</code> </p> <p> <code> },</code> </p> <p> <code> ...</code> </p> <p> <code> {</code> </p> <p> <code> \\\"label\\\": \\\"<i>label n</i>\\\"</code> </p> <p> <code> }</code> </p> <p> <code> ]</code> </p> <p> <code>}</code> </p>\"\
        },\
        \"StoppingConditions\":{\
          \"shape\":\"LabelingJobStoppingConditions\",\
          \"documentation\":\"<p>A set of conditions for stopping a labeling job. If any of the conditions are met, the job is automatically stopped.</p>\"\
        },\
        \"LabelingJobAlgorithmsConfig\":{\
          \"shape\":\"LabelingJobAlgorithmsConfig\",\
          \"documentation\":\"<p>Configuration information for automated data labeling.</p>\"\
        },\
        \"HumanTaskConfig\":{\
          \"shape\":\"HumanTaskConfig\",\
          \"documentation\":\"<p>Configuration information required for human workers to complete a labeling task.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of key/value pairs. For more information, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what\\\">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>\"\
        },\
        \"LabelingJobOutput\":{\
          \"shape\":\"LabelingJobOutput\",\
          \"documentation\":\"<p>The location of the output produced by the labeling job.</p>\"\
        }\
      }\
    },\
    \"DescribeModelInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ModelName\"],\
      \"members\":{\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the model.</p>\"\
        }\
      }\
    },\
    \"DescribeModelOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ModelName\",\
        \"ExecutionRoleArn\",\
        \"CreationTime\",\
        \"ModelArn\"\
      ],\
      \"members\":{\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>Name of the Amazon SageMaker model.</p>\"\
        },\
        \"PrimaryContainer\":{\
          \"shape\":\"ContainerDefinition\",\
          \"documentation\":\"<p>The location of the primary inference code, associated artifacts, and custom environment map that the inference code uses when it is deployed in production. </p>\"\
        },\
        \"Containers\":{\
          \"shape\":\"ContainerDefinitionList\",\
          \"documentation\":\"<p>The containers in the inference pipeline.</p>\"\
        },\
        \"ExecutionRoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that you specified for the model.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>A <a>VpcConfig</a> object that specifies the VPC that this model has access to. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/host-vpc.html\\\">Protect Endpoints by Using an Amazon Virtual Private Cloud</a> </p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that shows when the model was created.</p>\"\
        },\
        \"ModelArn\":{\
          \"shape\":\"ModelArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the model.</p>\"\
        },\
        \"EnableNetworkIsolation\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If <code>True</code>, no inbound or outbound network calls can be made to or from the model container.</p>\"\
        }\
      }\
    },\
    \"DescribeModelPackageInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ModelPackageName\"],\
      \"members\":{\
        \"ModelPackageName\":{\
          \"shape\":\"ArnOrName\",\
          \"documentation\":\"<p>The name of the model package to describe.</p>\"\
        }\
      }\
    },\
    \"DescribeModelPackageOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ModelPackageName\",\
        \"ModelPackageArn\",\
        \"CreationTime\",\
        \"ModelPackageStatus\",\
        \"ModelPackageStatusDetails\"\
      ],\
      \"members\":{\
        \"ModelPackageName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the model package being described.</p>\"\
        },\
        \"ModelPackageArn\":{\
          \"shape\":\"ModelPackageArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the model package.</p>\"\
        },\
        \"ModelPackageDescription\":{\
          \"shape\":\"EntityDescription\",\
          \"documentation\":\"<p>A brief summary of the model package.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A timestamp specifying when the model package was created.</p>\"\
        },\
        \"InferenceSpecification\":{\
          \"shape\":\"InferenceSpecification\",\
          \"documentation\":\"<p>Details about inference jobs that can be run with models based on this model package.</p>\"\
        },\
        \"SourceAlgorithmSpecification\":{\
          \"shape\":\"SourceAlgorithmSpecification\",\
          \"documentation\":\"<p>Details about the algorithm that was used to create the model package.</p>\"\
        },\
        \"ValidationSpecification\":{\
          \"shape\":\"ModelPackageValidationSpecification\",\
          \"documentation\":\"<p>Configurations for one or more transform jobs that Amazon SageMaker runs to test the model package.</p>\"\
        },\
        \"ModelPackageStatus\":{\
          \"shape\":\"ModelPackageStatus\",\
          \"documentation\":\"<p>The current status of the model package.</p>\"\
        },\
        \"ModelPackageStatusDetails\":{\
          \"shape\":\"ModelPackageStatusDetails\",\
          \"documentation\":\"<p>Details about the current status of the model package.</p>\"\
        },\
        \"CertifyForMarketplace\":{\
          \"shape\":\"CertifyForMarketplace\",\
          \"documentation\":\"<p>Whether the model package is certified for listing on AWS Marketplace.</p>\"\
        }\
      }\
    },\
    \"DescribeMonitoringScheduleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MonitoringScheduleName\"],\
      \"members\":{\
        \"MonitoringScheduleName\":{\
          \"shape\":\"MonitoringScheduleName\",\
          \"documentation\":\"<p>Name of a previously created monitoring schedule.</p>\"\
        }\
      }\
    },\
    \"DescribeMonitoringScheduleResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MonitoringScheduleArn\",\
        \"MonitoringScheduleName\",\
        \"MonitoringScheduleStatus\",\
        \"CreationTime\",\
        \"LastModifiedTime\",\
        \"MonitoringScheduleConfig\"\
      ],\
      \"members\":{\
        \"MonitoringScheduleArn\":{\
          \"shape\":\"MonitoringScheduleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the monitoring schedule.</p>\"\
        },\
        \"MonitoringScheduleName\":{\
          \"shape\":\"MonitoringScheduleName\",\
          \"documentation\":\"<p>Name of the monitoring schedule.</p>\"\
        },\
        \"MonitoringScheduleStatus\":{\
          \"shape\":\"ScheduleStatus\",\
          \"documentation\":\"<p>The status of an monitoring job.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>A string, up to one KB in size, that contains the reason a monitoring job failed, if it failed.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the monitoring job was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the monitoring job was last modified.</p>\"\
        },\
        \"MonitoringScheduleConfig\":{\
          \"shape\":\"MonitoringScheduleConfig\",\
          \"documentation\":\"<p>The configuration object that specifies the monitoring schedule and defines the monitoring job.</p>\"\
        },\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p> The name of the endpoint for the monitoring job.</p>\"\
        },\
        \"LastMonitoringExecutionSummary\":{\
          \"shape\":\"MonitoringExecutionSummary\",\
          \"documentation\":\"<p>Describes metadata on the last execution to run, if there was one.</p>\"\
        }\
      }\
    },\
    \"DescribeNotebookInstanceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"NotebookInstanceName\"],\
      \"members\":{\
        \"NotebookInstanceName\":{\
          \"shape\":\"NotebookInstanceName\",\
          \"documentation\":\"<p>The name of the notebook instance that you want information about.</p>\"\
        }\
      }\
    },\
    \"DescribeNotebookInstanceLifecycleConfigInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"NotebookInstanceLifecycleConfigName\"],\
      \"members\":{\
        \"NotebookInstanceLifecycleConfigName\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigName\",\
          \"documentation\":\"<p>The name of the lifecycle configuration to describe.</p>\"\
        }\
      }\
    },\
    \"DescribeNotebookInstanceLifecycleConfigOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NotebookInstanceLifecycleConfigArn\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the lifecycle configuration.</p>\"\
        },\
        \"NotebookInstanceLifecycleConfigName\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigName\",\
          \"documentation\":\"<p>The name of the lifecycle configuration.</p>\"\
        },\
        \"OnCreate\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigList\",\
          \"documentation\":\"<p>The shell script that runs only once, when you create a notebook instance.</p>\"\
        },\
        \"OnStart\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigList\",\
          \"documentation\":\"<p>The shell script that runs every time you start a notebook instance, including when you create the notebook instance.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>A timestamp that tells when the lifecycle configuration was last modified.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A timestamp that tells when the lifecycle configuration was created.</p>\"\
        }\
      }\
    },\
    \"DescribeNotebookInstanceOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NotebookInstanceArn\":{\
          \"shape\":\"NotebookInstanceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the notebook instance.</p>\"\
        },\
        \"NotebookInstanceName\":{\
          \"shape\":\"NotebookInstanceName\",\
          \"documentation\":\"<p>The name of the Amazon SageMaker notebook instance. </p>\"\
        },\
        \"NotebookInstanceStatus\":{\
          \"shape\":\"NotebookInstanceStatus\",\
          \"documentation\":\"<p>The status of the notebook instance.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If status is <code>Failed</code>, the reason it failed.</p>\"\
        },\
        \"Url\":{\
          \"shape\":\"NotebookInstanceUrl\",\
          \"documentation\":\"<p>The URL that you use to connect to the Jupyter notebook that is running in your notebook instance. </p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The type of ML compute instance running on the notebook instance.</p>\"\
        },\
        \"SubnetId\":{\
          \"shape\":\"SubnetId\",\
          \"documentation\":\"<p>The ID of the VPC subnet.</p>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>The IDs of the VPC security groups.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role associated with the instance. </p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS KMS key ID Amazon SageMaker uses to encrypt data when storing it on the ML storage volume attached to the instance. </p>\"\
        },\
        \"NetworkInterfaceId\":{\
          \"shape\":\"NetworkInterfaceId\",\
          \"documentation\":\"<p>The network interface IDs that Amazon SageMaker created at the time of creating the instance. </p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>A timestamp. Use this parameter to retrieve the time when the notebook instance was last modified. </p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A timestamp. Use this parameter to return the time when the notebook instance was created</p>\"\
        },\
        \"NotebookInstanceLifecycleConfigName\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigName\",\
          \"documentation\":\"<p>Returns the name of a notebook instance lifecycle configuration.</p> <p>For information about notebook instance lifestyle configurations, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html\\\">Step 2.1: (Optional) Customize a Notebook Instance</a> </p>\"\
        },\
        \"DirectInternetAccess\":{\
          \"shape\":\"DirectInternetAccess\",\
          \"documentation\":\"<p>Describes whether Amazon SageMaker provides internet access to the notebook instance. If this value is set to <i>Disabled</i>, the notebook instance does not have internet access, and cannot connect to Amazon SageMaker training and endpoint services.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/appendix-additional-considerations.html#appendix-notebook-and-internet-access\\\">Notebook Instances Are Internet-Enabled by Default</a>.</p>\"\
        },\
        \"VolumeSizeInGB\":{\
          \"shape\":\"NotebookInstanceVolumeSizeInGB\",\
          \"documentation\":\"<p>The size, in GB, of the ML storage volume attached to the notebook instance.</p>\"\
        },\
        \"AcceleratorTypes\":{\
          \"shape\":\"NotebookInstanceAcceleratorTypes\",\
          \"documentation\":\"<p>A list of the Elastic Inference (EI) instance types associated with this notebook instance. Currently only one EI instance type can be associated with a notebook instance. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html\\\">Using Elastic Inference in Amazon SageMaker</a>.</p>\"\
        },\
        \"DefaultCodeRepository\":{\
          \"shape\":\"CodeRepositoryNameOrUrl\",\
          \"documentation\":\"<p>The Git repository associated with the notebook instance as its default code repository. This can be either the name of a Git repository stored as a resource in your account, or the URL of a Git repository in <a href=\\\"https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html\\\">AWS CodeCommit</a> or in any other Git repository. When you open a notebook instance, it opens in the directory that contains this repository. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html\\\">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>\"\
        },\
        \"AdditionalCodeRepositories\":{\
          \"shape\":\"AdditionalCodeRepositoryNamesOrUrls\",\
          \"documentation\":\"<p>An array of up to three Git repositories associated with the notebook instance. These can be either the names of Git repositories stored as resources in your account, or the URL of Git repositories in <a href=\\\"https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html\\\">AWS CodeCommit</a> or in any other Git repository. These repositories are cloned at the same level as the default repository of your notebook instance. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html\\\">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>\"\
        },\
        \"RootAccess\":{\
          \"shape\":\"RootAccess\",\
          \"documentation\":\"<p>Whether root access is enabled or disabled for users of the notebook instance.</p> <note> <p>Lifecycle configurations need root access to be able to set up a notebook instance. Because of this, lifecycle configurations associated with a notebook instance always run with root access even if you disable root access for users.</p> </note>\"\
        }\
      }\
    },\
    \"DescribeProcessingJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ProcessingJobName\"],\
      \"members\":{\
        \"ProcessingJobName\":{\
          \"shape\":\"ProcessingJobName\",\
          \"documentation\":\"<p>The name of the processing job. The name must be unique within an AWS Region in the AWS account.</p>\"\
        }\
      }\
    },\
    \"DescribeProcessingJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ProcessingJobName\",\
        \"ProcessingResources\",\
        \"AppSpecification\",\
        \"ProcessingJobArn\",\
        \"ProcessingJobStatus\",\
        \"CreationTime\"\
      ],\
      \"members\":{\
        \"ProcessingInputs\":{\
          \"shape\":\"ProcessingInputs\",\
          \"documentation\":\"<p>The inputs for a processing job.</p>\"\
        },\
        \"ProcessingOutputConfig\":{\
          \"shape\":\"ProcessingOutputConfig\",\
          \"documentation\":\"<p>Output configuration for the processing job.</p>\"\
        },\
        \"ProcessingJobName\":{\
          \"shape\":\"ProcessingJobName\",\
          \"documentation\":\"<p>The name of the processing job. The name must be unique within an AWS Region in the AWS account.</p>\"\
        },\
        \"ProcessingResources\":{\
          \"shape\":\"ProcessingResources\",\
          \"documentation\":\"<p>Identifies the resources, ML compute instances, and ML storage volumes to deploy for a processing job. In distributed training, you specify more than one instance.</p>\"\
        },\
        \"StoppingCondition\":{\
          \"shape\":\"ProcessingStoppingCondition\",\
          \"documentation\":\"<p>The time limit for how long the processing job is allowed to run.</p>\"\
        },\
        \"AppSpecification\":{\
          \"shape\":\"AppSpecification\",\
          \"documentation\":\"<p>Configures the processing job to run a specified container image.</p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"ProcessingEnvironmentMap\",\
          \"documentation\":\"<p>The environment variables set in the Docker container.</p>\"\
        },\
        \"NetworkConfig\":{\
          \"shape\":\"NetworkConfig\",\
          \"documentation\":\"<p>Networking options for a processing job.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker can assume to perform tasks on your behalf.</p>\"\
        },\
        \"ExperimentConfig\":{\
          \"shape\":\"ExperimentConfig\",\
          \"documentation\":\"<p>The configuration information used to create an experiment.</p>\"\
        },\
        \"ProcessingJobArn\":{\
          \"shape\":\"ProcessingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the processing job.</p>\"\
        },\
        \"ProcessingJobStatus\":{\
          \"shape\":\"ProcessingJobStatus\",\
          \"documentation\":\"<p>Provides the status of a processing job.</p>\"\
        },\
        \"ExitMessage\":{\
          \"shape\":\"ExitMessage\",\
          \"documentation\":\"<p>An optional string, up to one KB in size, that contains metadata from the processing container when the processing job exits.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>A string, up to one KB in size, that contains the reason a processing job failed, if it failed.</p>\"\
        },\
        \"ProcessingEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the processing job completed.</p>\"\
        },\
        \"ProcessingStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the processing job started.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the processing job was last modified.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the processing job was created.</p>\"\
        },\
        \"MonitoringScheduleArn\":{\
          \"shape\":\"MonitoringScheduleArn\",\
          \"documentation\":\"<p>The ARN of a monitoring schedule for an endpoint associated with this processing job.</p>\"\
        },\
        \"AutoMLJobArn\":{\
          \"shape\":\"AutoMLJobArn\",\
          \"documentation\":\"<p>The ARN of an AutoML job associated with this processing job.</p>\"\
        },\
        \"TrainingJobArn\":{\
          \"shape\":\"TrainingJobArn\",\
          \"documentation\":\"<p>The ARN of a training job associated with this processing job.</p>\"\
        }\
      }\
    },\
    \"DescribeSubscribedWorkteamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"WorkteamArn\"],\
      \"members\":{\
        \"WorkteamArn\":{\
          \"shape\":\"WorkteamArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the subscribed work team to describe.</p>\"\
        }\
      }\
    },\
    \"DescribeSubscribedWorkteamResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"SubscribedWorkteam\"],\
      \"members\":{\
        \"SubscribedWorkteam\":{\
          \"shape\":\"SubscribedWorkteam\",\
          \"documentation\":\"<p>A <code>Workteam</code> instance that contains information about the work team.</p>\"\
        }\
      }\
    },\
    \"DescribeTrainingJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrainingJobName\"],\
      \"members\":{\
        \"TrainingJobName\":{\
          \"shape\":\"TrainingJobName\",\
          \"documentation\":\"<p>The name of the training job.</p>\"\
        }\
      }\
    },\
    \"DescribeTrainingJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrainingJobName\",\
        \"TrainingJobArn\",\
        \"ModelArtifacts\",\
        \"TrainingJobStatus\",\
        \"SecondaryStatus\",\
        \"AlgorithmSpecification\",\
        \"ResourceConfig\",\
        \"StoppingCondition\",\
        \"CreationTime\"\
      ],\
      \"members\":{\
        \"TrainingJobName\":{\
          \"shape\":\"TrainingJobName\",\
          \"documentation\":\"<p> Name of the model training job. </p>\"\
        },\
        \"TrainingJobArn\":{\
          \"shape\":\"TrainingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the training job.</p>\"\
        },\
        \"TuningJobArn\":{\
          \"shape\":\"HyperParameterTuningJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the associated hyperparameter tuning job if the training job was launched by a hyperparameter tuning job.</p>\"\
        },\
        \"LabelingJobArn\":{\
          \"shape\":\"LabelingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SageMaker Ground Truth labeling job that created the transform or training job.</p>\"\
        },\
        \"AutoMLJobArn\":{\
          \"shape\":\"AutoMLJobArn\",\
          \"documentation\":\"<p/>\"\
        },\
        \"ModelArtifacts\":{\
          \"shape\":\"ModelArtifacts\",\
          \"documentation\":\"<p>Information about the Amazon S3 location that is configured for storing model artifacts. </p>\"\
        },\
        \"TrainingJobStatus\":{\
          \"shape\":\"TrainingJobStatus\",\
          \"documentation\":\"<p>The status of the training job.</p> <p>Amazon SageMaker provides the following training job statuses:</p> <ul> <li> <p> <code>InProgress</code> - The training is in progress.</p> </li> <li> <p> <code>Completed</code> - The training job has completed.</p> </li> <li> <p> <code>Failed</code> - The training job has failed. To see the reason for the failure, see the <code>FailureReason</code> field in the response to a <code>DescribeTrainingJobResponse</code> call.</p> </li> <li> <p> <code>Stopping</code> - The training job is stopping.</p> </li> <li> <p> <code>Stopped</code> - The training job has stopped.</p> </li> </ul> <p>For more detailed information, see <code>SecondaryStatus</code>. </p>\"\
        },\
        \"SecondaryStatus\":{\
          \"shape\":\"SecondaryStatus\",\
          \"documentation\":\"<p> Provides detailed information about the state of the training job. For detailed information on the secondary status of the training job, see <code>StatusMessage</code> under <a>SecondaryStatusTransition</a>.</p> <p>Amazon SageMaker provides primary statuses and secondary statuses that apply to each of them:</p> <dl> <dt>InProgress</dt> <dd> <ul> <li> <p> <code>Starting</code> - Starting the training job.</p> </li> <li> <p> <code>Downloading</code> - An optional stage for algorithms that support <code>File</code> training input mode. It indicates that data is being downloaded to the ML storage volumes.</p> </li> <li> <p> <code>Training</code> - Training is in progress.</p> </li> <li> <p> <code>Interrupted</code> - The job stopped because the managed spot training instances were interrupted. </p> </li> <li> <p> <code>Uploading</code> - Training is complete and the model artifacts are being uploaded to the S3 location.</p> </li> </ul> </dd> <dt>Completed</dt> <dd> <ul> <li> <p> <code>Completed</code> - The training job has completed.</p> </li> </ul> </dd> <dt>Failed</dt> <dd> <ul> <li> <p> <code>Failed</code> - The training job has failed. The reason for the failure is returned in the <code>FailureReason</code> field of <code>DescribeTrainingJobResponse</code>.</p> </li> </ul> </dd> <dt>Stopped</dt> <dd> <ul> <li> <p> <code>MaxRuntimeExceeded</code> - The job stopped because it exceeded the maximum allowed runtime.</p> </li> <li> <p> <code>MaxWaitTmeExceeded</code> - The job stopped because it exceeded the maximum allowed wait time.</p> </li> <li> <p> <code>Stopped</code> - The training job has stopped.</p> </li> </ul> </dd> <dt>Stopping</dt> <dd> <ul> <li> <p> <code>Stopping</code> - Stopping the training job.</p> </li> </ul> </dd> </dl> <important> <p>Valid values for <code>SecondaryStatus</code> are subject to change. </p> </important> <p>We no longer support the following secondary statuses:</p> <ul> <li> <p> <code>LaunchingMLInstances</code> </p> </li> <li> <p> <code>PreparingTrainingStack</code> </p> </li> <li> <p> <code>DownloadingTrainingImage</code> </p> </li> </ul>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the training job failed, the reason it failed. </p>\"\
        },\
        \"HyperParameters\":{\
          \"shape\":\"HyperParameters\",\
          \"documentation\":\"<p>Algorithm-specific parameters. </p>\"\
        },\
        \"AlgorithmSpecification\":{\
          \"shape\":\"AlgorithmSpecification\",\
          \"documentation\":\"<p>Information about the algorithm used for training, and algorithm metadata. </p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The AWS Identity and Access Management (IAM) role configured for the training job. </p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>An array of <code>Channel</code> objects that describes each data input channel. </p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The S3 path where model artifacts that you configured when creating the job are stored. Amazon SageMaker creates subfolders for model artifacts. </p>\"\
        },\
        \"ResourceConfig\":{\
          \"shape\":\"ResourceConfig\",\
          \"documentation\":\"<p>Resources, including ML compute instances and ML storage volumes, that are configured for model training. </p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>A <a>VpcConfig</a> object that specifies the VPC that this training job has access to. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html\\\">Protect Training Jobs by Using an Amazon Virtual Private Cloud</a>.</p>\"\
        },\
        \"StoppingCondition\":{\
          \"shape\":\"StoppingCondition\",\
          \"documentation\":\"<p>Specifies a limit to how long a model training job can run. It also specifies the maximum time to wait for a spot instance. When the job reaches the time limit, Amazon SageMaker ends the training job. Use this API to cap model training costs.</p> <p>To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms can use this 120-second window to save the model artifacts, so the results of training are not lost. </p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that indicates when the training job was created.</p>\"\
        },\
        \"TrainingStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Indicates the time when the training job starts on training instances. You are billed for the time interval between this time and the value of <code>TrainingEndTime</code>. The start time in CloudWatch Logs might be later than this time. The difference is due to the time it takes to download the training data and to the size of the training container.</p>\"\
        },\
        \"TrainingEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Indicates the time when the training job ends on training instances. You are billed for the time interval between the value of <code>TrainingStartTime</code> and this time. For successful jobs and stopped jobs, this is the time after model artifacts are uploaded. For failed jobs, this is the time when Amazon SageMaker detects a job failure.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that indicates when the status of the training job was last modified.</p>\"\
        },\
        \"SecondaryStatusTransitions\":{\
          \"shape\":\"SecondaryStatusTransitions\",\
          \"documentation\":\"<p>A history of all of the secondary statuses that the training job has transitioned through.</p>\"\
        },\
        \"FinalMetricDataList\":{\
          \"shape\":\"FinalMetricDataList\",\
          \"documentation\":\"<p>A collection of <code>MetricData</code> objects that specify the names, values, and dates and times that the training algorithm emitted to Amazon CloudWatch.</p>\"\
        },\
        \"EnableNetworkIsolation\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If you want to allow inbound or outbound network calls, except for calls between peers within a training cluster for distributed training, choose <code>True</code>. If you enable network isolation for training jobs that are configured to use a VPC, Amazon SageMaker downloads and uploads customer data and model artifacts through the specified VPC, but the training container does not have network access.</p>\"\
        },\
        \"EnableInterContainerTrafficEncryption\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>To encrypt all communications between ML compute instances in distributed training, choose <code>True</code>. Encryption provides greater security for distributed training, but training might take longer. How long it takes depends on the amount of communication between compute instances, especially if you use a deep learning algorithms in distributed training.</p>\"\
        },\
        \"EnableManagedSpotTraining\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>A Boolean indicating whether managed spot training is enabled (<code>True</code>) or not (<code>False</code>).</p>\"\
        },\
        \"CheckpointConfig\":{\"shape\":\"CheckpointConfig\"},\
        \"TrainingTimeInSeconds\":{\
          \"shape\":\"TrainingTimeInSeconds\",\
          \"documentation\":\"<p>The training time in seconds.</p>\"\
        },\
        \"BillableTimeInSeconds\":{\
          \"shape\":\"BillableTimeInSeconds\",\
          \"documentation\":\"<p>The billable time in seconds.</p> <p>You can calculate the savings from using managed spot training using the formula <code>(1 - BillableTimeInSeconds / TrainingTimeInSeconds) * 100</code>. For example, if <code>BillableTimeInSeconds</code> is 100 and <code>TrainingTimeInSeconds</code> is 500, the savings is 80%.</p>\"\
        },\
        \"DebugHookConfig\":{\"shape\":\"DebugHookConfig\"},\
        \"ExperimentConfig\":{\"shape\":\"ExperimentConfig\"},\
        \"DebugRuleConfigurations\":{\
          \"shape\":\"DebugRuleConfigurations\",\
          \"documentation\":\"<p>Configuration information for debugging rules.</p>\"\
        },\
        \"TensorBoardOutputConfig\":{\"shape\":\"TensorBoardOutputConfig\"},\
        \"DebugRuleEvaluationStatuses\":{\
          \"shape\":\"DebugRuleEvaluationStatuses\",\
          \"documentation\":\"<p>Status about the debug rule evaluation.</p>\"\
        }\
      }\
    },\
    \"DescribeTransformJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TransformJobName\"],\
      \"members\":{\
        \"TransformJobName\":{\
          \"shape\":\"TransformJobName\",\
          \"documentation\":\"<p>The name of the transform job that you want to view details of.</p>\"\
        }\
      }\
    },\
    \"DescribeTransformJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TransformJobName\",\
        \"TransformJobArn\",\
        \"TransformJobStatus\",\
        \"ModelName\",\
        \"TransformInput\",\
        \"TransformResources\",\
        \"CreationTime\"\
      ],\
      \"members\":{\
        \"TransformJobName\":{\
          \"shape\":\"TransformJobName\",\
          \"documentation\":\"<p>The name of the transform job.</p>\"\
        },\
        \"TransformJobArn\":{\
          \"shape\":\"TransformJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the transform job.</p>\"\
        },\
        \"TransformJobStatus\":{\
          \"shape\":\"TransformJobStatus\",\
          \"documentation\":\"<p>The status of the transform job. If the transform job failed, the reason is returned in the <code>FailureReason</code> field.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the transform job failed, <code>FailureReason</code> describes why it failed. A transform job creates a log file, which includes error messages, and stores it as an Amazon S3 object. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/logging-cloudwatch.html\\\">Log Amazon SageMaker Events with Amazon CloudWatch</a>.</p>\"\
        },\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the model used in the transform job.</p>\"\
        },\
        \"MaxConcurrentTransforms\":{\
          \"shape\":\"MaxConcurrentTransforms\",\
          \"documentation\":\"<p>The maximum number of parallel requests on each instance node that can be launched in a transform job. The default value is 1.</p>\"\
        },\
        \"MaxPayloadInMB\":{\
          \"shape\":\"MaxPayloadInMB\",\
          \"documentation\":\"<p>The maximum payload size, in MB, used in the transform job.</p>\"\
        },\
        \"BatchStrategy\":{\
          \"shape\":\"BatchStrategy\",\
          \"documentation\":\"<p>Specifies the number of records to include in a mini-batch for an HTTP inference request. A <i>record</i> <i/> is a single unit of input data that inference can be made on. For example, a single line in a CSV file is a record. </p> <p>To enable the batch strategy, you must set <code>SplitType</code> to <code>Line</code>, <code>RecordIO</code>, or <code>TFRecord</code>.</p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"TransformEnvironmentMap\",\
          \"documentation\":\"<p>The environment variables to set in the Docker container. We support up to 16 key and values entries in the map.</p>\"\
        },\
        \"TransformInput\":{\
          \"shape\":\"TransformInput\",\
          \"documentation\":\"<p>Describes the dataset to be transformed and the Amazon S3 location where it is stored.</p>\"\
        },\
        \"TransformOutput\":{\
          \"shape\":\"TransformOutput\",\
          \"documentation\":\"<p>Identifies the Amazon S3 location where you want Amazon SageMaker to save the results from the transform job.</p>\"\
        },\
        \"TransformResources\":{\
          \"shape\":\"TransformResources\",\
          \"documentation\":\"<p>Describes the resources, including ML instance types and ML instance count, to use for the transform job.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that shows when the transform Job was created.</p>\"\
        },\
        \"TransformStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Indicates when the transform job starts on ML instances. You are billed for the time interval between this time and the value of <code>TransformEndTime</code>.</p>\"\
        },\
        \"TransformEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Indicates when the transform job has been completed, or has stopped or failed. You are billed for the time interval between this time and the value of <code>TransformStartTime</code>.</p>\"\
        },\
        \"LabelingJobArn\":{\
          \"shape\":\"LabelingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SageMaker Ground Truth labeling job that created the transform or training job.</p>\"\
        },\
        \"AutoMLJobArn\":{\
          \"shape\":\"AutoMLJobArn\",\
          \"documentation\":\"<p/>\"\
        },\
        \"DataProcessing\":{\"shape\":\"DataProcessing\"},\
        \"ExperimentConfig\":{\"shape\":\"ExperimentConfig\"}\
      }\
    },\
    \"DescribeTrialComponentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrialComponentName\"],\
      \"members\":{\
        \"TrialComponentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial component to describe.</p>\"\
        }\
      }\
    },\
    \"DescribeTrialComponentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialComponentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial component.</p>\"\
        },\
        \"TrialComponentArn\":{\
          \"shape\":\"TrialComponentArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trial component.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the component as displayed. If <code>DisplayName</code> isn't specified, <code>TrialComponentName</code> is displayed.</p>\"\
        },\
        \"Source\":{\
          \"shape\":\"TrialComponentSource\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the source and, optionally, the job type.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"TrialComponentStatus\",\
          \"documentation\":\"<p>The status of the component. States include:</p> <ul> <li> <p>InProgress</p> </li> <li> <p>Completed</p> </li> <li> <p>Failed</p> </li> </ul>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component started.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component ended.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component was created.</p>\"\
        },\
        \"CreatedBy\":{\
          \"shape\":\"UserContext\",\
          \"documentation\":\"<p>Who created the component.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component was last modified.</p>\"\
        },\
        \"LastModifiedBy\":{\
          \"shape\":\"UserContext\",\
          \"documentation\":\"<p>Who last modified the component.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"TrialComponentParameters\",\
          \"documentation\":\"<p>The hyperparameters of the component.</p>\"\
        },\
        \"InputArtifacts\":{\
          \"shape\":\"TrialComponentArtifacts\",\
          \"documentation\":\"<p>The input artifacts of the component.</p>\"\
        },\
        \"OutputArtifacts\":{\
          \"shape\":\"TrialComponentArtifacts\",\
          \"documentation\":\"<p>The output artifacts of the component.</p>\"\
        },\
        \"Metrics\":{\
          \"shape\":\"TrialComponentMetricSummaries\",\
          \"documentation\":\"<p>The metrics for the component.</p>\"\
        }\
      }\
    },\
    \"DescribeTrialRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrialName\"],\
      \"members\":{\
        \"TrialName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial to describe.</p>\"\
        }\
      }\
    },\
    \"DescribeTrialResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial.</p>\"\
        },\
        \"TrialArn\":{\
          \"shape\":\"TrialArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trial.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial as displayed. If <code>DisplayName</code> isn't specified, <code>TrialName</code> is displayed.</p>\"\
        },\
        \"ExperimentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment the trial is part of.</p>\"\
        },\
        \"Source\":{\
          \"shape\":\"TrialSource\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the source and, optionally, the job type.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the trial was created.</p>\"\
        },\
        \"CreatedBy\":{\
          \"shape\":\"UserContext\",\
          \"documentation\":\"<p>Who created the trial.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the trial was last modified.</p>\"\
        },\
        \"LastModifiedBy\":{\
          \"shape\":\"UserContext\",\
          \"documentation\":\"<p>Who last modified the trial.</p>\"\
        }\
      }\
    },\
    \"DescribeUserProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainId\",\
        \"UserProfileName\"\
      ],\
      \"members\":{\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"UserProfileName\":{\
          \"shape\":\"UserProfileName\",\
          \"documentation\":\"<p>The user profile name.</p>\"\
        }\
      }\
    },\
    \"DescribeUserProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"UserProfileArn\":{\
          \"shape\":\"UserProfileArn\",\
          \"documentation\":\"<p>The user profile Amazon Resource Name (ARN).</p>\"\
        },\
        \"UserProfileName\":{\
          \"shape\":\"UserProfileName\",\
          \"documentation\":\"<p>The user profile name.</p>\"\
        },\
        \"HomeEfsFileSystemUid\":{\
          \"shape\":\"EfsUid\",\
          \"documentation\":\"<p>The home Amazon Elastic File System (EFS) Uid.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"UserProfileStatus\",\
          \"documentation\":\"<p>The status.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>The last modified time.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The creation time.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>The failure reason.</p>\"\
        },\
        \"SingleSignOnUserIdentifier\":{\
          \"shape\":\"SingleSignOnUserIdentifier\",\
          \"documentation\":\"<p>The SSO user identifier.</p>\"\
        },\
        \"SingleSignOnUserValue\":{\
          \"shape\":\"String256\",\
          \"documentation\":\"<p>The SSO user value.</p>\"\
        },\
        \"UserSettings\":{\
          \"shape\":\"UserSettings\",\
          \"documentation\":\"<p>A collection of settings.</p>\"\
        }\
      }\
    },\
    \"DescribeWorkforceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"WorkforceName\"],\
      \"members\":{\
        \"WorkforceName\":{\
          \"shape\":\"WorkforceName\",\
          \"documentation\":\"<p>The name of the private workforce whose access you want to restrict. <code>WorkforceName</code> is automatically set to <code>default</code> when a workforce is created and cannot be modified. </p>\"\
        }\
      }\
    },\
    \"DescribeWorkforceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Workforce\"],\
      \"members\":{\
        \"Workforce\":{\
          \"shape\":\"Workforce\",\
          \"documentation\":\"<p>A single private workforce, which is automatically created when you create your first private work team. You can create one private work force in each AWS Region. By default, any workforce-related API operation used in a specific region will apply to the workforce created in that region. To learn how to create a private workforce, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private.html\\\">Create a Private Workforce</a>.</p>\"\
        }\
      }\
    },\
    \"DescribeWorkteamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"WorkteamName\"],\
      \"members\":{\
        \"WorkteamName\":{\
          \"shape\":\"WorkteamName\",\
          \"documentation\":\"<p>The name of the work team to return a description of.</p>\"\
        }\
      }\
    },\
    \"DescribeWorkteamResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Workteam\"],\
      \"members\":{\
        \"Workteam\":{\
          \"shape\":\"Workteam\",\
          \"documentation\":\"<p>A <code>Workteam</code> instance that contains information about the work team. </p>\"\
        }\
      }\
    },\
    \"DesiredWeightAndCapacity\":{\
      \"type\":\"structure\",\
      \"required\":[\"VariantName\"],\
      \"members\":{\
        \"VariantName\":{\
          \"shape\":\"VariantName\",\
          \"documentation\":\"<p>The name of the variant to update.</p>\"\
        },\
        \"DesiredWeight\":{\
          \"shape\":\"VariantWeight\",\
          \"documentation\":\"<p>The variant's weight.</p>\"\
        },\
        \"DesiredInstanceCount\":{\
          \"shape\":\"TaskCount\",\
          \"documentation\":\"<p>The variant's capacity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies weight and capacity values for a production variant.</p>\"\
    },\
    \"DesiredWeightAndCapacityList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DesiredWeightAndCapacity\"},\
      \"min\":1\
    },\
    \"DestinationS3Uri\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"pattern\":\"^(https|s3)://([^/])/?(.*)$\"\
    },\
    \"DetailedAlgorithmStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NotStarted\",\
        \"InProgress\",\
        \"Completed\",\
        \"Failed\"\
      ]\
    },\
    \"DetailedModelPackageStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NotStarted\",\
        \"InProgress\",\
        \"Completed\",\
        \"Failed\"\
      ]\
    },\
    \"DirectInternetAccess\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Enabled\",\
        \"Disabled\"\
      ]\
    },\
    \"DirectoryPath\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"pattern\":\".*\"\
    },\
    \"DisassociateAdditionalCodeRepositories\":{\"type\":\"boolean\"},\
    \"DisassociateDefaultCodeRepository\":{\"type\":\"boolean\"},\
    \"DisassociateNotebookInstanceAcceleratorTypes\":{\"type\":\"boolean\"},\
    \"DisassociateNotebookInstanceLifecycleConfig\":{\"type\":\"boolean\"},\
    \"DisassociateTrialComponentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrialComponentName\",\
        \"TrialName\"\
      ],\
      \"members\":{\
        \"TrialComponentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the component to disassociate from the trial.</p>\"\
        },\
        \"TrialName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial to disassociate from.</p>\"\
        }\
      }\
    },\
    \"DisassociateTrialComponentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialComponentArn\":{\
          \"shape\":\"TrialComponentArn\",\
          \"documentation\":\"<p>The ARN of the trial component.</p>\"\
        },\
        \"TrialArn\":{\
          \"shape\":\"TrialArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trial.</p>\"\
        }\
      }\
    },\
    \"Dollars\":{\
      \"type\":\"integer\",\
      \"max\":2,\
      \"min\":0\
    },\
    \"DomainArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:domain/.*\"\
    },\
    \"DomainDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DomainArn\":{\
          \"shape\":\"DomainArn\",\
          \"documentation\":\"<p>The domain's Amazon Resource Name (ARN).</p>\"\
        },\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"DomainName\":{\
          \"shape\":\"DomainName\",\
          \"documentation\":\"<p>The domain name.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"DomainStatus\",\
          \"documentation\":\"<p>The status.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The creation time.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>The last modified time.</p>\"\
        },\
        \"Url\":{\
          \"shape\":\"String1024\",\
          \"documentation\":\"<p>The domain's URL.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The domain's details.</p>\"\
    },\
    \"DomainId\":{\
      \"type\":\"string\",\
      \"max\":63\
    },\
    \"DomainList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DomainDetails\"}\
    },\
    \"DomainName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"DomainStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Deleting\",\
        \"Failed\",\
        \"InService\",\
        \"Pending\"\
      ]\
    },\
    \"DoubleParameterValue\":{\"type\":\"double\"},\
    \"EfsUid\":{\
      \"type\":\"string\",\
      \"max\":10,\
      \"pattern\":\"\\\\d+\"\
    },\
    \"EnableCapture\":{\"type\":\"boolean\"},\
    \"EndpointArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:endpoint/.*\"\
    },\
    \"EndpointConfigArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:endpoint-config/.*\"\
    },\
    \"EndpointConfigName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"EndpointConfigNameContains\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"[a-zA-Z0-9-]+\"\
    },\
    \"EndpointConfigSortKey\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\"\
      ]\
    },\
    \"EndpointConfigSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointConfigName\",\
        \"EndpointConfigArn\",\
        \"CreationTime\"\
      ],\
      \"members\":{\
        \"EndpointConfigName\":{\
          \"shape\":\"EndpointConfigName\",\
          \"documentation\":\"<p>The name of the endpoint configuration.</p>\"\
        },\
        \"EndpointConfigArn\":{\
          \"shape\":\"EndpointConfigArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the endpoint configuration.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that shows when the endpoint configuration was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information for an endpoint configuration.</p>\"\
    },\
    \"EndpointConfigSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EndpointConfigSummary\"}\
    },\
    \"EndpointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointName\",\
        \"LocalPath\"\
      ],\
      \"members\":{\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p>An endpoint in customer's account which has enabled <code>DataCaptureConfig</code> enabled.</p>\"\
        },\
        \"LocalPath\":{\
          \"shape\":\"ProcessingLocalPath\",\
          \"documentation\":\"<p>Path to the filesystem where the endpoint data is available to the container.</p>\"\
        },\
        \"S3InputMode\":{\
          \"shape\":\"ProcessingS3InputMode\",\
          \"documentation\":\"<p>Whether the <code>Pipe</code> or <code>File</code> is used as the input mode for transfering data for the monitoring job. <code>Pipe</code> mode is recommended for large datasets. <code>File</code> mode is useful for small files that fit in memory. Defaults to <code>File</code>.</p>\"\
        },\
        \"S3DataDistributionType\":{\
          \"shape\":\"ProcessingS3DataDistributionType\",\
          \"documentation\":\"<p>Whether input data distributed in Amazon S3 is fully replicated or sharded by an S3 key. Defauts to <code>FullyReplicated</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Input object for the endpoint</p>\"\
    },\
    \"EndpointName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"EndpointNameContains\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"[a-zA-Z0-9-]+\"\
    },\
    \"EndpointSortKey\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\",\
        \"Status\"\
      ]\
    },\
    \"EndpointStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"OutOfService\",\
        \"Creating\",\
        \"Updating\",\
        \"SystemUpdating\",\
        \"RollingBack\",\
        \"InService\",\
        \"Deleting\",\
        \"Failed\"\
      ]\
    },\
    \"EndpointSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointName\",\
        \"EndpointArn\",\
        \"CreationTime\",\
        \"LastModifiedTime\",\
        \"EndpointStatus\"\
      ],\
      \"members\":{\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p>The name of the endpoint.</p>\"\
        },\
        \"EndpointArn\":{\
          \"shape\":\"EndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the endpoint.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that shows when the endpoint was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that shows when the endpoint was last modified.</p>\"\
        },\
        \"EndpointStatus\":{\
          \"shape\":\"EndpointStatus\",\
          \"documentation\":\"<p>The status of the endpoint.</p> <ul> <li> <p> <code>OutOfService</code>: Endpoint is not available to take incoming requests.</p> </li> <li> <p> <code>Creating</code>: <a>CreateEndpoint</a> is executing.</p> </li> <li> <p> <code>Updating</code>: <a>UpdateEndpoint</a> or <a>UpdateEndpointWeightsAndCapacities</a> is executing.</p> </li> <li> <p> <code>SystemUpdating</code>: Endpoint is undergoing maintenance and cannot be updated or deleted or re-scaled until it has completed. This maintenance operation does not change any customer-specified values such as VPC config, KMS encryption, model, instance type, or instance count.</p> </li> <li> <p> <code>RollingBack</code>: Endpoint fails to scale up or down or change its variant weight and is in the process of rolling back to its previous configuration. Once the rollback completes, endpoint returns to an <code>InService</code> status. This transitional status only applies to an endpoint that has autoscaling enabled and is undergoing variant weight or capacity changes as part of an <a>UpdateEndpointWeightsAndCapacities</a> call or when the <a>UpdateEndpointWeightsAndCapacities</a> operation is called explicitly.</p> </li> <li> <p> <code>InService</code>: Endpoint is available to process incoming requests.</p> </li> <li> <p> <code>Deleting</code>: <a>DeleteEndpoint</a> is executing.</p> </li> <li> <p> <code>Failed</code>: Endpoint could not be created, updated, or re-scaled. Use <a>DescribeEndpointOutput$FailureReason</a> for information about the failure. <a>DeleteEndpoint</a> is the only operation that can be performed on a failed endpoint.</p> </li> </ul> <p>To get a list of endpoints with a specified status, use the <a>ListEndpointsInput$StatusEquals</a> filter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information for an endpoint.</p>\"\
    },\
    \"EndpointSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EndpointSummary\"}\
    },\
    \"EntityDescription\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{Z}\\\\p{S}\\\\p{N}\\\\p{P}]*\"\
    },\
    \"EntityName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$\"\
    },\
    \"EnvironmentKey\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"[a-zA-Z_][a-zA-Z0-9_]*\"\
    },\
    \"EnvironmentMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"EnvironmentKey\"},\
      \"value\":{\"shape\":\"EnvironmentValue\"},\
      \"max\":16\
    },\
    \"EnvironmentValue\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"[\\\\S\\\\s]*\"\
    },\
    \"ExecutionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pending\",\
        \"Completed\",\
        \"CompletedWithViolations\",\
        \"InProgress\",\
        \"Failed\",\
        \"Stopping\",\
        \"Stopped\"\
      ]\
    },\
    \"ExitMessage\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"[\\\\S\\\\s]*\"\
    },\
    \"Experiment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExperimentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment.</p>\"\
        },\
        \"ExperimentArn\":{\
          \"shape\":\"ExperimentArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the experiment.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment as displayed. If <code>DisplayName</code> isn't specified, <code>ExperimentName</code> is displayed.</p>\"\
        },\
        \"Source\":{\"shape\":\"ExperimentSource\"},\
        \"Description\":{\
          \"shape\":\"ExperimentDescription\",\
          \"documentation\":\"<p>The description of the experiment.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the experiment was created.</p>\"\
        },\
        \"CreatedBy\":{\"shape\":\"UserContext\"},\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the experiment was last modified.</p>\"\
        },\
        \"LastModifiedBy\":{\"shape\":\"UserContext\"},\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The list of tags that are associated with the experiment. You can use <a>Search</a> API to search on the tags.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The properties of an experiment as returned by the <a>Search</a> API.</p>\"\
    },\
    \"ExperimentArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:experiment/.*\"\
    },\
    \"ExperimentConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExperimentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment.</p>\"\
        },\
        \"TrialName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial.</p>\"\
        },\
        \"TrialComponentDisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>Display name for the trial component.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration for the experiment.</p>\"\
    },\
    \"ExperimentDescription\":{\
      \"type\":\"string\",\
      \"max\":3072,\
      \"pattern\":\".*\"\
    },\
    \"ExperimentEntityName\":{\
      \"type\":\"string\",\
      \"max\":82,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"ExperimentSource\":{\
      \"type\":\"structure\",\
      \"required\":[\"SourceArn\"],\
      \"members\":{\
        \"SourceArn\":{\
          \"shape\":\"ExperimentSourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the source.</p>\"\
        },\
        \"SourceType\":{\
          \"shape\":\"SourceType\",\
          \"documentation\":\"<p>The source type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The source of the experiment.</p>\"\
    },\
    \"ExperimentSourceArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:.*\"\
    },\
    \"ExperimentSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ExperimentSummary\"}\
    },\
    \"ExperimentSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExperimentArn\":{\
          \"shape\":\"ExperimentArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the experiment.</p>\"\
        },\
        \"ExperimentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment as displayed. If <code>DisplayName</code> isn't specified, <code>ExperimentName</code> is displayed.</p>\"\
        },\
        \"ExperimentSource\":{\"shape\":\"ExperimentSource\"},\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the experiment was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the experiment was last modified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A summary of the properties of an experiment. To get the complete set of properties, call the <a>DescribeExperiment</a> API and provide the <code>ExperimentName</code>.</p>\"\
    },\
    \"FailureReason\":{\
      \"type\":\"string\",\
      \"max\":1024\
    },\
    \"FileSystemAccessMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"rw\",\
        \"ro\"\
      ]\
    },\
    \"FileSystemDataSource\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FileSystemId\",\
        \"FileSystemAccessMode\",\
        \"FileSystemType\",\
        \"DirectoryPath\"\
      ],\
      \"members\":{\
        \"FileSystemId\":{\
          \"shape\":\"FileSystemId\",\
          \"documentation\":\"<p>The file system id.</p>\"\
        },\
        \"FileSystemAccessMode\":{\
          \"shape\":\"FileSystemAccessMode\",\
          \"documentation\":\"<p>The access mode of the mount of the directory associated with the channel. A directory can be mounted either in <code>ro</code> (read-only) or <code>rw</code> (read-write) mode.</p>\"\
        },\
        \"FileSystemType\":{\
          \"shape\":\"FileSystemType\",\
          \"documentation\":\"<p>The file system type. </p>\"\
        },\
        \"DirectoryPath\":{\
          \"shape\":\"DirectoryPath\",\
          \"documentation\":\"<p>The full path to the directory to associate with the channel.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a file system data source for a channel.</p>\"\
    },\
    \"FileSystemId\":{\
      \"type\":\"string\",\
      \"min\":11,\
      \"pattern\":\".*\"\
    },\
    \"FileSystemType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"EFS\",\
        \"FSxLustre\"\
      ]\
    },\
    \"Filter\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ResourcePropertyName\",\
          \"documentation\":\"<p>A resource property name. For example, <code>TrainingJobName</code>. For valid property names, see <a>SearchRecord</a>. You must specify a valid property for the resource.</p>\"\
        },\
        \"Operator\":{\
          \"shape\":\"Operator\",\
          \"documentation\":\"<p>A Boolean binary operator that is used to evaluate the filter. The operator field contains one of the following values:</p> <dl> <dt>Equals</dt> <dd> <p>The value of <code>Name</code> equals <code>Value</code>.</p> </dd> <dt>NotEquals</dt> <dd> <p>The value of <code>Name</code> doesn't equal <code>Value</code>.</p> </dd> <dt>GreaterThan</dt> <dd> <p>The value of <code>Name</code> is greater than <code>Value</code>. Not supported for text properties.</p> </dd> <dt>GreaterThanOrEqualTo</dt> <dd> <p>The value of <code>Name</code> is greater than or equal to <code>Value</code>. Not supported for text properties.</p> </dd> <dt>LessThan</dt> <dd> <p>The value of <code>Name</code> is less than <code>Value</code>. Not supported for text properties.</p> </dd> <dt>LessThanOrEqualTo</dt> <dd> <p>The value of <code>Name</code> is less than or equal to <code>Value</code>. Not supported for text properties.</p> </dd> <dt>Contains</dt> <dd> <p>The value of <code>Name</code> contains the string <code>Value</code>. A <code>SearchExpression</code> can include only one <code>Contains</code> operator. Only supported for text properties.</p> </dd> <dt>Exists</dt> <dd> <p>The <code>Name</code> property exists.</p> </dd> <dt>NotExists</dt> <dd> <p>The <code>Name</code> property does not exist.</p> </dd> <dt>In</dt> <dd> <p>The value of <code>Name</code> is one of the comma delimited strings in <code>Value</code>. Only supported for text properties.</p> </dd> </dl>\"\
        },\
        \"Value\":{\
          \"shape\":\"FilterValue\",\
          \"documentation\":\"<p>A value used with <code>Name</code> and <code>Operator</code> to determine which resources satisfy the filter's condition. For numerical properties, <code>Value</code> must be an integer or floating-point decimal. For timestamp properties, <code>Value</code> must be an ISO 8601 date-time string of the following format: <code>YYYY-mm-dd'T'HH:MM:SS</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A conditional statement for a search expression that includes a resource property, a Boolean operator, and a value. Resources that match the statement are returned in the results from the <a>Search</a> API.</p> <p>If you specify a <code>Value</code>, but not an <code>Operator</code>, Amazon SageMaker uses the equals operator.</p> <p>In search, there are several property types:</p> <dl> <dt>Metrics</dt> <dd> <p>To define a metric filter, enter a value using the form <code>\\\"Metrics.&lt;name&gt;\\\"</code>, where <code>&lt;name&gt;</code> is a metric name. For example, the following filter searches for training jobs with an <code>\\\"accuracy\\\"</code> metric greater than <code>\\\"0.9\\\"</code>:</p> <p> <code>{</code> </p> <p> <code>\\\"Name\\\": \\\"Metrics.accuracy\\\",</code> </p> <p> <code>\\\"Operator\\\": \\\"GreaterThan\\\",</code> </p> <p> <code>\\\"Value\\\": \\\"0.9\\\"</code> </p> <p> <code>}</code> </p> </dd> <dt>HyperParameters</dt> <dd> <p>To define a hyperparameter filter, enter a value with the form <code>\\\"HyperParameters.&lt;name&gt;\\\"</code>. Decimal hyperparameter values are treated as a decimal in a comparison if the specified <code>Value</code> is also a decimal value. If the specified <code>Value</code> is an integer, the decimal hyperparameter values are treated as integers. For example, the following filter is satisfied by training jobs with a <code>\\\"learning_rate\\\"</code> hyperparameter that is less than <code>\\\"0.5\\\"</code>:</p> <p> <code> {</code> </p> <p> <code> \\\"Name\\\": \\\"HyperParameters.learning_rate\\\",</code> </p> <p> <code> \\\"Operator\\\": \\\"LessThan\\\",</code> </p> <p> <code> \\\"Value\\\": \\\"0.5\\\"</code> </p> <p> <code> }</code> </p> </dd> <dt>Tags</dt> <dd> <p>To define a tag filter, enter a value with the form <code>Tags.&lt;key&gt;</code>.</p> </dd> </dl>\"\
    },\
    \"FilterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Filter\"},\
      \"max\":20,\
      \"min\":1\
    },\
    \"FilterValue\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\".+\"\
    },\
    \"FinalAutoMLJobObjectiveMetric\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MetricName\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"AutoMLJobObjectiveType\",\
          \"documentation\":\"<p>The metric type used.</p>\"\
        },\
        \"MetricName\":{\
          \"shape\":\"AutoMLMetricEnum\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"MetricValue\",\
          \"documentation\":\"<p>The value of the metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The candidate result from a job.</p>\"\
    },\
    \"FinalHyperParameterTuningJobObjectiveMetric\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MetricName\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"HyperParameterTuningJobObjectiveType\",\
          \"documentation\":\"<p>Whether to minimize or maximize the objective metric. Valid values are Minimize and Maximize.</p>\"\
        },\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the objective metric.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"MetricValue\",\
          \"documentation\":\"<p>The value of the objective metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Shows the final value for the objective metric for a training job that was launched by a hyperparameter tuning job. You define the objective metric in the <code>HyperParameterTuningJobObjective</code> parameter of <a>HyperParameterTuningJobConfig</a>.</p>\"\
    },\
    \"FinalMetricDataList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricData\"},\
      \"max\":40,\
      \"min\":0\
    },\
    \"Float\":{\"type\":\"float\"},\
    \"FlowDefinitionArn\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:flow-definition/.*\"\
    },\
    \"FlowDefinitionName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"^[a-z0-9](-*[a-z0-9])*\"\
    },\
    \"FlowDefinitionOutputConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3OutputPath\"],\
      \"members\":{\
        \"S3OutputPath\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 path where the object containing human output will be made available.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The Amazon Key Management Service (KMS) key ID for server-side encryption.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about where human output will be stored.</p>\"\
    },\
    \"FlowDefinitionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Initializing\",\
        \"Active\",\
        \"Failed\",\
        \"Deleting\"\
      ]\
    },\
    \"FlowDefinitionSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FlowDefinitionSummary\"}\
    },\
    \"FlowDefinitionSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FlowDefinitionName\",\
        \"FlowDefinitionArn\",\
        \"FlowDefinitionStatus\",\
        \"CreationTime\"\
      ],\
      \"members\":{\
        \"FlowDefinitionName\":{\
          \"shape\":\"FlowDefinitionName\",\
          \"documentation\":\"<p>The name of the flow definition.</p>\"\
        },\
        \"FlowDefinitionArn\":{\
          \"shape\":\"FlowDefinitionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the flow definition.</p>\"\
        },\
        \"FlowDefinitionStatus\":{\
          \"shape\":\"FlowDefinitionStatus\",\
          \"documentation\":\"<p>The status of the flow definition. Valid values:</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp when SageMaker created the flow definition.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>The reason why the flow definition creation failed. A failure reason is returned only when the flow definition status is <code>Failed</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about the flow definition.</p>\"\
    },\
    \"FlowDefinitionTaskAvailabilityLifetimeInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":864000,\
      \"min\":1\
    },\
    \"FlowDefinitionTaskCount\":{\
      \"type\":\"integer\",\
      \"max\":3,\
      \"min\":1\
    },\
    \"FlowDefinitionTaskDescription\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\".+\"\
    },\
    \"FlowDefinitionTaskKeyword\":{\
      \"type\":\"string\",\
      \"max\":30,\
      \"min\":1,\
      \"pattern\":\"^[A-Za-z0-9]+( [A-Za-z0-9]+)*$\"\
    },\
    \"FlowDefinitionTaskKeywords\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FlowDefinitionTaskKeyword\"},\
      \"max\":5,\
      \"min\":1\
    },\
    \"FlowDefinitionTaskTimeLimitInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":28800,\
      \"min\":30\
    },\
    \"FlowDefinitionTaskTitle\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^[\\\\t\\\\n\\\\r -\\\\uD7FF\\\\uE000-\\\\uFFFD]*$\"\
    },\
    \"Framework\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TENSORFLOW\",\
        \"KERAS\",\
        \"MXNET\",\
        \"ONNX\",\
        \"PYTORCH\",\
        \"XGBOOST\",\
        \"TFLITE\"\
      ]\
    },\
    \"GenerateCandidateDefinitionsOnly\":{\"type\":\"boolean\"},\
    \"GetSearchSuggestionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Resource\"],\
      \"members\":{\
        \"Resource\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The name of the Amazon SageMaker resource to search for.</p>\"\
        },\
        \"SuggestionQuery\":{\
          \"shape\":\"SuggestionQuery\",\
          \"documentation\":\"<p>Limits the property names that are included in the response.</p>\"\
        }\
      }\
    },\
    \"GetSearchSuggestionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PropertyNameSuggestions\":{\
          \"shape\":\"PropertyNameSuggestionList\",\
          \"documentation\":\"<p>A list of property names for a <code>Resource</code> that match a <code>SuggestionQuery</code>.</p>\"\
        }\
      }\
    },\
    \"GitConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"RepositoryUrl\"],\
      \"members\":{\
        \"RepositoryUrl\":{\
          \"shape\":\"GitConfigUrl\",\
          \"documentation\":\"<p>The URL where the Git repository is located.</p>\"\
        },\
        \"Branch\":{\
          \"shape\":\"Branch\",\
          \"documentation\":\"<p>The default branch for the Git repository.</p>\"\
        },\
        \"SecretArn\":{\
          \"shape\":\"SecretArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Secrets Manager secret that contains the credentials used to access the git repository. The secret must have a staging label of <code>AWSCURRENT</code> and must be in the following format:</p> <p> <code>{\\\"username\\\": <i>UserName</i>, \\\"password\\\": <i>Password</i>}</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies configuration details for a Git repository in your AWS account.</p>\"\
    },\
    \"GitConfigForUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecretArn\":{\
          \"shape\":\"SecretArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Secrets Manager secret that contains the credentials used to access the git repository. The secret must have a staging label of <code>AWSCURRENT</code> and must be in the following format:</p> <p> <code>{\\\"username\\\": <i>UserName</i>, \\\"password\\\": <i>Password</i>}</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies configuration details for a Git repository when the repository is updated.</p>\"\
    },\
    \"GitConfigUrl\":{\
      \"type\":\"string\",\
      \"pattern\":\"^https://([^/]+)/?(.*)$\"\
    },\
    \"HookParameters\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ConfigKey\"},\
      \"value\":{\"shape\":\"ConfigValue\"},\
      \"max\":20,\
      \"min\":0\
    },\
    \"HumanLoopActivationConditions\":{\
      \"type\":\"string\",\
      \"max\":10240\
    },\
    \"HumanLoopActivationConditionsConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"HumanLoopActivationConditions\"],\
      \"members\":{\
        \"HumanLoopActivationConditions\":{\
          \"shape\":\"HumanLoopActivationConditions\",\
          \"documentation\":\"<p>JSON expressing use-case specific conditions declaratively. If any condition is matched, atomic tasks are created against the configured work team. The set of conditions is different for Rekognition and Textract. For more information about how to structure the JSON, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/a2i-human-fallback-conditions-json-schema.html\\\">JSON Schema for Human Loop Activation Conditions in Amazon Augmented AI</a> in the <i>Amazon SageMaker Developer Guide</i>.</p>\",\
          \"jsonvalue\":true\
        }\
      },\
      \"documentation\":\"<p>Defines under what conditions SageMaker creates a human loop. Used within . See for the required format of activation conditions.</p>\"\
    },\
    \"HumanLoopActivationConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"HumanLoopActivationConditionsConfig\"],\
      \"members\":{\
        \"HumanLoopActivationConditionsConfig\":{\
          \"shape\":\"HumanLoopActivationConditionsConfig\",\
          \"documentation\":\"<p>Container structure for defining under what conditions SageMaker creates a human loop.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about how and under what conditions SageMaker creates a human loop. If <code>HumanLoopActivationConfig</code> is not given, then all requests go to humans.</p>\"\
    },\
    \"HumanLoopConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"WorkteamArn\",\
        \"HumanTaskUiArn\",\
        \"TaskTitle\",\
        \"TaskDescription\",\
        \"TaskCount\"\
      ],\
      \"members\":{\
        \"WorkteamArn\":{\
          \"shape\":\"WorkteamArn\",\
          \"documentation\":\"<p>Amazon Resource Name (ARN) of a team of workers.</p>\"\
        },\
        \"HumanTaskUiArn\":{\
          \"shape\":\"HumanTaskUiArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the human task user interface.</p>\"\
        },\
        \"TaskTitle\":{\
          \"shape\":\"FlowDefinitionTaskTitle\",\
          \"documentation\":\"<p>A title for the human worker task.</p>\"\
        },\
        \"TaskDescription\":{\
          \"shape\":\"FlowDefinitionTaskDescription\",\
          \"documentation\":\"<p>A description for the human worker task.</p>\"\
        },\
        \"TaskCount\":{\
          \"shape\":\"FlowDefinitionTaskCount\",\
          \"documentation\":\"<p>The number of distinct workers who will perform the same task on each object. For example, if <code>TaskCount</code> is set to <code>3</code> for an image classification labeling job, three workers will classify each input image. Increasing <code>TaskCount</code> can improve label accuracy.</p>\"\
        },\
        \"TaskAvailabilityLifetimeInSeconds\":{\
          \"shape\":\"FlowDefinitionTaskAvailabilityLifetimeInSeconds\",\
          \"documentation\":\"<p>The length of time that a task remains available for labeling by human workers.</p>\"\
        },\
        \"TaskTimeLimitInSeconds\":{\
          \"shape\":\"FlowDefinitionTaskTimeLimitInSeconds\",\
          \"documentation\":\"<p>The amount of time that a worker has to complete a task.</p>\"\
        },\
        \"TaskKeywords\":{\
          \"shape\":\"FlowDefinitionTaskKeywords\",\
          \"documentation\":\"<p>Keywords used to describe the task so that workers can discover the task.</p>\"\
        },\
        \"PublicWorkforceTaskPrice\":{\"shape\":\"PublicWorkforceTaskPrice\"}\
      },\
      \"documentation\":\"<p>Describes the work to be performed by human workers.</p>\"\
    },\
    \"HumanLoopRequestSource\":{\
      \"type\":\"structure\",\
      \"required\":[\"AwsManagedHumanLoopRequestSource\"],\
      \"members\":{\
        \"AwsManagedHumanLoopRequestSource\":{\
          \"shape\":\"AwsManagedHumanLoopRequestSource\",\
          \"documentation\":\"<p>Specifies whether Amazon Rekognition or Amazon Textract are used as the integration source. The default field settings and JSON parsing rules are different based on the integration source. Valid values:</p>\"\
        }\
      },\
      \"documentation\":\"<p>Container for configuring the source of human task requests.</p>\"\
    },\
    \"HumanTaskConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"WorkteamArn\",\
        \"UiConfig\",\
        \"PreHumanTaskLambdaArn\",\
        \"TaskTitle\",\
        \"TaskDescription\",\
        \"NumberOfHumanWorkersPerDataObject\",\
        \"TaskTimeLimitInSeconds\",\
        \"AnnotationConsolidationConfig\"\
      ],\
      \"members\":{\
        \"WorkteamArn\":{\
          \"shape\":\"WorkteamArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the work team assigned to complete the tasks.</p>\"\
        },\
        \"UiConfig\":{\
          \"shape\":\"UiConfig\",\
          \"documentation\":\"<p>Information about the user interface that workers use to complete the labeling task.</p>\"\
        },\
        \"PreHumanTaskLambdaArn\":{\
          \"shape\":\"LambdaFunctionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of a Lambda function that is run before a data object is sent to a human worker. Use this function to provide input to a custom labeling job.</p> <p>For the built-in bounding box, image classification, semantic segmentation, and text classification task types, Amazon SageMaker Ground Truth provides the following Lambda functions:</p> <p> <b>US East (Northern Virginia) (us-east-1):</b> </p> <ul> <li> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-BoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-ImageMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-ImageMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-SemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-TextMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-TextMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-NamedEntityRecognition</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-VerificationBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-VerificationSemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-AdjustmentBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-AdjustmentSemanticSegmentation</code> </p> </li> </ul> <p> <b>US East (Ohio) (us-east-2):</b> </p> <ul> <li> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-BoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-ImageMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-ImageMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-SemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-TextMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-TextMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-NamedEntityRecognition</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-VerificationBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-VerificationSemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-AdjustmentBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-AdjustmentSemanticSegmentation</code> </p> </li> </ul> <p> <b>US West (Oregon) (us-west-2):</b> </p> <ul> <li> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-BoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-ImageMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-ImageMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-SemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-TextMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-TextMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-NamedEntityRecognition</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-VerificationBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-VerificationSemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-AdjustmentBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-AdjustmentSemanticSegmentation</code> </p> </li> </ul> <p> <b>Canada (Central) (ca-central-1):</b> </p> <ul> <li> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-BoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-ImageMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-ImageMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-SemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-TextMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-TextMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-NamedEntityRecognition</code> </p> </li> <li> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-VerificationBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-VerificationSemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-AdjustmentBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-AdjustmentSemanticSegmentation</code> </p> </li> </ul> <p> <b>EU (Ireland) (eu-west-1):</b> </p> <ul> <li> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-BoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-ImageMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-ImageMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-SemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-TextMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-TextMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-NamedEntityRecognition</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-VerificationBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-VerificationSemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-AdjustmentBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-AdjustmentSemanticSegmentation</code> </p> </li> </ul> <p> <b>EU (London) (eu-west-2):</b> </p> <ul> <li> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-BoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-ImageMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-ImageMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-SemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-TextMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-TextMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-NamedEntityRecognition</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-VerificationBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-VerificationSemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-AdjustmentBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-AdjustmentSemanticSegmentation</code> </p> </li> </ul> <p> <b>EU Frankfurt (eu-central-1):</b> </p> <ul> <li> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-BoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-ImageMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-ImageMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-SemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-TextMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-TextMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-NamedEntityRecognition</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-VerificationBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-VerificationSemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-AdjustmentBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-AdjustmentSemanticSegmentation</code> </p> </li> </ul> <p> <b>Asia Pacific (Tokyo) (ap-northeast-1):</b> </p> <ul> <li> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-BoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-ImageMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-ImageMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-SemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-TextMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-TextMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-NamedEntityRecognition</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-VerificationBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-VerificationSemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-AdjustmentBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-AdjustmentSemanticSegmentation</code> </p> </li> </ul> <p> <b>Asia Pacific (Seoul) (ap-northeast-2):</b> </p> <ul> <li> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-BoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-ImageMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-ImageMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-SemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-TextMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-TextMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-NamedEntityRecognition</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-VerificationBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-VerificationSemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-AdjustmentBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-AdjustmentSemanticSegmentation</code> </p> </li> </ul> <p> <b>Asia Pacific (Mumbai) (ap-south-1):</b> </p> <ul> <li> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-BoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-ImageMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-ImageMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-SemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-TextMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-TextMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-NamedEntityRecognition</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-VerificationBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-VerificationSemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-AdjustmentBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-AdjustmentSemanticSegmentation</code> </p> </li> </ul> <p> <b>Asia Pacific (Singapore) (ap-southeast-1):</b> </p> <ul> <li> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-BoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-ImageMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-ImageMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-SemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-TextMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-TextMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-NamedEntityRecognition</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-VerificationBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-VerificationSemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-AdjustmentBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-AdjustmentSemanticSegmentation</code> </p> </li> </ul> <p> <b>Asia Pacific (Sydney) (ap-southeast-2):</b> </p> <ul> <li> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-BoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-ImageMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-ImageMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-SemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-TextMultiClass</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-TextMultiClassMultiLabel</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-NamedEntityRecognition</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-VerificationBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-VerificationSemanticSegmentation</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-AdjustmentBoundingBox</code> </p> </li> <li> <p> <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-AdjustmentSemanticSegmentation</code> </p> </li> </ul>\"\
        },\
        \"TaskKeywords\":{\
          \"shape\":\"TaskKeywords\",\
          \"documentation\":\"<p>Keywords used to describe the task so that workers on Amazon Mechanical Turk can discover the task.</p>\"\
        },\
        \"TaskTitle\":{\
          \"shape\":\"TaskTitle\",\
          \"documentation\":\"<p>A title for the task for your human workers.</p>\"\
        },\
        \"TaskDescription\":{\
          \"shape\":\"TaskDescription\",\
          \"documentation\":\"<p>A description of the task for your human workers.</p>\"\
        },\
        \"NumberOfHumanWorkersPerDataObject\":{\
          \"shape\":\"NumberOfHumanWorkersPerDataObject\",\
          \"documentation\":\"<p>The number of human workers that will label an object. </p>\"\
        },\
        \"TaskTimeLimitInSeconds\":{\
          \"shape\":\"TaskTimeLimitInSeconds\",\
          \"documentation\":\"<p>The amount of time that a worker has to complete a task.</p>\"\
        },\
        \"TaskAvailabilityLifetimeInSeconds\":{\
          \"shape\":\"TaskAvailabilityLifetimeInSeconds\",\
          \"documentation\":\"<p>The length of time that a task remains available for labeling by human workers. <b>If you choose the Amazon Mechanical Turk workforce, the maximum is 12 hours (43200)</b>. The default value is 864000 seconds (10 days). For private and vendor workforces, the maximum is as listed.</p>\"\
        },\
        \"MaxConcurrentTaskCount\":{\
          \"shape\":\"MaxConcurrentTaskCount\",\
          \"documentation\":\"<p>Defines the maximum number of data objects that can be labeled by human workers at the same time. Also referred to as batch size. Each object may have more than one worker at one time. The default value is 1000 objects.</p>\"\
        },\
        \"AnnotationConsolidationConfig\":{\
          \"shape\":\"AnnotationConsolidationConfig\",\
          \"documentation\":\"<p>Configures how labels are consolidated across human workers.</p>\"\
        },\
        \"PublicWorkforceTaskPrice\":{\
          \"shape\":\"PublicWorkforceTaskPrice\",\
          \"documentation\":\"<p>The price that you pay for each task performed by an Amazon Mechanical Turk worker.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information required for human workers to complete a labeling task.</p>\"\
    },\
    \"HumanTaskUiArn\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:human-task-ui/.*\"\
    },\
    \"HumanTaskUiName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"^[a-z0-9](-*[a-z0-9])*\"\
    },\
    \"HumanTaskUiSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HumanTaskUiSummary\"}\
    },\
    \"HumanTaskUiSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HumanTaskUiName\",\
        \"HumanTaskUiArn\",\
        \"CreationTime\"\
      ],\
      \"members\":{\
        \"HumanTaskUiName\":{\
          \"shape\":\"HumanTaskUiName\",\
          \"documentation\":\"<p>The name of the human task user interface.</p>\"\
        },\
        \"HumanTaskUiArn\":{\
          \"shape\":\"HumanTaskUiArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the human task user interface.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp when SageMaker created the human task user interface.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Container for human task user interface information.</p>\"\
    },\
    \"HyperParameterAlgorithmSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrainingInputMode\"],\
      \"members\":{\
        \"TrainingImage\":{\
          \"shape\":\"AlgorithmImage\",\
          \"documentation\":\"<p> The registry path of the Docker image that contains the training algorithm. For information about Docker registry paths for built-in algorithms, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-algo-docker-registry-paths.html\\\">Algorithms Provided by Amazon SageMaker: Common Parameters</a>. Amazon SageMaker supports both <code>registry/repository[:tag]</code> and <code>registry/repository[@digest]</code> image path formats. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html\\\">Using Your Own Algorithms with Amazon SageMaker</a>.</p>\"\
        },\
        \"TrainingInputMode\":{\
          \"shape\":\"TrainingInputMode\",\
          \"documentation\":\"<p>The input mode that the algorithm supports: File or Pipe. In File input mode, Amazon SageMaker downloads the training data from Amazon S3 to the storage volume that is attached to the training instance and mounts the directory to the Docker volume for the training container. In Pipe input mode, Amazon SageMaker streams data directly from Amazon S3 to the container. </p> <p>If you specify File mode, make sure that you provision the storage volume that is attached to the training instance with enough capacity to accommodate the training data downloaded from Amazon S3, the model artifacts, and intermediate information.</p> <p/> <p>For more information about input modes, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html\\\">Algorithms</a>. </p>\"\
        },\
        \"AlgorithmName\":{\
          \"shape\":\"ArnOrName\",\
          \"documentation\":\"<p>The name of the resource algorithm to use for the hyperparameter tuning job. If you specify a value for this parameter, do not specify a value for <code>TrainingImage</code>.</p>\"\
        },\
        \"MetricDefinitions\":{\
          \"shape\":\"MetricDefinitionList\",\
          \"documentation\":\"<p>An array of <a>MetricDefinition</a> objects that specify the metrics that the algorithm emits.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies which training algorithm to use for training jobs that a hyperparameter tuning job launches and the metrics to monitor.</p>\"\
    },\
    \"HyperParameterScalingType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Auto\",\
        \"Linear\",\
        \"Logarithmic\",\
        \"ReverseLogarithmic\"\
      ]\
    },\
    \"HyperParameterSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Type\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ParameterName\",\
          \"documentation\":\"<p>The name of this hyperparameter. The name must be unique.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"EntityDescription\",\
          \"documentation\":\"<p>A brief description of the hyperparameter.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ParameterType\",\
          \"documentation\":\"<p>The type of this hyperparameter. The valid types are <code>Integer</code>, <code>Continuous</code>, <code>Categorical</code>, and <code>FreeText</code>.</p>\"\
        },\
        \"Range\":{\
          \"shape\":\"ParameterRange\",\
          \"documentation\":\"<p>The allowed range for this hyperparameter.</p>\"\
        },\
        \"IsTunable\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether this hyperparameter is tunable in a hyperparameter tuning job.</p>\"\
        },\
        \"IsRequired\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether this hyperparameter is required.</p>\"\
        },\
        \"DefaultValue\":{\
          \"shape\":\"ParameterValue\",\
          \"documentation\":\"<p>The default value for this hyperparameter. If a default value is specified, a hyperparameter cannot be required.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines a hyperparameter to be used by an algorithm.</p>\"\
    },\
    \"HyperParameterSpecifications\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HyperParameterSpecification\"},\
      \"max\":100,\
      \"min\":0\
    },\
    \"HyperParameterTrainingJobDefinition\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AlgorithmSpecification\",\
        \"RoleArn\",\
        \"OutputDataConfig\",\
        \"ResourceConfig\",\
        \"StoppingCondition\"\
      ],\
      \"members\":{\
        \"DefinitionName\":{\
          \"shape\":\"HyperParameterTrainingJobDefinitionName\",\
          \"documentation\":\"<p>The job definition name.</p>\"\
        },\
        \"TuningObjective\":{\"shape\":\"HyperParameterTuningJobObjective\"},\
        \"HyperParameterRanges\":{\"shape\":\"ParameterRanges\"},\
        \"StaticHyperParameters\":{\
          \"shape\":\"HyperParameters\",\
          \"documentation\":\"<p>Specifies the values of hyperparameters that do not change for the tuning job.</p>\"\
        },\
        \"AlgorithmSpecification\":{\
          \"shape\":\"HyperParameterAlgorithmSpecification\",\
          \"documentation\":\"<p>The <a>HyperParameterAlgorithmSpecification</a> object that specifies the resource algorithm to use for the training jobs that the tuning job launches.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role associated with the training jobs that the tuning job launches.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>An array of <a>Channel</a> objects that specify the input for the training jobs that the tuning job launches.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>The <a>VpcConfig</a> object that specifies the VPC that you want the training jobs that this hyperparameter tuning job launches to connect to. Control access to and from your training container by configuring the VPC. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html\\\">Protect Training Jobs by Using an Amazon Virtual Private Cloud</a>.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies the path to the Amazon S3 bucket where you store model artifacts from the training jobs that the tuning job launches.</p>\"\
        },\
        \"ResourceConfig\":{\
          \"shape\":\"ResourceConfig\",\
          \"documentation\":\"<p>The resources, including the compute instances and storage volumes, to use for the training jobs that the tuning job launches.</p> <p>Storage volumes store model artifacts and incremental states. Training algorithms might also use storage volumes for scratch space. If you want Amazon SageMaker to use the storage volume to store the training data, choose <code>File</code> as the <code>TrainingInputMode</code> in the algorithm specification. For distributed training algorithms, specify an instance count greater than 1.</p>\"\
        },\
        \"StoppingCondition\":{\
          \"shape\":\"StoppingCondition\",\
          \"documentation\":\"<p>Specifies a limit to how long a model hyperparameter training job can run. It also specifies how long you are willing to wait for a managed spot training job to complete. When the job reaches the a limit, Amazon SageMaker ends the training job. Use this API to cap model training costs.</p>\"\
        },\
        \"EnableNetworkIsolation\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Isolates the training container. No inbound or outbound network calls can be made, except for calls between peers within a training cluster for distributed training. If network isolation is used for training jobs that are configured to use a VPC, Amazon SageMaker downloads and uploads customer data and model artifacts through the specified VPC, but the training container does not have network access.</p>\"\
        },\
        \"EnableInterContainerTrafficEncryption\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>To encrypt all communications between ML compute instances in distributed training, choose <code>True</code>. Encryption provides greater security for distributed training, but training might take longer. How long it takes depends on the amount of communication between compute instances, especially if you use a deep learning algorithm in distributed training.</p>\"\
        },\
        \"EnableManagedSpotTraining\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>A Boolean indicating whether managed spot training is enabled (<code>True</code>) or not (<code>False</code>).</p>\"\
        },\
        \"CheckpointConfig\":{\"shape\":\"CheckpointConfig\"}\
      },\
      \"documentation\":\"<p>Defines the training jobs launched by a hyperparameter tuning job.</p>\"\
    },\
    \"HyperParameterTrainingJobDefinitionName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"HyperParameterTrainingJobDefinitions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HyperParameterTrainingJobDefinition\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"HyperParameterTrainingJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HyperParameterTrainingJobSummary\"}\
    },\
    \"HyperParameterTrainingJobSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrainingJobName\",\
        \"TrainingJobArn\",\
        \"CreationTime\",\
        \"TrainingJobStatus\",\
        \"TunedHyperParameters\"\
      ],\
      \"members\":{\
        \"TrainingJobDefinitionName\":{\
          \"shape\":\"HyperParameterTrainingJobDefinitionName\",\
          \"documentation\":\"<p>The training job definition name.</p>\"\
        },\
        \"TrainingJobName\":{\
          \"shape\":\"TrainingJobName\",\
          \"documentation\":\"<p>The name of the training job.</p>\"\
        },\
        \"TrainingJobArn\":{\
          \"shape\":\"TrainingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the training job.</p>\"\
        },\
        \"TuningJobName\":{\
          \"shape\":\"HyperParameterTuningJobName\",\
          \"documentation\":\"<p>The HyperParameter tuning job that launched the training job.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the training job was created.</p>\"\
        },\
        \"TrainingStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the training job started.</p>\"\
        },\
        \"TrainingEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specifies the time when the training job ends on training instances. You are billed for the time interval between the value of <code>TrainingStartTime</code> and this time. For successful jobs and stopped jobs, this is the time after model artifacts are uploaded. For failed jobs, this is the time when Amazon SageMaker detects a job failure.</p>\"\
        },\
        \"TrainingJobStatus\":{\
          \"shape\":\"TrainingJobStatus\",\
          \"documentation\":\"<p>The status of the training job.</p>\"\
        },\
        \"TunedHyperParameters\":{\
          \"shape\":\"HyperParameters\",\
          \"documentation\":\"<p>A list of the hyperparameters for which you specified ranges to search.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>The reason that the training job failed. </p>\"\
        },\
        \"FinalHyperParameterTuningJobObjectiveMetric\":{\
          \"shape\":\"FinalHyperParameterTuningJobObjectiveMetric\",\
          \"documentation\":\"<p>The <a>FinalHyperParameterTuningJobObjectiveMetric</a> object that specifies the value of the objective metric of the tuning job that launched this training job.</p>\"\
        },\
        \"ObjectiveStatus\":{\
          \"shape\":\"ObjectiveStatus\",\
          \"documentation\":\"<p>The status of the objective metric for the training job:</p> <ul> <li> <p>Succeeded: The final objective metric for the training job was evaluated by the hyperparameter tuning job and used in the hyperparameter tuning process.</p> </li> </ul> <ul> <li> <p>Pending: The training job is in progress and evaluation of its final objective metric is pending.</p> </li> </ul> <ul> <li> <p>Failed: The final objective metric for the training job was not evaluated, and was not used in the hyperparameter tuning process. This typically occurs when the training job failed or did not emit an objective metric.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies summary information about a training job.</p>\"\
    },\
    \"HyperParameterTuningJobArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:hyper-parameter-tuning-job/.*\"\
    },\
    \"HyperParameterTuningJobConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Strategy\",\
        \"ResourceLimits\"\
      ],\
      \"members\":{\
        \"Strategy\":{\
          \"shape\":\"HyperParameterTuningJobStrategyType\",\
          \"documentation\":\"<p>Specifies how hyperparameter tuning chooses the combinations of hyperparameter values to use for the training job it launches. To use the Bayesian search strategy, set this to <code>Bayesian</code>. To randomly search, set it to <code>Random</code>. For information about search strategies, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-how-it-works.html\\\">How Hyperparameter Tuning Works</a>.</p>\"\
        },\
        \"HyperParameterTuningJobObjective\":{\
          \"shape\":\"HyperParameterTuningJobObjective\",\
          \"documentation\":\"<p>The <a>HyperParameterTuningJobObjective</a> object that specifies the objective metric for this tuning job.</p>\"\
        },\
        \"ResourceLimits\":{\
          \"shape\":\"ResourceLimits\",\
          \"documentation\":\"<p>The <a>ResourceLimits</a> object that specifies the maximum number of training jobs and parallel training jobs for this tuning job.</p>\"\
        },\
        \"ParameterRanges\":{\
          \"shape\":\"ParameterRanges\",\
          \"documentation\":\"<p>The <a>ParameterRanges</a> object that specifies the ranges of hyperparameters that this tuning job searches.</p>\"\
        },\
        \"TrainingJobEarlyStoppingType\":{\
          \"shape\":\"TrainingJobEarlyStoppingType\",\
          \"documentation\":\"<p>Specifies whether to use early stopping for training jobs launched by the hyperparameter tuning job. This can be one of the following values (the default value is <code>OFF</code>):</p> <dl> <dt>OFF</dt> <dd> <p>Training jobs launched by the hyperparameter tuning job do not use early stopping.</p> </dd> <dt>AUTO</dt> <dd> <p>Amazon SageMaker stops training jobs launched by the hyperparameter tuning job when they are unlikely to perform better than previously completed training jobs. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-early-stopping.html\\\">Stop Training Jobs Early</a>.</p> </dd> </dl>\"\
        },\
        \"TuningJobCompletionCriteria\":{\
          \"shape\":\"TuningJobCompletionCriteria\",\
          \"documentation\":\"<p>The tuning job's completion criteria.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configures a hyperparameter tuning job.</p>\"\
    },\
    \"HyperParameterTuningJobName\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"HyperParameterTuningJobObjective\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Type\",\
        \"MetricName\"\
      ],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"HyperParameterTuningJobObjectiveType\",\
          \"documentation\":\"<p>Whether to minimize or maximize the objective metric.</p>\"\
        },\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric to use for the objective metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines the objective metric for a hyperparameter tuning job. Hyperparameter tuning uses the value of this metric to evaluate the training jobs it launches, and returns the training job that results in either the highest or lowest value for this metric, depending on the value you specify for the <code>Type</code> parameter.</p>\"\
    },\
    \"HyperParameterTuningJobObjectiveType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Maximize\",\
        \"Minimize\"\
      ]\
    },\
    \"HyperParameterTuningJobObjectives\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HyperParameterTuningJobObjective\"}\
    },\
    \"HyperParameterTuningJobSortByOptions\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"Status\",\
        \"CreationTime\"\
      ]\
    },\
    \"HyperParameterTuningJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Completed\",\
        \"InProgress\",\
        \"Failed\",\
        \"Stopped\",\
        \"Stopping\"\
      ]\
    },\
    \"HyperParameterTuningJobStrategyType\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The strategy hyperparameter tuning uses to find the best combination of hyperparameters for your model. Currently, the only supported value is <code>Bayesian</code>.</p>\",\
      \"enum\":[\
        \"Bayesian\",\
        \"Random\"\
      ]\
    },\
    \"HyperParameterTuningJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HyperParameterTuningJobSummary\"}\
    },\
    \"HyperParameterTuningJobSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HyperParameterTuningJobName\",\
        \"HyperParameterTuningJobArn\",\
        \"HyperParameterTuningJobStatus\",\
        \"Strategy\",\
        \"CreationTime\",\
        \"TrainingJobStatusCounters\",\
        \"ObjectiveStatusCounters\"\
      ],\
      \"members\":{\
        \"HyperParameterTuningJobName\":{\
          \"shape\":\"HyperParameterTuningJobName\",\
          \"documentation\":\"<p>The name of the tuning job.</p>\"\
        },\
        \"HyperParameterTuningJobArn\":{\
          \"shape\":\"HyperParameterTuningJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the tuning job.</p>\"\
        },\
        \"HyperParameterTuningJobStatus\":{\
          \"shape\":\"HyperParameterTuningJobStatus\",\
          \"documentation\":\"<p>The status of the tuning job.</p>\"\
        },\
        \"Strategy\":{\
          \"shape\":\"HyperParameterTuningJobStrategyType\",\
          \"documentation\":\"<p>Specifies the search strategy hyperparameter tuning uses to choose which hyperparameters to use for each iteration. Currently, the only valid value is Bayesian.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the tuning job was created.</p>\"\
        },\
        \"HyperParameterTuningEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the tuning job ended.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the tuning job was modified.</p>\"\
        },\
        \"TrainingJobStatusCounters\":{\
          \"shape\":\"TrainingJobStatusCounters\",\
          \"documentation\":\"<p>The <a>TrainingJobStatusCounters</a> object that specifies the numbers of training jobs, categorized by status, that this tuning job launched.</p>\"\
        },\
        \"ObjectiveStatusCounters\":{\
          \"shape\":\"ObjectiveStatusCounters\",\
          \"documentation\":\"<p>The <a>ObjectiveStatusCounters</a> object that specifies the numbers of training jobs, categorized by objective metric status, that this tuning job launched.</p>\"\
        },\
        \"ResourceLimits\":{\
          \"shape\":\"ResourceLimits\",\
          \"documentation\":\"<p>The <a>ResourceLimits</a> object that specifies the maximum number of training jobs and parallel training jobs allowed for this tuning job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information about a hyperparameter tuning job.</p>\"\
    },\
    \"HyperParameterTuningJobWarmStartConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ParentHyperParameterTuningJobs\",\
        \"WarmStartType\"\
      ],\
      \"members\":{\
        \"ParentHyperParameterTuningJobs\":{\
          \"shape\":\"ParentHyperParameterTuningJobs\",\
          \"documentation\":\"<p>An array of hyperparameter tuning jobs that are used as the starting point for the new hyperparameter tuning job. For more information about warm starting a hyperparameter tuning job, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-warm-start.html\\\">Using a Previous Hyperparameter Tuning Job as a Starting Point</a>.</p> <p>Hyperparameter tuning jobs created before October 1, 2018 cannot be used as parent jobs for warm start tuning jobs.</p>\"\
        },\
        \"WarmStartType\":{\
          \"shape\":\"HyperParameterTuningJobWarmStartType\",\
          \"documentation\":\"<p>Specifies one of the following:</p> <dl> <dt>IDENTICAL_DATA_AND_ALGORITHM</dt> <dd> <p>The new hyperparameter tuning job uses the same input data and training image as the parent tuning jobs. You can change the hyperparameter ranges to search and the maximum number of training jobs that the hyperparameter tuning job launches. You cannot use a new version of the training algorithm, unless the changes in the new version do not affect the algorithm itself. For example, changes that improve logging or adding support for a different data format are allowed. You can also change hyperparameters from tunable to static, and from static to tunable, but the total number of static plus tunable hyperparameters must remain the same as it is in all parent jobs. The objective metric for the new tuning job must be the same as for all parent jobs.</p> </dd> <dt>TRANSFER_LEARNING</dt> <dd> <p>The new hyperparameter tuning job can include input data, hyperparameter ranges, maximum number of concurrent training jobs, and maximum number of training jobs that are different than those of its parent hyperparameter tuning jobs. The training image can also be a different version from the version used in the parent hyperparameter tuning job. You can also change hyperparameters from tunable to static, and from static to tunable, but the total number of static plus tunable hyperparameters must remain the same as it is in all parent jobs. The objective metric for the new tuning job must be the same as for all parent jobs.</p> </dd> </dl>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the configuration for a hyperparameter tuning job that uses one or more previous hyperparameter tuning jobs as a starting point. The results of previous tuning jobs are used to inform which combinations of hyperparameters to search over in the new tuning job.</p> <p>All training jobs launched by the new hyperparameter tuning job are evaluated by using the objective metric, and the training job that performs the best is compared to the best training jobs from the parent tuning jobs. From these, the training job that performs the best as measured by the objective metric is returned as the overall best training job.</p> <note> <p>All training jobs launched by parent hyperparameter tuning jobs and the new hyperparameter tuning jobs count against the limit of training jobs for the tuning job.</p> </note>\"\
    },\
    \"HyperParameterTuningJobWarmStartType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IdenticalDataAndAlgorithm\",\
        \"TransferLearning\"\
      ]\
    },\
    \"HyperParameters\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ParameterKey\"},\
      \"value\":{\"shape\":\"ParameterValue\"},\
      \"max\":100,\
      \"min\":0\
    },\
    \"Image\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"pattern\":\"[\\\\S]+\"\
    },\
    \"ImageDigest\":{\
      \"type\":\"string\",\
      \"max\":72,\
      \"pattern\":\"^[Ss][Hh][Aa]256:[0-9a-fA-F]{64}$\"\
    },\
    \"ImageUri\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"pattern\":\".*\"\
    },\
    \"InferenceSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Containers\",\
        \"SupportedTransformInstanceTypes\",\
        \"SupportedRealtimeInferenceInstanceTypes\",\
        \"SupportedContentTypes\",\
        \"SupportedResponseMIMETypes\"\
      ],\
      \"members\":{\
        \"Containers\":{\
          \"shape\":\"ModelPackageContainerDefinitionList\",\
          \"documentation\":\"<p>The Amazon ECR registry path of the Docker image that contains the inference code.</p>\"\
        },\
        \"SupportedTransformInstanceTypes\":{\
          \"shape\":\"TransformInstanceTypes\",\
          \"documentation\":\"<p>A list of the instance types on which a transformation job can be run or on which an endpoint can be deployed.</p>\"\
        },\
        \"SupportedRealtimeInferenceInstanceTypes\":{\
          \"shape\":\"RealtimeInferenceInstanceTypes\",\
          \"documentation\":\"<p>A list of the instance types that are used to generate inferences in real-time.</p>\"\
        },\
        \"SupportedContentTypes\":{\
          \"shape\":\"ContentTypes\",\
          \"documentation\":\"<p>The supported MIME types for the input data.</p>\"\
        },\
        \"SupportedResponseMIMETypes\":{\
          \"shape\":\"ResponseMIMETypes\",\
          \"documentation\":\"<p>The supported MIME types for the output data.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines how to perform inference generation after a training job is run.</p>\"\
    },\
    \"InputConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"S3Uri\",\
        \"DataInputConfig\",\
        \"Framework\"\
      ],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The S3 path where the model artifacts, which result from model training, are stored. This path must point to a single gzip compressed tar archive (.tar.gz suffix).</p>\"\
        },\
        \"DataInputConfig\":{\
          \"shape\":\"DataInputConfig\",\
          \"documentation\":\"<p>Specifies the name and shape of the expected data inputs for your trained model with a JSON dictionary form. The data inputs are <a>InputConfig$Framework</a> specific. </p> <ul> <li> <p> <code>TensorFlow</code>: You must specify the name and shape (NHWC format) of the expected data inputs using a dictionary format for your trained model. The dictionary formats required for the console and CLI are different.</p> <ul> <li> <p>Examples for one input:</p> <ul> <li> <p>If using the console, <code>{\\\"input\\\":[1,1024,1024,3]}</code> </p> </li> <li> <p>If using the CLI, <code>{\\\\\\\"input\\\\\\\":[1,1024,1024,3]}</code> </p> </li> </ul> </li> <li> <p>Examples for two inputs:</p> <ul> <li> <p>If using the console, <code>{\\\"data1\\\": [1,28,28,1], \\\"data2\\\":[1,28,28,1]}</code> </p> </li> <li> <p>If using the CLI, <code>{\\\\\\\"data1\\\\\\\": [1,28,28,1], \\\\\\\"data2\\\\\\\":[1,28,28,1]}</code> </p> </li> </ul> </li> </ul> </li> <li> <p> <code>KERAS</code>: You must specify the name and shape (NCHW format) of expected data inputs using a dictionary format for your trained model. Note that while Keras model artifacts should be uploaded in NHWC (channel-last) format, <code>DataInputConfig</code> should be specified in NCHW (channel-first) format. The dictionary formats required for the console and CLI are different.</p> <ul> <li> <p>Examples for one input:</p> <ul> <li> <p>If using the console, <code>{\\\"input_1\\\":[1,3,224,224]}</code> </p> </li> <li> <p>If using the CLI, <code>{\\\\\\\"input_1\\\\\\\":[1,3,224,224]}</code> </p> </li> </ul> </li> <li> <p>Examples for two inputs:</p> <ul> <li> <p>If using the console, <code>{\\\"input_1\\\": [1,3,224,224], \\\"input_2\\\":[1,3,224,224]} </code> </p> </li> <li> <p>If using the CLI, <code>{\\\\\\\"input_1\\\\\\\": [1,3,224,224], \\\\\\\"input_2\\\\\\\":[1,3,224,224]}</code> </p> </li> </ul> </li> </ul> </li> <li> <p> <code>MXNET/ONNX</code>: You must specify the name and shape (NCHW format) of the expected data inputs in order using a dictionary format for your trained model. The dictionary formats required for the console and CLI are different.</p> <ul> <li> <p>Examples for one input:</p> <ul> <li> <p>If using the console, <code>{\\\"data\\\":[1,3,1024,1024]}</code> </p> </li> <li> <p>If using the CLI, <code>{\\\\\\\"data\\\\\\\":[1,3,1024,1024]}</code> </p> </li> </ul> </li> <li> <p>Examples for two inputs:</p> <ul> <li> <p>If using the console, <code>{\\\"var1\\\": [1,1,28,28], \\\"var2\\\":[1,1,28,28]} </code> </p> </li> <li> <p>If using the CLI, <code>{\\\\\\\"var1\\\\\\\": [1,1,28,28], \\\\\\\"var2\\\\\\\":[1,1,28,28]}</code> </p> </li> </ul> </li> </ul> </li> <li> <p> <code>PyTorch</code>: You can either specify the name and shape (NCHW format) of expected data inputs in order using a dictionary format for your trained model or you can specify the shape only using a list format. The dictionary formats required for the console and CLI are different. The list formats for the console and CLI are the same.</p> <ul> <li> <p>Examples for one input in dictionary format:</p> <ul> <li> <p>If using the console, <code>{\\\"input0\\\":[1,3,224,224]}</code> </p> </li> <li> <p>If using the CLI, <code>{\\\\\\\"input0\\\\\\\":[1,3,224,224]}</code> </p> </li> </ul> </li> <li> <p>Example for one input in list format: <code>[[1,3,224,224]]</code> </p> </li> <li> <p>Examples for two inputs in dictionary format:</p> <ul> <li> <p>If using the console, <code>{\\\"input0\\\":[1,3,224,224], \\\"input1\\\":[1,3,224,224]}</code> </p> </li> <li> <p>If using the CLI, <code>{\\\\\\\"input0\\\\\\\":[1,3,224,224], \\\\\\\"input1\\\\\\\":[1,3,224,224]} </code> </p> </li> </ul> </li> <li> <p>Example for two inputs in list format: <code>[[1,3,224,224], [1,3,224,224]]</code> </p> </li> </ul> </li> <li> <p> <code>XGBOOST</code>: input data name and shape are not needed.</p> </li> </ul>\"\
        },\
        \"Framework\":{\
          \"shape\":\"Framework\",\
          \"documentation\":\"<p>Identifies the framework in which the model was trained. For example: TENSORFLOW.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the location of input model artifacts, the name and shape of the expected data inputs, and the framework in which the model was trained.</p>\"\
    },\
    \"InputDataConfig\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Channel\"},\
      \"max\":20,\
      \"min\":1\
    },\
    \"InputModes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrainingInputMode\"},\
      \"min\":1\
    },\
    \"InstanceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ml.t2.medium\",\
        \"ml.t2.large\",\
        \"ml.t2.xlarge\",\
        \"ml.t2.2xlarge\",\
        \"ml.t3.medium\",\
        \"ml.t3.large\",\
        \"ml.t3.xlarge\",\
        \"ml.t3.2xlarge\",\
        \"ml.m4.xlarge\",\
        \"ml.m4.2xlarge\",\
        \"ml.m4.4xlarge\",\
        \"ml.m4.10xlarge\",\
        \"ml.m4.16xlarge\",\
        \"ml.m5.xlarge\",\
        \"ml.m5.2xlarge\",\
        \"ml.m5.4xlarge\",\
        \"ml.m5.12xlarge\",\
        \"ml.m5.24xlarge\",\
        \"ml.c4.xlarge\",\
        \"ml.c4.2xlarge\",\
        \"ml.c4.4xlarge\",\
        \"ml.c4.8xlarge\",\
        \"ml.c5.xlarge\",\
        \"ml.c5.2xlarge\",\
        \"ml.c5.4xlarge\",\
        \"ml.c5.9xlarge\",\
        \"ml.c5.18xlarge\",\
        \"ml.c5d.xlarge\",\
        \"ml.c5d.2xlarge\",\
        \"ml.c5d.4xlarge\",\
        \"ml.c5d.9xlarge\",\
        \"ml.c5d.18xlarge\",\
        \"ml.p2.xlarge\",\
        \"ml.p2.8xlarge\",\
        \"ml.p2.16xlarge\",\
        \"ml.p3.2xlarge\",\
        \"ml.p3.8xlarge\",\
        \"ml.p3.16xlarge\"\
      ]\
    },\
    \"IntegerParameterRange\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"MinValue\",\
        \"MaxValue\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ParameterKey\",\
          \"documentation\":\"<p>The name of the hyperparameter to search.</p>\"\
        },\
        \"MinValue\":{\
          \"shape\":\"ParameterValue\",\
          \"documentation\":\"<p>The minimum value of the hyperparameter to search.</p>\"\
        },\
        \"MaxValue\":{\
          \"shape\":\"ParameterValue\",\
          \"documentation\":\"<p>The maximum value of the hyperparameter to search.</p>\"\
        },\
        \"ScalingType\":{\
          \"shape\":\"HyperParameterScalingType\",\
          \"documentation\":\"<p>The scale that hyperparameter tuning uses to search the hyperparameter range. For information about choosing a hyperparameter scale, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-ranges.html#scaling-type\\\">Hyperparameter Scaling</a>. One of the following values:</p> <dl> <dt>Auto</dt> <dd> <p>Amazon SageMaker hyperparameter tuning chooses the best scale for the hyperparameter.</p> </dd> <dt>Linear</dt> <dd> <p>Hyperparameter tuning searches the values in the hyperparameter range by using a linear scale.</p> </dd> <dt>Logarithmic</dt> <dd> <p>Hyperparameter tuning searches the values in the hyperparameter range by using a logarithmic scale.</p> <p>Logarithmic scaling works only for ranges that have only values greater than 0.</p> </dd> </dl>\"\
        }\
      },\
      \"documentation\":\"<p>For a hyperparameter of the integer type, specifies the range that a hyperparameter tuning job searches.</p>\"\
    },\
    \"IntegerParameterRangeSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MinValue\",\
        \"MaxValue\"\
      ],\
      \"members\":{\
        \"MinValue\":{\
          \"shape\":\"ParameterValue\",\
          \"documentation\":\"<p>The minimum integer value allowed.</p>\"\
        },\
        \"MaxValue\":{\
          \"shape\":\"ParameterValue\",\
          \"documentation\":\"<p>The maximum integer value allowed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines the possible values for an integer hyperparameter.</p>\"\
    },\
    \"IntegerParameterRanges\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IntegerParameterRange\"},\
      \"max\":20,\
      \"min\":0\
    },\
    \"JobReferenceCode\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\".+\"\
    },\
    \"JobReferenceCodeContains\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\".+\"\
    },\
    \"JoinSource\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Input\",\
        \"None\"\
      ]\
    },\
    \"JsonContentType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\\\\/[a-zA-Z0-9](-*[a-zA-Z0-9.])*\"\
    },\
    \"JsonContentTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"JsonContentType\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"JsonPath\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":0\
    },\
    \"JupyterServerAppSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DefaultResourceSpec\":{\
          \"shape\":\"ResourceSpec\",\
          \"documentation\":\"<p>The default instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Jupyter server's app settings.</p>\"\
    },\
    \"KernelGatewayAppSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DefaultResourceSpec\":{\
          \"shape\":\"ResourceSpec\",\
          \"documentation\":\"<p>The default instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The kernel gateway app settings.</p>\"\
    },\
    \"KmsKeyId\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"pattern\":\".*\"\
    },\
    \"LabelAttributeName\":{\
      \"type\":\"string\",\
      \"max\":127,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"LabelCounter\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"LabelCounters\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TotalLabeled\":{\
          \"shape\":\"LabelCounter\",\
          \"documentation\":\"<p>The total number of objects labeled.</p>\"\
        },\
        \"HumanLabeled\":{\
          \"shape\":\"LabelCounter\",\
          \"documentation\":\"<p>The total number of objects labeled by a human worker.</p>\"\
        },\
        \"MachineLabeled\":{\
          \"shape\":\"LabelCounter\",\
          \"documentation\":\"<p>The total number of objects labeled by automated data labeling.</p>\"\
        },\
        \"FailedNonRetryableError\":{\
          \"shape\":\"LabelCounter\",\
          \"documentation\":\"<p>The total number of objects that could not be labeled due to an error.</p>\"\
        },\
        \"Unlabeled\":{\
          \"shape\":\"LabelCounter\",\
          \"documentation\":\"<p>The total number of objects not yet labeled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides a breakdown of the number of objects labeled.</p>\"\
    },\
    \"LabelCountersForWorkteam\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HumanLabeled\":{\
          \"shape\":\"LabelCounter\",\
          \"documentation\":\"<p>The total number of data objects labeled by a human worker.</p>\"\
        },\
        \"PendingHuman\":{\
          \"shape\":\"LabelCounter\",\
          \"documentation\":\"<p>The total number of data objects that need to be labeled by a human worker.</p>\"\
        },\
        \"Total\":{\
          \"shape\":\"LabelCounter\",\
          \"documentation\":\"<p>The total number of tasks in the labeling job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides counts for human-labeled tasks in the labeling job.</p>\"\
    },\
    \"LabelingJobAlgorithmSpecificationArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"pattern\":\"arn:.*\"\
    },\
    \"LabelingJobAlgorithmsConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"LabelingJobAlgorithmSpecificationArn\"],\
      \"members\":{\
        \"LabelingJobAlgorithmSpecificationArn\":{\
          \"shape\":\"LabelingJobAlgorithmSpecificationArn\",\
          \"documentation\":\"<p>Specifies the Amazon Resource Name (ARN) of the algorithm used for auto-labeling. You must select one of the following ARNs:</p> <ul> <li> <p> <i>Image classification</i> </p> <p> <code>arn:aws:sagemaker:<i>region</i>:027400017018:labeling-job-algorithm-specification/image-classification</code> </p> </li> <li> <p> <i>Text classification</i> </p> <p> <code>arn:aws:sagemaker:<i>region</i>:027400017018:labeling-job-algorithm-specification/text-classification</code> </p> </li> <li> <p> <i>Object detection</i> </p> <p> <code>arn:aws:sagemaker:<i>region</i>:027400017018:labeling-job-algorithm-specification/object-detection</code> </p> </li> <li> <p> <i>Semantic Segmentation</i> </p> <p> <code>arn:aws:sagemaker:<i>region</i>:027400017018:labeling-job-algorithm-specification/semantic-segmentation</code> </p> </li> </ul>\"\
        },\
        \"InitialActiveLearningModelArn\":{\
          \"shape\":\"ModelArn\",\
          \"documentation\":\"<p>At the end of an auto-label job Amazon SageMaker Ground Truth sends the Amazon Resource Nam (ARN) of the final model used for auto-labeling. You can use this model as the starting point for subsequent similar jobs by providing the ARN of the model here. </p>\"\
        },\
        \"LabelingJobResourceConfig\":{\
          \"shape\":\"LabelingJobResourceConfig\",\
          \"documentation\":\"<p>Provides configuration information for a labeling job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides configuration information for auto-labeling of your data objects. A <code>LabelingJobAlgorithmsConfig</code> object must be supplied in order to use auto-labeling.</p>\"\
    },\
    \"LabelingJobArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:labeling-job/.*\"\
    },\
    \"LabelingJobDataAttributes\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContentClassifiers\":{\
          \"shape\":\"ContentClassifiers\",\
          \"documentation\":\"<p>Declares that your content is free of personally identifiable information or adult content. Amazon SageMaker may restrict the Amazon Mechanical Turk workers that can view your task based on this information.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Attributes of the data specified by the customer. Use these to describe the data to be labeled.</p>\"\
    },\
    \"LabelingJobDataSource\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3DataSource\"],\
      \"members\":{\
        \"S3DataSource\":{\
          \"shape\":\"LabelingJobS3DataSource\",\
          \"documentation\":\"<p>The Amazon S3 location of the input data objects.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about the location of input data.</p>\"\
    },\
    \"LabelingJobForWorkteamSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"JobReferenceCode\",\
        \"WorkRequesterAccountId\",\
        \"CreationTime\"\
      ],\
      \"members\":{\
        \"LabelingJobName\":{\
          \"shape\":\"LabelingJobName\",\
          \"documentation\":\"<p>The name of the labeling job that the work team is assigned to.</p>\"\
        },\
        \"JobReferenceCode\":{\
          \"shape\":\"JobReferenceCode\",\
          \"documentation\":\"<p>A unique identifier for a labeling job. You can use this to refer to a specific labeling job.</p>\"\
        },\
        \"WorkRequesterAccountId\":{\
          \"shape\":\"AccountId\",\
          \"documentation\":\"<p/>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the labeling job was created.</p>\"\
        },\
        \"LabelCounters\":{\
          \"shape\":\"LabelCountersForWorkteam\",\
          \"documentation\":\"<p>Provides information about the progress of a labeling job.</p>\"\
        },\
        \"NumberOfHumanWorkersPerDataObject\":{\
          \"shape\":\"NumberOfHumanWorkersPerDataObject\",\
          \"documentation\":\"<p>The configured number of workers per data object.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information for a work team.</p>\"\
    },\
    \"LabelingJobForWorkteamSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LabelingJobForWorkteamSummary\"}\
    },\
    \"LabelingJobInputConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"DataSource\"],\
      \"members\":{\
        \"DataSource\":{\
          \"shape\":\"LabelingJobDataSource\",\
          \"documentation\":\"<p>The location of the input data.</p>\"\
        },\
        \"DataAttributes\":{\
          \"shape\":\"LabelingJobDataAttributes\",\
          \"documentation\":\"<p>Attributes of the data specified by the customer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input configuration information for a labeling job.</p>\"\
    },\
    \"LabelingJobName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"LabelingJobOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"OutputDatasetS3Uri\"],\
      \"members\":{\
        \"OutputDatasetS3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 bucket location of the manifest file for labeled data. </p>\"\
        },\
        \"FinalActiveLearningModelArn\":{\
          \"shape\":\"ModelArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the most recent Amazon SageMaker model trained as part of automated data labeling. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the location of the output produced by the labeling job. </p>\"\
    },\
    \"LabelingJobOutputConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3OutputPath\"],\
      \"members\":{\
        \"S3OutputPath\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 location to write output data.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS Key Management Service ID of the key used to encrypt the output data, if any.</p> <p>If you use a KMS key ID or an alias of your master key, the Amazon SageMaker execution role must include permissions to call <code>kms:Encrypt</code>. If you don't provide a KMS key ID, Amazon SageMaker uses the default KMS key for Amazon S3 for your role's account. Amazon SageMaker uses server-side encryption with KMS-managed keys for <code>LabelingJobOutputConfig</code>. If you use a bucket policy with an <code>s3:PutObject</code> permission that only allows objects with server-side encryption, set the condition key of <code>s3:x-amz-server-side-encryption</code> to <code>\\\"aws:kms\\\"</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html\\\">KMS-Managed Encryption Keys</a> in the <i>Amazon Simple Storage Service Developer Guide.</i> </p> <p>The KMS key policy must grant permission to the IAM role that you specify in your <code>CreateLabelingJob</code> request. For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html\\\">Using Key Policies in AWS KMS</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Output configuration information for a labeling job.</p>\"\
    },\
    \"LabelingJobResourceConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance(s) that run the training job. The <code>VolumeKmsKeyId</code> can be any of the following formats:</p> <ul> <li> <p>// KMS Key ID</p> <p> <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>// Amazon Resource Name (ARN) of a KMS Key</p> <p> <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Provides configuration information for labeling jobs.</p>\"\
    },\
    \"LabelingJobS3DataSource\":{\
      \"type\":\"structure\",\
      \"required\":[\"ManifestS3Uri\"],\
      \"members\":{\
        \"ManifestS3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of the manifest file that describes the input data objects.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon S3 location of the input data objects.</p>\"\
    },\
    \"LabelingJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"InProgress\",\
        \"Completed\",\
        \"Failed\",\
        \"Stopping\",\
        \"Stopped\"\
      ]\
    },\
    \"LabelingJobStoppingConditions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxHumanLabeledObjectCount\":{\
          \"shape\":\"MaxHumanLabeledObjectCount\",\
          \"documentation\":\"<p>The maximum number of objects that can be labeled by human workers.</p>\"\
        },\
        \"MaxPercentageOfInputDatasetLabeled\":{\
          \"shape\":\"MaxPercentageOfInputDatasetLabeled\",\
          \"documentation\":\"<p>The maximum number of input data objects that should be labeled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A set of conditions for stopping a labeling job. If any of the conditions are met, the job is automatically stopped. You can use these conditions to control the cost of data labeling.</p> <note> <p>Labeling jobs fail after 30 days with an appropriate client error message.</p> </note>\"\
    },\
    \"LabelingJobSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LabelingJobName\",\
        \"LabelingJobArn\",\
        \"CreationTime\",\
        \"LastModifiedTime\",\
        \"LabelingJobStatus\",\
        \"LabelCounters\",\
        \"WorkteamArn\",\
        \"PreHumanTaskLambdaArn\"\
      ],\
      \"members\":{\
        \"LabelingJobName\":{\
          \"shape\":\"LabelingJobName\",\
          \"documentation\":\"<p>The name of the labeling job.</p>\"\
        },\
        \"LabelingJobArn\":{\
          \"shape\":\"LabelingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) assigned to the labeling job when it was created.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the job was created (timestamp).</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the job was last modified (timestamp).</p>\"\
        },\
        \"LabelingJobStatus\":{\
          \"shape\":\"LabelingJobStatus\",\
          \"documentation\":\"<p>The current status of the labeling job. </p>\"\
        },\
        \"LabelCounters\":{\
          \"shape\":\"LabelCounters\",\
          \"documentation\":\"<p>Counts showing the progress of the labeling job.</p>\"\
        },\
        \"WorkteamArn\":{\
          \"shape\":\"WorkteamArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the work team assigned to the job.</p>\"\
        },\
        \"PreHumanTaskLambdaArn\":{\
          \"shape\":\"LambdaFunctionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of a Lambda function. The function is run before each data object is sent to a worker.</p>\"\
        },\
        \"AnnotationConsolidationLambdaArn\":{\
          \"shape\":\"LambdaFunctionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Lambda function used to consolidate the annotations from individual workers into a label for a data object. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sms-annotation-consolidation.html\\\">Annotation Consolidation</a>.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>LabelingJobStatus</code> field is <code>Failed</code>, this field contains a description of the error.</p>\"\
        },\
        \"LabelingJobOutput\":{\
          \"shape\":\"LabelingJobOutput\",\
          \"documentation\":\"<p>The location of the output produced by the labeling job.</p>\"\
        },\
        \"InputConfig\":{\
          \"shape\":\"LabelingJobInputConfig\",\
          \"documentation\":\"<p>Input configuration for the labeling job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information about a labeling job.</p>\"\
    },\
    \"LabelingJobSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LabelingJobSummary\"}\
    },\
    \"LambdaFunctionArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:lambda:[a-z]{2}-[a-z]+-\\\\d{1}:\\\\d{12}:function:[a-zA-Z0-9-_\\\\.]+(:(\\\\$LATEST|[a-zA-Z0-9-_]+))?\"\
    },\
    \"LastModifiedTime\":{\"type\":\"timestamp\"},\
    \"ListAlgorithmsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationTimeAfter\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A filter that returns only algorithms created after the specified time (timestamp).</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A filter that returns only algorithms created before the specified time (timestamp).</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of algorithms to return in the response.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"NameContains\",\
          \"documentation\":\"<p>A string in the algorithm name. This filter returns only algorithms whose name contains the specified string.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response to a previous <code>ListAlgorithms</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of algorithms, use the token in the next request.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"AlgorithmSortBy\",\
          \"documentation\":\"<p>The parameter by which to sort the results. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order for the results. The default is <code>Ascending</code>.</p>\"\
        }\
      }\
    },\
    \"ListAlgorithmsOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"AlgorithmSummaryList\"],\
      \"members\":{\
        \"AlgorithmSummaryList\":{\
          \"shape\":\"AlgorithmSummaryList\",\
          \"documentation\":\"<p>&gt;An array of <code>AlgorithmSummary</code> objects, each of which lists an algorithm.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of algorithms, use it in the subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListAppsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Returns a list up to a specified limit.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order for the results. The default is Ascending.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"AppSortKey\",\
          \"documentation\":\"<p>The parameter by which to sort the results. The default is CreationTime.</p>\"\
        },\
        \"DomainIdEquals\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>A parameter to search for the domain ID.</p>\"\
        },\
        \"UserProfileNameEquals\":{\
          \"shape\":\"UserProfileName\",\
          \"documentation\":\"<p>A parameter to search by user profile name.</p>\"\
        }\
      }\
    },\
    \"ListAppsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Apps\":{\
          \"shape\":\"AppList\",\
          \"documentation\":\"<p>The list of apps.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListAutoMLJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Request a list of jobs, using a filter for time.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Request a list of jobs, using a filter for time.</p>\"\
        },\
        \"LastModifiedTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Request a list of jobs, using a filter for time.</p>\"\
        },\
        \"LastModifiedTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Request a list of jobs, using a filter for time.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"AutoMLNameContains\",\
          \"documentation\":\"<p>Request a list of jobs, using a search filter for name.</p>\"\
        },\
        \"StatusEquals\":{\
          \"shape\":\"AutoMLJobStatus\",\
          \"documentation\":\"<p>Request a list of jobs, using a filter for status.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"AutoMLSortOrder\",\
          \"documentation\":\"<p>The sort order for the results. The default is Descending.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"AutoMLSortBy\",\
          \"documentation\":\"<p>The parameter by which to sort the results. The default is AutoMLJobName.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"AutoMLMaxResults\",\
          \"documentation\":\"<p>Request a list of jobs up to a specified limit.</p>\",\
          \"box\":true\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListAutoMLJobsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoMLJobSummaries\"],\
      \"members\":{\
        \"AutoMLJobSummaries\":{\
          \"shape\":\"AutoMLJobSummaries\",\
          \"documentation\":\"<p>Returns a summary list of jobs.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListCandidatesForAutoMLJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoMLJobName\"],\
      \"members\":{\
        \"AutoMLJobName\":{\
          \"shape\":\"AutoMLJobName\",\
          \"documentation\":\"<p>List the Candidates created for the job by providing the job's name.</p>\"\
        },\
        \"StatusEquals\":{\
          \"shape\":\"CandidateStatus\",\
          \"documentation\":\"<p>List the Candidates for the job and filter by status.</p>\"\
        },\
        \"CandidateNameEquals\":{\
          \"shape\":\"CandidateName\",\
          \"documentation\":\"<p>List the Candidates for the job and filter by candidate name.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"AutoMLSortOrder\",\
          \"documentation\":\"<p>The sort order for the results. The default is Ascending.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"CandidateSortBy\",\
          \"documentation\":\"<p>The parameter by which to sort the results. The default is Descending.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"AutoMLMaxResults\",\
          \"documentation\":\"<p>List the job's Candidates up to a specified limit.</p>\",\
          \"box\":true\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListCandidatesForAutoMLJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Candidates\"],\
      \"members\":{\
        \"Candidates\":{\
          \"shape\":\"AutoMLCandidates\",\
          \"documentation\":\"<p>Summaries about the Candidates.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListCodeRepositoriesInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationTimeAfter\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A filter that returns only Git repositories that were created after the specified time.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A filter that returns only Git repositories that were created before the specified time.</p>\"\
        },\
        \"LastModifiedTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only Git repositories that were last modified after the specified time.</p>\"\
        },\
        \"LastModifiedTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only Git repositories that were last modified before the specified time.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of Git repositories to return in the response.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"CodeRepositoryNameContains\",\
          \"documentation\":\"<p>A string in the Git repositories name. This filter returns only repositories whose name contains the specified string.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of a <code>ListCodeRepositoriesOutput</code> request was truncated, the response includes a <code>NextToken</code>. To get the next set of Git repositories, use the token in the next request.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"CodeRepositorySortBy\",\
          \"documentation\":\"<p>The field to sort results by. The default is <code>Name</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"CodeRepositorySortOrder\",\
          \"documentation\":\"<p>The sort order for results. The default is <code>Ascending</code>.</p>\"\
        }\
      }\
    },\
    \"ListCodeRepositoriesOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeRepositorySummaryList\"],\
      \"members\":{\
        \"CodeRepositorySummaryList\":{\
          \"shape\":\"CodeRepositorySummaryList\",\
          \"documentation\":\"<p>Gets a list of summaries of the Git repositories. Each summary specifies the following values for the repository: </p> <ul> <li> <p>Name</p> </li> <li> <p>Amazon Resource Name (ARN)</p> </li> <li> <p>Creation time</p> </li> <li> <p>Last modified time</p> </li> <li> <p>Configuration information, including the URL location of the repository and the ARN of the AWS Secrets Manager secret that contains the credentials used to access the repository.</p> </li> </ul>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of a <code>ListCodeRepositoriesOutput</code> request was truncated, the response includes a <code>NextToken</code>. To get the next set of Git repositories, use the token in the next request.</p>\"\
        }\
      }\
    },\
    \"ListCompilationJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous <code>ListCompilationJobs</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of model compilation jobs, use the token in the next request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of model compilation jobs to return in the response.</p>\",\
          \"box\":true\
        },\
        \"CreationTimeAfter\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A filter that returns the model compilation jobs that were created after a specified time. </p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A filter that returns the model compilation jobs that were created before a specified time.</p>\"\
        },\
        \"LastModifiedTimeAfter\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>A filter that returns the model compilation jobs that were modified after a specified time.</p>\"\
        },\
        \"LastModifiedTimeBefore\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>A filter that returns the model compilation jobs that were modified before a specified time.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"NameContains\",\
          \"documentation\":\"<p>A filter that returns the model compilation jobs whose name contains a specified string.</p>\"\
        },\
        \"StatusEquals\":{\
          \"shape\":\"CompilationJobStatus\",\
          \"documentation\":\"<p>A filter that retrieves model compilation jobs with a specific <a>DescribeCompilationJobResponse$CompilationJobStatus</a> status.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"ListCompilationJobsSortBy\",\
          \"documentation\":\"<p>The field by which to sort results. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order for results. The default is <code>Ascending</code>.</p>\"\
        }\
      }\
    },\
    \"ListCompilationJobsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"CompilationJobSummaries\"],\
      \"members\":{\
        \"CompilationJobSummaries\":{\
          \"shape\":\"CompilationJobSummaries\",\
          \"documentation\":\"<p>An array of <a>CompilationJobSummary</a> objects, each describing a model compilation job. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon SageMaker returns this <code>NextToken</code>. To retrieve the next set of model compilation jobs, use this token in the next request.</p>\"\
        }\
      }\
    },\
    \"ListCompilationJobsSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\",\
        \"Status\"\
      ]\
    },\
    \"ListDomainsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Returns a list up to a specified limit.</p>\"\
        }\
      }\
    },\
    \"ListDomainsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Domains\":{\
          \"shape\":\"DomainList\",\
          \"documentation\":\"<p>The list of domains.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListEndpointConfigsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SortBy\":{\
          \"shape\":\"EndpointConfigSortKey\",\
          \"documentation\":\"<p>The field to sort results by. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"OrderKey\",\
          \"documentation\":\"<p>The sort order for results. The default is <code>Descending</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the result of the previous <code>ListEndpointConfig</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of endpoint configurations, use the token in the next request. </p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of training jobs to return in the response.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"EndpointConfigNameContains\",\
          \"documentation\":\"<p>A string in the endpoint configuration name. This filter returns only endpoint configurations whose name contains the specified string. </p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only endpoint configurations created before the specified time (timestamp).</p>\"\
        },\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only endpoint configurations with a creation time greater than or equal to the specified time (timestamp).</p>\"\
        }\
      }\
    },\
    \"ListEndpointConfigsOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointConfigs\"],\
      \"members\":{\
        \"EndpointConfigs\":{\
          \"shape\":\"EndpointConfigSummaryList\",\
          \"documentation\":\"<p>An array of endpoint configurations.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p> If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of endpoint configurations, use it in the subsequent request </p>\"\
        }\
      }\
    },\
    \"ListEndpointsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SortBy\":{\
          \"shape\":\"EndpointSortKey\",\
          \"documentation\":\"<p>Sorts the list of results. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"OrderKey\",\
          \"documentation\":\"<p>The sort order for results. The default is <code>Descending</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the result of a <code>ListEndpoints</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of endpoints, use the token in the next request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of endpoints to return in the response.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"EndpointNameContains\",\
          \"documentation\":\"<p>A string in endpoint names. This filter returns only endpoints whose name contains the specified string.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only endpoints that were created before the specified time (timestamp).</p>\"\
        },\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only endpoints with a creation time greater than or equal to the specified time (timestamp).</p>\"\
        },\
        \"LastModifiedTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> A filter that returns only endpoints that were modified before the specified timestamp. </p>\"\
        },\
        \"LastModifiedTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> A filter that returns only endpoints that were modified after the specified timestamp. </p>\"\
        },\
        \"StatusEquals\":{\
          \"shape\":\"EndpointStatus\",\
          \"documentation\":\"<p> A filter that returns only endpoints with the specified status.</p>\"\
        }\
      }\
    },\
    \"ListEndpointsOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Endpoints\"],\
      \"members\":{\
        \"Endpoints\":{\
          \"shape\":\"EndpointSummaryList\",\
          \"documentation\":\"<p> An array or endpoint objects. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p> If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of training jobs, use it in the subsequent request. </p>\"\
        }\
      }\
    },\
    \"ListExperimentsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreatedAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only experiments created after the specified time.</p>\"\
        },\
        \"CreatedBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only experiments created before the specified time.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"SortExperimentsBy\",\
          \"documentation\":\"<p>The property used to sort results. The default value is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order. The default value is <code>Descending</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous call to <code>ListExperiments</code> didn't return the full set of experiments, the call returns a token for getting the next set of experiments.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of experiments to return in the response. The default value is 10.</p>\"\
        }\
      }\
    },\
    \"ListExperimentsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExperimentSummaries\":{\
          \"shape\":\"ExperimentSummaries\",\
          \"documentation\":\"<p>A list of the summaries of your experiments.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token for getting the next set of experiments, if there are any.</p>\"\
        }\
      }\
    },\
    \"ListFlowDefinitionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only flow definitions with a creation time greater than or equal to the specified timestamp.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only flow definitions that were created before the specified timestamp.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>An optional value that specifies whether you want the results sorted in <code>Ascending</code> or <code>Descending</code> order.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to resume pagination.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The total number of items to return. If the total number of available items is more than the value specified in <code>MaxResults</code>, then a <code>NextToken</code> will be provided in the output that you can use to resume pagination.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"ListFlowDefinitionsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"FlowDefinitionSummaries\"],\
      \"members\":{\
        \"FlowDefinitionSummaries\":{\
          \"shape\":\"FlowDefinitionSummaries\",\
          \"documentation\":\"<p>An array of objects describing the flow definitions.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to resume pagination.</p>\"\
        }\
      }\
    },\
    \"ListHumanTaskUisRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only human task user interfaces with a creation time greater than or equal to the specified timestamp.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only human task user interfaces that were created before the specified timestamp.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>An optional value that specifies whether you want the results sorted in <code>Ascending</code> or <code>Descending</code> order.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to resume pagination.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The total number of items to return. If the total number of available items is more than the value specified in <code>MaxResults</code>, then a <code>NextToken</code> will be provided in the output that you can use to resume pagination.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"ListHumanTaskUisResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"HumanTaskUiSummaries\"],\
      \"members\":{\
        \"HumanTaskUiSummaries\":{\
          \"shape\":\"HumanTaskUiSummaries\",\
          \"documentation\":\"<p>An array of objects describing the human task user interfaces.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to resume pagination.</p>\"\
        }\
      }\
    },\
    \"ListHyperParameterTuningJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous <code>ListHyperParameterTuningJobs</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of tuning jobs, use the token in the next request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of tuning jobs to return. The default value is 10.</p>\",\
          \"box\":true\
        },\
        \"SortBy\":{\
          \"shape\":\"HyperParameterTuningJobSortByOptions\",\
          \"documentation\":\"<p>The field to sort results by. The default is <code>Name</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order for results. The default is <code>Ascending</code>.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"NameContains\",\
          \"documentation\":\"<p>A string in the tuning job name. This filter returns only tuning jobs whose name contains the specified string.</p>\"\
        },\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only tuning jobs that were created after the specified time.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only tuning jobs that were created before the specified time.</p>\"\
        },\
        \"LastModifiedTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only tuning jobs that were modified after the specified time.</p>\"\
        },\
        \"LastModifiedTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only tuning jobs that were modified before the specified time.</p>\"\
        },\
        \"StatusEquals\":{\
          \"shape\":\"HyperParameterTuningJobStatus\",\
          \"documentation\":\"<p>A filter that returns only tuning jobs with the specified status.</p>\"\
        }\
      }\
    },\
    \"ListHyperParameterTuningJobsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"HyperParameterTuningJobSummaries\"],\
      \"members\":{\
        \"HyperParameterTuningJobSummaries\":{\
          \"shape\":\"HyperParameterTuningJobSummaries\",\
          \"documentation\":\"<p>A list of <a>HyperParameterTuningJobSummary</a> objects that describe the tuning jobs that the <code>ListHyperParameterTuningJobs</code> request returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of this <code>ListHyperParameterTuningJobs</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of tuning jobs, use the token in the next request.</p>\"\
        }\
      }\
    },\
    \"ListLabelingJobsForWorkteamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"WorkteamArn\"],\
      \"members\":{\
        \"WorkteamArn\":{\
          \"shape\":\"WorkteamArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the work team for which you want to see labeling jobs for.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of labeling jobs to return in each page of the response.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous <code>ListLabelingJobsForWorkteam</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of labeling jobs, use the token in the next request.</p>\"\
        },\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only labeling jobs created after the specified time (timestamp).</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only labeling jobs created before the specified time (timestamp).</p>\"\
        },\
        \"JobReferenceCodeContains\":{\
          \"shape\":\"JobReferenceCodeContains\",\
          \"documentation\":\"<p>A filter the limits jobs to only the ones whose job reference code contains the specified string.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"ListLabelingJobsForWorkteamSortByOptions\",\
          \"documentation\":\"<p>The field to sort results by. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order for results. The default is <code>Ascending</code>.</p>\"\
        }\
      }\
    },\
    \"ListLabelingJobsForWorkteamResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"LabelingJobSummaryList\"],\
      \"members\":{\
        \"LabelingJobSummaryList\":{\
          \"shape\":\"LabelingJobForWorkteamSummaryList\",\
          \"documentation\":\"<p>An array of <code>LabelingJobSummary</code> objects, each describing a labeling job.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of labeling jobs, use it in the subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListLabelingJobsForWorkteamSortByOptions\":{\
      \"type\":\"string\",\
      \"enum\":[\"CreationTime\"]\
    },\
    \"ListLabelingJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only labeling jobs created after the specified time (timestamp).</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only labeling jobs created before the specified time (timestamp).</p>\"\
        },\
        \"LastModifiedTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only labeling jobs modified after the specified time (timestamp).</p>\"\
        },\
        \"LastModifiedTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only labeling jobs modified before the specified time (timestamp).</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of labeling jobs to return in each page of the response.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous <code>ListLabelingJobs</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of labeling jobs, use the token in the next request.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"NameContains\",\
          \"documentation\":\"<p>A string in the labeling job name. This filter returns only labeling jobs whose name contains the specified string.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"SortBy\",\
          \"documentation\":\"<p>The field to sort results by. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order for results. The default is <code>Ascending</code>.</p>\"\
        },\
        \"StatusEquals\":{\
          \"shape\":\"LabelingJobStatus\",\
          \"documentation\":\"<p>A filter that retrieves only labeling jobs with a specific status.</p>\"\
        }\
      }\
    },\
    \"ListLabelingJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LabelingJobSummaryList\":{\
          \"shape\":\"LabelingJobSummaryList\",\
          \"documentation\":\"<p>An array of <code>LabelingJobSummary</code> objects, each describing a labeling job.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of labeling jobs, use it in the subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListModelPackagesInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationTimeAfter\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A filter that returns only model packages created after the specified time (timestamp).</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A filter that returns only model packages created before the specified time (timestamp).</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of model packages to return in the response.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"NameContains\",\
          \"documentation\":\"<p>A string in the model package name. This filter returns only model packages whose name contains the specified string.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response to a previous <code>ListModelPackages</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of model packages, use the token in the next request.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"ModelPackageSortBy\",\
          \"documentation\":\"<p>The parameter by which to sort the results. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order for the results. The default is <code>Ascending</code>.</p>\"\
        }\
      }\
    },\
    \"ListModelPackagesOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ModelPackageSummaryList\"],\
      \"members\":{\
        \"ModelPackageSummaryList\":{\
          \"shape\":\"ModelPackageSummaryList\",\
          \"documentation\":\"<p>An array of <code>ModelPackageSummary</code> objects, each of which lists a model package.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of model packages, use it in the subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListModelsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SortBy\":{\
          \"shape\":\"ModelSortKey\",\
          \"documentation\":\"<p>Sorts the list of results. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"OrderKey\",\
          \"documentation\":\"<p>The sort order for results. The default is <code>Descending</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response to a previous <code>ListModels</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of models, use the token in the next request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of models to return in the response.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"ModelNameContains\",\
          \"documentation\":\"<p>A string in the training job name. This filter returns only models in the training job whose name contains the specified string.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only models created before the specified time (timestamp).</p>\"\
        },\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only models with a creation time greater than or equal to the specified time (timestamp).</p>\"\
        }\
      }\
    },\
    \"ListModelsOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Models\"],\
      \"members\":{\
        \"Models\":{\
          \"shape\":\"ModelSummaryList\",\
          \"documentation\":\"<p>An array of <code>ModelSummary</code> objects, each of which lists a model.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p> If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of models, use it in the subsequent request. </p>\"\
        }\
      }\
    },\
    \"ListMonitoringExecutionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MonitoringScheduleName\":{\
          \"shape\":\"MonitoringScheduleName\",\
          \"documentation\":\"<p>Name of a specific schedule to fetch jobs for.</p>\"\
        },\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p>Name of a specific endpoint to fetch jobs for.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"MonitoringExecutionSortKey\",\
          \"documentation\":\"<p>Whether to sort results by <code>Status</code>, <code>CreationTime</code>, <code>ScheduledTime</code> field. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>Whether to sort the results in <code>Ascending</code> or <code>Descending</code> order. The default is <code>Descending</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token returned if the response is truncated. To retrieve the next set of job executions, use it in the next request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of jobs to return in the response. The default value is 10.</p>\"\
        },\
        \"ScheduledTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filter for jobs scheduled before a specified time.</p>\"\
        },\
        \"ScheduledTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filter for jobs scheduled after a specified time.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only jobs created before a specified time.</p>\"\
        },\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only jobs created after a specified time.</p>\"\
        },\
        \"LastModifiedTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only jobs modified after a specified time.</p>\"\
        },\
        \"LastModifiedTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only jobs modified before a specified time.</p>\"\
        },\
        \"StatusEquals\":{\
          \"shape\":\"ExecutionStatus\",\
          \"documentation\":\"<p>A filter that retrieves only jobs with a specific status.</p>\"\
        }\
      }\
    },\
    \"ListMonitoringExecutionsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"MonitoringExecutionSummaries\"],\
      \"members\":{\
        \"MonitoringExecutionSummaries\":{\
          \"shape\":\"MonitoringExecutionSummaryList\",\
          \"documentation\":\"<p>A JSON array in which each element is a summary for a monitoring execution.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of jobs, use it in the subsequent reques</p>\"\
        }\
      }\
    },\
    \"ListMonitoringSchedulesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p>Name of a specific endpoint to fetch schedules for.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"MonitoringScheduleSortKey\",\
          \"documentation\":\"<p>Whether to sort results by <code>Status</code>, <code>CreationTime</code>, <code>ScheduledTime</code> field. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>Whether to sort the results in <code>Ascending</code> or <code>Descending</code> order. The default is <code>Descending</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token returned if the response is truncated. To retrieve the next set of job executions, use it in the next request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of jobs to return in the response. The default value is 10.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"NameContains\",\
          \"documentation\":\"<p>Filter for monitoring schedules whose name contains a specified string.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only monitoring schedules created before a specified time.</p>\"\
        },\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only monitoring schedules created after a specified time.</p>\"\
        },\
        \"LastModifiedTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only monitoring schedules modified before a specified time.</p>\"\
        },\
        \"LastModifiedTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only monitoring schedules modified after a specified time.</p>\"\
        },\
        \"StatusEquals\":{\
          \"shape\":\"ScheduleStatus\",\
          \"documentation\":\"<p>A filter that returns only monitoring schedules modified before a specified time.</p>\"\
        }\
      }\
    },\
    \"ListMonitoringSchedulesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"MonitoringScheduleSummaries\"],\
      \"members\":{\
        \"MonitoringScheduleSummaries\":{\
          \"shape\":\"MonitoringScheduleSummaryList\",\
          \"documentation\":\"<p>A JSON array in which each element is a summary for a monitoring schedule.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of jobs, use it in the subsequent reques</p>\"\
        }\
      }\
    },\
    \"ListNotebookInstanceLifecycleConfigsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of a <code>ListNotebookInstanceLifecycleConfigs</code> request was truncated, the response includes a <code>NextToken</code>. To get the next set of lifecycle configurations, use the token in the next request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of lifecycle configurations to return in the response.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigSortKey\",\
          \"documentation\":\"<p>Sorts the list of results. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigSortOrder\",\
          \"documentation\":\"<p>The sort order for results.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigNameContains\",\
          \"documentation\":\"<p>A string in the lifecycle configuration name. This filter returns only lifecycle configurations whose name contains the specified string.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A filter that returns only lifecycle configurations that were created before the specified time (timestamp).</p>\"\
        },\
        \"CreationTimeAfter\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A filter that returns only lifecycle configurations that were created after the specified time (timestamp).</p>\"\
        },\
        \"LastModifiedTimeBefore\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>A filter that returns only lifecycle configurations that were modified before the specified time (timestamp).</p>\"\
        },\
        \"LastModifiedTimeAfter\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>A filter that returns only lifecycle configurations that were modified after the specified time (timestamp).</p>\"\
        }\
      }\
    },\
    \"ListNotebookInstanceLifecycleConfigsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon SageMaker returns this token. To get the next set of lifecycle configurations, use it in the next request. </p>\"\
        },\
        \"NotebookInstanceLifecycleConfigs\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigSummaryList\",\
          \"documentation\":\"<p>An array of <code>NotebookInstanceLifecycleConfiguration</code> objects, each listing a lifecycle configuration.</p>\"\
        }\
      }\
    },\
    \"ListNotebookInstancesInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> If the previous call to the <code>ListNotebookInstances</code> is truncated, the response includes a <code>NextToken</code>. You can use this token in your subsequent <code>ListNotebookInstances</code> request to fetch the next set of notebook instances. </p> <note> <p>You might specify a filter or a sort order in your request. When response is truncated, you must use the same values for the filer and sort order in the next request. </p> </note>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of notebook instances to return.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"NotebookInstanceSortKey\",\
          \"documentation\":\"<p>The field to sort results by. The default is <code>Name</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"NotebookInstanceSortOrder\",\
          \"documentation\":\"<p>The sort order for results. </p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"NotebookInstanceNameContains\",\
          \"documentation\":\"<p>A string in the notebook instances' name. This filter returns only notebook instances whose name contains the specified string.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A filter that returns only notebook instances that were created before the specified time (timestamp). </p>\"\
        },\
        \"CreationTimeAfter\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A filter that returns only notebook instances that were created after the specified time (timestamp).</p>\"\
        },\
        \"LastModifiedTimeBefore\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>A filter that returns only notebook instances that were modified before the specified time (timestamp).</p>\"\
        },\
        \"LastModifiedTimeAfter\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>A filter that returns only notebook instances that were modified after the specified time (timestamp).</p>\"\
        },\
        \"StatusEquals\":{\
          \"shape\":\"NotebookInstanceStatus\",\
          \"documentation\":\"<p>A filter that returns only notebook instances with the specified status.</p>\"\
        },\
        \"NotebookInstanceLifecycleConfigNameContains\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigName\",\
          \"documentation\":\"<p>A string in the name of a notebook instances lifecycle configuration associated with this notebook instance. This filter returns only notebook instances associated with a lifecycle configuration with a name that contains the specified string.</p>\"\
        },\
        \"DefaultCodeRepositoryContains\":{\
          \"shape\":\"CodeRepositoryContains\",\
          \"documentation\":\"<p>A string in the name or URL of a Git repository associated with this notebook instance. This filter returns only notebook instances associated with a git repository with a name that contains the specified string.</p>\"\
        },\
        \"AdditionalCodeRepositoryEquals\":{\
          \"shape\":\"CodeRepositoryNameOrUrl\",\
          \"documentation\":\"<p>A filter that returns only notebook instances with associated with the specified git repository.</p>\"\
        }\
      }\
    },\
    \"ListNotebookInstancesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response to the previous <code>ListNotebookInstances</code> request was truncated, Amazon SageMaker returns this token. To retrieve the next set of notebook instances, use the token in the next request.</p>\"\
        },\
        \"NotebookInstances\":{\
          \"shape\":\"NotebookInstanceSummaryList\",\
          \"documentation\":\"<p>An array of <code>NotebookInstanceSummary</code> objects, one for each notebook instance.</p>\"\
        }\
      }\
    },\
    \"ListProcessingJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only processing jobs created after the specified time.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only processing jobs created after the specified time.</p>\"\
        },\
        \"LastModifiedTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only processing jobs modified after the specified time.</p>\"\
        },\
        \"LastModifiedTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only processing jobs modified before the specified time.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A string in the processing job name. This filter returns only processing jobs whose name contains the specified string.</p>\"\
        },\
        \"StatusEquals\":{\
          \"shape\":\"ProcessingJobStatus\",\
          \"documentation\":\"<p>A filter that retrieves only processing jobs with a specific status.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"SortBy\",\
          \"documentation\":\"<p>The field to sort results by. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order for results. The default is <code>Ascending</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous <code>ListProcessingJobs</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of processing jobs, use the token in the next request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of processing jobs to return in the response.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"ListProcessingJobsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ProcessingJobSummaries\"],\
      \"members\":{\
        \"ProcessingJobSummaries\":{\
          \"shape\":\"ProcessingJobSummaries\",\
          \"documentation\":\"<p>An array of <code>ProcessingJobSummary</code> objects, each listing a processing job.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of processing jobs, use it in the subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListSubscribedWorkteamsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NameContains\":{\
          \"shape\":\"WorkteamName\",\
          \"documentation\":\"<p>A string in the work team name. This filter returns only work teams whose name contains the specified string.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous <code>ListSubscribedWorkteams</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of labeling jobs, use the token in the next request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of work teams to return in each page of the response.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"ListSubscribedWorkteamsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"SubscribedWorkteams\"],\
      \"members\":{\
        \"SubscribedWorkteams\":{\
          \"shape\":\"SubscribedWorkteams\",\
          \"documentation\":\"<p>An array of <code>Workteam</code> objects, each describing a work team.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of work teams, use it in the subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListTagsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource whose tags you want to retrieve.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> If the response to the previous <code>ListTags</code> request is truncated, Amazon SageMaker returns this token. To retrieve the next set of tags, use it in the subsequent request. </p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"ListTagsMaxResults\",\
          \"documentation\":\"<p>Maximum number of tags to return.</p>\"\
        }\
      }\
    },\
    \"ListTagsMaxResults\":{\
      \"type\":\"integer\",\
      \"min\":50\
    },\
    \"ListTagsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of <code>Tag</code> objects, each with a tag key and a value.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p> If response is truncated, Amazon SageMaker includes a token in the response. You can use this token in your subsequent request to fetch next set of tokens. </p>\"\
        }\
      }\
    },\
    \"ListTrainingJobsForHyperParameterTuningJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"HyperParameterTuningJobName\"],\
      \"members\":{\
        \"HyperParameterTuningJobName\":{\
          \"shape\":\"HyperParameterTuningJobName\",\
          \"documentation\":\"<p>The name of the tuning job whose training jobs you want to list.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous <code>ListTrainingJobsForHyperParameterTuningJob</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of training jobs, use the token in the next request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of training jobs to return. The default value is 10.</p>\"\
        },\
        \"StatusEquals\":{\
          \"shape\":\"TrainingJobStatus\",\
          \"documentation\":\"<p>A filter that returns only training jobs with the specified status.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"TrainingJobSortByOptions\",\
          \"documentation\":\"<p>The field to sort results by. The default is <code>Name</code>.</p> <p>If the value of this field is <code>FinalObjectiveMetricValue</code>, any training jobs that did not return an objective metric are not listed.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order for results. The default is <code>Ascending</code>.</p>\"\
        }\
      }\
    },\
    \"ListTrainingJobsForHyperParameterTuningJobResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrainingJobSummaries\"],\
      \"members\":{\
        \"TrainingJobSummaries\":{\
          \"shape\":\"HyperParameterTrainingJobSummaries\",\
          \"documentation\":\"<p>A list of <a>TrainingJobSummary</a> objects that describe the training jobs that the <code>ListTrainingJobsForHyperParameterTuningJob</code> request returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of this <code>ListTrainingJobsForHyperParameterTuningJob</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of training jobs, use the token in the next request.</p>\"\
        }\
      }\
    },\
    \"ListTrainingJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous <code>ListTrainingJobs</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of training jobs, use the token in the next request. </p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of training jobs to return in the response.</p>\",\
          \"box\":true\
        },\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only training jobs created after the specified time (timestamp).</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only training jobs created before the specified time (timestamp).</p>\"\
        },\
        \"LastModifiedTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only training jobs modified after the specified time (timestamp).</p>\"\
        },\
        \"LastModifiedTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only training jobs modified before the specified time (timestamp).</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"NameContains\",\
          \"documentation\":\"<p>A string in the training job name. This filter returns only training jobs whose name contains the specified string.</p>\"\
        },\
        \"StatusEquals\":{\
          \"shape\":\"TrainingJobStatus\",\
          \"documentation\":\"<p>A filter that retrieves only training jobs with a specific status.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"SortBy\",\
          \"documentation\":\"<p>The field to sort results by. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order for results. The default is <code>Ascending</code>.</p>\"\
        }\
      }\
    },\
    \"ListTrainingJobsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrainingJobSummaries\"],\
      \"members\":{\
        \"TrainingJobSummaries\":{\
          \"shape\":\"TrainingJobSummaries\",\
          \"documentation\":\"<p>An array of <code>TrainingJobSummary</code> objects, each listing a training job.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of training jobs, use it in the subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListTransformJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only transform jobs created after the specified time.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only transform jobs created before the specified time.</p>\"\
        },\
        \"LastModifiedTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only transform jobs modified after the specified time.</p>\"\
        },\
        \"LastModifiedTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only transform jobs modified before the specified time.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"NameContains\",\
          \"documentation\":\"<p>A string in the transform job name. This filter returns only transform jobs whose name contains the specified string.</p>\"\
        },\
        \"StatusEquals\":{\
          \"shape\":\"TransformJobStatus\",\
          \"documentation\":\"<p>A filter that retrieves only transform jobs with a specific status.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"SortBy\",\
          \"documentation\":\"<p>The field to sort results by. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order for results. The default is <code>Descending</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous <code>ListTransformJobs</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of transform jobs, use the token in the next request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of transform jobs to return in the response. The default value is <code>10</code>.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"ListTransformJobsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"TransformJobSummaries\"],\
      \"members\":{\
        \"TransformJobSummaries\":{\
          \"shape\":\"TransformJobSummaries\",\
          \"documentation\":\"<p>An array of <code>TransformJobSummary</code> objects.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of transform jobs, use it in the next request.</p>\"\
        }\
      }\
    },\
    \"ListTrialComponentKey256\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrialComponentKey256\"}\
    },\
    \"ListTrialComponentsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExperimentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>A filter that returns only components that are part of the specified experiment. If you specify <code>ExperimentName</code>, you can't filter by <code>SourceArn</code> or <code>TrialName</code>.</p>\"\
        },\
        \"TrialName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>A filter that returns only components that are part of the specified trial. If you specify <code>TrialName</code>, you can't filter by <code>ExperimentName</code> or <code>SourceArn</code>.</p>\"\
        },\
        \"SourceArn\":{\
          \"shape\":\"String256\",\
          \"documentation\":\"<p>A filter that returns only components that have the specified source Amazon Resource Name (ARN). If you specify <code>SourceArn</code>, you can't filter by <code>ExperimentName</code> or <code>TrialName</code>.</p>\"\
        },\
        \"CreatedAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only components created after the specified time.</p>\"\
        },\
        \"CreatedBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only components created before the specified time.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"SortTrialComponentsBy\",\
          \"documentation\":\"<p>The property used to sort results. The default value is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order. The default value is <code>Descending</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of components to return in the response. The default value is 10.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous call to <code>ListTrialComponents</code> didn't return the full set of components, the call returns a token for getting the next set of components.</p>\"\
        }\
      }\
    },\
    \"ListTrialComponentsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialComponentSummaries\":{\
          \"shape\":\"TrialComponentSummaries\",\
          \"documentation\":\"<p>A list of the summaries of your trial components.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token for getting the next set of components, if there are any.</p>\"\
        }\
      }\
    },\
    \"ListTrialsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExperimentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>A filter that returns only trials that are part of the specified experiment.</p>\"\
        },\
        \"TrialComponentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>A filter that returns only trials that are associated with the specified trial component.</p>\"\
        },\
        \"CreatedAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only trials created after the specified time.</p>\"\
        },\
        \"CreatedBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A filter that returns only trials created before the specified time.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"SortTrialsBy\",\
          \"documentation\":\"<p>The property used to sort results. The default value is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order. The default value is <code>Descending</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of trials to return in the response. The default value is 10.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous call to <code>ListTrials</code> didn't return the full set of trials, the call returns a token for getting the next set of trials.</p>\"\
        }\
      }\
    },\
    \"ListTrialsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialSummaries\":{\
          \"shape\":\"TrialSummaries\",\
          \"documentation\":\"<p>A list of the summaries of your trials.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token for getting the next set of trials, if there are any.</p>\"\
        }\
      }\
    },\
    \"ListUserProfilesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Returns a list up to a specified limit.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order for the results. The default is Ascending.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"UserProfileSortKey\",\
          \"documentation\":\"<p>The parameter by which to sort the results. The default is CreationTime.</p>\"\
        },\
        \"DomainIdEquals\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>A parameter by which to filter the results.</p>\"\
        },\
        \"UserProfileNameContains\":{\
          \"shape\":\"UserProfileName\",\
          \"documentation\":\"<p>A parameter by which to filter the results.</p>\"\
        }\
      }\
    },\
    \"ListUserProfilesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserProfiles\":{\
          \"shape\":\"UserProfileList\",\
          \"documentation\":\"<p>The list of user profiles.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListWorkteamsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SortBy\":{\
          \"shape\":\"ListWorkteamsSortByOptions\",\
          \"documentation\":\"<p>The field to sort results by. The default is <code>CreationTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortOrder\",\
          \"documentation\":\"<p>The sort order for results. The default is <code>Ascending</code>.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"WorkteamName\",\
          \"documentation\":\"<p>A string in the work team's name. This filter returns only work teams whose name contains the specified string.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous <code>ListWorkteams</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of labeling jobs, use the token in the next request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of work teams to return in each page of the response.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"ListWorkteamsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Workteams\"],\
      \"members\":{\
        \"Workteams\":{\
          \"shape\":\"Workteams\",\
          \"documentation\":\"<p>An array of <code>Workteam</code> objects, each describing a work team.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of work teams, use it in the subsequent request.</p>\"\
        }\
      }\
    },\
    \"ListWorkteamsSortByOptions\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreateDate\"\
      ]\
    },\
    \"MaxAutoMLJobRuntimeInSeconds\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"MaxCandidates\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"MaxConcurrentTaskCount\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"MaxConcurrentTransforms\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"MaxHumanLabeledObjectCount\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"MaxNumberOfTrainingJobs\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"MaxParallelTrainingJobs\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"MaxPayloadInMB\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"MaxPercentageOfInputDatasetLabeled\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"MaxRuntimeInSeconds\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"MaxRuntimePerTrainingJobInSeconds\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"MaxWaitTimeInSeconds\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"MediaType\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"pattern\":\"^[\\\\w]+\\\\/[\\\\w+]+$\"\
    },\
    \"MemberDefinition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CognitoMemberDefinition\":{\
          \"shape\":\"CognitoMemberDefinition\",\
          \"documentation\":\"<p>The Amazon Cognito user group that is part of the work team.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines the Amazon Cognito user group that is part of a work team.</p>\"\
    },\
    \"MemberDefinitions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MemberDefinition\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"MetricData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The value of the metric.</p>\"\
        },\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the algorithm emitted the metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The name, value, and date and time of a metric that was emitted to Amazon CloudWatch.</p>\"\
    },\
    \"MetricDefinition\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Regex\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        },\
        \"Regex\":{\
          \"shape\":\"MetricRegex\",\
          \"documentation\":\"<p>A regular expression that searches the output of a training job and gets the value of the metric. For more information about using regular expressions to define metrics, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-metrics.html\\\">Defining Objective Metrics</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a metric that the training algorithm writes to <code>stderr</code> or <code>stdout</code> . Amazon SageMakerhyperparameter tuning captures all defined metrics. You specify one metric that a hyperparameter tuning job uses as its objective metric to choose the best training job.</p>\"\
    },\
    \"MetricDefinitionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricDefinition\"},\
      \"max\":40,\
      \"min\":0\
    },\
    \"MetricName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\".+\"\
    },\
    \"MetricRegex\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":1,\
      \"pattern\":\".+\"\
    },\
    \"MetricValue\":{\"type\":\"float\"},\
    \"ModelArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:model/.*\"\
    },\
    \"ModelArtifacts\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3ModelArtifacts\"],\
      \"members\":{\
        \"S3ModelArtifacts\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The path of the S3 object that contains the model artifacts. For example, <code>s3://bucket-name/keynameprefix/model.tar.gz</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about the location that is configured for storing model artifacts. </p>\"\
    },\
    \"ModelName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"ModelNameContains\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"[a-zA-Z0-9-]+\"\
    },\
    \"ModelPackageArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:model-package/.*\"\
    },\
    \"ModelPackageContainerDefinition\":{\
      \"type\":\"structure\",\
      \"required\":[\"Image\"],\
      \"members\":{\
        \"ContainerHostname\":{\
          \"shape\":\"ContainerHostname\",\
          \"documentation\":\"<p>The DNS host name for the Docker container.</p>\"\
        },\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The Amazon EC2 Container Registry (Amazon ECR) path where inference code is stored.</p> <p>If you are using your own custom algorithm instead of an algorithm provided by Amazon SageMaker, the inference code must meet Amazon SageMaker requirements. Amazon SageMaker supports both <code>registry/repository[:tag]</code> and <code>registry/repository[@digest]</code> image path formats. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html\\\">Using Your Own Algorithms with Amazon SageMaker</a>.</p>\"\
        },\
        \"ImageDigest\":{\
          \"shape\":\"ImageDigest\",\
          \"documentation\":\"<p>An MD5 hash of the training algorithm that identifies the Docker image used for training.</p>\"\
        },\
        \"ModelDataUrl\":{\
          \"shape\":\"Url\",\
          \"documentation\":\"<p>The Amazon S3 path where the model artifacts, which result from model training, are stored. This path must point to a single <code>gzip</code> compressed tar archive (<code>.tar.gz</code> suffix).</p>\"\
        },\
        \"ProductId\":{\
          \"shape\":\"ProductId\",\
          \"documentation\":\"<p>The AWS Marketplace product ID of the model package.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the Docker container for the model package.</p>\"\
    },\
    \"ModelPackageContainerDefinitionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ModelPackageContainerDefinition\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"ModelPackageSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\"\
      ]\
    },\
    \"ModelPackageStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pending\",\
        \"InProgress\",\
        \"Completed\",\
        \"Failed\",\
        \"Deleting\"\
      ]\
    },\
    \"ModelPackageStatusDetails\":{\
      \"type\":\"structure\",\
      \"required\":[\"ValidationStatuses\"],\
      \"members\":{\
        \"ValidationStatuses\":{\
          \"shape\":\"ModelPackageStatusItemList\",\
          \"documentation\":\"<p>The validation status of the model package.</p>\"\
        },\
        \"ImageScanStatuses\":{\
          \"shape\":\"ModelPackageStatusItemList\",\
          \"documentation\":\"<p>The status of the scan of the Docker image container for the model package.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the validation and image scan statuses of the model package.</p>\"\
    },\
    \"ModelPackageStatusItem\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Status\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the model package for which the overall status is being reported.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"DetailedModelPackageStatus\",\
          \"documentation\":\"<p>The current status.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>if the overall status is <code>Failed</code>, the reason for the failure.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the overall status of a model package.</p>\"\
    },\
    \"ModelPackageStatusItemList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ModelPackageStatusItem\"}\
    },\
    \"ModelPackageSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ModelPackageName\",\
        \"ModelPackageArn\",\
        \"CreationTime\",\
        \"ModelPackageStatus\"\
      ],\
      \"members\":{\
        \"ModelPackageName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the model package.</p>\"\
        },\
        \"ModelPackageArn\":{\
          \"shape\":\"ModelPackageArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the model package.</p>\"\
        },\
        \"ModelPackageDescription\":{\
          \"shape\":\"EntityDescription\",\
          \"documentation\":\"<p>A brief description of the model package.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A timestamp that shows when the model package was created.</p>\"\
        },\
        \"ModelPackageStatus\":{\
          \"shape\":\"ModelPackageStatus\",\
          \"documentation\":\"<p>The overall status of the model package.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information about a model package.</p>\"\
    },\
    \"ModelPackageSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ModelPackageSummary\"}\
    },\
    \"ModelPackageValidationProfile\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ProfileName\",\
        \"TransformJobDefinition\"\
      ],\
      \"members\":{\
        \"ProfileName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the profile for the model package.</p>\"\
        },\
        \"TransformJobDefinition\":{\
          \"shape\":\"TransformJobDefinition\",\
          \"documentation\":\"<p>The <code>TransformJobDefinition</code> object that describes the transform job used for the validation of the model package.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains data, such as the inputs and targeted instance types that are used in the process of validating the model package.</p> <p>The data provided in the validation profile is made available to your buyers on AWS Marketplace.</p>\"\
    },\
    \"ModelPackageValidationProfiles\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ModelPackageValidationProfile\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"ModelPackageValidationSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ValidationRole\",\
        \"ValidationProfiles\"\
      ],\
      \"members\":{\
        \"ValidationRole\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The IAM roles to be used for the validation of the model package.</p>\"\
        },\
        \"ValidationProfiles\":{\
          \"shape\":\"ModelPackageValidationProfiles\",\
          \"documentation\":\"<p>An array of <code>ModelPackageValidationProfile</code> objects, each of which specifies a batch transform job that Amazon SageMaker runs to validate your model package.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies batch transform jobs that Amazon SageMaker runs to validate your model package.</p>\"\
    },\
    \"ModelSortKey\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\"\
      ]\
    },\
    \"ModelSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ModelName\",\
        \"ModelArn\",\
        \"CreationTime\"\
      ],\
      \"members\":{\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the model that you want a summary for.</p>\"\
        },\
        \"ModelArn\":{\
          \"shape\":\"ModelArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the model.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that indicates when the model was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information about a model.</p>\"\
    },\
    \"ModelSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ModelSummary\"}\
    },\
    \"MonitoringAppSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\"ImageUri\"],\
      \"members\":{\
        \"ImageUri\":{\
          \"shape\":\"ImageUri\",\
          \"documentation\":\"<p>The container image to be run by the monitoring job.</p>\"\
        },\
        \"ContainerEntrypoint\":{\
          \"shape\":\"ContainerEntrypoint\",\
          \"documentation\":\"<p>Specifies the entrypoint for a container used to run the monitoring job.</p>\"\
        },\
        \"ContainerArguments\":{\
          \"shape\":\"MonitoringContainerArguments\",\
          \"documentation\":\"<p>An array of arguments for the container used to run the monitoring job.</p>\"\
        },\
        \"RecordPreprocessorSourceUri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>An Amazon S3 URI to a script that is called per row prior to running analysis. It can base64 decode the payload and convert it into a flatted json so that the built-in container can use the converted data. Applicable only for the built-in (first party) containers.</p>\"\
        },\
        \"PostAnalyticsProcessorSourceUri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>An Amazon S3 URI to a script that is called after analysis has been performed. Applicable only for the built-in (first party) containers.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Container image configuration object for the monitoring job.</p>\"\
    },\
    \"MonitoringBaselineConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConstraintsResource\":{\
          \"shape\":\"MonitoringConstraintsResource\",\
          \"documentation\":\"<p>The baseline constraint file in Amazon S3 that the current monitoring job should validated against.</p>\"\
        },\
        \"StatisticsResource\":{\
          \"shape\":\"MonitoringStatisticsResource\",\
          \"documentation\":\"<p>The baseline statistics file in Amazon S3 that the current monitoring job should be validated against.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration for monitoring constraints and monitoring statistics. These baseline resources are compared against the results of the current job from the series of jobs scheduled to collect data periodically.</p>\"\
    },\
    \"MonitoringClusterConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceCount\",\
        \"InstanceType\",\
        \"VolumeSizeInGB\"\
      ],\
      \"members\":{\
        \"InstanceCount\":{\
          \"shape\":\"ProcessingInstanceCount\",\
          \"documentation\":\"<p>The number of ML compute instances to use in the model monitoring job. For distributed processing jobs, specify a value greater than 1. The default value is 1.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"ProcessingInstanceType\",\
          \"documentation\":\"<p>The ML compute instance type for the processing job.</p>\"\
        },\
        \"VolumeSizeInGB\":{\
          \"shape\":\"ProcessingVolumeSizeInGB\",\
          \"documentation\":\"<p>The size of the ML storage volume, in gigabytes, that you want to provision. You must specify sufficient ML storage for your scenario.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance(s) that run the model monitoring job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration for the cluster used to run model monitoring jobs.</p>\"\
    },\
    \"MonitoringConstraintsResource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 URI for the constraints resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The constraints resource for a monitoring job.</p>\"\
    },\
    \"MonitoringContainerArguments\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContainerArgument\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"MonitoringEnvironmentMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ProcessingEnvironmentKey\"},\
      \"value\":{\"shape\":\"ProcessingEnvironmentValue\"},\
      \"max\":50\
    },\
    \"MonitoringExecutionSortKey\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CreationTime\",\
        \"ScheduledTime\",\
        \"Status\"\
      ]\
    },\
    \"MonitoringExecutionSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MonitoringScheduleName\",\
        \"ScheduledTime\",\
        \"CreationTime\",\
        \"LastModifiedTime\",\
        \"MonitoringExecutionStatus\"\
      ],\
      \"members\":{\
        \"MonitoringScheduleName\":{\
          \"shape\":\"MonitoringScheduleName\",\
          \"documentation\":\"<p>The name of the monitoring schedule.</p>\"\
        },\
        \"ScheduledTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the monitoring job was scheduled.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the monitoring job was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that indicates the last time the monitoring job was modified.</p>\"\
        },\
        \"MonitoringExecutionStatus\":{\
          \"shape\":\"ExecutionStatus\",\
          \"documentation\":\"<p>The status of the monitoring job.</p>\"\
        },\
        \"ProcessingJobArn\":{\
          \"shape\":\"ProcessingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the monitoring job.</p>\"\
        },\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p>The name of teh endpoint used to run the monitoring job.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>Contains the reason a monitoring job failed, if it failed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of information about the last monitoring job to run.</p>\"\
    },\
    \"MonitoringExecutionSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MonitoringExecutionSummary\"}\
    },\
    \"MonitoringInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointInput\"],\
      \"members\":{\
        \"EndpointInput\":{\
          \"shape\":\"EndpointInput\",\
          \"documentation\":\"<p>The endpoint for a monitoring job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The inputs for a monitoring job.</p>\"\
    },\
    \"MonitoringInputs\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MonitoringInput\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"MonitoringJobDefinition\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MonitoringInputs\",\
        \"MonitoringOutputConfig\",\
        \"MonitoringResources\",\
        \"MonitoringAppSpecification\",\
        \"RoleArn\"\
      ],\
      \"members\":{\
        \"BaselineConfig\":{\
          \"shape\":\"MonitoringBaselineConfig\",\
          \"documentation\":\"<p>Baseline configuration used to validate that the data conforms to the specified constraints and statistics</p>\"\
        },\
        \"MonitoringInputs\":{\
          \"shape\":\"MonitoringInputs\",\
          \"documentation\":\"<p>The array of inputs for the monitoring job. Currently we support monitoring an Amazon SageMaker Endpoint.</p>\"\
        },\
        \"MonitoringOutputConfig\":{\
          \"shape\":\"MonitoringOutputConfig\",\
          \"documentation\":\"<p>The array of outputs from the monitoring job to be uploaded to Amazon Simple Storage Service (Amazon S3).</p>\"\
        },\
        \"MonitoringResources\":{\
          \"shape\":\"MonitoringResources\",\
          \"documentation\":\"<p>Identifies the resources, ML compute instances, and ML storage volumes to deploy for a monitoring job. In distributed processing, you specify more than one instance.</p>\"\
        },\
        \"MonitoringAppSpecification\":{\
          \"shape\":\"MonitoringAppSpecification\",\
          \"documentation\":\"<p>Configures the monitoring job to run a specified Docker container image.</p>\"\
        },\
        \"StoppingCondition\":{\
          \"shape\":\"MonitoringStoppingCondition\",\
          \"documentation\":\"<p>Specifies a time limit for how long the monitoring job is allowed to run.</p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"MonitoringEnvironmentMap\",\
          \"documentation\":\"<p>Sets the environment variables in the Docker container.</p>\"\
        },\
        \"NetworkConfig\":{\
          \"shape\":\"NetworkConfig\",\
          \"documentation\":\"<p>Specifies networking options for an monitoring job.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker can assume to perform tasks on your behalf.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines the monitoring job.</p>\"\
    },\
    \"MonitoringMaxRuntimeInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":86400,\
      \"min\":1\
    },\
    \"MonitoringOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Output\"],\
      \"members\":{\
        \"S3Output\":{\
          \"shape\":\"MonitoringS3Output\",\
          \"documentation\":\"<p>The Amazon S3 storage location where the results of a monitoring job are saved.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output object for a monitoring job.</p>\"\
    },\
    \"MonitoringOutputConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"MonitoringOutputs\"],\
      \"members\":{\
        \"MonitoringOutputs\":{\
          \"shape\":\"MonitoringOutputs\",\
          \"documentation\":\"<p>Monitoring outputs for monitoring jobs. This is where the output of the periodic monitoring jobs is uploaded.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the model artifacts at rest using Amazon S3 server-side encryption.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output configuration for monitoring jobs.</p>\"\
    },\
    \"MonitoringOutputs\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MonitoringOutput\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"MonitoringResources\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterConfig\"],\
      \"members\":{\
        \"ClusterConfig\":{\
          \"shape\":\"MonitoringClusterConfig\",\
          \"documentation\":\"<p>The configuration for the cluster resources used to run the processing job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies the resources to deploy for a monitoring job.</p>\"\
    },\
    \"MonitoringS3Output\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"S3Uri\",\
        \"LocalPath\"\
      ],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"MonitoringS3Uri\",\
          \"documentation\":\"<p>A URI that identifies the Amazon S3 storage location where Amazon SageMaker saves the results of a monitoring job.</p>\"\
        },\
        \"LocalPath\":{\
          \"shape\":\"ProcessingLocalPath\",\
          \"documentation\":\"<p>The local path to the Amazon S3 storage location where Amazon SageMaker saves the results of a monitoring job. LocalPath is an absolute path for the output data.</p>\"\
        },\
        \"S3UploadMode\":{\
          \"shape\":\"ProcessingS3UploadMode\",\
          \"documentation\":\"<p>Whether to upload the results of the monitoring job continuously or after the job completes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about where and how you want to store the results of a monitoring job.</p>\"\
    },\
    \"MonitoringS3Uri\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"pattern\":\"^(https|s3)://([^/]+)/?(.*)$\"\
    },\
    \"MonitoringScheduleArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\".*\"\
    },\
    \"MonitoringScheduleConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"MonitoringJobDefinition\"],\
      \"members\":{\
        \"ScheduleConfig\":{\
          \"shape\":\"ScheduleConfig\",\
          \"documentation\":\"<p>Configures the monitoring schedule.</p>\"\
        },\
        \"MonitoringJobDefinition\":{\
          \"shape\":\"MonitoringJobDefinition\",\
          \"documentation\":\"<p>Defines the monitoring job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configures the monitoring schedule and defines the monitoring job.</p>\"\
    },\
    \"MonitoringScheduleName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$\"\
    },\
    \"MonitoringScheduleSortKey\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\",\
        \"Status\"\
      ]\
    },\
    \"MonitoringScheduleSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MonitoringScheduleName\",\
        \"MonitoringScheduleArn\",\
        \"CreationTime\",\
        \"LastModifiedTime\",\
        \"MonitoringScheduleStatus\"\
      ],\
      \"members\":{\
        \"MonitoringScheduleName\":{\
          \"shape\":\"MonitoringScheduleName\",\
          \"documentation\":\"<p>The name of the monitoring schedule.</p>\"\
        },\
        \"MonitoringScheduleArn\":{\
          \"shape\":\"MonitoringScheduleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the monitoring schedule.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the monitoring schedule.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The last time the monitoring schedule was modified.</p>\"\
        },\
        \"MonitoringScheduleStatus\":{\
          \"shape\":\"ScheduleStatus\",\
          \"documentation\":\"<p>The status of the monitoring schedule.</p>\"\
        },\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p>The name of the endpoint using the monitoring schedule.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summarizes the monitoring schedule.</p>\"\
    },\
    \"MonitoringScheduleSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MonitoringScheduleSummary\"}\
    },\
    \"MonitoringStatisticsResource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 URI for the statistics resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The statistics resource for a monitoring job.</p>\"\
    },\
    \"MonitoringStoppingCondition\":{\
      \"type\":\"structure\",\
      \"required\":[\"MaxRuntimeInSeconds\"],\
      \"members\":{\
        \"MaxRuntimeInSeconds\":{\
          \"shape\":\"MonitoringMaxRuntimeInSeconds\",\
          \"documentation\":\"<p>The maximum runtime allowed in seconds.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A time limit for how long the monitoring job is allowed to run before stopping.</p>\"\
    },\
    \"NameContains\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"[a-zA-Z0-9\\\\-]+\"\
    },\
    \"NestedFilters\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"NestedPropertyName\",\
        \"Filters\"\
      ],\
      \"members\":{\
        \"NestedPropertyName\":{\
          \"shape\":\"ResourcePropertyName\",\
          \"documentation\":\"<p>The name of the property to use in the nested filters. The value must match a listed property name, such as <code>InputDataConfig</code>.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>A list of filters. Each filter acts on a property. Filters must contain at least one <code>Filters</code> value. For example, a <code>NestedFilters</code> call might include a filter on the <code>PropertyName</code> parameter of the <code>InputDataConfig</code> property: <code>InputDataConfig.DataSource.S3DataSource.S3Uri</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of nested <a>Filter</a> objects. A resource must satisfy the conditions of all filters to be included in the results returned from the <a>Search</a> API.</p> <p>For example, to filter on a training job's <code>InputDataConfig</code> property with a specific channel name and <code>S3Uri</code> prefix, define the following filters:</p> <ul> <li> <p> <code>'{Name:\\\"InputDataConfig.ChannelName\\\", \\\"Operator\\\":\\\"Equals\\\", \\\"Value\\\":\\\"train\\\"}',</code> </p> </li> <li> <p> <code>'{Name:\\\"InputDataConfig.DataSource.S3DataSource.S3Uri\\\", \\\"Operator\\\":\\\"Contains\\\", \\\"Value\\\":\\\"mybucket/catdata\\\"}'</code> </p> </li> </ul>\"\
    },\
    \"NestedFiltersList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NestedFilters\"},\
      \"max\":20,\
      \"min\":1\
    },\
    \"NetworkConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EnableInterContainerTrafficEncryption\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether to encrypt all communications between distributed processing jobs. Choose <code>True</code> to encrypt communications. Encryption provides greater security for distributed processing jobs, but the processing might take longer.</p>\"\
        },\
        \"EnableNetworkIsolation\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether to allow inbound and outbound network calls to and from the containers used for the processing job.</p>\"\
        },\
        \"VpcConfig\":{\"shape\":\"VpcConfig\"}\
      },\
      \"documentation\":\"<p>Networking options for a job, such as network traffic encryption between containers, whether to allow inbound and outbound network calls to and from containers, and the VPC subnets and security groups to use for VPC-enabled jobs.</p>\"\
    },\
    \"NetworkInterfaceId\":{\"type\":\"string\"},\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":8192,\
      \"pattern\":\".*\"\
    },\
    \"NotebookInstanceAcceleratorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ml.eia1.medium\",\
        \"ml.eia1.large\",\
        \"ml.eia1.xlarge\",\
        \"ml.eia2.medium\",\
        \"ml.eia2.large\",\
        \"ml.eia2.xlarge\"\
      ]\
    },\
    \"NotebookInstanceAcceleratorTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NotebookInstanceAcceleratorType\"}\
    },\
    \"NotebookInstanceArn\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"NotebookInstanceLifecycleConfigArn\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"NotebookInstanceLifecycleConfigContent\":{\
      \"type\":\"string\",\
      \"max\":16384,\
      \"min\":1,\
      \"pattern\":\"[\\\\S\\\\s]+\"\
    },\
    \"NotebookInstanceLifecycleConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NotebookInstanceLifecycleHook\"},\
      \"max\":1\
    },\
    \"NotebookInstanceLifecycleConfigName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"NotebookInstanceLifecycleConfigNameContains\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"[a-zA-Z0-9-]+\"\
    },\
    \"NotebookInstanceLifecycleConfigSortKey\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\",\
        \"LastModifiedTime\"\
      ]\
    },\
    \"NotebookInstanceLifecycleConfigSortOrder\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Ascending\",\
        \"Descending\"\
      ]\
    },\
    \"NotebookInstanceLifecycleConfigSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"NotebookInstanceLifecycleConfigName\",\
        \"NotebookInstanceLifecycleConfigArn\"\
      ],\
      \"members\":{\
        \"NotebookInstanceLifecycleConfigName\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigName\",\
          \"documentation\":\"<p>The name of the lifecycle configuration.</p>\"\
        },\
        \"NotebookInstanceLifecycleConfigArn\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the lifecycle configuration.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A timestamp that tells when the lifecycle configuration was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>A timestamp that tells when the lifecycle configuration was last modified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides a summary of a notebook instance lifecycle configuration.</p>\"\
    },\
    \"NotebookInstanceLifecycleConfigSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NotebookInstanceLifecycleConfigSummary\"}\
    },\
    \"NotebookInstanceLifecycleHook\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Content\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigContent\",\
          \"documentation\":\"<p>A base64-encoded string that contains a shell script for a notebook instance lifecycle configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the notebook instance lifecycle configuration script.</p> <p>Each lifecycle configuration script has a limit of 16384 characters.</p> <p>The value of the <code>$PATH</code> environment variable that is available to both scripts is <code>/sbin:bin:/usr/sbin:/usr/bin</code>.</p> <p>View CloudWatch Logs for notebook instance lifecycle configurations in log group <code>/aws/sagemaker/NotebookInstances</code> in log stream <code>[notebook-instance-name]/[LifecycleConfigHook]</code>.</p> <p>Lifecycle configuration scripts cannot run for longer than 5 minutes. If a script runs for longer than 5 minutes, it fails and the notebook instance is not created or started.</p> <p>For information about notebook instance lifestyle configurations, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html\\\">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>\"\
    },\
    \"NotebookInstanceName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"NotebookInstanceNameContains\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"[a-zA-Z0-9-]+\"\
    },\
    \"NotebookInstanceSortKey\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\",\
        \"Status\"\
      ]\
    },\
    \"NotebookInstanceSortOrder\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Ascending\",\
        \"Descending\"\
      ]\
    },\
    \"NotebookInstanceStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pending\",\
        \"InService\",\
        \"Stopping\",\
        \"Stopped\",\
        \"Failed\",\
        \"Deleting\",\
        \"Updating\"\
      ]\
    },\
    \"NotebookInstanceSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"NotebookInstanceName\",\
        \"NotebookInstanceArn\"\
      ],\
      \"members\":{\
        \"NotebookInstanceName\":{\
          \"shape\":\"NotebookInstanceName\",\
          \"documentation\":\"<p>The name of the notebook instance that you want a summary for.</p>\"\
        },\
        \"NotebookInstanceArn\":{\
          \"shape\":\"NotebookInstanceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the notebook instance.</p>\"\
        },\
        \"NotebookInstanceStatus\":{\
          \"shape\":\"NotebookInstanceStatus\",\
          \"documentation\":\"<p>The status of the notebook instance.</p>\"\
        },\
        \"Url\":{\
          \"shape\":\"NotebookInstanceUrl\",\
          \"documentation\":\"<p>The URL that you use to connect to the Jupyter instance running in your notebook instance. </p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The type of ML compute instance that the notebook instance is running on.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>A timestamp that shows when the notebook instance was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>A timestamp that shows when the notebook instance was last modified.</p>\"\
        },\
        \"NotebookInstanceLifecycleConfigName\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigName\",\
          \"documentation\":\"<p>The name of a notebook instance lifecycle configuration associated with this notebook instance.</p> <p>For information about notebook instance lifestyle configurations, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html\\\">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>\"\
        },\
        \"DefaultCodeRepository\":{\
          \"shape\":\"CodeRepositoryNameOrUrl\",\
          \"documentation\":\"<p>The Git repository associated with the notebook instance as its default code repository. This can be either the name of a Git repository stored as a resource in your account, or the URL of a Git repository in <a href=\\\"https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html\\\">AWS CodeCommit</a> or in any other Git repository. When you open a notebook instance, it opens in the directory that contains this repository. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html\\\">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>\"\
        },\
        \"AdditionalCodeRepositories\":{\
          \"shape\":\"AdditionalCodeRepositoryNamesOrUrls\",\
          \"documentation\":\"<p>An array of up to three Git repositories associated with the notebook instance. These can be either the names of Git repositories stored as resources in your account, or the URL of Git repositories in <a href=\\\"https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html\\\">AWS CodeCommit</a> or in any other Git repository. These repositories are cloned at the same level as the default repository of your notebook instance. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html\\\">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information for an Amazon SageMaker notebook instance.</p>\"\
    },\
    \"NotebookInstanceSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NotebookInstanceSummary\"}\
    },\
    \"NotebookInstanceUrl\":{\"type\":\"string\"},\
    \"NotebookInstanceVolumeSizeInGB\":{\
      \"type\":\"integer\",\
      \"max\":16384,\
      \"min\":5\
    },\
    \"NotebookOutputOption\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Allowed\",\
        \"Disabled\"\
      ]\
    },\
    \"NotificationConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NotificationTopicArn\":{\
          \"shape\":\"NotificationTopicArn\",\
          \"documentation\":\"<p>The ARN for the SNS topic to which notifications should be published.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configures SNS notifications of available or expiring work items for work teams.</p>\"\
    },\
    \"NotificationTopicArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sns:[a-z0-9\\\\-]*:[0-9]{12}:[a-zA-Z0-9_.-]*\"\
    },\
    \"NumberOfHumanWorkersPerDataObject\":{\
      \"type\":\"integer\",\
      \"max\":9,\
      \"min\":1\
    },\
    \"ObjectiveStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Succeeded\",\
        \"Pending\",\
        \"Failed\"\
      ]\
    },\
    \"ObjectiveStatusCounter\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"ObjectiveStatusCounters\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Succeeded\":{\
          \"shape\":\"ObjectiveStatusCounter\",\
          \"documentation\":\"<p>The number of training jobs whose final objective metric was evaluated by the hyperparameter tuning job and used in the hyperparameter tuning process.</p>\"\
        },\
        \"Pending\":{\
          \"shape\":\"ObjectiveStatusCounter\",\
          \"documentation\":\"<p>The number of training jobs that are in progress and pending evaluation of their final objective metric.</p>\"\
        },\
        \"Failed\":{\
          \"shape\":\"ObjectiveStatusCounter\",\
          \"documentation\":\"<p>The number of training jobs whose final objective metric was not evaluated and used in the hyperparameter tuning process. This typically occurs when the training job failed or did not emit an objective metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the number of training jobs that this hyperparameter tuning job launched, categorized by the status of their objective metric. The objective metric status shows whether the final objective metric for the training job has been evaluated by the tuning job and used in the hyperparameter tuning process.</p>\"\
    },\
    \"Operator\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Equals\",\
        \"NotEquals\",\
        \"GreaterThan\",\
        \"GreaterThanOrEqualTo\",\
        \"LessThan\",\
        \"LessThanOrEqualTo\",\
        \"Contains\",\
        \"Exists\",\
        \"NotExists\",\
        \"In\"\
      ]\
    },\
    \"OptionalDouble\":{\"type\":\"double\"},\
    \"OptionalInteger\":{\"type\":\"integer\"},\
    \"OptionalVolumeSizeInGB\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"OrderKey\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Ascending\",\
        \"Descending\"\
      ]\
    },\
    \"OutputConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"S3OutputLocation\",\
        \"TargetDevice\"\
      ],\
      \"members\":{\
        \"S3OutputLocation\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>Identifies the S3 path where you want Amazon SageMaker to store the model artifacts. For example, s3://bucket-name/key-name-prefix.</p>\"\
        },\
        \"TargetDevice\":{\
          \"shape\":\"TargetDevice\",\
          \"documentation\":\"<p>Identifies the device that you want to run your model on after it has been compiled. For example: ml_c5.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the output location for the compiled model and the device (target) that the model runs on.</p>\"\
    },\
    \"OutputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3OutputPath\"],\
      \"members\":{\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the model artifacts at rest using Amazon S3 server-side encryption. The <code>KmsKeyId</code> can be any of the following formats: </p> <ul> <li> <p>// KMS Key ID</p> <p> <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>// Amazon Resource Name (ARN) of a KMS Key</p> <p> <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>// KMS Key Alias</p> <p> <code>\\\"alias/ExampleAlias\\\"</code> </p> </li> <li> <p>// Amazon Resource Name (ARN) of a KMS Key Alias</p> <p> <code>\\\"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias\\\"</code> </p> </li> </ul> <p>If you use a KMS key ID or an alias of your master key, the Amazon SageMaker execution role must include permissions to call <code>kms:Encrypt</code>. If you don't provide a KMS key ID, Amazon SageMaker uses the default KMS key for Amazon S3 for your role's account. Amazon SageMaker uses server-side encryption with KMS-managed keys for <code>OutputDataConfig</code>. If you use a bucket policy with an <code>s3:PutObject</code> permission that only allows objects with server-side encryption, set the condition key of <code>s3:x-amz-server-side-encryption</code> to <code>\\\"aws:kms\\\"</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html\\\">KMS-Managed Encryption Keys</a> in the <i>Amazon Simple Storage Service Developer Guide.</i> </p> <p>The KMS key policy must grant permission to the IAM role that you specify in your <code>CreateTrainingJob</code>, <code>CreateTransformJob</code>, or <code>CreateHyperParameterTuningJob</code> requests. For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html\\\">Using Key Policies in AWS KMS</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        },\
        \"S3OutputPath\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>Identifies the S3 path where you want Amazon SageMaker to store the model artifacts. For example, <code>s3://bucket-name/key-name-prefix</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about how to store model training results (model artifacts).</p>\"\
    },\
    \"PaginationToken\":{\
      \"type\":\"string\",\
      \"max\":8192,\
      \"pattern\":\".*\"\
    },\
    \"ParameterKey\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\".*\"\
    },\
    \"ParameterName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{Z}\\\\p{S}\\\\p{N}\\\\p{P}]*\"\
    },\
    \"ParameterRange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IntegerParameterRangeSpecification\":{\
          \"shape\":\"IntegerParameterRangeSpecification\",\
          \"documentation\":\"<p>A <code>IntegerParameterRangeSpecification</code> object that defines the possible values for an integer hyperparameter.</p>\"\
        },\
        \"ContinuousParameterRangeSpecification\":{\
          \"shape\":\"ContinuousParameterRangeSpecification\",\
          \"documentation\":\"<p>A <code>ContinuousParameterRangeSpecification</code> object that defines the possible values for a continuous hyperparameter.</p>\"\
        },\
        \"CategoricalParameterRangeSpecification\":{\
          \"shape\":\"CategoricalParameterRangeSpecification\",\
          \"documentation\":\"<p>A <code>CategoricalParameterRangeSpecification</code> object that defines the possible values for a categorical hyperparameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines the possible values for categorical, continuous, and integer hyperparameters to be used by an algorithm.</p>\"\
    },\
    \"ParameterRanges\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IntegerParameterRanges\":{\
          \"shape\":\"IntegerParameterRanges\",\
          \"documentation\":\"<p>The array of <a>IntegerParameterRange</a> objects that specify ranges of integer hyperparameters that a hyperparameter tuning job searches.</p>\"\
        },\
        \"ContinuousParameterRanges\":{\
          \"shape\":\"ContinuousParameterRanges\",\
          \"documentation\":\"<p>The array of <a>ContinuousParameterRange</a> objects that specify ranges of continuous hyperparameters that a hyperparameter tuning job searches.</p>\"\
        },\
        \"CategoricalParameterRanges\":{\
          \"shape\":\"CategoricalParameterRanges\",\
          \"documentation\":\"<p>The array of <a>CategoricalParameterRange</a> objects that specify ranges of categorical hyperparameters that a hyperparameter tuning job searches.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies ranges of integer, continuous, and categorical hyperparameters that a hyperparameter tuning job searches. The hyperparameter tuning job launches training jobs with hyperparameter values within these ranges to find the combination of values that result in the training job with the best performance as measured by the objective metric of the hyperparameter tuning job.</p> <note> <p>You can specify a maximum of 20 hyperparameters that a hyperparameter tuning job can search over. Every possible value of a categorical parameter range counts against this limit.</p> </note>\"\
    },\
    \"ParameterType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Integer\",\
        \"Continuous\",\
        \"Categorical\",\
        \"FreeText\"\
      ]\
    },\
    \"ParameterValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\".*\"\
    },\
    \"ParameterValues\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ParameterValue\"},\
      \"max\":20,\
      \"min\":1\
    },\
    \"Parent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial.</p>\"\
        },\
        \"ExperimentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The trial that a trial component is associated with and the experiment the trial is part of. A component might not be associated with a trial. A component can be associated with multiple trials.</p>\"\
    },\
    \"ParentHyperParameterTuningJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HyperParameterTuningJobName\":{\
          \"shape\":\"HyperParameterTuningJobName\",\
          \"documentation\":\"<p>The name of the hyperparameter tuning job to be used as a starting point for a new hyperparameter tuning job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A previously completed or stopped hyperparameter tuning job to be used as a starting point for a new hyperparameter tuning job.</p>\"\
    },\
    \"ParentHyperParameterTuningJobs\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ParentHyperParameterTuningJob\"},\
      \"max\":5,\
      \"min\":1\
    },\
    \"Parents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Parent\"}\
    },\
    \"PresignedDomainUrl\":{\"type\":\"string\"},\
    \"ProblemType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"BinaryClassification\",\
        \"MulticlassClassification\",\
        \"Regression\"\
      ]\
    },\
    \"ProcessingClusterConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceCount\",\
        \"InstanceType\",\
        \"VolumeSizeInGB\"\
      ],\
      \"members\":{\
        \"InstanceCount\":{\
          \"shape\":\"ProcessingInstanceCount\",\
          \"documentation\":\"<p>The number of ML compute instances to use in the processing job. For distributed processing jobs, specify a value greater than 1. The default value is 1.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"ProcessingInstanceType\",\
          \"documentation\":\"<p>The ML compute instance type for the processing job.</p>\"\
        },\
        \"VolumeSizeInGB\":{\
          \"shape\":\"ProcessingVolumeSizeInGB\",\
          \"documentation\":\"<p>The size of the ML storage volume in gigabytes that you want to provision. You must specify sufficient ML storage for your scenario.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance(s) that run the processing job. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration for the cluster used to run a processing job.</p>\"\
    },\
    \"ProcessingEnvironmentKey\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"[a-zA-Z_][a-zA-Z0-9_]*\"\
    },\
    \"ProcessingEnvironmentMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ProcessingEnvironmentKey\"},\
      \"value\":{\"shape\":\"ProcessingEnvironmentValue\"},\
      \"max\":100\
    },\
    \"ProcessingEnvironmentValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"[\\\\S\\\\s]*\"\
    },\
    \"ProcessingInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputName\",\
        \"S3Input\"\
      ],\
      \"members\":{\
        \"InputName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the inputs for the processing job.</p>\"\
        },\
        \"S3Input\":{\
          \"shape\":\"ProcessingS3Input\",\
          \"documentation\":\"<p>The S3 inputs for the processing job. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The inputs for a processing job.</p>\"\
    },\
    \"ProcessingInputs\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProcessingInput\"},\
      \"max\":10,\
      \"min\":0\
    },\
    \"ProcessingInstanceCount\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"ProcessingInstanceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ml.t3.medium\",\
        \"ml.t3.large\",\
        \"ml.t3.xlarge\",\
        \"ml.t3.2xlarge\",\
        \"ml.m4.xlarge\",\
        \"ml.m4.2xlarge\",\
        \"ml.m4.4xlarge\",\
        \"ml.m4.10xlarge\",\
        \"ml.m4.16xlarge\",\
        \"ml.c4.xlarge\",\
        \"ml.c4.2xlarge\",\
        \"ml.c4.4xlarge\",\
        \"ml.c4.8xlarge\",\
        \"ml.p2.xlarge\",\
        \"ml.p2.8xlarge\",\
        \"ml.p2.16xlarge\",\
        \"ml.p3.2xlarge\",\
        \"ml.p3.8xlarge\",\
        \"ml.p3.16xlarge\",\
        \"ml.c5.xlarge\",\
        \"ml.c5.2xlarge\",\
        \"ml.c5.4xlarge\",\
        \"ml.c5.9xlarge\",\
        \"ml.c5.18xlarge\",\
        \"ml.m5.large\",\
        \"ml.m5.xlarge\",\
        \"ml.m5.2xlarge\",\
        \"ml.m5.4xlarge\",\
        \"ml.m5.12xlarge\",\
        \"ml.m5.24xlarge\",\
        \"ml.r5.large\",\
        \"ml.r5.xlarge\",\
        \"ml.r5.2xlarge\",\
        \"ml.r5.4xlarge\",\
        \"ml.r5.8xlarge\",\
        \"ml.r5.12xlarge\",\
        \"ml.r5.16xlarge\",\
        \"ml.r5.24xlarge\"\
      ]\
    },\
    \"ProcessingJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProcessingInputs\":{\
          \"shape\":\"ProcessingInputs\",\
          \"documentation\":\"<p>For each input, data is downloaded from S3 into the processing container before the processing job begins running if \\\"S3InputMode\\\" is set to <code>File</code>.</p>\"\
        },\
        \"ProcessingOutputConfig\":{\"shape\":\"ProcessingOutputConfig\"},\
        \"ProcessingJobName\":{\
          \"shape\":\"ProcessingJobName\",\
          \"documentation\":\"<p>The name of the processing job.</p>\"\
        },\
        \"ProcessingResources\":{\"shape\":\"ProcessingResources\"},\
        \"StoppingCondition\":{\"shape\":\"ProcessingStoppingCondition\"},\
        \"AppSpecification\":{\"shape\":\"AppSpecification\"},\
        \"Environment\":{\
          \"shape\":\"ProcessingEnvironmentMap\",\
          \"documentation\":\"<p>Sets the environment variables in the Docker container.</p>\"\
        },\
        \"NetworkConfig\":{\"shape\":\"NetworkConfig\"},\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of the role used to create the processing job.</p>\"\
        },\
        \"ExperimentConfig\":{\"shape\":\"ExperimentConfig\"},\
        \"ProcessingJobArn\":{\
          \"shape\":\"ProcessingJobArn\",\
          \"documentation\":\"<p>The ARN of the processing job.</p>\"\
        },\
        \"ProcessingJobStatus\":{\
          \"shape\":\"ProcessingJobStatus\",\
          \"documentation\":\"<p>The status of the processing job.</p>\"\
        },\
        \"ExitMessage\":{\
          \"shape\":\"ExitMessage\",\
          \"documentation\":\"<p>A string, up to one KB in size, that contains metadata from the processing container when the processing job exits.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>A string, up to one KB in size, that contains the reason a processing job failed, if it failed.</p>\"\
        },\
        \"ProcessingEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the processing job ended.</p>\"\
        },\
        \"ProcessingStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the processing job started.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the processing job was last modified.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the processing job was created.</p>\"\
        },\
        \"MonitoringScheduleArn\":{\
          \"shape\":\"MonitoringScheduleArn\",\
          \"documentation\":\"<p>The ARN of a monitoring schedule for an endpoint associated with this processing job.</p>\"\
        },\
        \"AutoMLJobArn\":{\
          \"shape\":\"AutoMLJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AutoML job associated with this processing job.</p>\"\
        },\
        \"TrainingJobArn\":{\
          \"shape\":\"TrainingJobArn\",\
          \"documentation\":\"<p>The ARN of the training job associated with this processing job.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of key-value pairs. For more information, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL\\\">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An Amazon SageMaker processing job that is used to analyze data and evaluate models. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/processing-job.html\\\">Process Data and Evaluate Models</a>.</p>\"\
    },\
    \"ProcessingJobArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:processing-job/.*\"\
    },\
    \"ProcessingJobName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"ProcessingJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"InProgress\",\
        \"Completed\",\
        \"Failed\",\
        \"Stopping\",\
        \"Stopped\"\
      ]\
    },\
    \"ProcessingJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProcessingJobSummary\"}\
    },\
    \"ProcessingJobSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ProcessingJobName\",\
        \"ProcessingJobArn\",\
        \"CreationTime\",\
        \"ProcessingJobStatus\"\
      ],\
      \"members\":{\
        \"ProcessingJobName\":{\
          \"shape\":\"ProcessingJobName\",\
          \"documentation\":\"<p>The name of the processing job.</p>\"\
        },\
        \"ProcessingJobArn\":{\
          \"shape\":\"ProcessingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the processing job..</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the processing job was created.</p>\"\
        },\
        \"ProcessingEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the processing job completed.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that indicates the last time the processing job was modified.</p>\"\
        },\
        \"ProcessingJobStatus\":{\
          \"shape\":\"ProcessingJobStatus\",\
          \"documentation\":\"<p>The status of the processing job.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>A string, up to one KB in size, that contains the reason a processing job failed, if it failed.</p>\"\
        },\
        \"ExitMessage\":{\
          \"shape\":\"ExitMessage\",\
          \"documentation\":\"<p>An optional string, up to one KB in size, that contains metadata from the processing container when the processing job exits.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of information about a processing job.</p>\"\
    },\
    \"ProcessingLocalPath\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\".*\"\
    },\
    \"ProcessingMaxRuntimeInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":604800,\
      \"min\":1\
    },\
    \"ProcessingOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"OutputName\",\
        \"S3Output\"\
      ],\
      \"members\":{\
        \"OutputName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name for the processing job output.</p>\"\
        },\
        \"S3Output\":{\
          \"shape\":\"ProcessingS3Output\",\
          \"documentation\":\"<p>Configuration for processing job outputs in Amazon S3.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the results of a processing job.</p>\"\
    },\
    \"ProcessingOutputConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"Outputs\"],\
      \"members\":{\
        \"Outputs\":{\
          \"shape\":\"ProcessingOutputs\",\
          \"documentation\":\"<p>Output configuration information for a processing job.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the processing job output. <code>KmsKeyId</code> can be an ID of a KMS key, ARN of a KMS key, alias of a KMS key, or alias of a KMS key. The <code>KmsKeyId</code> is applied to all outputs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output configuration for the processing job.</p>\"\
    },\
    \"ProcessingOutputs\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProcessingOutput\"},\
      \"max\":10,\
      \"min\":0\
    },\
    \"ProcessingResources\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClusterConfig\"],\
      \"members\":{\
        \"ClusterConfig\":{\
          \"shape\":\"ProcessingClusterConfig\",\
          \"documentation\":\"<p>The configuration for the resources in a cluster used to run the processing job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies the resources, ML compute instances, and ML storage volumes to deploy for a processing job. In distributed training, you specify more than one instance.</p>\"\
    },\
    \"ProcessingS3CompressionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"None\",\
        \"Gzip\"\
      ]\
    },\
    \"ProcessingS3DataDistributionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FullyReplicated\",\
        \"ShardedByS3Key\"\
      ]\
    },\
    \"ProcessingS3DataType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ManifestFile\",\
        \"S3Prefix\"\
      ]\
    },\
    \"ProcessingS3Input\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"S3Uri\",\
        \"LocalPath\",\
        \"S3DataType\",\
        \"S3InputMode\"\
      ],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The URI for the Amazon S3 storage where you want Amazon SageMaker to download the artifacts needed to run a processing job.</p>\"\
        },\
        \"LocalPath\":{\
          \"shape\":\"ProcessingLocalPath\",\
          \"documentation\":\"<p>The local path to the Amazon S3 bucket where you want Amazon SageMaker to download the inputs to run a processing job. <code>LocalPath</code> is an absolute path to the input data.</p>\"\
        },\
        \"S3DataType\":{\
          \"shape\":\"ProcessingS3DataType\",\
          \"documentation\":\"<p>Whether you use an <code>S3Prefix</code> or a <code>ManifestFile</code> for the data type. If you choose <code>S3Prefix</code>, <code>S3Uri</code> identifies a key name prefix. Amazon SageMaker uses all objects with the specified key name prefix for the processing job. If you choose <code>ManifestFile</code>, <code>S3Uri</code> identifies an object that is a manifest file containing a list of object keys that you want Amazon SageMaker to use for the processing job.</p>\"\
        },\
        \"S3InputMode\":{\
          \"shape\":\"ProcessingS3InputMode\",\
          \"documentation\":\"<p>Whether to use <code>File</code> or <code>Pipe</code> input mode. In <code>File</code> mode, Amazon SageMaker copies the data from the input source onto the local Amazon Elastic Block Store (Amazon EBS) volumes before starting your training algorithm. This is the most commonly used input mode. In <code>Pipe</code> mode, Amazon SageMaker streams input data from the source directly to your algorithm without using the EBS volume.</p>\"\
        },\
        \"S3DataDistributionType\":{\
          \"shape\":\"ProcessingS3DataDistributionType\",\
          \"documentation\":\"<p>Whether the data stored in Amazon S3 is <code>FullyReplicated</code> or <code>ShardedByS3Key</code>.</p>\"\
        },\
        \"S3CompressionType\":{\
          \"shape\":\"ProcessingS3CompressionType\",\
          \"documentation\":\"<p>Whether to use <code>Gzip</code> compression for Amazon S3 storage.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about where and how you want to obtain the inputs for an processing job.</p>\"\
    },\
    \"ProcessingS3InputMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pipe\",\
        \"File\"\
      ]\
    },\
    \"ProcessingS3Output\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"S3Uri\",\
        \"LocalPath\",\
        \"S3UploadMode\"\
      ],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>A URI that identifies the Amazon S3 bucket where you want Amazon SageMaker to save the results of a processing job.</p>\"\
        },\
        \"LocalPath\":{\
          \"shape\":\"ProcessingLocalPath\",\
          \"documentation\":\"<p>The local path to the Amazon S3 bucket where you want Amazon SageMaker to save the results of an processing job. <code>LocalPath</code> is an absolute path to the input data.</p>\"\
        },\
        \"S3UploadMode\":{\
          \"shape\":\"ProcessingS3UploadMode\",\
          \"documentation\":\"<p>Whether to upload the results of the processing job continuously or after the job completes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about where and how you want to store the results of an processing job.</p>\"\
    },\
    \"ProcessingS3UploadMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Continuous\",\
        \"EndOfJob\"\
      ]\
    },\
    \"ProcessingStoppingCondition\":{\
      \"type\":\"structure\",\
      \"required\":[\"MaxRuntimeInSeconds\"],\
      \"members\":{\
        \"MaxRuntimeInSeconds\":{\
          \"shape\":\"ProcessingMaxRuntimeInSeconds\",\
          \"documentation\":\"<p>Specifies the maximum runtime in seconds.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a time limit for how long the processing job is allowed to run.</p>\"\
    },\
    \"ProcessingVolumeSizeInGB\":{\
      \"type\":\"integer\",\
      \"max\":16384,\
      \"min\":1\
    },\
    \"ProductId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$\"\
    },\
    \"ProductListings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"ProductionVariant\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VariantName\",\
        \"ModelName\",\
        \"InitialInstanceCount\",\
        \"InstanceType\"\
      ],\
      \"members\":{\
        \"VariantName\":{\
          \"shape\":\"VariantName\",\
          \"documentation\":\"<p>The name of the production variant.</p>\"\
        },\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the model that you want to host. This is the name that you specified when creating the model.</p>\"\
        },\
        \"InitialInstanceCount\":{\
          \"shape\":\"TaskCount\",\
          \"documentation\":\"<p>Number of instances to launch initially.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"ProductionVariantInstanceType\",\
          \"documentation\":\"<p>The ML compute instance type.</p>\"\
        },\
        \"InitialVariantWeight\":{\
          \"shape\":\"VariantWeight\",\
          \"documentation\":\"<p>Determines initial traffic distribution among all of the models that you specify in the endpoint configuration. The traffic to a production variant is determined by the ratio of the <code>VariantWeight</code> to the sum of all <code>VariantWeight</code> values across all ProductionVariants. If unspecified, it defaults to 1.0. </p>\"\
        },\
        \"AcceleratorType\":{\
          \"shape\":\"ProductionVariantAcceleratorType\",\
          \"documentation\":\"<p>The size of the Elastic Inference (EI) instance to use for the production variant. EI instances provide on-demand GPU computing for inference. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html\\\">Using Elastic Inference in Amazon SageMaker</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies a model that you want to host and the resources to deploy for hosting it. If you are deploying multiple models, tell Amazon SageMaker how to distribute traffic among the models by specifying variant weights. </p>\"\
    },\
    \"ProductionVariantAcceleratorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ml.eia1.medium\",\
        \"ml.eia1.large\",\
        \"ml.eia1.xlarge\",\
        \"ml.eia2.medium\",\
        \"ml.eia2.large\",\
        \"ml.eia2.xlarge\"\
      ]\
    },\
    \"ProductionVariantInstanceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ml.t2.medium\",\
        \"ml.t2.large\",\
        \"ml.t2.xlarge\",\
        \"ml.t2.2xlarge\",\
        \"ml.m4.xlarge\",\
        \"ml.m4.2xlarge\",\
        \"ml.m4.4xlarge\",\
        \"ml.m4.10xlarge\",\
        \"ml.m4.16xlarge\",\
        \"ml.m5.large\",\
        \"ml.m5.xlarge\",\
        \"ml.m5.2xlarge\",\
        \"ml.m5.4xlarge\",\
        \"ml.m5.12xlarge\",\
        \"ml.m5.24xlarge\",\
        \"ml.m5d.large\",\
        \"ml.m5d.xlarge\",\
        \"ml.m5d.2xlarge\",\
        \"ml.m5d.4xlarge\",\
        \"ml.m5d.12xlarge\",\
        \"ml.m5d.24xlarge\",\
        \"ml.c4.large\",\
        \"ml.c4.xlarge\",\
        \"ml.c4.2xlarge\",\
        \"ml.c4.4xlarge\",\
        \"ml.c4.8xlarge\",\
        \"ml.p2.xlarge\",\
        \"ml.p2.8xlarge\",\
        \"ml.p2.16xlarge\",\
        \"ml.p3.2xlarge\",\
        \"ml.p3.8xlarge\",\
        \"ml.p3.16xlarge\",\
        \"ml.c5.large\",\
        \"ml.c5.xlarge\",\
        \"ml.c5.2xlarge\",\
        \"ml.c5.4xlarge\",\
        \"ml.c5.9xlarge\",\
        \"ml.c5.18xlarge\",\
        \"ml.c5d.large\",\
        \"ml.c5d.xlarge\",\
        \"ml.c5d.2xlarge\",\
        \"ml.c5d.4xlarge\",\
        \"ml.c5d.9xlarge\",\
        \"ml.c5d.18xlarge\",\
        \"ml.g4dn.xlarge\",\
        \"ml.g4dn.2xlarge\",\
        \"ml.g4dn.4xlarge\",\
        \"ml.g4dn.8xlarge\",\
        \"ml.g4dn.12xlarge\",\
        \"ml.g4dn.16xlarge\",\
        \"ml.r5.large\",\
        \"ml.r5.xlarge\",\
        \"ml.r5.2xlarge\",\
        \"ml.r5.4xlarge\",\
        \"ml.r5.12xlarge\",\
        \"ml.r5.24xlarge\",\
        \"ml.r5d.large\",\
        \"ml.r5d.xlarge\",\
        \"ml.r5d.2xlarge\",\
        \"ml.r5d.4xlarge\",\
        \"ml.r5d.12xlarge\",\
        \"ml.r5d.24xlarge\",\
        \"ml.inf1.xlarge\",\
        \"ml.inf1.2xlarge\",\
        \"ml.inf1.6xlarge\",\
        \"ml.inf1.24xlarge\"\
      ]\
    },\
    \"ProductionVariantList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProductionVariant\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"ProductionVariantSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\"VariantName\"],\
      \"members\":{\
        \"VariantName\":{\
          \"shape\":\"VariantName\",\
          \"documentation\":\"<p>The name of the variant.</p>\"\
        },\
        \"DeployedImages\":{\
          \"shape\":\"DeployedImages\",\
          \"documentation\":\"<p>An array of <code>DeployedImage</code> objects that specify the Amazon EC2 Container Registry paths of the inference images deployed on instances of this <code>ProductionVariant</code>.</p>\"\
        },\
        \"CurrentWeight\":{\
          \"shape\":\"VariantWeight\",\
          \"documentation\":\"<p>The weight associated with the variant.</p>\"\
        },\
        \"DesiredWeight\":{\
          \"shape\":\"VariantWeight\",\
          \"documentation\":\"<p>The requested weight, as specified in the <code>UpdateEndpointWeightsAndCapacities</code> request. </p>\"\
        },\
        \"CurrentInstanceCount\":{\
          \"shape\":\"TaskCount\",\
          \"documentation\":\"<p>The number of instances associated with the variant.</p>\"\
        },\
        \"DesiredInstanceCount\":{\
          \"shape\":\"TaskCount\",\
          \"documentation\":\"<p>The number of instances requested in the <code>UpdateEndpointWeightsAndCapacities</code> request. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes weight and capacities for a production variant associated with an endpoint. If you sent a request to the <code>UpdateEndpointWeightsAndCapacities</code> API and the endpoint status is <code>Updating</code>, you get different desired and current values. </p>\"\
    },\
    \"ProductionVariantSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProductionVariantSummary\"},\
      \"min\":1\
    },\
    \"PropertyNameHint\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":0,\
      \"pattern\":\".*\"\
    },\
    \"PropertyNameQuery\":{\
      \"type\":\"structure\",\
      \"required\":[\"PropertyNameHint\"],\
      \"members\":{\
        \"PropertyNameHint\":{\
          \"shape\":\"PropertyNameHint\",\
          \"documentation\":\"<p>Text that begins a property's name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Part of the <code>SuggestionQuery</code> type. Specifies a hint for retrieving property names that begin with the specified text.</p>\"\
    },\
    \"PropertyNameSuggestion\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PropertyName\":{\
          \"shape\":\"ResourcePropertyName\",\
          \"documentation\":\"<p>A suggested property name based on what you entered in the search textbox in the Amazon SageMaker console.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A property name returned from a <code>GetSearchSuggestions</code> call that specifies a value in the <code>PropertyNameQuery</code> field.</p>\"\
    },\
    \"PropertyNameSuggestionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PropertyNameSuggestion\"}\
    },\
    \"PublicWorkforceTaskPrice\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AmountInUsd\":{\
          \"shape\":\"USD\",\
          \"documentation\":\"<p>Defines the amount of money paid to an Amazon Mechanical Turk worker in United States dollars.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines the amount of money paid to an Amazon Mechanical Turk worker for each task performed. </p> <p>Use one of the following prices for bounding box tasks. Prices are in US dollars and should be based on the complexity of the task; the longer it takes in your initial testing, the more you should offer.</p> <ul> <li> <p>0.036</p> </li> <li> <p>0.048</p> </li> <li> <p>0.060</p> </li> <li> <p>0.072</p> </li> <li> <p>0.120</p> </li> <li> <p>0.240</p> </li> <li> <p>0.360</p> </li> <li> <p>0.480</p> </li> <li> <p>0.600</p> </li> <li> <p>0.720</p> </li> <li> <p>0.840</p> </li> <li> <p>0.960</p> </li> <li> <p>1.080</p> </li> <li> <p>1.200</p> </li> </ul> <p>Use one of the following prices for image classification, text classification, and custom tasks. Prices are in US dollars.</p> <ul> <li> <p>0.012</p> </li> <li> <p>0.024</p> </li> <li> <p>0.036</p> </li> <li> <p>0.048</p> </li> <li> <p>0.060</p> </li> <li> <p>0.072</p> </li> <li> <p>0.120</p> </li> <li> <p>0.240</p> </li> <li> <p>0.360</p> </li> <li> <p>0.480</p> </li> <li> <p>0.600</p> </li> <li> <p>0.720</p> </li> <li> <p>0.840</p> </li> <li> <p>0.960</p> </li> <li> <p>1.080</p> </li> <li> <p>1.200</p> </li> </ul> <p>Use one of the following prices for semantic segmentation tasks. Prices are in US dollars.</p> <ul> <li> <p>0.840</p> </li> <li> <p>0.960</p> </li> <li> <p>1.080</p> </li> <li> <p>1.200</p> </li> </ul> <p>Use one of the following prices for Textract AnalyzeDocument Important Form Key Amazon Augmented AI review tasks. Prices are in US dollars.</p> <ul> <li> <p>2.400 </p> </li> <li> <p>2.280 </p> </li> <li> <p>2.160 </p> </li> <li> <p>2.040 </p> </li> <li> <p>1.920 </p> </li> <li> <p>1.800 </p> </li> <li> <p>1.680 </p> </li> <li> <p>1.560 </p> </li> <li> <p>1.440 </p> </li> <li> <p>1.320 </p> </li> <li> <p>1.200 </p> </li> <li> <p>1.080 </p> </li> <li> <p>0.960 </p> </li> <li> <p>0.840 </p> </li> <li> <p>0.720 </p> </li> <li> <p>0.600 </p> </li> <li> <p>0.480 </p> </li> <li> <p>0.360 </p> </li> <li> <p>0.240 </p> </li> <li> <p>0.120 </p> </li> <li> <p>0.072 </p> </li> <li> <p>0.060 </p> </li> <li> <p>0.048 </p> </li> <li> <p>0.036 </p> </li> <li> <p>0.024 </p> </li> <li> <p>0.012 </p> </li> </ul> <p>Use one of the following prices for Rekognition DetectModerationLabels Amazon Augmented AI review tasks. Prices are in US dollars.</p> <ul> <li> <p>1.200 </p> </li> <li> <p>1.080 </p> </li> <li> <p>0.960 </p> </li> <li> <p>0.840 </p> </li> <li> <p>0.720 </p> </li> <li> <p>0.600 </p> </li> <li> <p>0.480 </p> </li> <li> <p>0.360 </p> </li> <li> <p>0.240 </p> </li> <li> <p>0.120 </p> </li> <li> <p>0.072 </p> </li> <li> <p>0.060 </p> </li> <li> <p>0.048 </p> </li> <li> <p>0.036 </p> </li> <li> <p>0.024 </p> </li> <li> <p>0.012 </p> </li> </ul> <p>Use one of the following prices for Amazon Augmented AI custom human review tasks. Prices are in US dollars.</p> <ul> <li> <p>1.200 </p> </li> <li> <p>1.080 </p> </li> <li> <p>0.960 </p> </li> <li> <p>0.840 </p> </li> <li> <p>0.720 </p> </li> <li> <p>0.600 </p> </li> <li> <p>0.480 </p> </li> <li> <p>0.360 </p> </li> <li> <p>0.240 </p> </li> <li> <p>0.120 </p> </li> <li> <p>0.072 </p> </li> <li> <p>0.060 </p> </li> <li> <p>0.048 </p> </li> <li> <p>0.036 </p> </li> <li> <p>0.024 </p> </li> <li> <p>0.012 </p> </li> </ul>\"\
    },\
    \"RealtimeInferenceInstanceTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProductionVariantInstanceType\"}\
    },\
    \"RecordWrapper\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"None\",\
        \"RecordIO\"\
      ]\
    },\
    \"RenderUiTemplateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Task\",\
        \"RoleArn\"\
      ],\
      \"members\":{\
        \"UiTemplate\":{\
          \"shape\":\"UiTemplate\",\
          \"documentation\":\"<p>A <code>Template</code> object containing the worker UI template to render.</p>\"\
        },\
        \"Task\":{\
          \"shape\":\"RenderableTask\",\
          \"documentation\":\"<p>A <code>RenderableTask</code> object containing a representative task to render.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that has access to the S3 objects that are used by the template.</p>\"\
        }\
      }\
    },\
    \"RenderUiTemplateResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RenderedContent\",\
        \"Errors\"\
      ],\
      \"members\":{\
        \"RenderedContent\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A Liquid template that renders the HTML for the worker UI.</p>\"\
        },\
        \"Errors\":{\
          \"shape\":\"RenderingErrorList\",\
          \"documentation\":\"<p>A list of one or more <code>RenderingError</code> objects if any were encountered while rendering the template. If there were no errors, the list is empty.</p>\"\
        }\
      }\
    },\
    \"RenderableTask\":{\
      \"type\":\"structure\",\
      \"required\":[\"Input\"],\
      \"members\":{\
        \"Input\":{\
          \"shape\":\"TaskInput\",\
          \"documentation\":\"<p>A JSON object that contains values for the variables defined in the template. It is made available to the template under the substitution variable <code>task.input</code>. For example, if you define a variable <code>task.input.text</code> in your template, you can supply the variable in the JSON object as <code>\\\"text\\\": \\\"sample text\\\"</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains input values for a task.</p>\"\
    },\
    \"RenderingError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Code\",\
        \"Message\"\
      ],\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique identifier for a specific class of errors.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A human-readable message describing the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A description of an error that occurred while rendering the template.</p>\"\
    },\
    \"RenderingErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RenderingError\"}\
    },\
    \"ResolvedAttributes\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AutoMLJobObjective\":{\"shape\":\"AutoMLJobObjective\"},\
        \"ProblemType\":{\
          \"shape\":\"ProblemType\",\
          \"documentation\":\"<p>The problem type.</p>\"\
        },\
        \"CompletionCriteria\":{\"shape\":\"AutoMLJobCompletionCriteria\"}\
      },\
      \"documentation\":\"<p>The resolved attributes.</p>\"\
    },\
    \"ResourceArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:.*\"\
    },\
    \"ResourceConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceType\",\
        \"InstanceCount\",\
        \"VolumeSizeInGB\"\
      ],\
      \"members\":{\
        \"InstanceType\":{\
          \"shape\":\"TrainingInstanceType\",\
          \"documentation\":\"<p>The ML compute instance type. </p>\"\
        },\
        \"InstanceCount\":{\
          \"shape\":\"TrainingInstanceCount\",\
          \"documentation\":\"<p>The number of ML compute instances to use. For distributed training, provide a value greater than 1. </p>\"\
        },\
        \"VolumeSizeInGB\":{\
          \"shape\":\"VolumeSizeInGB\",\
          \"documentation\":\"<p>The size of the ML storage volume that you want to provision. </p> <p>ML storage volumes store model artifacts and incremental states. Training algorithms might also use the ML storage volume for scratch space. If you want to store the training data in the ML storage volume, choose <code>File</code> as the <code>TrainingInputMode</code> in the algorithm specification. </p> <p>You must specify sufficient ML storage for your scenario. </p> <note> <p> Amazon SageMaker supports only the General Purpose SSD (gp2) ML storage volume type. </p> </note> <note> <p>Certain Nitro-based instances include local storage with a fixed total size, dependent on the instance type. When using these instances for training, Amazon SageMaker mounts the local instance storage instead of Amazon EBS gp2 storage. You can't request a <code>VolumeSizeInGB</code> greater than the total size of the local instance storage.</p> <p>For a list of instance types that support local instance storage, including the total size per instance type, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html#instance-store-volumes\\\">Instance Store Volumes</a>.</p> </note>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS KMS key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance(s) that run the training job.</p> <note> <p>Certain Nitro-based instances include local storage, dependent on the instance type. Local storage volumes are encrypted using a hardware module on the instance. You can't request a <code>VolumeKmsKeyId</code> when using an instance type with local storage.</p> <p>For a list of instance types that support local instance storage, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html#instance-store-volumes\\\">Instance Store Volumes</a>.</p> <p>For more information about local instance storage encryption, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ssd-instance-store.html\\\">SSD Instance Store Volumes</a>.</p> </note> <p>The <code>VolumeKmsKeyId</code> can be in any of the following formats:</p> <ul> <li> <p>// KMS Key ID</p> <p> <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>// Amazon Resource Name (ARN) of a KMS Key</p> <p> <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the resources, including ML compute instances and ML storage volumes, to use for model training. </p>\"\
    },\
    \"ResourceId\":{\
      \"type\":\"string\",\
      \"max\":32\
    },\
    \"ResourceInUse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"FailureReason\"}\
      },\
      \"documentation\":\"<p>Resource being accessed is in use.</p>\",\
      \"exception\":true\
    },\
    \"ResourceLimitExceeded\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"FailureReason\"}\
      },\
      \"documentation\":\"<p> You have exceeded an Amazon SageMaker resource limit. For example, you might have too many training jobs created. </p>\",\
      \"exception\":true\
    },\
    \"ResourceLimits\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MaxNumberOfTrainingJobs\",\
        \"MaxParallelTrainingJobs\"\
      ],\
      \"members\":{\
        \"MaxNumberOfTrainingJobs\":{\
          \"shape\":\"MaxNumberOfTrainingJobs\",\
          \"documentation\":\"<p>The maximum number of training jobs that a hyperparameter tuning job can launch.</p>\"\
        },\
        \"MaxParallelTrainingJobs\":{\
          \"shape\":\"MaxParallelTrainingJobs\",\
          \"documentation\":\"<p>The maximum number of concurrent training jobs that a hyperparameter tuning job can launch.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the maximum number of training jobs and parallel training jobs that a hyperparameter tuning job can launch.</p>\"\
    },\
    \"ResourceNotFound\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"FailureReason\"}\
      },\
      \"documentation\":\"<p>Resource being access is not found.</p>\",\
      \"exception\":true\
    },\
    \"ResourcePropertyName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\".+\"\
    },\
    \"ResourceSpec\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SageMakerImageArn\":{\
          \"shape\":\"SageMakerImageArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the SageMaker image created on the instance.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"AppInstanceType\",\
          \"documentation\":\"<p>The instance type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance. The ARN is stored as metadata in Amazon SageMaker Studio notebooks.</p>\"\
    },\
    \"ResourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TrainingJob\",\
        \"Experiment\",\
        \"ExperimentTrial\",\
        \"ExperimentTrialComponent\"\
      ]\
    },\
    \"ResponseMIMEType\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"^[-\\\\w]+\\\\/.+$\"\
    },\
    \"ResponseMIMETypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResponseMIMEType\"}\
    },\
    \"RetentionPolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HomeEfsFileSystem\":{\
          \"shape\":\"RetentionType\",\
          \"documentation\":\"<p>The default is <code>Retain</code>, which specifies to keep the data stored on the EFS volume.</p> <p>Specify <code>Delete</code> to delete the data stored on the EFS volume.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The retention policy for data stored on an Amazon Elastic File System (EFS) volume.</p>\"\
    },\
    \"RetentionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Retain\",\
        \"Delete\"\
      ]\
    },\
    \"RoleArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"^arn:aws[a-z\\\\-]*:iam::\\\\d{12}:role/?[a-zA-Z_0-9+=,.@\\\\-_/]+$\"\
    },\
    \"RootAccess\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Enabled\",\
        \"Disabled\"\
      ]\
    },\
    \"RuleConfigurationName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\".*\"\
    },\
    \"RuleEvaluationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"InProgress\",\
        \"NoIssuesFound\",\
        \"IssuesFound\",\
        \"Error\",\
        \"Stopping\",\
        \"Stopped\"\
      ]\
    },\
    \"RuleParameters\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ConfigKey\"},\
      \"value\":{\"shape\":\"ConfigValue\"},\
      \"max\":20,\
      \"min\":0\
    },\
    \"S3DataDistribution\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FullyReplicated\",\
        \"ShardedByS3Key\"\
      ]\
    },\
    \"S3DataSource\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"S3DataType\",\
        \"S3Uri\"\
      ],\
      \"members\":{\
        \"S3DataType\":{\
          \"shape\":\"S3DataType\",\
          \"documentation\":\"<p>If you choose <code>S3Prefix</code>, <code>S3Uri</code> identifies a key name prefix. Amazon SageMaker uses all objects that match the specified key name prefix for model training. </p> <p>If you choose <code>ManifestFile</code>, <code>S3Uri</code> identifies an object that is a manifest file containing a list of object keys that you want Amazon SageMaker to use for model training. </p> <p>If you choose <code>AugmentedManifestFile</code>, S3Uri identifies an object that is an augmented manifest file in JSON lines format. This file contains the data you want to use for model training. <code>AugmentedManifestFile</code> can only be used if the Channel's input mode is <code>Pipe</code>.</p>\"\
        },\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>Depending on the value specified for the <code>S3DataType</code>, identifies either a key name prefix or a manifest. For example: </p> <ul> <li> <p> A key name prefix might look like this: <code>s3://bucketname/exampleprefix</code>. </p> </li> <li> <p> A manifest might look like this: <code>s3://bucketname/example.manifest</code> </p> <p> The manifest is an S3 object which is a JSON file with the following format: </p> <p> The preceding JSON matches the following <code>s3Uris</code>: </p> <p> <code>[ {\\\"prefix\\\": \\\"s3://customer_bucket/some/prefix/\\\"},</code> </p> <p> <code>\\\"relative/path/to/custdata-1\\\",</code> </p> <p> <code>\\\"relative/path/custdata-2\\\",</code> </p> <p> <code>...</code> </p> <p> <code>\\\"relative/path/custdata-N\\\"</code> </p> <p> <code>]</code> </p> <p> The preceding JSON matches the following <code>s3Uris</code>: </p> <p> <code>s3://customer_bucket/some/prefix/relative/path/to/custdata-1</code> </p> <p> <code>s3://customer_bucket/some/prefix/relative/path/custdata-2</code> </p> <p> <code>...</code> </p> <p> <code>s3://customer_bucket/some/prefix/relative/path/custdata-N</code> </p> <p>The complete set of <code>s3uris</code> in this manifest is the input data for the channel for this datasource. The object that each <code>s3uris</code> points to must be readable by the IAM role that Amazon SageMaker uses to perform tasks on your behalf. </p> </li> </ul>\"\
        },\
        \"S3DataDistributionType\":{\
          \"shape\":\"S3DataDistribution\",\
          \"documentation\":\"<p>If you want Amazon SageMaker to replicate the entire dataset on each ML compute instance that is launched for model training, specify <code>FullyReplicated</code>. </p> <p>If you want Amazon SageMaker to replicate a subset of data on each ML compute instance that is launched for model training, specify <code>ShardedByS3Key</code>. If there are <i>n</i> ML compute instances launched for a training job, each instance gets approximately 1/<i>n</i> of the number of S3 objects. In this case, model training on each machine uses only the subset of training data. </p> <p>Don't choose more ML compute instances for training than available S3 objects. If you do, some nodes won't get any data and you will pay for nodes that aren't getting any training data. This applies in both File and Pipe modes. Keep this in mind when developing algorithms. </p> <p>In distributed training, where you use multiple ML compute EC2 instances, you might choose <code>ShardedByS3Key</code>. If the algorithm requires copying training data to the ML storage volume (when <code>TrainingInputMode</code> is set to <code>File</code>), this copies 1/<i>n</i> of the number of objects. </p>\"\
        },\
        \"AttributeNames\":{\
          \"shape\":\"AttributeNames\",\
          \"documentation\":\"<p>A list of one or more attribute names to use that are found in a specified augmented manifest file.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the S3 data source.</p>\"\
    },\
    \"S3DataType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ManifestFile\",\
        \"S3Prefix\",\
        \"AugmentedManifestFile\"\
      ]\
    },\
    \"S3Uri\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"^(https|s3)://([^/]+)/?(.*)$\"\
    },\
    \"SageMakerImageArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"^arn:aws(-[\\\\w]+)*:sagemaker:.+:[0-9]{12}:image/[a-z0-9]([-.]?[a-z0-9])*$\"\
    },\
    \"SamplingPercentage\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"ScheduleConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"ScheduleExpression\"],\
      \"members\":{\
        \"ScheduleExpression\":{\
          \"shape\":\"ScheduleExpression\",\
          \"documentation\":\"<p>A cron expression that describes details about the monitoring schedule.</p> <p>Currently the only supported cron expressions are:</p> <ul> <li> <p>If you want to set the job to start every hour, please use the following:</p> <p> <code>Hourly: cron(0 * ? * * *)</code> </p> </li> <li> <p>If you want to start the job daily:</p> <p> <code>cron(0 [00-23] ? * * *)</code> </p> </li> </ul> <p>For example, the following are valid cron expressions:</p> <ul> <li> <p>Daily at noon UTC: <code>cron(0 12 ? * * *)</code> </p> </li> <li> <p>Daily at midnight UTC: <code>cron(0 0 ? * * *)</code> </p> </li> </ul> <p>To support running every 6, 12 hours, the following are also supported:</p> <p> <code>cron(0 [00-23]/[01-24] ? * * *)</code> </p> <p>For example, the following are valid cron expressions:</p> <ul> <li> <p>Every 12 hours, starting at 5pm UTC: <code>cron(0 17/12 ? * * *)</code> </p> </li> <li> <p>Every two hours starting at midnight: <code>cron(0 0/2 ? * * *)</code> </p> </li> </ul> <note> <ul> <li> <p>Even though the cron expression is set to start at 5PM UTC, note that there could be a delay of 0-20 minutes from the actual requested time to run the execution. </p> </li> <li> <p>We recommend that if you would like a daily schedule, you do not provide this parameter. Amazon SageMaker will pick a time for running every day.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration details about the monitoring schedule.</p>\"\
    },\
    \"ScheduleExpression\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ScheduleStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pending\",\
        \"Failed\",\
        \"Scheduled\",\
        \"Stopped\"\
      ]\
    },\
    \"SearchExpression\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p>A list of filter objects.</p>\"\
        },\
        \"NestedFilters\":{\
          \"shape\":\"NestedFiltersList\",\
          \"documentation\":\"<p>A list of nested filter objects.</p>\"\
        },\
        \"SubExpressions\":{\
          \"shape\":\"SearchExpressionList\",\
          \"documentation\":\"<p>A list of search expression objects.</p>\"\
        },\
        \"Operator\":{\
          \"shape\":\"BooleanOperator\",\
          \"documentation\":\"<p>A Boolean operator used to evaluate the search expression. If you want every conditional statement in all lists to be satisfied for the entire search expression to be true, specify <code>And</code>. If only a single conditional statement needs to be true for the entire search expression to be true, specify <code>Or</code>. The default value is <code>And</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A multi-expression that searches for the specified resource or resources in a search. All resource objects that satisfy the expression's condition are included in the search results. You must specify at least one subexpression, filter, or nested filter. A <code>SearchExpression</code> can contain up to twenty elements.</p> <p>A <code>SearchExpression</code> contains the following components:</p> <ul> <li> <p>A list of <code>Filter</code> objects. Each filter defines a simple Boolean expression comprised of a resource property name, Boolean operator, and value. A <code>SearchExpression</code> can include only one <code>Contains</code> operator.</p> </li> <li> <p>A list of <code>NestedFilter</code> objects. Each nested filter defines a list of Boolean expressions using a list of resource properties. A nested filter is satisfied if a single object in the list satisfies all Boolean expressions.</p> </li> <li> <p>A list of <code>SearchExpression</code> objects. A search expression object can be nested in a list of search expression objects.</p> </li> <li> <p>A Boolean operator: <code>And</code> or <code>Or</code>.</p> </li> </ul>\"\
    },\
    \"SearchExpressionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SearchExpression\"},\
      \"max\":20,\
      \"min\":1\
    },\
    \"SearchRecord\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrainingJob\":{\
          \"shape\":\"TrainingJob\",\
          \"documentation\":\"<p>The properties of a training job.</p>\"\
        },\
        \"Experiment\":{\
          \"shape\":\"Experiment\",\
          \"documentation\":\"<p>The properties of an experiment.</p>\"\
        },\
        \"Trial\":{\
          \"shape\":\"Trial\",\
          \"documentation\":\"<p>The properties of a trial.</p>\"\
        },\
        \"TrialComponent\":{\
          \"shape\":\"TrialComponent\",\
          \"documentation\":\"<p>The properties of a trial component.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A single resource returned as part of the <a>Search</a> API response.</p>\"\
    },\
    \"SearchRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Resource\"],\
      \"members\":{\
        \"Resource\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The name of the Amazon SageMaker resource to search for.</p>\"\
        },\
        \"SearchExpression\":{\
          \"shape\":\"SearchExpression\",\
          \"documentation\":\"<p>A Boolean conditional statement. Resources must satisfy this condition to be included in search results. You must provide at least one subexpression, filter, or nested filter. The maximum number of recursive <code>SubExpressions</code>, <code>NestedFilters</code>, and <code>Filters</code> that can be included in a <code>SearchExpression</code> object is 50.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"ResourcePropertyName\",\
          \"documentation\":\"<p>The name of the resource property used to sort the <code>SearchResults</code>. The default is <code>LastModifiedTime</code>.</p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SearchSortOrder\",\
          \"documentation\":\"<p>How <code>SearchResults</code> are ordered. Valid values are <code>Ascending</code> or <code>Descending</code>. The default is <code>Descending</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If more than <code>MaxResults</code> resources match the specified <code>SearchExpression</code>, the response includes a <code>NextToken</code>. The <code>NextToken</code> can be passed to the next <code>SearchRequest</code> to continue retrieving results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"SearchResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Results\":{\
          \"shape\":\"SearchResultsList\",\
          \"documentation\":\"<p>A list of <code>SearchRecord</code> objects.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous <code>Search</code> request was truncated, the response includes a NextToken. To retrieve the next set of results, use the token in the next request.</p>\"\
        }\
      }\
    },\
    \"SearchResultsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SearchRecord\"}\
    },\
    \"SearchSortOrder\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Ascending\",\
        \"Descending\"\
      ]\
    },\
    \"SecondaryStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Starting\",\
        \"LaunchingMLInstances\",\
        \"PreparingTrainingStack\",\
        \"Downloading\",\
        \"DownloadingTrainingImage\",\
        \"Training\",\
        \"Uploading\",\
        \"Stopping\",\
        \"Stopped\",\
        \"MaxRuntimeExceeded\",\
        \"Completed\",\
        \"Failed\",\
        \"Interrupted\",\
        \"MaxWaitTimeExceeded\"\
      ]\
    },\
    \"SecondaryStatusTransition\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Status\",\
        \"StartTime\"\
      ],\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"SecondaryStatus\",\
          \"documentation\":\"<p>Contains a secondary status information from a training job.</p> <p>Status might be one of the following secondary statuses:</p> <dl> <dt>InProgress</dt> <dd> <ul> <li> <p> <code>Starting</code> - Starting the training job.</p> </li> <li> <p> <code>Downloading</code> - An optional stage for algorithms that support <code>File</code> training input mode. It indicates that data is being downloaded to the ML storage volumes.</p> </li> <li> <p> <code>Training</code> - Training is in progress.</p> </li> <li> <p> <code>Uploading</code> - Training is complete and the model artifacts are being uploaded to the S3 location.</p> </li> </ul> </dd> <dt>Completed</dt> <dd> <ul> <li> <p> <code>Completed</code> - The training job has completed.</p> </li> </ul> </dd> <dt>Failed</dt> <dd> <ul> <li> <p> <code>Failed</code> - The training job has failed. The reason for the failure is returned in the <code>FailureReason</code> field of <code>DescribeTrainingJobResponse</code>.</p> </li> </ul> </dd> <dt>Stopped</dt> <dd> <ul> <li> <p> <code>MaxRuntimeExceeded</code> - The job stopped because it exceeded the maximum allowed runtime.</p> </li> <li> <p> <code>Stopped</code> - The training job has stopped.</p> </li> </ul> </dd> <dt>Stopping</dt> <dd> <ul> <li> <p> <code>Stopping</code> - Stopping the training job.</p> </li> </ul> </dd> </dl> <p>We no longer support the following secondary statuses:</p> <ul> <li> <p> <code>LaunchingMLInstances</code> </p> </li> <li> <p> <code>PreparingTrainingStack</code> </p> </li> <li> <p> <code>DownloadingTrainingImage</code> </p> </li> </ul>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that shows when the training job transitioned to the current secondary status state.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that shows when the training job transitioned out of this secondary status state into another secondary status state or when the training job has ended.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>A detailed description of the progress within a secondary status. </p> <p>Amazon SageMaker provides secondary statuses and status messages that apply to each of them:</p> <dl> <dt>Starting</dt> <dd> <ul> <li> <p>Starting the training job.</p> </li> <li> <p>Launching requested ML instances.</p> </li> <li> <p>Insufficient capacity error from EC2 while launching instances, retrying!</p> </li> <li> <p>Launched instance was unhealthy, replacing it!</p> </li> <li> <p>Preparing the instances for training.</p> </li> </ul> </dd> <dt>Training</dt> <dd> <ul> <li> <p>Downloading the training image.</p> </li> <li> <p>Training image download completed. Training in progress.</p> </li> </ul> </dd> </dl> <important> <p>Status messages are subject to change. Therefore, we recommend not including them in code that programmatically initiates actions. For examples, don't use status messages in if statements.</p> </important> <p>To have an overview of your training job's progress, view <code>TrainingJobStatus</code> and <code>SecondaryStatus</code> in <a>DescribeTrainingJob</a>, and <code>StatusMessage</code> together. For example, at the start of a training job, you might see the following:</p> <ul> <li> <p> <code>TrainingJobStatus</code> - InProgress</p> </li> <li> <p> <code>SecondaryStatus</code> - Training</p> </li> <li> <p> <code>StatusMessage</code> - Downloading the training image</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>An array element of <a>DescribeTrainingJobResponse$SecondaryStatusTransitions</a>. It provides additional details about a status that the training job has transitioned through. A training job can be in one of several states, for example, starting, downloading, training, or uploading. Within each state, there are a number of intermediate states. For example, within the starting state, Amazon SageMaker could be starting the training job or launching the ML instances. These transitional states are referred to as the job's secondary status. </p> <p/>\"\
    },\
    \"SecondaryStatusTransitions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecondaryStatusTransition\"}\
    },\
    \"SecretArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:secretsmanager:[a-z0-9\\\\-]*:[0-9]{12}:secret:.*\"\
    },\
    \"SecurityGroupId\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"pattern\":\"[-0-9a-zA-Z]+\"\
    },\
    \"SecurityGroupIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityGroupId\"},\
      \"max\":5\
    },\
    \"Seed\":{\"type\":\"long\"},\
    \"SessionExpirationDurationInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":43200,\
      \"min\":1800\
    },\
    \"SharingSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NotebookOutputOption\":{\
          \"shape\":\"NotebookOutputOption\",\
          \"documentation\":\"<p>The notebook output option.</p>\"\
        },\
        \"S3OutputPath\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 output path.</p>\"\
        },\
        \"S3KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS Key Management Service encryption key ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The sharing settings.</p>\"\
    },\
    \"ShuffleConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"Seed\"],\
      \"members\":{\
        \"Seed\":{\
          \"shape\":\"Seed\",\
          \"documentation\":\"<p>Determines the shuffling order in <code>ShuffleConfig</code> value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A configuration for a shuffle option for input data in a channel. If you use <code>S3Prefix</code> for <code>S3DataType</code>, the results of the S3 key prefix matches are shuffled. If you use <code>ManifestFile</code>, the order of the S3 object references in the <code>ManifestFile</code> is shuffled. If you use <code>AugmentedManifestFile</code>, the order of the JSON lines in the <code>AugmentedManifestFile</code> is shuffled. The shuffling order is determined using the <code>Seed</code> value.</p> <p>For Pipe input mode, when <code>ShuffleConfig</code> is specified shuffling is done at the start of every epoch. With large datasets, this ensures that the order of the training data is different for each epoch, and it helps reduce bias and possible overfitting. In a multi-node training job when <code>ShuffleConfig</code> is combined with <code>S3DataDistributionType</code> of <code>ShardedByS3Key</code>, the data is shuffled across nodes so that the content sent to a particular node on the first epoch might be sent to a different node on the second epoch.</p>\"\
    },\
    \"SingleSignOnUserIdentifier\":{\
      \"type\":\"string\",\
      \"pattern\":\"UserName\"\
    },\
    \"SortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\",\
        \"Status\"\
      ]\
    },\
    \"SortExperimentsBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\"\
      ]\
    },\
    \"SortOrder\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Ascending\",\
        \"Descending\"\
      ]\
    },\
    \"SortTrialComponentsBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\"\
      ]\
    },\
    \"SortTrialsBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\"\
      ]\
    },\
    \"SourceAlgorithm\":{\
      \"type\":\"structure\",\
      \"required\":[\"AlgorithmName\"],\
      \"members\":{\
        \"ModelDataUrl\":{\
          \"shape\":\"Url\",\
          \"documentation\":\"<p>The Amazon S3 path where the model artifacts, which result from model training, are stored. This path must point to a single <code>gzip</code> compressed tar archive (<code>.tar.gz</code> suffix).</p>\"\
        },\
        \"AlgorithmName\":{\
          \"shape\":\"ArnOrName\",\
          \"documentation\":\"<p>The name of an algorithm that was used to create the model package. The algorithm must be either an algorithm resource in your Amazon SageMaker account or an algorithm in AWS Marketplace that you are subscribed to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies an algorithm that was used to create the model package. The algorithm must be either an algorithm resource in your Amazon SageMaker account or an algorithm in AWS Marketplace that you are subscribed to.</p>\"\
    },\
    \"SourceAlgorithmList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SourceAlgorithm\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"SourceAlgorithmSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\"SourceAlgorithms\"],\
      \"members\":{\
        \"SourceAlgorithms\":{\
          \"shape\":\"SourceAlgorithmList\",\
          \"documentation\":\"<p>A list of the algorithms that were used to create a model package.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of algorithms that were used to create a model package.</p>\"\
    },\
    \"SourceIpConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"Cidrs\"],\
      \"members\":{\
        \"Cidrs\":{\
          \"shape\":\"Cidrs\",\
          \"documentation\":\"<p>A list of one to four <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html\\\">Classless Inter-Domain Routing</a> (CIDR) values.</p> <p>Maximum: Four CIDR values</p> <note> <p>The following Length Constraints apply to individual CIDR values in the CIDR value list.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>A list of IP address ranges (<a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html\\\">CIDRs</a>). Used to create an allow list of IP addresses for a private workforce. For more information, see .</p>\"\
    },\
    \"SourceType\":{\
      \"type\":\"string\",\
      \"max\":128\
    },\
    \"SplitType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"None\",\
        \"Line\",\
        \"RecordIO\",\
        \"TFRecord\"\
      ]\
    },\
    \"StartMonitoringScheduleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MonitoringScheduleName\"],\
      \"members\":{\
        \"MonitoringScheduleName\":{\
          \"shape\":\"MonitoringScheduleName\",\
          \"documentation\":\"<p>The name of the schedule to start.</p>\"\
        }\
      }\
    },\
    \"StartNotebookInstanceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"NotebookInstanceName\"],\
      \"members\":{\
        \"NotebookInstanceName\":{\
          \"shape\":\"NotebookInstanceName\",\
          \"documentation\":\"<p>The name of the notebook instance to start.</p>\"\
        }\
      }\
    },\
    \"StatusDetails\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\".*\"\
    },\
    \"StatusMessage\":{\"type\":\"string\"},\
    \"StopAutoMLJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoMLJobName\"],\
      \"members\":{\
        \"AutoMLJobName\":{\
          \"shape\":\"AutoMLJobName\",\
          \"documentation\":\"<p>The name of the object you are requesting.</p>\"\
        }\
      }\
    },\
    \"StopCompilationJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CompilationJobName\"],\
      \"members\":{\
        \"CompilationJobName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the model compilation job to stop.</p>\"\
        }\
      }\
    },\
    \"StopHyperParameterTuningJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"HyperParameterTuningJobName\"],\
      \"members\":{\
        \"HyperParameterTuningJobName\":{\
          \"shape\":\"HyperParameterTuningJobName\",\
          \"documentation\":\"<p>The name of the tuning job to stop.</p>\"\
        }\
      }\
    },\
    \"StopLabelingJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"LabelingJobName\"],\
      \"members\":{\
        \"LabelingJobName\":{\
          \"shape\":\"LabelingJobName\",\
          \"documentation\":\"<p>The name of the labeling job to stop.</p>\"\
        }\
      }\
    },\
    \"StopMonitoringScheduleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MonitoringScheduleName\"],\
      \"members\":{\
        \"MonitoringScheduleName\":{\
          \"shape\":\"MonitoringScheduleName\",\
          \"documentation\":\"<p>The name of the schedule to stop.</p>\"\
        }\
      }\
    },\
    \"StopNotebookInstanceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"NotebookInstanceName\"],\
      \"members\":{\
        \"NotebookInstanceName\":{\
          \"shape\":\"NotebookInstanceName\",\
          \"documentation\":\"<p>The name of the notebook instance to terminate.</p>\"\
        }\
      }\
    },\
    \"StopProcessingJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ProcessingJobName\"],\
      \"members\":{\
        \"ProcessingJobName\":{\
          \"shape\":\"ProcessingJobName\",\
          \"documentation\":\"<p>The name of the processing job to stop.</p>\"\
        }\
      }\
    },\
    \"StopTrainingJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrainingJobName\"],\
      \"members\":{\
        \"TrainingJobName\":{\
          \"shape\":\"TrainingJobName\",\
          \"documentation\":\"<p>The name of the training job to stop.</p>\"\
        }\
      }\
    },\
    \"StopTransformJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TransformJobName\"],\
      \"members\":{\
        \"TransformJobName\":{\
          \"shape\":\"TransformJobName\",\
          \"documentation\":\"<p>The name of the transform job to stop.</p>\"\
        }\
      }\
    },\
    \"StoppingCondition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxRuntimeInSeconds\":{\
          \"shape\":\"MaxRuntimeInSeconds\",\
          \"documentation\":\"<p>The maximum length of time, in seconds, that the training or compilation job can run. If job does not complete during this time, Amazon SageMaker ends the job. If value is not specified, default value is 1 day. The maximum value is 28 days.</p>\"\
        },\
        \"MaxWaitTimeInSeconds\":{\
          \"shape\":\"MaxWaitTimeInSeconds\",\
          \"documentation\":\"<p>The maximum length of time, in seconds, how long you are willing to wait for a managed spot training job to complete. It is the amount of time spent waiting for Spot capacity plus the amount of time the training job runs. It must be equal to or greater than <code>MaxRuntimeInSeconds</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a limit to how long a model training or compilation job can run. It also specifies how long you are willing to wait for a managed spot training job to complete. When the job reaches the time limit, Amazon SageMaker ends the training or compilation job. Use this API to cap model training costs.</p> <p>To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms can use this 120-second window to save the model artifacts, so the results of training are not lost. </p> <p>The training algorithms provided by Amazon SageMaker automatically save the intermediate results of a model training job when possible. This attempt to save artifacts is only a best effort case as model might not be in a state from which it can be saved. For example, if training has just started, the model might not be ready to save. When saved, this intermediate data is a valid model artifact. You can use it to create a model with <code>CreateModel</code>.</p> <note> <p>The Neural Topic Model (NTM) currently does not support saving intermediate model artifacts. When training NTMs, make sure that the maximum runtime is sufficient for the training job to complete.</p> </note>\"\
    },\
    \"String\":{\"type\":\"string\"},\
    \"String1024\":{\
      \"type\":\"string\",\
      \"max\":1024\
    },\
    \"String200\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\".+\"\
    },\
    \"String256\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"StringParameterValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\".*\"\
    },\
    \"SubnetId\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"pattern\":\"[-0-9a-zA-Z]+\"\
    },\
    \"Subnets\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubnetId\"},\
      \"max\":16,\
      \"min\":1\
    },\
    \"SubscribedWorkteam\":{\
      \"type\":\"structure\",\
      \"required\":[\"WorkteamArn\"],\
      \"members\":{\
        \"WorkteamArn\":{\
          \"shape\":\"WorkteamArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the vendor that you have subscribed.</p>\"\
        },\
        \"MarketplaceTitle\":{\
          \"shape\":\"String200\",\
          \"documentation\":\"<p>The title of the service provided by the vendor in the Amazon Marketplace.</p>\"\
        },\
        \"SellerName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the vendor in the Amazon Marketplace.</p>\"\
        },\
        \"MarketplaceDescription\":{\
          \"shape\":\"String200\",\
          \"documentation\":\"<p>The description of the vendor from the Amazon Marketplace.</p>\"\
        },\
        \"ListingId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a work team of a vendor that does the a labelling job.</p>\"\
    },\
    \"SubscribedWorkteams\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubscribedWorkteam\"}\
    },\
    \"Success\":{\"type\":\"boolean\"},\
    \"SuggestionQuery\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PropertyNameQuery\":{\
          \"shape\":\"PropertyNameQuery\",\
          \"documentation\":\"<p>Defines a property name hint. Only property names that begin with the specified hint are included in the response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specified in the <a>GetSearchSuggestions</a> request. Limits the property names that are included in the response.</p>\"\
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
          \"documentation\":\"<p>The tag key.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The tag value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a tag. </p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":50,\
      \"min\":0\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"TargetAttributeName\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"TargetDevice\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"lambda\",\
        \"ml_m4\",\
        \"ml_m5\",\
        \"ml_c4\",\
        \"ml_c5\",\
        \"ml_p2\",\
        \"ml_p3\",\
        \"ml_inf1\",\
        \"jetson_tx1\",\
        \"jetson_tx2\",\
        \"jetson_nano\",\
        \"jetson_xavier\",\
        \"rasp3b\",\
        \"imx8qm\",\
        \"deeplens\",\
        \"rk3399\",\
        \"rk3288\",\
        \"aisage\",\
        \"sbe_c\",\
        \"qcs605\",\
        \"qcs603\",\
        \"sitara_am57x\",\
        \"amba_cv22\"\
      ]\
    },\
    \"TargetObjectiveMetricValue\":{\"type\":\"float\"},\
    \"TaskAvailabilityLifetimeInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":864000,\
      \"min\":60\
    },\
    \"TaskCount\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"TaskDescription\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\".+\"\
    },\
    \"TaskInput\":{\
      \"type\":\"string\",\
      \"max\":128000,\
      \"min\":2,\
      \"pattern\":\"[\\\\S\\\\s]+\"\
    },\
    \"TaskKeyword\":{\
      \"type\":\"string\",\
      \"max\":30,\
      \"min\":1,\
      \"pattern\":\"^[A-Za-z0-9]+( [A-Za-z0-9]+)*$\"\
    },\
    \"TaskKeywords\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TaskKeyword\"},\
      \"max\":5,\
      \"min\":1\
    },\
    \"TaskTimeLimitInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":28800,\
      \"min\":30\
    },\
    \"TaskTitle\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^[\\\\t\\\\n\\\\r -\\\\uD7FF\\\\uE000-\\\\uFFFD]*$\"\
    },\
    \"TemplateContent\":{\
      \"type\":\"string\",\
      \"max\":128000,\
      \"min\":1,\
      \"pattern\":\"[\\\\S\\\\s]+\"\
    },\
    \"TemplateContentSha256\":{\
      \"type\":\"string\",\
      \"max\":128000,\
      \"min\":1\
    },\
    \"TemplateUrl\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"TensorBoardAppSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DefaultResourceSpec\":{\
          \"shape\":\"ResourceSpec\",\
          \"documentation\":\"<p>The default instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The TensorBoard app settings.</p>\"\
    },\
    \"TensorBoardOutputConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3OutputPath\"],\
      \"members\":{\
        \"LocalPath\":{\
          \"shape\":\"DirectoryPath\",\
          \"documentation\":\"<p>Path to local storage location for tensorBoard output. Defaults to <code>/opt/ml/output/tensorboard</code>.</p>\"\
        },\
        \"S3OutputPath\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>Path to Amazon S3 storage location for TensorBoard output.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration of storage locations for TensorBoard output.</p>\"\
    },\
    \"TenthFractionsOfACent\":{\
      \"type\":\"integer\",\
      \"max\":9,\
      \"min\":0\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TrainingInputMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pipe\",\
        \"File\"\
      ]\
    },\
    \"TrainingInstanceCount\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"TrainingInstanceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ml.m4.xlarge\",\
        \"ml.m4.2xlarge\",\
        \"ml.m4.4xlarge\",\
        \"ml.m4.10xlarge\",\
        \"ml.m4.16xlarge\",\
        \"ml.g4dn.xlarge\",\
        \"ml.g4dn.2xlarge\",\
        \"ml.g4dn.4xlarge\",\
        \"ml.g4dn.8xlarge\",\
        \"ml.g4dn.12xlarge\",\
        \"ml.g4dn.16xlarge\",\
        \"ml.m5.large\",\
        \"ml.m5.xlarge\",\
        \"ml.m5.2xlarge\",\
        \"ml.m5.4xlarge\",\
        \"ml.m5.12xlarge\",\
        \"ml.m5.24xlarge\",\
        \"ml.c4.xlarge\",\
        \"ml.c4.2xlarge\",\
        \"ml.c4.4xlarge\",\
        \"ml.c4.8xlarge\",\
        \"ml.p2.xlarge\",\
        \"ml.p2.8xlarge\",\
        \"ml.p2.16xlarge\",\
        \"ml.p3.2xlarge\",\
        \"ml.p3.8xlarge\",\
        \"ml.p3.16xlarge\",\
        \"ml.p3dn.24xlarge\",\
        \"ml.c5.xlarge\",\
        \"ml.c5.2xlarge\",\
        \"ml.c5.4xlarge\",\
        \"ml.c5.9xlarge\",\
        \"ml.c5.18xlarge\",\
        \"ml.c5n.xlarge\",\
        \"ml.c5n.2xlarge\",\
        \"ml.c5n.4xlarge\",\
        \"ml.c5n.9xlarge\",\
        \"ml.c5n.18xlarge\"\
      ]\
    },\
    \"TrainingInstanceTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrainingInstanceType\"}\
    },\
    \"TrainingJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrainingJobName\":{\
          \"shape\":\"TrainingJobName\",\
          \"documentation\":\"<p>The name of the training job.</p>\"\
        },\
        \"TrainingJobArn\":{\
          \"shape\":\"TrainingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the training job.</p>\"\
        },\
        \"TuningJobArn\":{\
          \"shape\":\"HyperParameterTuningJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the associated hyperparameter tuning job if the training job was launched by a hyperparameter tuning job.</p>\"\
        },\
        \"LabelingJobArn\":{\
          \"shape\":\"LabelingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the labeling job.</p>\"\
        },\
        \"AutoMLJobArn\":{\
          \"shape\":\"AutoMLJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the job.</p>\"\
        },\
        \"ModelArtifacts\":{\
          \"shape\":\"ModelArtifacts\",\
          \"documentation\":\"<p>Information about the Amazon S3 location that is configured for storing model artifacts.</p>\"\
        },\
        \"TrainingJobStatus\":{\
          \"shape\":\"TrainingJobStatus\",\
          \"documentation\":\"<p>The status of the training job.</p> <p>Training job statuses are:</p> <ul> <li> <p> <code>InProgress</code> - The training is in progress.</p> </li> <li> <p> <code>Completed</code> - The training job has completed.</p> </li> <li> <p> <code>Failed</code> - The training job has failed. To see the reason for the failure, see the <code>FailureReason</code> field in the response to a <code>DescribeTrainingJobResponse</code> call.</p> </li> <li> <p> <code>Stopping</code> - The training job is stopping.</p> </li> <li> <p> <code>Stopped</code> - The training job has stopped.</p> </li> </ul> <p>For more detailed information, see <code>SecondaryStatus</code>. </p>\"\
        },\
        \"SecondaryStatus\":{\
          \"shape\":\"SecondaryStatus\",\
          \"documentation\":\"<p> Provides detailed information about the state of the training job. For detailed information about the secondary status of the training job, see <code>StatusMessage</code> under <a>SecondaryStatusTransition</a>.</p> <p>Amazon SageMaker provides primary statuses and secondary statuses that apply to each of them:</p> <dl> <dt>InProgress</dt> <dd> <ul> <li> <p> <code>Starting</code> - Starting the training job.</p> </li> <li> <p> <code>Downloading</code> - An optional stage for algorithms that support <code>File</code> training input mode. It indicates that data is being downloaded to the ML storage volumes.</p> </li> <li> <p> <code>Training</code> - Training is in progress.</p> </li> <li> <p> <code>Uploading</code> - Training is complete and the model artifacts are being uploaded to the S3 location.</p> </li> </ul> </dd> <dt>Completed</dt> <dd> <ul> <li> <p> <code>Completed</code> - The training job has completed.</p> </li> </ul> </dd> <dt>Failed</dt> <dd> <ul> <li> <p> <code>Failed</code> - The training job has failed. The reason for the failure is returned in the <code>FailureReason</code> field of <code>DescribeTrainingJobResponse</code>.</p> </li> </ul> </dd> <dt>Stopped</dt> <dd> <ul> <li> <p> <code>MaxRuntimeExceeded</code> - The job stopped because it exceeded the maximum allowed runtime.</p> </li> <li> <p> <code>Stopped</code> - The training job has stopped.</p> </li> </ul> </dd> <dt>Stopping</dt> <dd> <ul> <li> <p> <code>Stopping</code> - Stopping the training job.</p> </li> </ul> </dd> </dl> <important> <p>Valid values for <code>SecondaryStatus</code> are subject to change. </p> </important> <p>We no longer support the following secondary statuses:</p> <ul> <li> <p> <code>LaunchingMLInstances</code> </p> </li> <li> <p> <code>PreparingTrainingStack</code> </p> </li> <li> <p> <code>DownloadingTrainingImage</code> </p> </li> </ul>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the training job failed, the reason it failed.</p>\"\
        },\
        \"HyperParameters\":{\
          \"shape\":\"HyperParameters\",\
          \"documentation\":\"<p>Algorithm-specific parameters.</p>\"\
        },\
        \"AlgorithmSpecification\":{\
          \"shape\":\"AlgorithmSpecification\",\
          \"documentation\":\"<p>Information about the algorithm used for training, and algorithm metadata.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The AWS Identity and Access Management (IAM) role configured for the training job.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>An array of <code>Channel</code> objects that describes each data input channel.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The S3 path where model artifacts that you configured when creating the job are stored. Amazon SageMaker creates subfolders for model artifacts.</p>\"\
        },\
        \"ResourceConfig\":{\
          \"shape\":\"ResourceConfig\",\
          \"documentation\":\"<p>Resources, including ML compute instances and ML storage volumes, that are configured for model training.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>A <a>VpcConfig</a> object that specifies the VPC that this training job has access to. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html\\\">Protect Training Jobs by Using an Amazon Virtual Private Cloud</a>.</p>\"\
        },\
        \"StoppingCondition\":{\
          \"shape\":\"StoppingCondition\",\
          \"documentation\":\"<p>Specifies a limit to how long a model training job can run. When the job reaches the time limit, Amazon SageMaker ends the training job. Use this API to cap model training costs.</p> <p>To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms can use this 120-second window to save the model artifacts, so the results of training are not lost. </p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that indicates when the training job was created.</p>\"\
        },\
        \"TrainingStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Indicates the time when the training job starts on training instances. You are billed for the time interval between this time and the value of <code>TrainingEndTime</code>. The start time in CloudWatch Logs might be later than this time. The difference is due to the time it takes to download the training data and to the size of the training container.</p>\"\
        },\
        \"TrainingEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Indicates the time when the training job ends on training instances. You are billed for the time interval between the value of <code>TrainingStartTime</code> and this time. For successful jobs and stopped jobs, this is the time after model artifacts are uploaded. For failed jobs, this is the time when Amazon SageMaker detects a job failure.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that indicates when the status of the training job was last modified.</p>\"\
        },\
        \"SecondaryStatusTransitions\":{\
          \"shape\":\"SecondaryStatusTransitions\",\
          \"documentation\":\"<p>A history of all of the secondary statuses that the training job has transitioned through.</p>\"\
        },\
        \"FinalMetricDataList\":{\
          \"shape\":\"FinalMetricDataList\",\
          \"documentation\":\"<p>A list of final metric values that are set when the training job completes. Used only if the training job was configured to use metrics.</p>\"\
        },\
        \"EnableNetworkIsolation\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If the <code>TrainingJob</code> was created with network isolation, the value is set to <code>true</code>. If network isolation is enabled, nodes can't communicate beyond the VPC they run in.</p>\"\
        },\
        \"EnableInterContainerTrafficEncryption\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>To encrypt all communications between ML compute instances in distributed training, choose <code>True</code>. Encryption provides greater security for distributed training, but training might take longer. How long it takes depends on the amount of communication between compute instances, especially if you use a deep learning algorithm in distributed training.</p>\"\
        },\
        \"EnableManagedSpotTraining\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>When true, enables managed spot training using Amazon EC2 Spot instances to run training jobs instead of on-demand instances. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html\\\">Managed Spot Training</a>.</p>\"\
        },\
        \"CheckpointConfig\":{\"shape\":\"CheckpointConfig\"},\
        \"TrainingTimeInSeconds\":{\
          \"shape\":\"TrainingTimeInSeconds\",\
          \"documentation\":\"<p>The training time in seconds.</p>\"\
        },\
        \"BillableTimeInSeconds\":{\
          \"shape\":\"BillableTimeInSeconds\",\
          \"documentation\":\"<p>The billable time in seconds.</p>\"\
        },\
        \"DebugHookConfig\":{\"shape\":\"DebugHookConfig\"},\
        \"ExperimentConfig\":{\"shape\":\"ExperimentConfig\"},\
        \"DebugRuleConfigurations\":{\
          \"shape\":\"DebugRuleConfigurations\",\
          \"documentation\":\"<p>Information about the debug rule configuration.</p>\"\
        },\
        \"TensorBoardOutputConfig\":{\"shape\":\"TensorBoardOutputConfig\"},\
        \"DebugRuleEvaluationStatuses\":{\
          \"shape\":\"DebugRuleEvaluationStatuses\",\
          \"documentation\":\"<p>Information about the evaluation status of the rules for the training job.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>An array of key-value pairs. For more information, see <a href=\\\"https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what\\\">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a training job.</p>\"\
    },\
    \"TrainingJobArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:training-job/.*\"\
    },\
    \"TrainingJobDefinition\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrainingInputMode\",\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"ResourceConfig\",\
        \"StoppingCondition\"\
      ],\
      \"members\":{\
        \"TrainingInputMode\":{\
          \"shape\":\"TrainingInputMode\",\
          \"documentation\":\"<p>The input mode used by the algorithm for the training job. For the input modes that Amazon SageMaker algorithms support, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html\\\">Algorithms</a>.</p> <p>If an algorithm supports the <code>File</code> input mode, Amazon SageMaker downloads the training data from S3 to the provisioned ML storage Volume, and mounts the directory to docker volume for training container. If an algorithm supports the <code>Pipe</code> input mode, Amazon SageMaker streams data directly from S3 to the container.</p>\"\
        },\
        \"HyperParameters\":{\
          \"shape\":\"HyperParameters\",\
          \"documentation\":\"<p>The hyperparameters used for the training job.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>An array of <code>Channel</code> objects, each of which specifies an input source.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>the path to the S3 bucket where you want to store model artifacts. Amazon SageMaker creates subfolders for the artifacts.</p>\"\
        },\
        \"ResourceConfig\":{\
          \"shape\":\"ResourceConfig\",\
          \"documentation\":\"<p>The resources, including the ML compute instances and ML storage volumes, to use for model training.</p>\"\
        },\
        \"StoppingCondition\":{\
          \"shape\":\"StoppingCondition\",\
          \"documentation\":\"<p>Specifies a limit to how long a model training job can run. When the job reaches the time limit, Amazon SageMaker ends the training job. Use this API to cap model training costs.</p> <p>To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal, which delays job termination for 120 seconds. Algorithms can use this 120-second window to save the model artifacts.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines the input needed to run a training job using the algorithm.</p>\"\
    },\
    \"TrainingJobEarlyStoppingType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Off\",\
        \"Auto\"\
      ]\
    },\
    \"TrainingJobName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"TrainingJobSortByOptions\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Name\",\
        \"CreationTime\",\
        \"Status\",\
        \"FinalObjectiveMetricValue\"\
      ]\
    },\
    \"TrainingJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"InProgress\",\
        \"Completed\",\
        \"Failed\",\
        \"Stopping\",\
        \"Stopped\"\
      ]\
    },\
    \"TrainingJobStatusCounter\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"TrainingJobStatusCounters\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Completed\":{\
          \"shape\":\"TrainingJobStatusCounter\",\
          \"documentation\":\"<p>The number of completed training jobs launched by the hyperparameter tuning job.</p>\"\
        },\
        \"InProgress\":{\
          \"shape\":\"TrainingJobStatusCounter\",\
          \"documentation\":\"<p>The number of in-progress training jobs launched by a hyperparameter tuning job.</p>\"\
        },\
        \"RetryableError\":{\
          \"shape\":\"TrainingJobStatusCounter\",\
          \"documentation\":\"<p>The number of training jobs that failed, but can be retried. A failed training job can be retried only if it failed because an internal service error occurred.</p>\"\
        },\
        \"NonRetryableError\":{\
          \"shape\":\"TrainingJobStatusCounter\",\
          \"documentation\":\"<p>The number of training jobs that failed and can't be retried. A failed training job can't be retried if it failed because a client error occurred.</p>\"\
        },\
        \"Stopped\":{\
          \"shape\":\"TrainingJobStatusCounter\",\
          \"documentation\":\"<p>The number of training jobs launched by a hyperparameter tuning job that were manually stopped.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The numbers of training jobs launched by a hyperparameter tuning job, categorized by status.</p>\"\
    },\
    \"TrainingJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrainingJobSummary\"}\
    },\
    \"TrainingJobSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrainingJobName\",\
        \"TrainingJobArn\",\
        \"CreationTime\",\
        \"TrainingJobStatus\"\
      ],\
      \"members\":{\
        \"TrainingJobName\":{\
          \"shape\":\"TrainingJobName\",\
          \"documentation\":\"<p>The name of the training job that you want a summary for.</p>\"\
        },\
        \"TrainingJobArn\":{\
          \"shape\":\"TrainingJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the training job.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that shows when the training job was created.</p>\"\
        },\
        \"TrainingEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that shows when the training job ended. This field is set only if the training job has one of the terminal statuses (<code>Completed</code>, <code>Failed</code>, or <code>Stopped</code>). </p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> Timestamp when the training job was last modified. </p>\"\
        },\
        \"TrainingJobStatus\":{\
          \"shape\":\"TrainingJobStatus\",\
          \"documentation\":\"<p>The status of the training job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information about a training job.</p>\"\
    },\
    \"TrainingSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrainingImage\",\
        \"SupportedTrainingInstanceTypes\",\
        \"TrainingChannels\"\
      ],\
      \"members\":{\
        \"TrainingImage\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The Amazon ECR registry path of the Docker image that contains the training algorithm.</p>\"\
        },\
        \"TrainingImageDigest\":{\
          \"shape\":\"ImageDigest\",\
          \"documentation\":\"<p>An MD5 hash of the training algorithm that identifies the Docker image used for training.</p>\"\
        },\
        \"SupportedHyperParameters\":{\
          \"shape\":\"HyperParameterSpecifications\",\
          \"documentation\":\"<p>A list of the <code>HyperParameterSpecification</code> objects, that define the supported hyperparameters. This is required if the algorithm supports automatic model tuning.&gt;</p>\"\
        },\
        \"SupportedTrainingInstanceTypes\":{\
          \"shape\":\"TrainingInstanceTypes\",\
          \"documentation\":\"<p>A list of the instance types that this algorithm can use for training.</p>\"\
        },\
        \"SupportsDistributedTraining\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether the algorithm supports distributed training. If set to false, buyers can't request more than one instance during training.</p>\"\
        },\
        \"MetricDefinitions\":{\
          \"shape\":\"MetricDefinitionList\",\
          \"documentation\":\"<p>A list of <code>MetricDefinition</code> objects, which are used for parsing metrics generated by the algorithm.</p>\"\
        },\
        \"TrainingChannels\":{\
          \"shape\":\"ChannelSpecifications\",\
          \"documentation\":\"<p>A list of <code>ChannelSpecification</code> objects, which specify the input sources to be used by the algorithm.</p>\"\
        },\
        \"SupportedTuningJobObjectiveMetrics\":{\
          \"shape\":\"HyperParameterTuningJobObjectives\",\
          \"documentation\":\"<p>A list of the metrics that the algorithm emits that can be used as the objective metric in a hyperparameter tuning job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines how the algorithm is used for a training job.</p>\"\
    },\
    \"TrainingTimeInSeconds\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"TransformDataSource\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3DataSource\"],\
      \"members\":{\
        \"S3DataSource\":{\
          \"shape\":\"TransformS3DataSource\",\
          \"documentation\":\"<p>The S3 location of the data source that is associated with a channel.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the location of the channel data.</p>\"\
    },\
    \"TransformEnvironmentKey\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"[a-zA-Z_][a-zA-Z0-9_]*\"\
    },\
    \"TransformEnvironmentMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TransformEnvironmentKey\"},\
      \"value\":{\"shape\":\"TransformEnvironmentValue\"},\
      \"max\":16\
    },\
    \"TransformEnvironmentValue\":{\
      \"type\":\"string\",\
      \"max\":10240,\
      \"pattern\":\"[\\\\S\\\\s]*\"\
    },\
    \"TransformInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"DataSource\"],\
      \"members\":{\
        \"DataSource\":{\
          \"shape\":\"TransformDataSource\",\
          \"documentation\":\"<p>Describes the location of the channel data, which is, the S3 location of the input data that the model can consume.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>The multipurpose internet mail extension (MIME) type of the data. Amazon SageMaker uses the MIME type with each http call to transfer data to the transform job.</p>\"\
        },\
        \"CompressionType\":{\
          \"shape\":\"CompressionType\",\
          \"documentation\":\"<p>If your transform data is compressed, specify the compression type. Amazon SageMaker automatically decompresses the data for the transform job accordingly. The default value is <code>None</code>.</p>\"\
        },\
        \"SplitType\":{\
          \"shape\":\"SplitType\",\
          \"documentation\":\"<p>The method to use to split the transform job's data files into smaller batches. Splitting is necessary when the total size of each object is too large to fit in a single request. You can also use data splitting to improve performance by processing multiple concurrent mini-batches. The default value for <code>SplitType</code> is <code>None</code>, which indicates that input data files are not split, and request payloads contain the entire contents of an input object. Set the value of this parameter to <code>Line</code> to split records on a newline character boundary. <code>SplitType</code> also supports a number of record-oriented binary data formats.</p> <p>When splitting is enabled, the size of a mini-batch depends on the values of the <code>BatchStrategy</code> and <code>MaxPayloadInMB</code> parameters. When the value of <code>BatchStrategy</code> is <code>MultiRecord</code>, Amazon SageMaker sends the maximum number of records in each request, up to the <code>MaxPayloadInMB</code> limit. If the value of <code>BatchStrategy</code> is <code>SingleRecord</code>, Amazon SageMaker sends individual records in each request.</p> <note> <p>Some data formats represent a record as a binary payload wrapped with extra padding bytes. When splitting is applied to a binary data format, padding is removed if the value of <code>BatchStrategy</code> is set to <code>SingleRecord</code>. Padding is not removed if the value of <code>BatchStrategy</code> is set to <code>MultiRecord</code>.</p> <p>For more information about <code>RecordIO</code>, see <a href=\\\"https://mxnet.apache.org/api/faq/recordio\\\">Create a Dataset Using RecordIO</a> in the MXNet documentation. For more information about <code>TFRecord</code>, see <a href=\\\"https://www.tensorflow.org/guide/datasets#consuming_tfrecord_data\\\">Consuming TFRecord data</a> in the TensorFlow documentation.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the input source of a transform job and the way the transform job consumes it.</p>\"\
    },\
    \"TransformInstanceCount\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"TransformInstanceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ml.m4.xlarge\",\
        \"ml.m4.2xlarge\",\
        \"ml.m4.4xlarge\",\
        \"ml.m4.10xlarge\",\
        \"ml.m4.16xlarge\",\
        \"ml.c4.xlarge\",\
        \"ml.c4.2xlarge\",\
        \"ml.c4.4xlarge\",\
        \"ml.c4.8xlarge\",\
        \"ml.p2.xlarge\",\
        \"ml.p2.8xlarge\",\
        \"ml.p2.16xlarge\",\
        \"ml.p3.2xlarge\",\
        \"ml.p3.8xlarge\",\
        \"ml.p3.16xlarge\",\
        \"ml.c5.xlarge\",\
        \"ml.c5.2xlarge\",\
        \"ml.c5.4xlarge\",\
        \"ml.c5.9xlarge\",\
        \"ml.c5.18xlarge\",\
        \"ml.m5.large\",\
        \"ml.m5.xlarge\",\
        \"ml.m5.2xlarge\",\
        \"ml.m5.4xlarge\",\
        \"ml.m5.12xlarge\",\
        \"ml.m5.24xlarge\"\
      ]\
    },\
    \"TransformInstanceTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TransformInstanceType\"},\
      \"min\":1\
    },\
    \"TransformJobArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:transform-job/.*\"\
    },\
    \"TransformJobDefinition\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TransformInput\",\
        \"TransformOutput\",\
        \"TransformResources\"\
      ],\
      \"members\":{\
        \"MaxConcurrentTransforms\":{\
          \"shape\":\"MaxConcurrentTransforms\",\
          \"documentation\":\"<p>The maximum number of parallel requests that can be sent to each instance in a transform job. The default value is 1.</p>\"\
        },\
        \"MaxPayloadInMB\":{\
          \"shape\":\"MaxPayloadInMB\",\
          \"documentation\":\"<p>The maximum payload size allowed, in MB. A payload is the data portion of a record (without metadata).</p>\"\
        },\
        \"BatchStrategy\":{\
          \"shape\":\"BatchStrategy\",\
          \"documentation\":\"<p>A string that determines the number of records included in a single mini-batch.</p> <p> <code>SingleRecord</code> means only one record is used per mini-batch. <code>MultiRecord</code> means a mini-batch is set to contain as many records that can fit within the <code>MaxPayloadInMB</code> limit.</p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"TransformEnvironmentMap\",\
          \"documentation\":\"<p>The environment variables to set in the Docker container. We support up to 16 key and values entries in the map.</p>\"\
        },\
        \"TransformInput\":{\
          \"shape\":\"TransformInput\",\
          \"documentation\":\"<p>A description of the input source and the way the transform job consumes it.</p>\"\
        },\
        \"TransformOutput\":{\
          \"shape\":\"TransformOutput\",\
          \"documentation\":\"<p>Identifies the Amazon S3 location where you want Amazon SageMaker to save the results from the transform job.</p>\"\
        },\
        \"TransformResources\":{\
          \"shape\":\"TransformResources\",\
          \"documentation\":\"<p>Identifies the ML compute instances for the transform job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Defines the input needed to run a transform job using the inference specification specified in the algorithm.</p>\"\
    },\
    \"TransformJobName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"TransformJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"InProgress\",\
        \"Completed\",\
        \"Failed\",\
        \"Stopping\",\
        \"Stopped\"\
      ]\
    },\
    \"TransformJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TransformJobSummary\"}\
    },\
    \"TransformJobSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TransformJobName\",\
        \"TransformJobArn\",\
        \"CreationTime\",\
        \"TransformJobStatus\"\
      ],\
      \"members\":{\
        \"TransformJobName\":{\
          \"shape\":\"TransformJobName\",\
          \"documentation\":\"<p>The name of the transform job.</p>\"\
        },\
        \"TransformJobArn\":{\
          \"shape\":\"TransformJobArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the transform job.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>A timestamp that shows when the transform Job was created.</p>\"\
        },\
        \"TransformEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Indicates when the transform job ends on compute instances. For successful jobs and stopped jobs, this is the exact time recorded after the results are uploaded. For failed jobs, this is when Amazon SageMaker detected that the job failed.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Indicates when the transform job was last modified.</p>\"\
        },\
        \"TransformJobStatus\":{\
          \"shape\":\"TransformJobStatus\",\
          \"documentation\":\"<p>The status of the transform job.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the transform job failed, the reason it failed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides a summary of a transform job. Multiple <code>TransformJobSummary</code> objects are returned as a list after in response to a <a>ListTransformJobs</a> call.</p>\"\
    },\
    \"TransformOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3OutputPath\"],\
      \"members\":{\
        \"S3OutputPath\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 path where you want Amazon SageMaker to store the results of the transform job. For example, <code>s3://bucket-name/key-name-prefix</code>.</p> <p>For every S3 object used as input for the transform job, batch transform stores the transformed data with an .<code>out</code> suffix in a corresponding subfolder in the location in the output prefix. For example, for the input data stored at <code>s3://bucket-name/input-name-prefix/dataset01/data.csv</code>, batch transform stores the transformed data at <code>s3://bucket-name/output-name-prefix/input-name-prefix/data.csv.out</code>. Batch transform doesn't upload partially processed objects. For an input S3 object that contains multiple records, it creates an .<code>out</code> file only if the transform job succeeds on the entire file. When the input contains multiple S3 objects, the batch transform job processes the listed S3 objects and uploads only the output for successfully processed objects. If any object fails in the transform job batch transform marks the job as failed to prompt investigation.</p>\"\
        },\
        \"Accept\":{\
          \"shape\":\"Accept\",\
          \"documentation\":\"<p>The MIME type used to specify the output data. Amazon SageMaker uses the MIME type with each http call to transfer data from the transform job.</p>\"\
        },\
        \"AssembleWith\":{\
          \"shape\":\"AssemblyType\",\
          \"documentation\":\"<p>Defines how to assemble the results of the transform job as a single S3 object. Choose a format that is most convenient to you. To concatenate the results in binary format, specify <code>None</code>. To add a newline character at the end of every transformed record, specify <code>Line</code>.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the model artifacts at rest using Amazon S3 server-side encryption. The <code>KmsKeyId</code> can be any of the following formats: </p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias name ARN: <code>arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul> <p>If you don't provide a KMS key ID, Amazon SageMaker uses the default KMS key for Amazon S3 for your role's account. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html\\\">KMS-Managed Encryption Keys</a> in the <i>Amazon Simple Storage Service Developer Guide.</i> </p> <p>The KMS key policy must grant permission to the IAM role that you specify in your <a>CreateModel</a> request. For more information, see <a href=\\\"http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html\\\">Using Key Policies in AWS KMS</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the results of a transform job.</p>\"\
    },\
    \"TransformResources\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceType\",\
        \"InstanceCount\"\
      ],\
      \"members\":{\
        \"InstanceType\":{\
          \"shape\":\"TransformInstanceType\",\
          \"documentation\":\"<p>The ML compute instance type for the transform job. If you are using built-in algorithms to transform moderately sized datasets, we recommend using ml.m4.xlarge or <code>ml.m5.large</code> instance types.</p>\"\
        },\
        \"InstanceCount\":{\
          \"shape\":\"TransformInstanceCount\",\
          \"documentation\":\"<p>The number of ML compute instances to use in the transform job. For distributed transform jobs, specify a value greater than 1. The default value is <code>1</code>.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt model data on the storage volume attached to the ML compute instance(s) that run the batch transform job. The <code>VolumeKmsKeyId</code> can be any of the following formats:</p> <ul> <li> <p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Key ARN: <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code> </p> </li> <li> <p>Alias name: <code>alias/ExampleAlias</code> </p> </li> <li> <p>Alias name ARN: <code>arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the resources, including ML instance types and ML instance count, to use for transform job.</p>\"\
    },\
    \"TransformS3DataSource\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"S3DataType\",\
        \"S3Uri\"\
      ],\
      \"members\":{\
        \"S3DataType\":{\
          \"shape\":\"S3DataType\",\
          \"documentation\":\"<p>If you choose <code>S3Prefix</code>, <code>S3Uri</code> identifies a key name prefix. Amazon SageMaker uses all objects with the specified key name prefix for batch transform. </p> <p>If you choose <code>ManifestFile</code>, <code>S3Uri</code> identifies an object that is a manifest file containing a list of object keys that you want Amazon SageMaker to use for batch transform. </p> <p>The following values are compatible: <code>ManifestFile</code>, <code>S3Prefix</code> </p> <p>The following value is not compatible: <code>AugmentedManifestFile</code> </p>\"\
        },\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>Depending on the value specified for the <code>S3DataType</code>, identifies either a key name prefix or a manifest. For example:</p> <ul> <li> <p> A key name prefix might look like this: <code>s3://bucketname/exampleprefix</code>. </p> </li> <li> <p> A manifest might look like this: <code>s3://bucketname/example.manifest</code> </p> <p> The manifest is an S3 object which is a JSON file with the following format: </p> <p> <code>[ {\\\"prefix\\\": \\\"s3://customer_bucket/some/prefix/\\\"},</code> </p> <p> <code>\\\"relative/path/to/custdata-1\\\",</code> </p> <p> <code>\\\"relative/path/custdata-2\\\",</code> </p> <p> <code>...</code> </p> <p> <code>\\\"relative/path/custdata-N\\\"</code> </p> <p> <code>]</code> </p> <p> The preceding JSON matches the following <code>s3Uris</code>: </p> <p> <code>s3://customer_bucket/some/prefix/relative/path/to/custdata-1</code> </p> <p> <code>s3://customer_bucket/some/prefix/relative/path/custdata-2</code> </p> <p> <code>...</code> </p> <p> <code>s3://customer_bucket/some/prefix/relative/path/custdata-N</code> </p> <p> The complete set of <code>S3Uris</code> in this manifest constitutes the input data for the channel for this datasource. The object that each <code>S3Uris</code> points to must be readable by the IAM role that Amazon SageMaker uses to perform tasks on your behalf.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the S3 data source.</p>\"\
    },\
    \"Trial\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial.</p>\"\
        },\
        \"TrialArn\":{\
          \"shape\":\"TrialArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trial.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial as displayed. If <code>DisplayName</code> isn't specified, <code>TrialName</code> is displayed.</p>\"\
        },\
        \"ExperimentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment the trial is part of.</p>\"\
        },\
        \"Source\":{\"shape\":\"TrialSource\"},\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the trial was created.</p>\"\
        },\
        \"CreatedBy\":{\"shape\":\"UserContext\"},\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Who last modified the trial.</p>\"\
        },\
        \"LastModifiedBy\":{\"shape\":\"UserContext\"},\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The list of tags that are associated with the trial. You can use <a>Search</a> API to search on the tags.</p>\"\
        },\
        \"TrialComponentSummaries\":{\
          \"shape\":\"TrialComponentSimpleSummaries\",\
          \"documentation\":\"<p>A list of the components associated with the trial. For each component, a summary of the component's properties is included.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The properties of a trial as returned by the <a>Search</a> API.</p>\"\
    },\
    \"TrialArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:experiment-trial/.*\"\
    },\
    \"TrialComponent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialComponentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial component.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the component as displayed. If <code>DisplayName</code> isn't specified, <code>TrialComponentName</code> is displayed.</p>\"\
        },\
        \"TrialComponentArn\":{\
          \"shape\":\"TrialComponentArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trial component.</p>\"\
        },\
        \"Source\":{\
          \"shape\":\"TrialComponentSource\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) and job type of the source of the component.</p>\"\
        },\
        \"Status\":{\"shape\":\"TrialComponentStatus\"},\
        \"StartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component started.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component ended.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component was created.</p>\"\
        },\
        \"CreatedBy\":{\"shape\":\"UserContext\"},\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component was last modified.</p>\"\
        },\
        \"LastModifiedBy\":{\"shape\":\"UserContext\"},\
        \"Parameters\":{\
          \"shape\":\"TrialComponentParameters\",\
          \"documentation\":\"<p>The hyperparameters of the component.</p>\"\
        },\
        \"InputArtifacts\":{\
          \"shape\":\"TrialComponentArtifacts\",\
          \"documentation\":\"<p>The input artifacts of the component.</p>\"\
        },\
        \"OutputArtifacts\":{\
          \"shape\":\"TrialComponentArtifacts\",\
          \"documentation\":\"<p>The output artifacts of the component.</p>\"\
        },\
        \"Metrics\":{\
          \"shape\":\"TrialComponentMetricSummaries\",\
          \"documentation\":\"<p>The metrics for the component.</p>\"\
        },\
        \"SourceDetail\":{\
          \"shape\":\"TrialComponentSourceDetail\",\
          \"documentation\":\"<p>Details of the source of the component.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The list of tags that are associated with the component. You can use <a>Search</a> API to search on the tags.</p>\"\
        },\
        \"Parents\":{\
          \"shape\":\"Parents\",\
          \"documentation\":\"<p>An array of the parents of the component. A parent is a trial the component is associated with and the experiment the trial is part of. A component might not have any parents.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The properties of a trial component as returned by the <a>Search</a> API.</p>\"\
    },\
    \"TrialComponentArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:experiment-trial-component/.*\"\
    },\
    \"TrialComponentArtifact\":{\
      \"type\":\"structure\",\
      \"required\":[\"Value\"],\
      \"members\":{\
        \"MediaType\":{\
          \"shape\":\"MediaType\",\
          \"documentation\":\"<p>The media type of the artifact, which indicates the type of data in the artifact file. The media type consists of a <i>type</i> and a <i>subtype</i> concatenated with a slash (/) character, for example, text/csv, image/jpeg, and s3/uri. The type specifies the category of the media. The subtype specifies the kind of data.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TrialComponentArtifactValue\",\
          \"documentation\":\"<p>The location of the artifact.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents an input or output artifact of a trial component. You specify <code>TrialComponentArtifact</code> as part of the <code>InputArtifacts</code> and <code>OutputArtifacts</code> parameters in the <a>CreateTrialComponent</a> request.</p> <p>Examples of input artifacts are datasets, algorithms, hyperparameters, source code, and instance types. Examples of output artifacts are metrics, snapshots, logs, and images.</p>\"\
    },\
    \"TrialComponentArtifactValue\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"pattern\":\".*\"\
    },\
    \"TrialComponentArtifacts\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TrialComponentKey64\"},\
      \"value\":{\"shape\":\"TrialComponentArtifact\"},\
      \"max\":30\
    },\
    \"TrialComponentKey256\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\".*\"\
    },\
    \"TrialComponentKey64\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"pattern\":\".*\"\
    },\
    \"TrialComponentMetricSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrialComponentMetricSummary\"}\
    },\
    \"TrialComponentMetricSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        },\
        \"SourceArn\":{\
          \"shape\":\"TrialComponentSourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the source.</p>\"\
        },\
        \"TimeStamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the metric was last updated.</p>\"\
        },\
        \"Max\":{\
          \"shape\":\"OptionalDouble\",\
          \"documentation\":\"<p>The maximum value of the metric.</p>\"\
        },\
        \"Min\":{\
          \"shape\":\"OptionalDouble\",\
          \"documentation\":\"<p>The minimum value of the metric.</p>\"\
        },\
        \"Last\":{\
          \"shape\":\"OptionalDouble\",\
          \"documentation\":\"<p>The most recent value of the metric.</p>\"\
        },\
        \"Count\":{\
          \"shape\":\"OptionalInteger\",\
          \"documentation\":\"<p>The number of samples used to generate the metric.</p>\"\
        },\
        \"Avg\":{\
          \"shape\":\"OptionalDouble\",\
          \"documentation\":\"<p>The average value of the metric.</p>\"\
        },\
        \"StdDev\":{\
          \"shape\":\"OptionalDouble\",\
          \"documentation\":\"<p>The standard deviation of the metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A summary of the metrics of a trial component.</p>\"\
    },\
    \"TrialComponentParameterValue\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StringValue\":{\
          \"shape\":\"StringParameterValue\",\
          \"documentation\":\"<p>The string value of a categorical hyperparameter. If you specify a value for this parameter, you can't specify the <code>NumberValue</code> parameter.</p>\"\
        },\
        \"NumberValue\":{\
          \"shape\":\"DoubleParameterValue\",\
          \"documentation\":\"<p>The numeric value of a numeric hyperparameter. If you specify a value for this parameter, you can't specify the <code>StringValue</code> parameter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The value of a hyperparameter. Only one of <code>NumberValue</code> or <code>StringValue</code> can be specified.</p> <p>This object is specified in the <a>CreateTrialComponent</a> request.</p>\"\
    },\
    \"TrialComponentParameters\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TrialComponentKey256\"},\
      \"value\":{\"shape\":\"TrialComponentParameterValue\"},\
      \"max\":150\
    },\
    \"TrialComponentPrimaryStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"InProgress\",\
        \"Completed\",\
        \"Failed\",\
        \"Stopping\",\
        \"Stopped\"\
      ]\
    },\
    \"TrialComponentSimpleSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrialComponentSimpleSummary\"}\
    },\
    \"TrialComponentSimpleSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialComponentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial component.</p>\"\
        },\
        \"TrialComponentArn\":{\
          \"shape\":\"TrialComponentArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trial component.</p>\"\
        },\
        \"TrialComponentSource\":{\"shape\":\"TrialComponentSource\"},\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component was created.</p>\"\
        },\
        \"CreatedBy\":{\"shape\":\"UserContext\"}\
      },\
      \"documentation\":\"<p>A short summary of a trial component.</p>\"\
    },\
    \"TrialComponentSource\":{\
      \"type\":\"structure\",\
      \"required\":[\"SourceArn\"],\
      \"members\":{\
        \"SourceArn\":{\
          \"shape\":\"TrialComponentSourceArn\",\
          \"documentation\":\"<p>The source ARN.</p>\"\
        },\
        \"SourceType\":{\
          \"shape\":\"SourceType\",\
          \"documentation\":\"<p>The source job type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon Resource Name (ARN) and job type of the source of a trial component.</p>\"\
    },\
    \"TrialComponentSourceArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:.*\"\
    },\
    \"TrialComponentSourceDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SourceArn\":{\
          \"shape\":\"TrialComponentSourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the source.</p>\"\
        },\
        \"TrainingJob\":{\
          \"shape\":\"TrainingJob\",\
          \"documentation\":\"<p>Information about a training job that's the source of a trial component.</p>\"\
        },\
        \"ProcessingJob\":{\
          \"shape\":\"ProcessingJob\",\
          \"documentation\":\"<p>Information about a processing job that's the source of a trial component.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Detailed information about the source of a trial component. Either <code>ProcessingJob</code> or <code>TrainingJob</code> is returned.</p>\"\
    },\
    \"TrialComponentStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PrimaryStatus\":{\
          \"shape\":\"TrialComponentPrimaryStatus\",\
          \"documentation\":\"<p>The status of the trial component.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"TrialComponentStatusMessage\",\
          \"documentation\":\"<p>If the component failed, a message describing why.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The status of the trial component.</p>\"\
    },\
    \"TrialComponentStatusMessage\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\".*\"\
    },\
    \"TrialComponentSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrialComponentSummary\"}\
    },\
    \"TrialComponentSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialComponentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial component.</p>\"\
        },\
        \"TrialComponentArn\":{\
          \"shape\":\"TrialComponentArn\",\
          \"documentation\":\"<p>The ARN of the trial component.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the component as displayed. If <code>DisplayName</code> isn't specified, <code>TrialComponentName</code> is displayed.</p>\"\
        },\
        \"TrialComponentSource\":{\"shape\":\"TrialComponentSource\"},\
        \"Status\":{\
          \"shape\":\"TrialComponentStatus\",\
          \"documentation\":\"<p>The status of the component. States include:</p> <ul> <li> <p>InProgress</p> </li> <li> <p>Completed</p> </li> <li> <p>Failed</p> </li> </ul>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component started.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component ended.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component was created.</p>\"\
        },\
        \"CreatedBy\":{\
          \"shape\":\"UserContext\",\
          \"documentation\":\"<p>Who created the component.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component was last modified.</p>\"\
        },\
        \"LastModifiedBy\":{\
          \"shape\":\"UserContext\",\
          \"documentation\":\"<p>Who last modified the component.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A summary of the properties of a trial component. To get all the properties, call the <a>DescribeTrialComponent</a> API and provide the <code>TrialComponentName</code>.</p>\"\
    },\
    \"TrialSource\":{\
      \"type\":\"structure\",\
      \"required\":[\"SourceArn\"],\
      \"members\":{\
        \"SourceArn\":{\
          \"shape\":\"TrialSourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the source.</p>\"\
        },\
        \"SourceType\":{\
          \"shape\":\"SourceType\",\
          \"documentation\":\"<p>The source job type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The source of the trial.</p>\"\
    },\
    \"TrialSourceArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:.*\"\
    },\
    \"TrialSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrialSummary\"}\
    },\
    \"TrialSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialArn\":{\
          \"shape\":\"TrialArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trial.</p>\"\
        },\
        \"TrialName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial as displayed. If <code>DisplayName</code> isn't specified, <code>TrialName</code> is displayed.</p>\"\
        },\
        \"TrialSource\":{\"shape\":\"TrialSource\"},\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the trial was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the trial was last modified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A summary of the properties of a trial. To get the complete set of properties, call the <a>DescribeTrial</a> API and provide the <code>TrialName</code>.</p>\"\
    },\
    \"TuningJobCompletionCriteria\":{\
      \"type\":\"structure\",\
      \"required\":[\"TargetObjectiveMetricValue\"],\
      \"members\":{\
        \"TargetObjectiveMetricValue\":{\
          \"shape\":\"TargetObjectiveMetricValue\",\
          \"documentation\":\"<p>The objective metric's value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The job completion criteria.</p>\"\
    },\
    \"USD\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Dollars\":{\
          \"shape\":\"Dollars\",\
          \"documentation\":\"<p>The whole number of dollars in the amount.</p>\"\
        },\
        \"Cents\":{\
          \"shape\":\"Cents\",\
          \"documentation\":\"<p>The fractional portion, in cents, of the amount. </p>\"\
        },\
        \"TenthFractionsOfACent\":{\
          \"shape\":\"TenthFractionsOfACent\",\
          \"documentation\":\"<p>Fractions of a cent, in tenths.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents an amount of money in United States dollars/</p>\"\
    },\
    \"UiConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UiTemplateS3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 bucket location of the UI template. For more information about the contents of a UI template, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sms-custom-templates-step2.html\\\"> Creating Your Custom Labeling Task Template</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provided configuration information for the worker UI for a labeling job. </p>\"\
    },\
    \"UiTemplate\":{\
      \"type\":\"structure\",\
      \"required\":[\"Content\"],\
      \"members\":{\
        \"Content\":{\
          \"shape\":\"TemplateContent\",\
          \"documentation\":\"<p>The content of the Liquid template for the worker user interface.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Liquid template for the worker user interface.</p>\"\
    },\
    \"UiTemplateInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Url\":{\
          \"shape\":\"TemplateUrl\",\
          \"documentation\":\"<p>The URL for the user interface template.</p>\"\
        },\
        \"ContentSha256\":{\
          \"shape\":\"TemplateContentSha256\",\
          \"documentation\":\"<p>The SHA-256 digest of the contents of the template.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Container for user interface template information.</p>\"\
    },\
    \"UpdateCodeRepositoryInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeRepositoryName\"],\
      \"members\":{\
        \"CodeRepositoryName\":{\
          \"shape\":\"EntityName\",\
          \"documentation\":\"<p>The name of the Git repository to update.</p>\"\
        },\
        \"GitConfig\":{\
          \"shape\":\"GitConfigForUpdate\",\
          \"documentation\":\"<p>The configuration of the git repository, including the URL and the Amazon Resource Name (ARN) of the AWS Secrets Manager secret that contains the credentials used to access the repository. The secret must have a staging label of <code>AWSCURRENT</code> and must be in the following format:</p> <p> <code>{\\\"username\\\": <i>UserName</i>, \\\"password\\\": <i>Password</i>}</code> </p>\"\
        }\
      }\
    },\
    \"UpdateCodeRepositoryOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeRepositoryArn\"],\
      \"members\":{\
        \"CodeRepositoryArn\":{\
          \"shape\":\"CodeRepositoryArn\",\
          \"documentation\":\"<p>The ARN of the Git repository.</p>\"\
        }\
      }\
    },\
    \"UpdateDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DomainId\"],\
      \"members\":{\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"DefaultUserSettings\":{\
          \"shape\":\"UserSettings\",\
          \"documentation\":\"<p>A collection of settings.</p>\"\
        }\
      }\
    },\
    \"UpdateDomainResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DomainArn\":{\
          \"shape\":\"DomainArn\",\
          \"documentation\":\"<p>The domain Amazon Resource Name (ARN).</p>\"\
        }\
      }\
    },\
    \"UpdateEndpointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointName\",\
        \"EndpointConfigName\"\
      ],\
      \"members\":{\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p>The name of the endpoint whose configuration you want to update.</p>\"\
        },\
        \"EndpointConfigName\":{\
          \"shape\":\"EndpointConfigName\",\
          \"documentation\":\"<p>The name of the new endpoint configuration.</p>\"\
        },\
        \"RetainAllVariantProperties\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>When updating endpoint resources, enables or disables the retention of variant properties, such as the instance count or the variant weight. To retain the variant properties of an endpoint when updating it, set <code>RetainAllVariantProperties</code> to <code>true</code>. To use the variant properties specified in a new <code>EndpointConfig</code> call when updating an endpoint, set <code>RetainAllVariantProperties</code> to <code>false</code>.</p>\"\
        },\
        \"ExcludeRetainedVariantProperties\":{\
          \"shape\":\"VariantPropertyList\",\
          \"documentation\":\"<p>When you are updating endpoint resources with <a>UpdateEndpointInput$RetainAllVariantProperties</a>, whose value is set to <code>true</code>, <code>ExcludeRetainedVariantProperties</code> specifies the list of type <a>VariantProperty</a> to override with the values provided by <code>EndpointConfig</code>. If you don't specify a value for <code>ExcludeAllVariantProperties</code>, no variant properties are overridden. </p>\"\
        }\
      }\
    },\
    \"UpdateEndpointOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointArn\"],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"EndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the endpoint.</p>\"\
        }\
      }\
    },\
    \"UpdateEndpointWeightsAndCapacitiesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointName\",\
        \"DesiredWeightsAndCapacities\"\
      ],\
      \"members\":{\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p>The name of an existing Amazon SageMaker endpoint.</p>\"\
        },\
        \"DesiredWeightsAndCapacities\":{\
          \"shape\":\"DesiredWeightAndCapacityList\",\
          \"documentation\":\"<p>An object that provides new capacity and weight values for a variant.</p>\"\
        }\
      }\
    },\
    \"UpdateEndpointWeightsAndCapacitiesOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointArn\"],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"EndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the updated endpoint.</p>\"\
        }\
      }\
    },\
    \"UpdateExperimentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ExperimentName\"],\
      \"members\":{\
        \"ExperimentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment to update.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the experiment as displayed. The name doesn't need to be unique. If <code>DisplayName</code> isn't specified, <code>ExperimentName</code> is displayed.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ExperimentDescription\",\
          \"documentation\":\"<p>The description of the experiment.</p>\"\
        }\
      }\
    },\
    \"UpdateExperimentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExperimentArn\":{\
          \"shape\":\"ExperimentArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the experiment.</p>\"\
        }\
      }\
    },\
    \"UpdateMonitoringScheduleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MonitoringScheduleName\",\
        \"MonitoringScheduleConfig\"\
      ],\
      \"members\":{\
        \"MonitoringScheduleName\":{\
          \"shape\":\"MonitoringScheduleName\",\
          \"documentation\":\"<p>The name of the monitoring schedule. The name must be unique within an AWS Region within an AWS account.</p>\"\
        },\
        \"MonitoringScheduleConfig\":{\
          \"shape\":\"MonitoringScheduleConfig\",\
          \"documentation\":\"<p>The configuration object that specifies the monitoring schedule and defines the monitoring job.</p>\"\
        }\
      }\
    },\
    \"UpdateMonitoringScheduleResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"MonitoringScheduleArn\"],\
      \"members\":{\
        \"MonitoringScheduleArn\":{\
          \"shape\":\"MonitoringScheduleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the monitoring schedule.</p>\"\
        }\
      }\
    },\
    \"UpdateNotebookInstanceInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"NotebookInstanceName\"],\
      \"members\":{\
        \"NotebookInstanceName\":{\
          \"shape\":\"NotebookInstanceName\",\
          \"documentation\":\"<p>The name of the notebook instance to update.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"InstanceType\",\
          \"documentation\":\"<p>The Amazon ML compute instance type.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker can assume to access the notebook instance. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html\\\">Amazon SageMaker Roles</a>. </p> <note> <p>To be able to pass this role to Amazon SageMaker, the caller of this API must have the <code>iam:PassRole</code> permission.</p> </note>\"\
        },\
        \"LifecycleConfigName\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigName\",\
          \"documentation\":\"<p>The name of a lifecycle configuration to associate with the notebook instance. For information about lifestyle configurations, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html\\\">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>\"\
        },\
        \"DisassociateLifecycleConfig\":{\
          \"shape\":\"DisassociateNotebookInstanceLifecycleConfig\",\
          \"documentation\":\"<p>Set to <code>true</code> to remove the notebook instance lifecycle configuration currently associated with the notebook instance. This operation is idempotent. If you specify a lifecycle configuration that is not associated with the notebook instance when you call this method, it does not throw an error.</p>\"\
        },\
        \"VolumeSizeInGB\":{\
          \"shape\":\"NotebookInstanceVolumeSizeInGB\",\
          \"documentation\":\"<p>The size, in GB, of the ML storage volume to attach to the notebook instance. The default value is 5 GB. ML storage volumes are encrypted, so Amazon SageMaker can't determine the amount of available free space on the volume. Because of this, you can increase the volume size when you update a notebook instance, but you can't decrease the volume size. If you want to decrease the size of the ML storage volume in use, create a new notebook instance with the desired size.</p>\"\
        },\
        \"DefaultCodeRepository\":{\
          \"shape\":\"CodeRepositoryNameOrUrl\",\
          \"documentation\":\"<p>The Git repository to associate with the notebook instance as its default code repository. This can be either the name of a Git repository stored as a resource in your account, or the URL of a Git repository in <a href=\\\"https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html\\\">AWS CodeCommit</a> or in any other Git repository. When you open a notebook instance, it opens in the directory that contains this repository. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html\\\">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>\"\
        },\
        \"AdditionalCodeRepositories\":{\
          \"shape\":\"AdditionalCodeRepositoryNamesOrUrls\",\
          \"documentation\":\"<p>An array of up to three Git repositories to associate with the notebook instance. These can be either the names of Git repositories stored as resources in your account, or the URL of Git repositories in <a href=\\\"https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html\\\">AWS CodeCommit</a> or in any other Git repository. These repositories are cloned at the same level as the default repository of your notebook instance. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html\\\">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>\"\
        },\
        \"AcceleratorTypes\":{\
          \"shape\":\"NotebookInstanceAcceleratorTypes\",\
          \"documentation\":\"<p>A list of the Elastic Inference (EI) instance types to associate with this notebook instance. Currently only one EI instance type can be associated with a notebook instance. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html\\\">Using Elastic Inference in Amazon SageMaker</a>.</p>\"\
        },\
        \"DisassociateAcceleratorTypes\":{\
          \"shape\":\"DisassociateNotebookInstanceAcceleratorTypes\",\
          \"documentation\":\"<p>A list of the Elastic Inference (EI) instance types to remove from this notebook instance. This operation is idempotent. If you specify an accelerator type that is not associated with the notebook instance when you call this method, it does not throw an error.</p>\"\
        },\
        \"DisassociateDefaultCodeRepository\":{\
          \"shape\":\"DisassociateDefaultCodeRepository\",\
          \"documentation\":\"<p>The name or URL of the default Git repository to remove from this notebook instance. This operation is idempotent. If you specify a Git repository that is not associated with the notebook instance when you call this method, it does not throw an error.</p>\"\
        },\
        \"DisassociateAdditionalCodeRepositories\":{\
          \"shape\":\"DisassociateAdditionalCodeRepositories\",\
          \"documentation\":\"<p>A list of names or URLs of the default Git repositories to remove from this notebook instance. This operation is idempotent. If you specify a Git repository that is not associated with the notebook instance when you call this method, it does not throw an error.</p>\"\
        },\
        \"RootAccess\":{\
          \"shape\":\"RootAccess\",\
          \"documentation\":\"<p>Whether root access is enabled or disabled for users of the notebook instance. The default value is <code>Enabled</code>.</p> <note> <p>If you set this to <code>Disabled</code>, users don't have root access on the notebook instance, but lifecycle configuration scripts still run with root permissions.</p> </note>\"\
        }\
      }\
    },\
    \"UpdateNotebookInstanceLifecycleConfigInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"NotebookInstanceLifecycleConfigName\"],\
      \"members\":{\
        \"NotebookInstanceLifecycleConfigName\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigName\",\
          \"documentation\":\"<p>The name of the lifecycle configuration.</p>\"\
        },\
        \"OnCreate\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigList\",\
          \"documentation\":\"<p>The shell script that runs only once, when you create a notebook instance. The shell script must be a base64-encoded string.</p>\"\
        },\
        \"OnStart\":{\
          \"shape\":\"NotebookInstanceLifecycleConfigList\",\
          \"documentation\":\"<p>The shell script that runs every time you start a notebook instance, including when you create the notebook instance. The shell script must be a base64-encoded string.</p>\"\
        }\
      }\
    },\
    \"UpdateNotebookInstanceLifecycleConfigOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateNotebookInstanceOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateTrialComponentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrialComponentName\"],\
      \"members\":{\
        \"TrialComponentName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the component to update.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the component as displayed. The name doesn't need to be unique. If <code>DisplayName</code> isn't specified, <code>TrialComponentName</code> is displayed.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"TrialComponentStatus\",\
          \"documentation\":\"<p>The new status of the component.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component started.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the component ended.</p>\"\
        },\
        \"Parameters\":{\
          \"shape\":\"TrialComponentParameters\",\
          \"documentation\":\"<p>Replaces all of the component's hyperparameters with the specified hyperparameters.</p>\"\
        },\
        \"ParametersToRemove\":{\
          \"shape\":\"ListTrialComponentKey256\",\
          \"documentation\":\"<p>The hyperparameters to remove from the component.</p>\"\
        },\
        \"InputArtifacts\":{\
          \"shape\":\"TrialComponentArtifacts\",\
          \"documentation\":\"<p>Replaces all of the component's input artifacts with the specified artifacts.</p>\"\
        },\
        \"InputArtifactsToRemove\":{\
          \"shape\":\"ListTrialComponentKey256\",\
          \"documentation\":\"<p>The input artifacts to remove from the component.</p>\"\
        },\
        \"OutputArtifacts\":{\
          \"shape\":\"TrialComponentArtifacts\",\
          \"documentation\":\"<p>Replaces all of the component's output artifacts with the specified artifacts.</p>\"\
        },\
        \"OutputArtifactsToRemove\":{\
          \"shape\":\"ListTrialComponentKey256\",\
          \"documentation\":\"<p>The output artifacts to remove from the component.</p>\"\
        }\
      }\
    },\
    \"UpdateTrialComponentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialComponentArn\":{\
          \"shape\":\"TrialComponentArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trial component.</p>\"\
        }\
      }\
    },\
    \"UpdateTrialRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrialName\"],\
      \"members\":{\
        \"TrialName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial to update.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"ExperimentEntityName\",\
          \"documentation\":\"<p>The name of the trial as displayed. The name doesn't need to be unique. If <code>DisplayName</code> isn't specified, <code>TrialName</code> is displayed.</p>\"\
        }\
      }\
    },\
    \"UpdateTrialResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrialArn\":{\
          \"shape\":\"TrialArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the trial.</p>\"\
        }\
      }\
    },\
    \"UpdateUserProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DomainId\",\
        \"UserProfileName\"\
      ],\
      \"members\":{\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"UserProfileName\":{\
          \"shape\":\"UserProfileName\",\
          \"documentation\":\"<p>The user profile name.</p>\"\
        },\
        \"UserSettings\":{\
          \"shape\":\"UserSettings\",\
          \"documentation\":\"<p>A collection of settings.</p>\"\
        }\
      }\
    },\
    \"UpdateUserProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserProfileArn\":{\
          \"shape\":\"UserProfileArn\",\
          \"documentation\":\"<p>The user profile Amazon Resource Name (ARN).</p>\"\
        }\
      }\
    },\
    \"UpdateWorkforceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"WorkforceName\"],\
      \"members\":{\
        \"WorkforceName\":{\
          \"shape\":\"WorkforceName\",\
          \"documentation\":\"<p>The name of the private workforce whose access you want to restrict. <code>WorkforceName</code> is automatically set to <code>default</code> when a workforce is created and cannot be modified. </p>\"\
        },\
        \"SourceIpConfig\":{\
          \"shape\":\"SourceIpConfig\",\
          \"documentation\":\"<p>A list of one to four worker IP address ranges (<a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html\\\">CIDRs</a>) that can be used to access tasks assigned to this workforce.</p> <p>Maximum: Four CIDR values</p>\"\
        }\
      }\
    },\
    \"UpdateWorkforceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Workforce\"],\
      \"members\":{\
        \"Workforce\":{\
          \"shape\":\"Workforce\",\
          \"documentation\":\"<p>A single private workforce, which is automatically created when you create your first private work team. You can create one private work force in each AWS Region. By default, any workforce-related API operation used in a specific region will apply to the workforce created in that region. To learn how to create a private workforce, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private.html\\\">Create a Private Workforce</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateWorkteamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"WorkteamName\"],\
      \"members\":{\
        \"WorkteamName\":{\
          \"shape\":\"WorkteamName\",\
          \"documentation\":\"<p>The name of the work team to update.</p>\"\
        },\
        \"MemberDefinitions\":{\
          \"shape\":\"MemberDefinitions\",\
          \"documentation\":\"<p>A list of <code>MemberDefinition</code> objects that contain the updated work team members.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String200\",\
          \"documentation\":\"<p>An updated description for the work team.</p>\"\
        },\
        \"NotificationConfiguration\":{\
          \"shape\":\"NotificationConfiguration\",\
          \"documentation\":\"<p>Configures SNS topic notifications for available or expiring work items</p>\"\
        }\
      }\
    },\
    \"UpdateWorkteamResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Workteam\"],\
      \"members\":{\
        \"Workteam\":{\
          \"shape\":\"Workteam\",\
          \"documentation\":\"<p>A <code>Workteam</code> object that describes the updated work team.</p>\"\
        }\
      }\
    },\
    \"Url\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"^(https|s3)://([^/]+)/?(.*)$\"\
    },\
    \"UserContext\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserProfileArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user's profile.</p>\"\
        },\
        \"UserProfileName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the user's profile.</p>\"\
        },\
        \"DomainId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The domain associated with the user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the user who created or modified an experiment, trial, or trial component.</p>\"\
    },\
    \"UserProfileArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:user-profile/.*\"\
    },\
    \"UserProfileDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DomainId\":{\
          \"shape\":\"DomainId\",\
          \"documentation\":\"<p>The domain ID.</p>\"\
        },\
        \"UserProfileName\":{\
          \"shape\":\"UserProfileName\",\
          \"documentation\":\"<p>The user profile name.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"UserProfileStatus\",\
          \"documentation\":\"<p>The status.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"CreationTime\",\
          \"documentation\":\"<p>The creation time.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"LastModifiedTime\",\
          \"documentation\":\"<p>The last modified time.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The user profile details.</p>\"\
    },\
    \"UserProfileList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserProfileDetails\"}\
    },\
    \"UserProfileName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"UserProfileSortKey\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CreationTime\",\
        \"LastModifiedTime\"\
      ]\
    },\
    \"UserProfileStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Deleting\",\
        \"Failed\",\
        \"InService\",\
        \"Pending\"\
      ]\
    },\
    \"UserSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ExecutionRole\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The execution role for the user.</p>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>The security groups.</p>\"\
        },\
        \"SharingSettings\":{\
          \"shape\":\"SharingSettings\",\
          \"documentation\":\"<p>The sharing settings.</p>\"\
        },\
        \"JupyterServerAppSettings\":{\
          \"shape\":\"JupyterServerAppSettings\",\
          \"documentation\":\"<p>The Jupyter server's app settings.</p>\"\
        },\
        \"KernelGatewayAppSettings\":{\
          \"shape\":\"KernelGatewayAppSettings\",\
          \"documentation\":\"<p>The kernel gateway app settings.</p>\"\
        },\
        \"TensorBoardAppSettings\":{\
          \"shape\":\"TensorBoardAppSettings\",\
          \"documentation\":\"<p>The TensorBoard app settings.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A collection of settings.</p>\"\
    },\
    \"VariantName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"VariantProperty\":{\
      \"type\":\"structure\",\
      \"required\":[\"VariantPropertyType\"],\
      \"members\":{\
        \"VariantPropertyType\":{\
          \"shape\":\"VariantPropertyType\",\
          \"documentation\":\"<p>The type of variant property. The supported values are:</p> <ul> <li> <p> <code>DesiredInstanceCount</code>: Overrides the existing variant instance counts using the <a>ProductionVariant$InitialInstanceCount</a> values in the <a>CreateEndpointConfigInput$ProductionVariants</a>.</p> </li> <li> <p> <code>DesiredWeight</code>: Overrides the existing variant weights using the <a>ProductionVariant$InitialVariantWeight</a> values in the <a>CreateEndpointConfigInput$ProductionVariants</a>.</p> </li> <li> <p> <code>DataCaptureConfig</code>: (Not currently supported.)</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a production variant property type for an Endpoint.</p> <p>If you are updating an endpoint with the <a>UpdateEndpointInput$RetainAllVariantProperties</a> option set to <code>true</code>, the <code>VariantProperty</code> objects listed in <a>UpdateEndpointInput$ExcludeRetainedVariantProperties</a> override the existing variant properties of the endpoint.</p>\"\
    },\
    \"VariantPropertyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VariantProperty\"},\
      \"max\":3,\
      \"min\":0\
    },\
    \"VariantPropertyType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DesiredInstanceCount\",\
        \"DesiredWeight\",\
        \"DataCaptureConfig\"\
      ]\
    },\
    \"VariantWeight\":{\
      \"type\":\"float\",\
      \"min\":0\
    },\
    \"VolumeSizeInGB\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"VpcConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecurityGroupIds\",\
        \"Subnets\"\
      ],\
      \"members\":{\
        \"SecurityGroupIds\":{\
          \"shape\":\"VpcSecurityGroupIds\",\
          \"documentation\":\"<p>The VPC security group IDs, in the form sg-xxxxxxxx. Specify the security groups for the VPC that is specified in the <code>Subnets</code> field.</p>\"\
        },\
        \"Subnets\":{\
          \"shape\":\"Subnets\",\
          \"documentation\":\"<p>The ID of the subnets in the VPC to which you want to connect your training job or model. For information about the availability of specific instance types, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/instance-types-az.html\\\">Supported Instance Types and Availability Zones</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a VPC that your training jobs and hosted models have access to. Control access to and from your training and model containers by configuring the VPC. For more information, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/host-vpc.html\\\">Protect Endpoints by Using an Amazon Virtual Private Cloud</a> and <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html\\\">Protect Training Jobs by Using an Amazon Virtual Private Cloud</a>. </p>\"\
    },\
    \"VpcId\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"pattern\":\"[-0-9a-zA-Z]+\"\
    },\
    \"VpcSecurityGroupIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityGroupId\"},\
      \"max\":5,\
      \"min\":1\
    },\
    \"Workforce\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"WorkforceName\",\
        \"WorkforceArn\"\
      ],\
      \"members\":{\
        \"WorkforceName\":{\
          \"shape\":\"WorkforceName\",\
          \"documentation\":\"<p>The name of the private workforce whose access you want to restrict. <code>WorkforceName</code> is automatically set to <code>default</code> when a workforce is created and cannot be modified. </p>\"\
        },\
        \"WorkforceArn\":{\
          \"shape\":\"WorkforceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the private workforce.</p>\"\
        },\
        \"LastUpdatedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The most recent date that was used to successfully add one or more IP address ranges (<a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html\\\">CIDRs</a>) to a private workforce's allow list.</p>\"\
        },\
        \"SourceIpConfig\":{\
          \"shape\":\"SourceIpConfig\",\
          \"documentation\":\"<p>A list of one to four IP address ranges (<a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html\\\">CIDRs</a>) to be added to the workforce allow list.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A single private workforce, which is automatically created when you create your first private work team. You can create one private work force in each AWS Region. By default, any workforce-related API operation used in a specific region will apply to the workforce created in that region. To learn how to create a private workforce, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private.html\\\">Create a Private Workforce</a>.</p>\"\
    },\
    \"WorkforceArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:workforce/.*\"\
    },\
    \"WorkforceName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9]([a-zA-Z0-9\\\\-])*$\"\
    },\
    \"Workteam\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"WorkteamName\",\
        \"MemberDefinitions\",\
        \"WorkteamArn\",\
        \"Description\"\
      ],\
      \"members\":{\
        \"WorkteamName\":{\
          \"shape\":\"WorkteamName\",\
          \"documentation\":\"<p>The name of the work team.</p>\"\
        },\
        \"MemberDefinitions\":{\
          \"shape\":\"MemberDefinitions\",\
          \"documentation\":\"<p>The Amazon Cognito user groups that make up the work team.</p>\"\
        },\
        \"WorkteamArn\":{\
          \"shape\":\"WorkteamArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the work team.</p>\"\
        },\
        \"ProductListingIds\":{\
          \"shape\":\"ProductListings\",\
          \"documentation\":\"<p>The Amazon Marketplace identifier for a vendor's work team.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"String200\",\
          \"documentation\":\"<p>A description of the work team.</p>\"\
        },\
        \"SubDomain\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The URI of the labeling job's user interface. Workers open this URI to start labeling your data objects.</p>\"\
        },\
        \"CreateDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the work team was created (timestamp).</p>\"\
        },\
        \"LastUpdatedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the work team was last updated (timestamp).</p>\"\
        },\
        \"NotificationConfiguration\":{\
          \"shape\":\"NotificationConfiguration\",\
          \"documentation\":\"<p>Configures SNS notifications of available or expiring work items for work teams.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides details about a labeling work team.</p>\"\
    },\
    \"WorkteamArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws[a-z\\\\-]*:sagemaker:[a-z0-9\\\\-]*:[0-9]{12}:workteam/.*\"\
    },\
    \"WorkteamName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"Workteams\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Workteam\"}\
    }\
  },\
  \"documentation\":\"<p>Provides APIs for creating and managing Amazon SageMaker resources. </p> <p>Other Resources:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/whatis.html#first-time-user\\\">Amazon SageMaker Developer Guide</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/augmented-ai/2019-11-07/APIReference/Welcome.html\\\">Amazon Augmented AI Runtime API Reference</a> </p> </li> </ul>\"\
}\
";
}

@end
