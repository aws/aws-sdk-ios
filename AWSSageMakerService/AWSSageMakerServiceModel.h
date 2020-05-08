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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSSageMakerServiceErrorDomain;

typedef NS_ENUM(NSInteger, AWSSageMakerServiceErrorType) {
    AWSSageMakerServiceErrorUnknown,
    AWSSageMakerServiceErrorConflict,
    AWSSageMakerServiceErrorResourceInUse,
    AWSSageMakerServiceErrorResourceLimitExceeded,
    AWSSageMakerServiceErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAlgorithmSortBy) {
    AWSSageMakerServiceAlgorithmSortByUnknown,
    AWSSageMakerServiceAlgorithmSortByName,
    AWSSageMakerServiceAlgorithmSortByCreationTime,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAlgorithmStatus) {
    AWSSageMakerServiceAlgorithmStatusUnknown,
    AWSSageMakerServiceAlgorithmStatusPending,
    AWSSageMakerServiceAlgorithmStatusInProgress,
    AWSSageMakerServiceAlgorithmStatusCompleted,
    AWSSageMakerServiceAlgorithmStatusFailed,
    AWSSageMakerServiceAlgorithmStatusDeleting,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAppInstanceType) {
    AWSSageMakerServiceAppInstanceTypeUnknown,
    AWSSageMakerServiceAppInstanceTypeSystem,
    AWSSageMakerServiceAppInstanceTypeMlT3Micro,
    AWSSageMakerServiceAppInstanceTypeMlT3Small,
    AWSSageMakerServiceAppInstanceTypeMlT3Medium,
    AWSSageMakerServiceAppInstanceTypeMlT3Large,
    AWSSageMakerServiceAppInstanceTypeMlT3Xlarge,
    AWSSageMakerServiceAppInstanceTypeMlT32xlarge,
    AWSSageMakerServiceAppInstanceTypeMlM5Large,
    AWSSageMakerServiceAppInstanceTypeMlM5Xlarge,
    AWSSageMakerServiceAppInstanceTypeMlM52xlarge,
    AWSSageMakerServiceAppInstanceTypeMlM54xlarge,
    AWSSageMakerServiceAppInstanceTypeMlM58xlarge,
    AWSSageMakerServiceAppInstanceTypeMlM512xlarge,
    AWSSageMakerServiceAppInstanceTypeMlM516xlarge,
    AWSSageMakerServiceAppInstanceTypeMlM524xlarge,
    AWSSageMakerServiceAppInstanceTypeMlC5Large,
    AWSSageMakerServiceAppInstanceTypeMlC5Xlarge,
    AWSSageMakerServiceAppInstanceTypeMlC52xlarge,
    AWSSageMakerServiceAppInstanceTypeMlC54xlarge,
    AWSSageMakerServiceAppInstanceTypeMlC59xlarge,
    AWSSageMakerServiceAppInstanceTypeMlC512xlarge,
    AWSSageMakerServiceAppInstanceTypeMlC518xlarge,
    AWSSageMakerServiceAppInstanceTypeMlC524xlarge,
    AWSSageMakerServiceAppInstanceTypeMlP32xlarge,
    AWSSageMakerServiceAppInstanceTypeMlP38xlarge,
    AWSSageMakerServiceAppInstanceTypeMlP316xlarge,
    AWSSageMakerServiceAppInstanceTypeMlG4dnXlarge,
    AWSSageMakerServiceAppInstanceTypeMlG4dn2xlarge,
    AWSSageMakerServiceAppInstanceTypeMlG4dn4xlarge,
    AWSSageMakerServiceAppInstanceTypeMlG4dn8xlarge,
    AWSSageMakerServiceAppInstanceTypeMlG4dn12xlarge,
    AWSSageMakerServiceAppInstanceTypeMlG4dn16xlarge,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAppSortKey) {
    AWSSageMakerServiceAppSortKeyUnknown,
    AWSSageMakerServiceAppSortKeyCreationTime,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAppStatus) {
    AWSSageMakerServiceAppStatusUnknown,
    AWSSageMakerServiceAppStatusDeleted,
    AWSSageMakerServiceAppStatusDeleting,
    AWSSageMakerServiceAppStatusFailed,
    AWSSageMakerServiceAppStatusInService,
    AWSSageMakerServiceAppStatusPending,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAppType) {
    AWSSageMakerServiceAppTypeUnknown,
    AWSSageMakerServiceAppTypeJupyterServer,
    AWSSageMakerServiceAppTypeKernelGateway,
    AWSSageMakerServiceAppTypeTensorBoard,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAssemblyType) {
    AWSSageMakerServiceAssemblyTypeUnknown,
    AWSSageMakerServiceAssemblyTypeNone,
    AWSSageMakerServiceAssemblyTypeLine,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAuthMode) {
    AWSSageMakerServiceAuthModeUnknown,
    AWSSageMakerServiceAuthModeSso,
    AWSSageMakerServiceAuthModeIam,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAutoMLJobObjectiveType) {
    AWSSageMakerServiceAutoMLJobObjectiveTypeUnknown,
    AWSSageMakerServiceAutoMLJobObjectiveTypeMaximize,
    AWSSageMakerServiceAutoMLJobObjectiveTypeMinimize,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAutoMLJobSecondaryStatus) {
    AWSSageMakerServiceAutoMLJobSecondaryStatusUnknown,
    AWSSageMakerServiceAutoMLJobSecondaryStatusStarting,
    AWSSageMakerServiceAutoMLJobSecondaryStatusAnalyzingData,
    AWSSageMakerServiceAutoMLJobSecondaryStatusFeatureEngineering,
    AWSSageMakerServiceAutoMLJobSecondaryStatusModelTuning,
    AWSSageMakerServiceAutoMLJobSecondaryStatusMaxCandidatesReached,
    AWSSageMakerServiceAutoMLJobSecondaryStatusFailed,
    AWSSageMakerServiceAutoMLJobSecondaryStatusStopped,
    AWSSageMakerServiceAutoMLJobSecondaryStatusMaxAutoMLJobRuntimeReached,
    AWSSageMakerServiceAutoMLJobSecondaryStatusStopping,
    AWSSageMakerServiceAutoMLJobSecondaryStatusCandidateDefinitionsGenerated,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAutoMLJobStatus) {
    AWSSageMakerServiceAutoMLJobStatusUnknown,
    AWSSageMakerServiceAutoMLJobStatusCompleted,
    AWSSageMakerServiceAutoMLJobStatusInProgress,
    AWSSageMakerServiceAutoMLJobStatusFailed,
    AWSSageMakerServiceAutoMLJobStatusStopped,
    AWSSageMakerServiceAutoMLJobStatusStopping,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAutoMLMetricEnum) {
    AWSSageMakerServiceAutoMLMetricEnumUnknown,
    AWSSageMakerServiceAutoMLMetricEnumAccuracy,
    AWSSageMakerServiceAutoMLMetricEnumMse,
    AWSSageMakerServiceAutoMLMetricEnumF1,
    AWSSageMakerServiceAutoMLMetricEnumF1macro,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAutoMLS3DataType) {
    AWSSageMakerServiceAutoMLS3DataTypeUnknown,
    AWSSageMakerServiceAutoMLS3DataTypeManifestFile,
    AWSSageMakerServiceAutoMLS3DataTypeS3Prefix,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAutoMLSortBy) {
    AWSSageMakerServiceAutoMLSortByUnknown,
    AWSSageMakerServiceAutoMLSortByName,
    AWSSageMakerServiceAutoMLSortByCreationTime,
    AWSSageMakerServiceAutoMLSortByStatus,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAutoMLSortOrder) {
    AWSSageMakerServiceAutoMLSortOrderUnknown,
    AWSSageMakerServiceAutoMLSortOrderAscending,
    AWSSageMakerServiceAutoMLSortOrderDescending,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceAwsManagedHumanLoopRequestSource) {
    AWSSageMakerServiceAwsManagedHumanLoopRequestSourceUnknown,
    AWSSageMakerServiceAwsManagedHumanLoopRequestSourceAWSRekognitionDetectModerationLabelsImageV3,
    AWSSageMakerServiceAwsManagedHumanLoopRequestSourceAWSTextractAnalyzeDocumentFormsV1,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceBatchStrategy) {
    AWSSageMakerServiceBatchStrategyUnknown,
    AWSSageMakerServiceBatchStrategyMultiRecord,
    AWSSageMakerServiceBatchStrategySingleRecord,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceBooleanOperator) {
    AWSSageMakerServiceBooleanOperatorUnknown,
    AWSSageMakerServiceBooleanOperatorAnd,
    AWSSageMakerServiceBooleanOperatorOr,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceCandidateSortBy) {
    AWSSageMakerServiceCandidateSortByUnknown,
    AWSSageMakerServiceCandidateSortByCreationTime,
    AWSSageMakerServiceCandidateSortByStatus,
    AWSSageMakerServiceCandidateSortByFinalObjectiveMetricValue,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceCandidateStatus) {
    AWSSageMakerServiceCandidateStatusUnknown,
    AWSSageMakerServiceCandidateStatusCompleted,
    AWSSageMakerServiceCandidateStatusInProgress,
    AWSSageMakerServiceCandidateStatusFailed,
    AWSSageMakerServiceCandidateStatusStopped,
    AWSSageMakerServiceCandidateStatusStopping,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceCandidateStepType) {
    AWSSageMakerServiceCandidateStepTypeUnknown,
    AWSSageMakerServiceCandidateStepTypeAWSSageMakerTrainingJob,
    AWSSageMakerServiceCandidateStepTypeAWSSageMakerTransformJob,
    AWSSageMakerServiceCandidateStepTypeAWSSageMakerProcessingJob,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceCaptureMode) {
    AWSSageMakerServiceCaptureModeUnknown,
    AWSSageMakerServiceCaptureModeInput,
    AWSSageMakerServiceCaptureModeOutput,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceCaptureStatus) {
    AWSSageMakerServiceCaptureStatusUnknown,
    AWSSageMakerServiceCaptureStatusStarted,
    AWSSageMakerServiceCaptureStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceCodeRepositorySortBy) {
    AWSSageMakerServiceCodeRepositorySortByUnknown,
    AWSSageMakerServiceCodeRepositorySortByName,
    AWSSageMakerServiceCodeRepositorySortByCreationTime,
    AWSSageMakerServiceCodeRepositorySortByLastModifiedTime,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceCodeRepositorySortOrder) {
    AWSSageMakerServiceCodeRepositorySortOrderUnknown,
    AWSSageMakerServiceCodeRepositorySortOrderAscending,
    AWSSageMakerServiceCodeRepositorySortOrderDescending,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceCompilationJobStatus) {
    AWSSageMakerServiceCompilationJobStatusUnknown,
    AWSSageMakerServiceCompilationJobStatusInprogress,
    AWSSageMakerServiceCompilationJobStatusCompleted,
    AWSSageMakerServiceCompilationJobStatusFailed,
    AWSSageMakerServiceCompilationJobStatusStarting,
    AWSSageMakerServiceCompilationJobStatusStopping,
    AWSSageMakerServiceCompilationJobStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceCompressionType) {
    AWSSageMakerServiceCompressionTypeUnknown,
    AWSSageMakerServiceCompressionTypeNone,
    AWSSageMakerServiceCompressionTypeGzip,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceContainerMode) {
    AWSSageMakerServiceContainerModeUnknown,
    AWSSageMakerServiceContainerModeSingleModel,
    AWSSageMakerServiceContainerModeMultiModel,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceContentClassifier) {
    AWSSageMakerServiceContentClassifierUnknown,
    AWSSageMakerServiceContentClassifierFreeOfPersonallyIdentifiableInformation,
    AWSSageMakerServiceContentClassifierFreeOfAdultContent,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceDetailedAlgorithmStatus) {
    AWSSageMakerServiceDetailedAlgorithmStatusUnknown,
    AWSSageMakerServiceDetailedAlgorithmStatusNotStarted,
    AWSSageMakerServiceDetailedAlgorithmStatusInProgress,
    AWSSageMakerServiceDetailedAlgorithmStatusCompleted,
    AWSSageMakerServiceDetailedAlgorithmStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceDetailedModelPackageStatus) {
    AWSSageMakerServiceDetailedModelPackageStatusUnknown,
    AWSSageMakerServiceDetailedModelPackageStatusNotStarted,
    AWSSageMakerServiceDetailedModelPackageStatusInProgress,
    AWSSageMakerServiceDetailedModelPackageStatusCompleted,
    AWSSageMakerServiceDetailedModelPackageStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceDirectInternetAccess) {
    AWSSageMakerServiceDirectInternetAccessUnknown,
    AWSSageMakerServiceDirectInternetAccessEnabled,
    AWSSageMakerServiceDirectInternetAccessDisabled,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceDomainStatus) {
    AWSSageMakerServiceDomainStatusUnknown,
    AWSSageMakerServiceDomainStatusDeleting,
    AWSSageMakerServiceDomainStatusFailed,
    AWSSageMakerServiceDomainStatusInService,
    AWSSageMakerServiceDomainStatusPending,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceEndpointConfigSortKey) {
    AWSSageMakerServiceEndpointConfigSortKeyUnknown,
    AWSSageMakerServiceEndpointConfigSortKeyName,
    AWSSageMakerServiceEndpointConfigSortKeyCreationTime,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceEndpointSortKey) {
    AWSSageMakerServiceEndpointSortKeyUnknown,
    AWSSageMakerServiceEndpointSortKeyName,
    AWSSageMakerServiceEndpointSortKeyCreationTime,
    AWSSageMakerServiceEndpointSortKeyStatus,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceEndpointStatus) {
    AWSSageMakerServiceEndpointStatusUnknown,
    AWSSageMakerServiceEndpointStatusOutOfService,
    AWSSageMakerServiceEndpointStatusCreating,
    AWSSageMakerServiceEndpointStatusUpdating,
    AWSSageMakerServiceEndpointStatusSystemUpdating,
    AWSSageMakerServiceEndpointStatusRollingBack,
    AWSSageMakerServiceEndpointStatusInService,
    AWSSageMakerServiceEndpointStatusDeleting,
    AWSSageMakerServiceEndpointStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceExecutionStatus) {
    AWSSageMakerServiceExecutionStatusUnknown,
    AWSSageMakerServiceExecutionStatusPending,
    AWSSageMakerServiceExecutionStatusCompleted,
    AWSSageMakerServiceExecutionStatusCompletedWithViolations,
    AWSSageMakerServiceExecutionStatusInProgress,
    AWSSageMakerServiceExecutionStatusFailed,
    AWSSageMakerServiceExecutionStatusStopping,
    AWSSageMakerServiceExecutionStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceFileSystemAccessMode) {
    AWSSageMakerServiceFileSystemAccessModeUnknown,
    AWSSageMakerServiceFileSystemAccessModeRw,
    AWSSageMakerServiceFileSystemAccessModeRo,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceFileSystemType) {
    AWSSageMakerServiceFileSystemTypeUnknown,
    AWSSageMakerServiceFileSystemTypeEfs,
    AWSSageMakerServiceFileSystemTypeFSxLustre,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceFlowDefinitionStatus) {
    AWSSageMakerServiceFlowDefinitionStatusUnknown,
    AWSSageMakerServiceFlowDefinitionStatusInitializing,
    AWSSageMakerServiceFlowDefinitionStatusActive,
    AWSSageMakerServiceFlowDefinitionStatusFailed,
    AWSSageMakerServiceFlowDefinitionStatusDeleting,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceFramework) {
    AWSSageMakerServiceFrameworkUnknown,
    AWSSageMakerServiceFrameworkTensorflow,
    AWSSageMakerServiceFrameworkKeras,
    AWSSageMakerServiceFrameworkMxnet,
    AWSSageMakerServiceFrameworkOnnx,
    AWSSageMakerServiceFrameworkPytorch,
    AWSSageMakerServiceFrameworkXgboost,
    AWSSageMakerServiceFrameworkTflite,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceHyperParameterScalingType) {
    AWSSageMakerServiceHyperParameterScalingTypeUnknown,
    AWSSageMakerServiceHyperParameterScalingTypeAuto,
    AWSSageMakerServiceHyperParameterScalingTypeLinear,
    AWSSageMakerServiceHyperParameterScalingTypeLogarithmic,
    AWSSageMakerServiceHyperParameterScalingTypeReverseLogarithmic,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceHyperParameterTuningJobObjectiveType) {
    AWSSageMakerServiceHyperParameterTuningJobObjectiveTypeUnknown,
    AWSSageMakerServiceHyperParameterTuningJobObjectiveTypeMaximize,
    AWSSageMakerServiceHyperParameterTuningJobObjectiveTypeMinimize,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceHyperParameterTuningJobSortByOptions) {
    AWSSageMakerServiceHyperParameterTuningJobSortByOptionsUnknown,
    AWSSageMakerServiceHyperParameterTuningJobSortByOptionsName,
    AWSSageMakerServiceHyperParameterTuningJobSortByOptionsStatus,
    AWSSageMakerServiceHyperParameterTuningJobSortByOptionsCreationTime,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceHyperParameterTuningJobStatus) {
    AWSSageMakerServiceHyperParameterTuningJobStatusUnknown,
    AWSSageMakerServiceHyperParameterTuningJobStatusCompleted,
    AWSSageMakerServiceHyperParameterTuningJobStatusInProgress,
    AWSSageMakerServiceHyperParameterTuningJobStatusFailed,
    AWSSageMakerServiceHyperParameterTuningJobStatusStopped,
    AWSSageMakerServiceHyperParameterTuningJobStatusStopping,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceHyperParameterTuningJobStrategyType) {
    AWSSageMakerServiceHyperParameterTuningJobStrategyTypeUnknown,
    AWSSageMakerServiceHyperParameterTuningJobStrategyTypeBayesian,
    AWSSageMakerServiceHyperParameterTuningJobStrategyTypeRandom,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceHyperParameterTuningJobWarmStartType) {
    AWSSageMakerServiceHyperParameterTuningJobWarmStartTypeUnknown,
    AWSSageMakerServiceHyperParameterTuningJobWarmStartTypeIdenticalDataAndAlgorithm,
    AWSSageMakerServiceHyperParameterTuningJobWarmStartTypeTransferLearning,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceInstanceType) {
    AWSSageMakerServiceInstanceTypeUnknown,
    AWSSageMakerServiceInstanceTypeMlT2Medium,
    AWSSageMakerServiceInstanceTypeMlT2Large,
    AWSSageMakerServiceInstanceTypeMlT2Xlarge,
    AWSSageMakerServiceInstanceTypeMlT22xlarge,
    AWSSageMakerServiceInstanceTypeMlT3Medium,
    AWSSageMakerServiceInstanceTypeMlT3Large,
    AWSSageMakerServiceInstanceTypeMlT3Xlarge,
    AWSSageMakerServiceInstanceTypeMlT32xlarge,
    AWSSageMakerServiceInstanceTypeMlM4Xlarge,
    AWSSageMakerServiceInstanceTypeMlM42xlarge,
    AWSSageMakerServiceInstanceTypeMlM44xlarge,
    AWSSageMakerServiceInstanceTypeMlM410xlarge,
    AWSSageMakerServiceInstanceTypeMlM416xlarge,
    AWSSageMakerServiceInstanceTypeMlM5Xlarge,
    AWSSageMakerServiceInstanceTypeMlM52xlarge,
    AWSSageMakerServiceInstanceTypeMlM54xlarge,
    AWSSageMakerServiceInstanceTypeMlM512xlarge,
    AWSSageMakerServiceInstanceTypeMlM524xlarge,
    AWSSageMakerServiceInstanceTypeMlC4Xlarge,
    AWSSageMakerServiceInstanceTypeMlC42xlarge,
    AWSSageMakerServiceInstanceTypeMlC44xlarge,
    AWSSageMakerServiceInstanceTypeMlC48xlarge,
    AWSSageMakerServiceInstanceTypeMlC5Xlarge,
    AWSSageMakerServiceInstanceTypeMlC52xlarge,
    AWSSageMakerServiceInstanceTypeMlC54xlarge,
    AWSSageMakerServiceInstanceTypeMlC59xlarge,
    AWSSageMakerServiceInstanceTypeMlC518xlarge,
    AWSSageMakerServiceInstanceTypeMlC5dXlarge,
    AWSSageMakerServiceInstanceTypeMlC5d2xlarge,
    AWSSageMakerServiceInstanceTypeMlC5d4xlarge,
    AWSSageMakerServiceInstanceTypeMlC5d9xlarge,
    AWSSageMakerServiceInstanceTypeMlC5d18xlarge,
    AWSSageMakerServiceInstanceTypeMlP2Xlarge,
    AWSSageMakerServiceInstanceTypeMlP28xlarge,
    AWSSageMakerServiceInstanceTypeMlP216xlarge,
    AWSSageMakerServiceInstanceTypeMlP32xlarge,
    AWSSageMakerServiceInstanceTypeMlP38xlarge,
    AWSSageMakerServiceInstanceTypeMlP316xlarge,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceJoinSource) {
    AWSSageMakerServiceJoinSourceUnknown,
    AWSSageMakerServiceJoinSourceInput,
    AWSSageMakerServiceJoinSourceNone,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceLabelingJobStatus) {
    AWSSageMakerServiceLabelingJobStatusUnknown,
    AWSSageMakerServiceLabelingJobStatusInProgress,
    AWSSageMakerServiceLabelingJobStatusCompleted,
    AWSSageMakerServiceLabelingJobStatusFailed,
    AWSSageMakerServiceLabelingJobStatusStopping,
    AWSSageMakerServiceLabelingJobStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceListCompilationJobsSortBy) {
    AWSSageMakerServiceListCompilationJobsSortByUnknown,
    AWSSageMakerServiceListCompilationJobsSortByName,
    AWSSageMakerServiceListCompilationJobsSortByCreationTime,
    AWSSageMakerServiceListCompilationJobsSortByStatus,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceListLabelingJobsForWorkteamSortByOptions) {
    AWSSageMakerServiceListLabelingJobsForWorkteamSortByOptionsUnknown,
    AWSSageMakerServiceListLabelingJobsForWorkteamSortByOptionsCreationTime,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceListWorkteamsSortByOptions) {
    AWSSageMakerServiceListWorkteamsSortByOptionsUnknown,
    AWSSageMakerServiceListWorkteamsSortByOptionsName,
    AWSSageMakerServiceListWorkteamsSortByOptionsCreateDate,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceModelPackageSortBy) {
    AWSSageMakerServiceModelPackageSortByUnknown,
    AWSSageMakerServiceModelPackageSortByName,
    AWSSageMakerServiceModelPackageSortByCreationTime,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceModelPackageStatus) {
    AWSSageMakerServiceModelPackageStatusUnknown,
    AWSSageMakerServiceModelPackageStatusPending,
    AWSSageMakerServiceModelPackageStatusInProgress,
    AWSSageMakerServiceModelPackageStatusCompleted,
    AWSSageMakerServiceModelPackageStatusFailed,
    AWSSageMakerServiceModelPackageStatusDeleting,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceModelSortKey) {
    AWSSageMakerServiceModelSortKeyUnknown,
    AWSSageMakerServiceModelSortKeyName,
    AWSSageMakerServiceModelSortKeyCreationTime,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceMonitoringExecutionSortKey) {
    AWSSageMakerServiceMonitoringExecutionSortKeyUnknown,
    AWSSageMakerServiceMonitoringExecutionSortKeyCreationTime,
    AWSSageMakerServiceMonitoringExecutionSortKeyScheduledTime,
    AWSSageMakerServiceMonitoringExecutionSortKeyStatus,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceMonitoringScheduleSortKey) {
    AWSSageMakerServiceMonitoringScheduleSortKeyUnknown,
    AWSSageMakerServiceMonitoringScheduleSortKeyName,
    AWSSageMakerServiceMonitoringScheduleSortKeyCreationTime,
    AWSSageMakerServiceMonitoringScheduleSortKeyStatus,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceNotebookInstanceAcceleratorType) {
    AWSSageMakerServiceNotebookInstanceAcceleratorTypeUnknown,
    AWSSageMakerServiceNotebookInstanceAcceleratorTypeMlEia1Medium,
    AWSSageMakerServiceNotebookInstanceAcceleratorTypeMlEia1Large,
    AWSSageMakerServiceNotebookInstanceAcceleratorTypeMlEia1Xlarge,
    AWSSageMakerServiceNotebookInstanceAcceleratorTypeMlEia2Medium,
    AWSSageMakerServiceNotebookInstanceAcceleratorTypeMlEia2Large,
    AWSSageMakerServiceNotebookInstanceAcceleratorTypeMlEia2Xlarge,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceNotebookInstanceLifecycleConfigSortKey) {
    AWSSageMakerServiceNotebookInstanceLifecycleConfigSortKeyUnknown,
    AWSSageMakerServiceNotebookInstanceLifecycleConfigSortKeyName,
    AWSSageMakerServiceNotebookInstanceLifecycleConfigSortKeyCreationTime,
    AWSSageMakerServiceNotebookInstanceLifecycleConfigSortKeyLastModifiedTime,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceNotebookInstanceLifecycleConfigSortOrder) {
    AWSSageMakerServiceNotebookInstanceLifecycleConfigSortOrderUnknown,
    AWSSageMakerServiceNotebookInstanceLifecycleConfigSortOrderAscending,
    AWSSageMakerServiceNotebookInstanceLifecycleConfigSortOrderDescending,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceNotebookInstanceSortKey) {
    AWSSageMakerServiceNotebookInstanceSortKeyUnknown,
    AWSSageMakerServiceNotebookInstanceSortKeyName,
    AWSSageMakerServiceNotebookInstanceSortKeyCreationTime,
    AWSSageMakerServiceNotebookInstanceSortKeyStatus,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceNotebookInstanceSortOrder) {
    AWSSageMakerServiceNotebookInstanceSortOrderUnknown,
    AWSSageMakerServiceNotebookInstanceSortOrderAscending,
    AWSSageMakerServiceNotebookInstanceSortOrderDescending,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceNotebookInstanceStatus) {
    AWSSageMakerServiceNotebookInstanceStatusUnknown,
    AWSSageMakerServiceNotebookInstanceStatusPending,
    AWSSageMakerServiceNotebookInstanceStatusInService,
    AWSSageMakerServiceNotebookInstanceStatusStopping,
    AWSSageMakerServiceNotebookInstanceStatusStopped,
    AWSSageMakerServiceNotebookInstanceStatusFailed,
    AWSSageMakerServiceNotebookInstanceStatusDeleting,
    AWSSageMakerServiceNotebookInstanceStatusUpdating,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceNotebookOutputOption) {
    AWSSageMakerServiceNotebookOutputOptionUnknown,
    AWSSageMakerServiceNotebookOutputOptionAllowed,
    AWSSageMakerServiceNotebookOutputOptionDisabled,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceObjectiveStatus) {
    AWSSageMakerServiceObjectiveStatusUnknown,
    AWSSageMakerServiceObjectiveStatusSucceeded,
    AWSSageMakerServiceObjectiveStatusPending,
    AWSSageMakerServiceObjectiveStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceOperator) {
    AWSSageMakerServiceOperatorUnknown,
    AWSSageMakerServiceOperatorEquals,
    AWSSageMakerServiceOperatorNotEquals,
    AWSSageMakerServiceOperatorGreaterThan,
    AWSSageMakerServiceOperatorGreaterThanOrEqualTo,
    AWSSageMakerServiceOperatorLessThan,
    AWSSageMakerServiceOperatorLessThanOrEqualTo,
    AWSSageMakerServiceOperatorContains,
    AWSSageMakerServiceOperatorExists,
    AWSSageMakerServiceOperatorNotExists,
    AWSSageMakerServiceOperatorIn,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceOrderKey) {
    AWSSageMakerServiceOrderKeyUnknown,
    AWSSageMakerServiceOrderKeyAscending,
    AWSSageMakerServiceOrderKeyDescending,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceParameterType) {
    AWSSageMakerServiceParameterTypeUnknown,
    AWSSageMakerServiceParameterTypeInteger,
    AWSSageMakerServiceParameterTypeContinuous,
    AWSSageMakerServiceParameterTypeCategorical,
    AWSSageMakerServiceParameterTypeFreeText,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceProblemType) {
    AWSSageMakerServiceProblemTypeUnknown,
    AWSSageMakerServiceProblemTypeBinaryClassification,
    AWSSageMakerServiceProblemTypeMulticlassClassification,
    AWSSageMakerServiceProblemTypeRegression,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceProcessingInstanceType) {
    AWSSageMakerServiceProcessingInstanceTypeUnknown,
    AWSSageMakerServiceProcessingInstanceTypeMlT3Medium,
    AWSSageMakerServiceProcessingInstanceTypeMlT3Large,
    AWSSageMakerServiceProcessingInstanceTypeMlT3Xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlT32xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlM4Xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlM42xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlM44xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlM410xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlM416xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlC4Xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlC42xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlC44xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlC48xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlP2Xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlP28xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlP216xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlP32xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlP38xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlP316xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlC5Xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlC52xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlC54xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlC59xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlC518xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlM5Large,
    AWSSageMakerServiceProcessingInstanceTypeMlM5Xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlM52xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlM54xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlM512xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlM524xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlR5Large,
    AWSSageMakerServiceProcessingInstanceTypeMlR5Xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlR52xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlR54xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlR58xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlR512xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlR516xlarge,
    AWSSageMakerServiceProcessingInstanceTypeMlR524xlarge,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceProcessingJobStatus) {
    AWSSageMakerServiceProcessingJobStatusUnknown,
    AWSSageMakerServiceProcessingJobStatusInProgress,
    AWSSageMakerServiceProcessingJobStatusCompleted,
    AWSSageMakerServiceProcessingJobStatusFailed,
    AWSSageMakerServiceProcessingJobStatusStopping,
    AWSSageMakerServiceProcessingJobStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceProcessingS3CompressionType) {
    AWSSageMakerServiceProcessingS3CompressionTypeUnknown,
    AWSSageMakerServiceProcessingS3CompressionTypeNone,
    AWSSageMakerServiceProcessingS3CompressionTypeGzip,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceProcessingS3DataDistributionType) {
    AWSSageMakerServiceProcessingS3DataDistributionTypeUnknown,
    AWSSageMakerServiceProcessingS3DataDistributionTypeFullyReplicated,
    AWSSageMakerServiceProcessingS3DataDistributionTypeShardedByS3Key,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceProcessingS3DataType) {
    AWSSageMakerServiceProcessingS3DataTypeUnknown,
    AWSSageMakerServiceProcessingS3DataTypeManifestFile,
    AWSSageMakerServiceProcessingS3DataTypeS3Prefix,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceProcessingS3InputMode) {
    AWSSageMakerServiceProcessingS3InputModeUnknown,
    AWSSageMakerServiceProcessingS3InputModePipe,
    AWSSageMakerServiceProcessingS3InputModeFile,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceProcessingS3UploadMode) {
    AWSSageMakerServiceProcessingS3UploadModeUnknown,
    AWSSageMakerServiceProcessingS3UploadModeContinuous,
    AWSSageMakerServiceProcessingS3UploadModeEndOfJob,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceProductionVariantAcceleratorType) {
    AWSSageMakerServiceProductionVariantAcceleratorTypeUnknown,
    AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia1Medium,
    AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia1Large,
    AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia1Xlarge,
    AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia2Medium,
    AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia2Large,
    AWSSageMakerServiceProductionVariantAcceleratorTypeMlEia2Xlarge,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceProductionVariantInstanceType) {
    AWSSageMakerServiceProductionVariantInstanceTypeUnknown,
    AWSSageMakerServiceProductionVariantInstanceTypeMlT2Medium,
    AWSSageMakerServiceProductionVariantInstanceTypeMlT2Large,
    AWSSageMakerServiceProductionVariantInstanceTypeMlT2Xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlT22xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM4Xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM42xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM44xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM410xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM416xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM5Large,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM5Xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM52xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM54xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM512xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM524xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM5dLarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM5dXlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM5d2xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM5d4xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM5d12xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlM5d24xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC4Large,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC4Xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC42xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC44xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC48xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlP2Xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlP28xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlP216xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlP32xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlP38xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlP316xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC5Large,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC5Xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC52xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC54xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC59xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC518xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC5dLarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC5dXlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC5d2xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC5d4xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC5d9xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlC5d18xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlG4dnXlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn2xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn4xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn8xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn12xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlG4dn16xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlR5Large,
    AWSSageMakerServiceProductionVariantInstanceTypeMlR5Xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlR52xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlR54xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlR512xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlR524xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlR5dLarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlR5dXlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlR5d2xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlR5d4xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlR5d12xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlR5d24xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlInf1Xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlInf12xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlInf16xlarge,
    AWSSageMakerServiceProductionVariantInstanceTypeMlInf124xlarge,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceRecordWrapper) {
    AWSSageMakerServiceRecordWrapperUnknown,
    AWSSageMakerServiceRecordWrapperNone,
    AWSSageMakerServiceRecordWrapperRecordIO,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceResourceType) {
    AWSSageMakerServiceResourceTypeUnknown,
    AWSSageMakerServiceResourceTypeTrainingJob,
    AWSSageMakerServiceResourceTypeExperiment,
    AWSSageMakerServiceResourceTypeExperimentTrial,
    AWSSageMakerServiceResourceTypeExperimentTrialComponent,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceRetentionType) {
    AWSSageMakerServiceRetentionTypeUnknown,
    AWSSageMakerServiceRetentionTypeRetain,
    AWSSageMakerServiceRetentionTypeDelete,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceRootAccess) {
    AWSSageMakerServiceRootAccessUnknown,
    AWSSageMakerServiceRootAccessEnabled,
    AWSSageMakerServiceRootAccessDisabled,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceRuleEvaluationStatus) {
    AWSSageMakerServiceRuleEvaluationStatusUnknown,
    AWSSageMakerServiceRuleEvaluationStatusInProgress,
    AWSSageMakerServiceRuleEvaluationStatusNoIssuesFound,
    AWSSageMakerServiceRuleEvaluationStatusIssuesFound,
    AWSSageMakerServiceRuleEvaluationStatusError,
    AWSSageMakerServiceRuleEvaluationStatusStopping,
    AWSSageMakerServiceRuleEvaluationStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceS3DataDistribution) {
    AWSSageMakerServiceS3DataDistributionUnknown,
    AWSSageMakerServiceS3DataDistributionFullyReplicated,
    AWSSageMakerServiceS3DataDistributionShardedByS3Key,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceS3DataType) {
    AWSSageMakerServiceS3DataTypeUnknown,
    AWSSageMakerServiceS3DataTypeManifestFile,
    AWSSageMakerServiceS3DataTypeS3Prefix,
    AWSSageMakerServiceS3DataTypeAugmentedManifestFile,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceScheduleStatus) {
    AWSSageMakerServiceScheduleStatusUnknown,
    AWSSageMakerServiceScheduleStatusPending,
    AWSSageMakerServiceScheduleStatusFailed,
    AWSSageMakerServiceScheduleStatusScheduled,
    AWSSageMakerServiceScheduleStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceSearchSortOrder) {
    AWSSageMakerServiceSearchSortOrderUnknown,
    AWSSageMakerServiceSearchSortOrderAscending,
    AWSSageMakerServiceSearchSortOrderDescending,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceSecondaryStatus) {
    AWSSageMakerServiceSecondaryStatusUnknown,
    AWSSageMakerServiceSecondaryStatusStarting,
    AWSSageMakerServiceSecondaryStatusLaunchingMLInstances,
    AWSSageMakerServiceSecondaryStatusPreparingTrainingStack,
    AWSSageMakerServiceSecondaryStatusDownloading,
    AWSSageMakerServiceSecondaryStatusDownloadingTrainingImage,
    AWSSageMakerServiceSecondaryStatusTraining,
    AWSSageMakerServiceSecondaryStatusUploading,
    AWSSageMakerServiceSecondaryStatusStopping,
    AWSSageMakerServiceSecondaryStatusStopped,
    AWSSageMakerServiceSecondaryStatusMaxRuntimeExceeded,
    AWSSageMakerServiceSecondaryStatusCompleted,
    AWSSageMakerServiceSecondaryStatusFailed,
    AWSSageMakerServiceSecondaryStatusInterrupted,
    AWSSageMakerServiceSecondaryStatusMaxWaitTimeExceeded,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceSortBy) {
    AWSSageMakerServiceSortByUnknown,
    AWSSageMakerServiceSortByName,
    AWSSageMakerServiceSortByCreationTime,
    AWSSageMakerServiceSortByStatus,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceSortExperimentsBy) {
    AWSSageMakerServiceSortExperimentsByUnknown,
    AWSSageMakerServiceSortExperimentsByName,
    AWSSageMakerServiceSortExperimentsByCreationTime,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceSortOrder) {
    AWSSageMakerServiceSortOrderUnknown,
    AWSSageMakerServiceSortOrderAscending,
    AWSSageMakerServiceSortOrderDescending,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceSortTrialComponentsBy) {
    AWSSageMakerServiceSortTrialComponentsByUnknown,
    AWSSageMakerServiceSortTrialComponentsByName,
    AWSSageMakerServiceSortTrialComponentsByCreationTime,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceSortTrialsBy) {
    AWSSageMakerServiceSortTrialsByUnknown,
    AWSSageMakerServiceSortTrialsByName,
    AWSSageMakerServiceSortTrialsByCreationTime,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceSplitType) {
    AWSSageMakerServiceSplitTypeUnknown,
    AWSSageMakerServiceSplitTypeNone,
    AWSSageMakerServiceSplitTypeLine,
    AWSSageMakerServiceSplitTypeRecordIO,
    AWSSageMakerServiceSplitTypeTFRecord,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceTargetDevice) {
    AWSSageMakerServiceTargetDeviceUnknown,
    AWSSageMakerServiceTargetDeviceLambda,
    AWSSageMakerServiceTargetDeviceMlM4,
    AWSSageMakerServiceTargetDeviceMlM5,
    AWSSageMakerServiceTargetDeviceMlC4,
    AWSSageMakerServiceTargetDeviceMlC5,
    AWSSageMakerServiceTargetDeviceMlP2,
    AWSSageMakerServiceTargetDeviceMlP3,
    AWSSageMakerServiceTargetDeviceMlInf1,
    AWSSageMakerServiceTargetDeviceJetsonTx1,
    AWSSageMakerServiceTargetDeviceJetsonTx2,
    AWSSageMakerServiceTargetDeviceJetsonNano,
    AWSSageMakerServiceTargetDeviceJetsonXavier,
    AWSSageMakerServiceTargetDeviceRasp3b,
    AWSSageMakerServiceTargetDeviceImx8qm,
    AWSSageMakerServiceTargetDeviceDeeplens,
    AWSSageMakerServiceTargetDeviceRk3399,
    AWSSageMakerServiceTargetDeviceRk3288,
    AWSSageMakerServiceTargetDeviceAisage,
    AWSSageMakerServiceTargetDeviceSbeC,
    AWSSageMakerServiceTargetDeviceQcs605,
    AWSSageMakerServiceTargetDeviceQcs603,
    AWSSageMakerServiceTargetDeviceSitaraAm57x,
    AWSSageMakerServiceTargetDeviceAmbaCv22,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceTrainingInputMode) {
    AWSSageMakerServiceTrainingInputModeUnknown,
    AWSSageMakerServiceTrainingInputModePipe,
    AWSSageMakerServiceTrainingInputModeFile,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceTrainingInstanceType) {
    AWSSageMakerServiceTrainingInstanceTypeUnknown,
    AWSSageMakerServiceTrainingInstanceTypeMlM4Xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlM42xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlM44xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlM410xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlM416xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlG4dnXlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlG4dn2xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlG4dn4xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlG4dn8xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlG4dn12xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlG4dn16xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlM5Large,
    AWSSageMakerServiceTrainingInstanceTypeMlM5Xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlM52xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlM54xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlM512xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlM524xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlC4Xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlC42xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlC44xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlC48xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlP2Xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlP28xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlP216xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlP32xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlP38xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlP316xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlP3dn24xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlC5Xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlC52xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlC54xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlC59xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlC518xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlC5nXlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlC5n2xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlC5n4xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlC5n9xlarge,
    AWSSageMakerServiceTrainingInstanceTypeMlC5n18xlarge,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceTrainingJobEarlyStoppingType) {
    AWSSageMakerServiceTrainingJobEarlyStoppingTypeUnknown,
    AWSSageMakerServiceTrainingJobEarlyStoppingTypeOff,
    AWSSageMakerServiceTrainingJobEarlyStoppingTypeAuto,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceTrainingJobSortByOptions) {
    AWSSageMakerServiceTrainingJobSortByOptionsUnknown,
    AWSSageMakerServiceTrainingJobSortByOptionsName,
    AWSSageMakerServiceTrainingJobSortByOptionsCreationTime,
    AWSSageMakerServiceTrainingJobSortByOptionsStatus,
    AWSSageMakerServiceTrainingJobSortByOptionsFinalObjectiveMetricValue,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceTrainingJobStatus) {
    AWSSageMakerServiceTrainingJobStatusUnknown,
    AWSSageMakerServiceTrainingJobStatusInProgress,
    AWSSageMakerServiceTrainingJobStatusCompleted,
    AWSSageMakerServiceTrainingJobStatusFailed,
    AWSSageMakerServiceTrainingJobStatusStopping,
    AWSSageMakerServiceTrainingJobStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceTransformInstanceType) {
    AWSSageMakerServiceTransformInstanceTypeUnknown,
    AWSSageMakerServiceTransformInstanceTypeMlM4Xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlM42xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlM44xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlM410xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlM416xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlC4Xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlC42xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlC44xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlC48xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlP2Xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlP28xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlP216xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlP32xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlP38xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlP316xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlC5Xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlC52xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlC54xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlC59xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlC518xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlM5Large,
    AWSSageMakerServiceTransformInstanceTypeMlM5Xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlM52xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlM54xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlM512xlarge,
    AWSSageMakerServiceTransformInstanceTypeMlM524xlarge,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceTransformJobStatus) {
    AWSSageMakerServiceTransformJobStatusUnknown,
    AWSSageMakerServiceTransformJobStatusInProgress,
    AWSSageMakerServiceTransformJobStatusCompleted,
    AWSSageMakerServiceTransformJobStatusFailed,
    AWSSageMakerServiceTransformJobStatusStopping,
    AWSSageMakerServiceTransformJobStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceTrialComponentPrimaryStatus) {
    AWSSageMakerServiceTrialComponentPrimaryStatusUnknown,
    AWSSageMakerServiceTrialComponentPrimaryStatusInProgress,
    AWSSageMakerServiceTrialComponentPrimaryStatusCompleted,
    AWSSageMakerServiceTrialComponentPrimaryStatusFailed,
    AWSSageMakerServiceTrialComponentPrimaryStatusStopping,
    AWSSageMakerServiceTrialComponentPrimaryStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceUserProfileSortKey) {
    AWSSageMakerServiceUserProfileSortKeyUnknown,
    AWSSageMakerServiceUserProfileSortKeyCreationTime,
    AWSSageMakerServiceUserProfileSortKeyLastModifiedTime,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceUserProfileStatus) {
    AWSSageMakerServiceUserProfileStatusUnknown,
    AWSSageMakerServiceUserProfileStatusDeleting,
    AWSSageMakerServiceUserProfileStatusFailed,
    AWSSageMakerServiceUserProfileStatusInService,
    AWSSageMakerServiceUserProfileStatusPending,
};

typedef NS_ENUM(NSInteger, AWSSageMakerServiceVariantPropertyType) {
    AWSSageMakerServiceVariantPropertyTypeUnknown,
    AWSSageMakerServiceVariantPropertyTypeDesiredInstanceCount,
    AWSSageMakerServiceVariantPropertyTypeDesiredWeight,
    AWSSageMakerServiceVariantPropertyTypeDataCaptureConfig,
};

@class AWSSageMakerServiceAddTagsInput;
@class AWSSageMakerServiceAddTagsOutput;
@class AWSSageMakerServiceAlgorithmSpecification;
@class AWSSageMakerServiceAlgorithmStatusDetails;
@class AWSSageMakerServiceAlgorithmStatusItem;
@class AWSSageMakerServiceAlgorithmSummary;
@class AWSSageMakerServiceAlgorithmValidationProfile;
@class AWSSageMakerServiceAlgorithmValidationSpecification;
@class AWSSageMakerServiceAnnotationConsolidationConfig;
@class AWSSageMakerServiceAppDetails;
@class AWSSageMakerServiceAppSpecification;
@class AWSSageMakerServiceAssociateTrialComponentRequest;
@class AWSSageMakerServiceAssociateTrialComponentResponse;
@class AWSSageMakerServiceAutoMLCandidate;
@class AWSSageMakerServiceAutoMLCandidateStep;
@class AWSSageMakerServiceAutoMLChannel;
@class AWSSageMakerServiceAutoMLContainerDefinition;
@class AWSSageMakerServiceAutoMLDataSource;
@class AWSSageMakerServiceAutoMLJobArtifacts;
@class AWSSageMakerServiceAutoMLJobCompletionCriteria;
@class AWSSageMakerServiceAutoMLJobConfig;
@class AWSSageMakerServiceAutoMLJobObjective;
@class AWSSageMakerServiceAutoMLJobSummary;
@class AWSSageMakerServiceAutoMLOutputDataConfig;
@class AWSSageMakerServiceAutoMLS3DataSource;
@class AWSSageMakerServiceAutoMLSecurityConfig;
@class AWSSageMakerServiceCaptureContentTypeHeader;
@class AWSSageMakerServiceCaptureOption;
@class AWSSageMakerServiceCategoricalParameterRange;
@class AWSSageMakerServiceCategoricalParameterRangeSpecification;
@class AWSSageMakerServiceChannel;
@class AWSSageMakerServiceChannelSpecification;
@class AWSSageMakerServiceCheckpointConfig;
@class AWSSageMakerServiceCodeRepositorySummary;
@class AWSSageMakerServiceCognitoMemberDefinition;
@class AWSSageMakerServiceCollectionConfiguration;
@class AWSSageMakerServiceCompilationJobSummary;
@class AWSSageMakerServiceContainerDefinition;
@class AWSSageMakerServiceContinuousParameterRange;
@class AWSSageMakerServiceContinuousParameterRangeSpecification;
@class AWSSageMakerServiceCreateAlgorithmInput;
@class AWSSageMakerServiceCreateAlgorithmOutput;
@class AWSSageMakerServiceCreateAppRequest;
@class AWSSageMakerServiceCreateAppResponse;
@class AWSSageMakerServiceCreateAutoMLJobRequest;
@class AWSSageMakerServiceCreateAutoMLJobResponse;
@class AWSSageMakerServiceCreateCodeRepositoryInput;
@class AWSSageMakerServiceCreateCodeRepositoryOutput;
@class AWSSageMakerServiceCreateCompilationJobRequest;
@class AWSSageMakerServiceCreateCompilationJobResponse;
@class AWSSageMakerServiceCreateDomainRequest;
@class AWSSageMakerServiceCreateDomainResponse;
@class AWSSageMakerServiceCreateEndpointConfigInput;
@class AWSSageMakerServiceCreateEndpointConfigOutput;
@class AWSSageMakerServiceCreateEndpointInput;
@class AWSSageMakerServiceCreateEndpointOutput;
@class AWSSageMakerServiceCreateExperimentRequest;
@class AWSSageMakerServiceCreateExperimentResponse;
@class AWSSageMakerServiceCreateFlowDefinitionRequest;
@class AWSSageMakerServiceCreateFlowDefinitionResponse;
@class AWSSageMakerServiceCreateHumanTaskUiRequest;
@class AWSSageMakerServiceCreateHumanTaskUiResponse;
@class AWSSageMakerServiceCreateHyperParameterTuningJobRequest;
@class AWSSageMakerServiceCreateHyperParameterTuningJobResponse;
@class AWSSageMakerServiceCreateLabelingJobRequest;
@class AWSSageMakerServiceCreateLabelingJobResponse;
@class AWSSageMakerServiceCreateModelInput;
@class AWSSageMakerServiceCreateModelOutput;
@class AWSSageMakerServiceCreateModelPackageInput;
@class AWSSageMakerServiceCreateModelPackageOutput;
@class AWSSageMakerServiceCreateMonitoringScheduleRequest;
@class AWSSageMakerServiceCreateMonitoringScheduleResponse;
@class AWSSageMakerServiceCreateNotebookInstanceInput;
@class AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigInput;
@class AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigOutput;
@class AWSSageMakerServiceCreateNotebookInstanceOutput;
@class AWSSageMakerServiceCreatePresignedDomainUrlRequest;
@class AWSSageMakerServiceCreatePresignedDomainUrlResponse;
@class AWSSageMakerServiceCreatePresignedNotebookInstanceUrlInput;
@class AWSSageMakerServiceCreatePresignedNotebookInstanceUrlOutput;
@class AWSSageMakerServiceCreateProcessingJobRequest;
@class AWSSageMakerServiceCreateProcessingJobResponse;
@class AWSSageMakerServiceCreateTrainingJobRequest;
@class AWSSageMakerServiceCreateTrainingJobResponse;
@class AWSSageMakerServiceCreateTransformJobRequest;
@class AWSSageMakerServiceCreateTransformJobResponse;
@class AWSSageMakerServiceCreateTrialComponentRequest;
@class AWSSageMakerServiceCreateTrialComponentResponse;
@class AWSSageMakerServiceCreateTrialRequest;
@class AWSSageMakerServiceCreateTrialResponse;
@class AWSSageMakerServiceCreateUserProfileRequest;
@class AWSSageMakerServiceCreateUserProfileResponse;
@class AWSSageMakerServiceCreateWorkteamRequest;
@class AWSSageMakerServiceCreateWorkteamResponse;
@class AWSSageMakerServiceDataCaptureConfig;
@class AWSSageMakerServiceDataCaptureConfigSummary;
@class AWSSageMakerServiceDataProcessing;
@class AWSSageMakerServiceDataSource;
@class AWSSageMakerServiceDebugHookConfig;
@class AWSSageMakerServiceDebugRuleConfiguration;
@class AWSSageMakerServiceDebugRuleEvaluationStatus;
@class AWSSageMakerServiceDeleteAlgorithmInput;
@class AWSSageMakerServiceDeleteAppRequest;
@class AWSSageMakerServiceDeleteCodeRepositoryInput;
@class AWSSageMakerServiceDeleteDomainRequest;
@class AWSSageMakerServiceDeleteEndpointConfigInput;
@class AWSSageMakerServiceDeleteEndpointInput;
@class AWSSageMakerServiceDeleteExperimentRequest;
@class AWSSageMakerServiceDeleteExperimentResponse;
@class AWSSageMakerServiceDeleteFlowDefinitionRequest;
@class AWSSageMakerServiceDeleteFlowDefinitionResponse;
@class AWSSageMakerServiceDeleteModelInput;
@class AWSSageMakerServiceDeleteModelPackageInput;
@class AWSSageMakerServiceDeleteMonitoringScheduleRequest;
@class AWSSageMakerServiceDeleteNotebookInstanceInput;
@class AWSSageMakerServiceDeleteNotebookInstanceLifecycleConfigInput;
@class AWSSageMakerServiceDeleteTagsInput;
@class AWSSageMakerServiceDeleteTagsOutput;
@class AWSSageMakerServiceDeleteTrialComponentRequest;
@class AWSSageMakerServiceDeleteTrialComponentResponse;
@class AWSSageMakerServiceDeleteTrialRequest;
@class AWSSageMakerServiceDeleteTrialResponse;
@class AWSSageMakerServiceDeleteUserProfileRequest;
@class AWSSageMakerServiceDeleteWorkteamRequest;
@class AWSSageMakerServiceDeleteWorkteamResponse;
@class AWSSageMakerServiceDeployedImage;
@class AWSSageMakerServiceDescribeAlgorithmInput;
@class AWSSageMakerServiceDescribeAlgorithmOutput;
@class AWSSageMakerServiceDescribeAppRequest;
@class AWSSageMakerServiceDescribeAppResponse;
@class AWSSageMakerServiceDescribeAutoMLJobRequest;
@class AWSSageMakerServiceDescribeAutoMLJobResponse;
@class AWSSageMakerServiceDescribeCodeRepositoryInput;
@class AWSSageMakerServiceDescribeCodeRepositoryOutput;
@class AWSSageMakerServiceDescribeCompilationJobRequest;
@class AWSSageMakerServiceDescribeCompilationJobResponse;
@class AWSSageMakerServiceDescribeDomainRequest;
@class AWSSageMakerServiceDescribeDomainResponse;
@class AWSSageMakerServiceDescribeEndpointConfigInput;
@class AWSSageMakerServiceDescribeEndpointConfigOutput;
@class AWSSageMakerServiceDescribeEndpointInput;
@class AWSSageMakerServiceDescribeEndpointOutput;
@class AWSSageMakerServiceDescribeExperimentRequest;
@class AWSSageMakerServiceDescribeExperimentResponse;
@class AWSSageMakerServiceDescribeFlowDefinitionRequest;
@class AWSSageMakerServiceDescribeFlowDefinitionResponse;
@class AWSSageMakerServiceDescribeHumanTaskUiRequest;
@class AWSSageMakerServiceDescribeHumanTaskUiResponse;
@class AWSSageMakerServiceDescribeHyperParameterTuningJobRequest;
@class AWSSageMakerServiceDescribeHyperParameterTuningJobResponse;
@class AWSSageMakerServiceDescribeLabelingJobRequest;
@class AWSSageMakerServiceDescribeLabelingJobResponse;
@class AWSSageMakerServiceDescribeModelInput;
@class AWSSageMakerServiceDescribeModelOutput;
@class AWSSageMakerServiceDescribeModelPackageInput;
@class AWSSageMakerServiceDescribeModelPackageOutput;
@class AWSSageMakerServiceDescribeMonitoringScheduleRequest;
@class AWSSageMakerServiceDescribeMonitoringScheduleResponse;
@class AWSSageMakerServiceDescribeNotebookInstanceInput;
@class AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigInput;
@class AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigOutput;
@class AWSSageMakerServiceDescribeNotebookInstanceOutput;
@class AWSSageMakerServiceDescribeProcessingJobRequest;
@class AWSSageMakerServiceDescribeProcessingJobResponse;
@class AWSSageMakerServiceDescribeSubscribedWorkteamRequest;
@class AWSSageMakerServiceDescribeSubscribedWorkteamResponse;
@class AWSSageMakerServiceDescribeTrainingJobRequest;
@class AWSSageMakerServiceDescribeTrainingJobResponse;
@class AWSSageMakerServiceDescribeTransformJobRequest;
@class AWSSageMakerServiceDescribeTransformJobResponse;
@class AWSSageMakerServiceDescribeTrialComponentRequest;
@class AWSSageMakerServiceDescribeTrialComponentResponse;
@class AWSSageMakerServiceDescribeTrialRequest;
@class AWSSageMakerServiceDescribeTrialResponse;
@class AWSSageMakerServiceDescribeUserProfileRequest;
@class AWSSageMakerServiceDescribeUserProfileResponse;
@class AWSSageMakerServiceDescribeWorkforceRequest;
@class AWSSageMakerServiceDescribeWorkforceResponse;
@class AWSSageMakerServiceDescribeWorkteamRequest;
@class AWSSageMakerServiceDescribeWorkteamResponse;
@class AWSSageMakerServiceDesiredWeightAndCapacity;
@class AWSSageMakerServiceDisassociateTrialComponentRequest;
@class AWSSageMakerServiceDisassociateTrialComponentResponse;
@class AWSSageMakerServiceDomainDetails;
@class AWSSageMakerServiceEndpointConfigSummary;
@class AWSSageMakerServiceEndpointInput;
@class AWSSageMakerServiceEndpointSummary;
@class AWSSageMakerServiceExperiment;
@class AWSSageMakerServiceExperimentConfig;
@class AWSSageMakerServiceExperimentSource;
@class AWSSageMakerServiceExperimentSummary;
@class AWSSageMakerServiceFileSystemDataSource;
@class AWSSageMakerServiceFilter;
@class AWSSageMakerServiceFinalAutoMLJobObjectiveMetric;
@class AWSSageMakerServiceFinalHyperParameterTuningJobObjectiveMetric;
@class AWSSageMakerServiceFlowDefinitionOutputConfig;
@class AWSSageMakerServiceFlowDefinitionSummary;
@class AWSSageMakerServiceGetSearchSuggestionsRequest;
@class AWSSageMakerServiceGetSearchSuggestionsResponse;
@class AWSSageMakerServiceGitConfig;
@class AWSSageMakerServiceGitConfigForUpdate;
@class AWSSageMakerServiceHumanLoopActivationConditionsConfig;
@class AWSSageMakerServiceHumanLoopActivationConfig;
@class AWSSageMakerServiceHumanLoopConfig;
@class AWSSageMakerServiceHumanLoopRequestSource;
@class AWSSageMakerServiceHumanTaskConfig;
@class AWSSageMakerServiceHumanTaskUiSummary;
@class AWSSageMakerServiceHyperParameterAlgorithmSpecification;
@class AWSSageMakerServiceHyperParameterSpecification;
@class AWSSageMakerServiceHyperParameterTrainingJobDefinition;
@class AWSSageMakerServiceHyperParameterTrainingJobSummary;
@class AWSSageMakerServiceHyperParameterTuningJobConfig;
@class AWSSageMakerServiceHyperParameterTuningJobObjective;
@class AWSSageMakerServiceHyperParameterTuningJobSummary;
@class AWSSageMakerServiceHyperParameterTuningJobWarmStartConfig;
@class AWSSageMakerServiceInferenceSpecification;
@class AWSSageMakerServiceInputConfig;
@class AWSSageMakerServiceIntegerParameterRange;
@class AWSSageMakerServiceIntegerParameterRangeSpecification;
@class AWSSageMakerServiceJupyterServerAppSettings;
@class AWSSageMakerServiceKernelGatewayAppSettings;
@class AWSSageMakerServiceLabelCounters;
@class AWSSageMakerServiceLabelCountersForWorkteam;
@class AWSSageMakerServiceLabelingJobAlgorithmsConfig;
@class AWSSageMakerServiceLabelingJobDataAttributes;
@class AWSSageMakerServiceLabelingJobDataSource;
@class AWSSageMakerServiceLabelingJobForWorkteamSummary;
@class AWSSageMakerServiceLabelingJobInputConfig;
@class AWSSageMakerServiceLabelingJobOutput;
@class AWSSageMakerServiceLabelingJobOutputConfig;
@class AWSSageMakerServiceLabelingJobResourceConfig;
@class AWSSageMakerServiceLabelingJobS3DataSource;
@class AWSSageMakerServiceLabelingJobStoppingConditions;
@class AWSSageMakerServiceLabelingJobSummary;
@class AWSSageMakerServiceListAlgorithmsInput;
@class AWSSageMakerServiceListAlgorithmsOutput;
@class AWSSageMakerServiceListAppsRequest;
@class AWSSageMakerServiceListAppsResponse;
@class AWSSageMakerServiceListAutoMLJobsRequest;
@class AWSSageMakerServiceListAutoMLJobsResponse;
@class AWSSageMakerServiceListCandidatesForAutoMLJobRequest;
@class AWSSageMakerServiceListCandidatesForAutoMLJobResponse;
@class AWSSageMakerServiceListCodeRepositoriesInput;
@class AWSSageMakerServiceListCodeRepositoriesOutput;
@class AWSSageMakerServiceListCompilationJobsRequest;
@class AWSSageMakerServiceListCompilationJobsResponse;
@class AWSSageMakerServiceListDomainsRequest;
@class AWSSageMakerServiceListDomainsResponse;
@class AWSSageMakerServiceListEndpointConfigsInput;
@class AWSSageMakerServiceListEndpointConfigsOutput;
@class AWSSageMakerServiceListEndpointsInput;
@class AWSSageMakerServiceListEndpointsOutput;
@class AWSSageMakerServiceListExperimentsRequest;
@class AWSSageMakerServiceListExperimentsResponse;
@class AWSSageMakerServiceListFlowDefinitionsRequest;
@class AWSSageMakerServiceListFlowDefinitionsResponse;
@class AWSSageMakerServiceListHumanTaskUisRequest;
@class AWSSageMakerServiceListHumanTaskUisResponse;
@class AWSSageMakerServiceListHyperParameterTuningJobsRequest;
@class AWSSageMakerServiceListHyperParameterTuningJobsResponse;
@class AWSSageMakerServiceListLabelingJobsForWorkteamRequest;
@class AWSSageMakerServiceListLabelingJobsForWorkteamResponse;
@class AWSSageMakerServiceListLabelingJobsRequest;
@class AWSSageMakerServiceListLabelingJobsResponse;
@class AWSSageMakerServiceListModelPackagesInput;
@class AWSSageMakerServiceListModelPackagesOutput;
@class AWSSageMakerServiceListModelsInput;
@class AWSSageMakerServiceListModelsOutput;
@class AWSSageMakerServiceListMonitoringExecutionsRequest;
@class AWSSageMakerServiceListMonitoringExecutionsResponse;
@class AWSSageMakerServiceListMonitoringSchedulesRequest;
@class AWSSageMakerServiceListMonitoringSchedulesResponse;
@class AWSSageMakerServiceListNotebookInstanceLifecycleConfigsInput;
@class AWSSageMakerServiceListNotebookInstanceLifecycleConfigsOutput;
@class AWSSageMakerServiceListNotebookInstancesInput;
@class AWSSageMakerServiceListNotebookInstancesOutput;
@class AWSSageMakerServiceListProcessingJobsRequest;
@class AWSSageMakerServiceListProcessingJobsResponse;
@class AWSSageMakerServiceListSubscribedWorkteamsRequest;
@class AWSSageMakerServiceListSubscribedWorkteamsResponse;
@class AWSSageMakerServiceListTagsInput;
@class AWSSageMakerServiceListTagsOutput;
@class AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobRequest;
@class AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobResponse;
@class AWSSageMakerServiceListTrainingJobsRequest;
@class AWSSageMakerServiceListTrainingJobsResponse;
@class AWSSageMakerServiceListTransformJobsRequest;
@class AWSSageMakerServiceListTransformJobsResponse;
@class AWSSageMakerServiceListTrialComponentsRequest;
@class AWSSageMakerServiceListTrialComponentsResponse;
@class AWSSageMakerServiceListTrialsRequest;
@class AWSSageMakerServiceListTrialsResponse;
@class AWSSageMakerServiceListUserProfilesRequest;
@class AWSSageMakerServiceListUserProfilesResponse;
@class AWSSageMakerServiceListWorkteamsRequest;
@class AWSSageMakerServiceListWorkteamsResponse;
@class AWSSageMakerServiceMemberDefinition;
@class AWSSageMakerServiceMetricData;
@class AWSSageMakerServiceMetricDefinition;
@class AWSSageMakerServiceModelArtifacts;
@class AWSSageMakerServiceModelPackageContainerDefinition;
@class AWSSageMakerServiceModelPackageStatusDetails;
@class AWSSageMakerServiceModelPackageStatusItem;
@class AWSSageMakerServiceModelPackageSummary;
@class AWSSageMakerServiceModelPackageValidationProfile;
@class AWSSageMakerServiceModelPackageValidationSpecification;
@class AWSSageMakerServiceModelSummary;
@class AWSSageMakerServiceMonitoringAppSpecification;
@class AWSSageMakerServiceMonitoringBaselineConfig;
@class AWSSageMakerServiceMonitoringClusterConfig;
@class AWSSageMakerServiceMonitoringConstraintsResource;
@class AWSSageMakerServiceMonitoringExecutionSummary;
@class AWSSageMakerServiceMonitoringInput;
@class AWSSageMakerServiceMonitoringJobDefinition;
@class AWSSageMakerServiceMonitoringOutput;
@class AWSSageMakerServiceMonitoringOutputConfig;
@class AWSSageMakerServiceMonitoringResources;
@class AWSSageMakerServiceMonitoringS3Output;
@class AWSSageMakerServiceMonitoringScheduleConfig;
@class AWSSageMakerServiceMonitoringScheduleSummary;
@class AWSSageMakerServiceMonitoringStatisticsResource;
@class AWSSageMakerServiceMonitoringStoppingCondition;
@class AWSSageMakerServiceNestedFilters;
@class AWSSageMakerServiceNetworkConfig;
@class AWSSageMakerServiceNotebookInstanceLifecycleConfigSummary;
@class AWSSageMakerServiceNotebookInstanceLifecycleHook;
@class AWSSageMakerServiceNotebookInstanceSummary;
@class AWSSageMakerServiceNotificationConfiguration;
@class AWSSageMakerServiceObjectiveStatusCounters;
@class AWSSageMakerServiceOutputConfig;
@class AWSSageMakerServiceOutputDataConfig;
@class AWSSageMakerServiceParameterRange;
@class AWSSageMakerServiceParameterRanges;
@class AWSSageMakerServiceParent;
@class AWSSageMakerServiceParentHyperParameterTuningJob;
@class AWSSageMakerServiceProcessingClusterConfig;
@class AWSSageMakerServiceProcessingInput;
@class AWSSageMakerServiceProcessingJob;
@class AWSSageMakerServiceProcessingJobSummary;
@class AWSSageMakerServiceProcessingOutput;
@class AWSSageMakerServiceProcessingOutputConfig;
@class AWSSageMakerServiceProcessingResources;
@class AWSSageMakerServiceProcessingS3Input;
@class AWSSageMakerServiceProcessingS3Output;
@class AWSSageMakerServiceProcessingStoppingCondition;
@class AWSSageMakerServiceProductionVariant;
@class AWSSageMakerServiceProductionVariantSummary;
@class AWSSageMakerServicePropertyNameQuery;
@class AWSSageMakerServicePropertyNameSuggestion;
@class AWSSageMakerServicePublicWorkforceTaskPrice;
@class AWSSageMakerServiceRenderUiTemplateRequest;
@class AWSSageMakerServiceRenderUiTemplateResponse;
@class AWSSageMakerServiceRenderableTask;
@class AWSSageMakerServiceRenderingError;
@class AWSSageMakerServiceResolvedAttributes;
@class AWSSageMakerServiceResourceConfig;
@class AWSSageMakerServiceResourceLimits;
@class AWSSageMakerServiceResourceSpec;
@class AWSSageMakerServiceRetentionPolicy;
@class AWSSageMakerServiceS3DataSource;
@class AWSSageMakerServiceScheduleConfig;
@class AWSSageMakerServiceSearchExpression;
@class AWSSageMakerServiceSearchRecord;
@class AWSSageMakerServiceSearchRequest;
@class AWSSageMakerServiceSearchResponse;
@class AWSSageMakerServiceSecondaryStatusTransition;
@class AWSSageMakerServiceSharingSettings;
@class AWSSageMakerServiceShuffleConfig;
@class AWSSageMakerServiceSourceAlgorithm;
@class AWSSageMakerServiceSourceAlgorithmSpecification;
@class AWSSageMakerServiceSourceIpConfig;
@class AWSSageMakerServiceStartMonitoringScheduleRequest;
@class AWSSageMakerServiceStartNotebookInstanceInput;
@class AWSSageMakerServiceStopAutoMLJobRequest;
@class AWSSageMakerServiceStopCompilationJobRequest;
@class AWSSageMakerServiceStopHyperParameterTuningJobRequest;
@class AWSSageMakerServiceStopLabelingJobRequest;
@class AWSSageMakerServiceStopMonitoringScheduleRequest;
@class AWSSageMakerServiceStopNotebookInstanceInput;
@class AWSSageMakerServiceStopProcessingJobRequest;
@class AWSSageMakerServiceStopTrainingJobRequest;
@class AWSSageMakerServiceStopTransformJobRequest;
@class AWSSageMakerServiceStoppingCondition;
@class AWSSageMakerServiceSubscribedWorkteam;
@class AWSSageMakerServiceSuggestionQuery;
@class AWSSageMakerServiceTag;
@class AWSSageMakerServiceTensorBoardAppSettings;
@class AWSSageMakerServiceTensorBoardOutputConfig;
@class AWSSageMakerServiceTrainingJob;
@class AWSSageMakerServiceTrainingJobDefinition;
@class AWSSageMakerServiceTrainingJobStatusCounters;
@class AWSSageMakerServiceTrainingJobSummary;
@class AWSSageMakerServiceTrainingSpecification;
@class AWSSageMakerServiceTransformDataSource;
@class AWSSageMakerServiceTransformInput;
@class AWSSageMakerServiceTransformJobDefinition;
@class AWSSageMakerServiceTransformJobSummary;
@class AWSSageMakerServiceTransformOutput;
@class AWSSageMakerServiceTransformResources;
@class AWSSageMakerServiceTransformS3DataSource;
@class AWSSageMakerServiceTrial;
@class AWSSageMakerServiceTrialComponent;
@class AWSSageMakerServiceTrialComponentArtifact;
@class AWSSageMakerServiceTrialComponentMetricSummary;
@class AWSSageMakerServiceTrialComponentParameterValue;
@class AWSSageMakerServiceTrialComponentSimpleSummary;
@class AWSSageMakerServiceTrialComponentSource;
@class AWSSageMakerServiceTrialComponentSourceDetail;
@class AWSSageMakerServiceTrialComponentStatus;
@class AWSSageMakerServiceTrialComponentSummary;
@class AWSSageMakerServiceTrialSource;
@class AWSSageMakerServiceTrialSummary;
@class AWSSageMakerServiceTuningJobCompletionCriteria;
@class AWSSageMakerServiceUSD;
@class AWSSageMakerServiceUiConfig;
@class AWSSageMakerServiceUiTemplate;
@class AWSSageMakerServiceUiTemplateInfo;
@class AWSSageMakerServiceUpdateCodeRepositoryInput;
@class AWSSageMakerServiceUpdateCodeRepositoryOutput;
@class AWSSageMakerServiceUpdateDomainRequest;
@class AWSSageMakerServiceUpdateDomainResponse;
@class AWSSageMakerServiceUpdateEndpointInput;
@class AWSSageMakerServiceUpdateEndpointOutput;
@class AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesInput;
@class AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesOutput;
@class AWSSageMakerServiceUpdateExperimentRequest;
@class AWSSageMakerServiceUpdateExperimentResponse;
@class AWSSageMakerServiceUpdateMonitoringScheduleRequest;
@class AWSSageMakerServiceUpdateMonitoringScheduleResponse;
@class AWSSageMakerServiceUpdateNotebookInstanceInput;
@class AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigInput;
@class AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigOutput;
@class AWSSageMakerServiceUpdateNotebookInstanceOutput;
@class AWSSageMakerServiceUpdateTrialComponentRequest;
@class AWSSageMakerServiceUpdateTrialComponentResponse;
@class AWSSageMakerServiceUpdateTrialRequest;
@class AWSSageMakerServiceUpdateTrialResponse;
@class AWSSageMakerServiceUpdateUserProfileRequest;
@class AWSSageMakerServiceUpdateUserProfileResponse;
@class AWSSageMakerServiceUpdateWorkforceRequest;
@class AWSSageMakerServiceUpdateWorkforceResponse;
@class AWSSageMakerServiceUpdateWorkteamRequest;
@class AWSSageMakerServiceUpdateWorkteamResponse;
@class AWSSageMakerServiceUserContext;
@class AWSSageMakerServiceUserProfileDetails;
@class AWSSageMakerServiceUserSettings;
@class AWSSageMakerServiceVariantProperty;
@class AWSSageMakerServiceVpcConfig;
@class AWSSageMakerServiceWorkforce;
@class AWSSageMakerServiceWorkteam;

/**
 
 */
@interface AWSSageMakerServiceAddTagsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource that you want to tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>An array of <code>Tag</code> objects. Each tag is a key-value pair. Only the <code>key</code> parameter is required. If you don't specify a value, Amazon SageMaker sets the value to an empty string. </p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSageMakerServiceAddTagsOutput : AWSModel


/**
 <p>A list of tags associated with the Amazon SageMaker resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

@end

/**
 <p>Specifies the training algorithm to use in a <a>CreateTrainingJob</a> request.</p><p>For more information about algorithms provided by Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>. For information about using your own algorithms, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html">Using Your Own Algorithms with Amazon SageMaker</a>. </p>
 Required parameters: [TrainingInputMode]
 */
@interface AWSSageMakerServiceAlgorithmSpecification : AWSModel


/**
 <p>The name of the algorithm resource to use for the training job. This must be an algorithm resource that you created or subscribe to on AWS Marketplace. If you specify a value for this parameter, you can't specify a value for <code>TrainingImage</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmName;

/**
 <p>To generate and save time-series metrics during training, set to <code>true</code>. The default is <code>false</code> and time-series metrics aren't generated except in the following cases:</p><ul><li><p>You use one of the Amazon SageMaker built-in algorithms</p></li><li><p>You use one of the following <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/pre-built-containers-frameworks-deep-learning.html">Prebuilt Amazon SageMaker Docker Images</a>:</p><ul><li><p>Tensorflow (version &gt;= 1.15)</p></li><li><p>MXNet (version &gt;= 1.6)</p></li><li><p>PyTorch (version &gt;= 1.3)</p></li></ul></li><li><p>You specify at least one <a>MetricDefinition</a></p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableSageMakerMetricsTimeSeries;

/**
 <p>A list of metric definition objects. Each object specifies the metric name and regular expressions used to parse algorithm logs. Amazon SageMaker publishes each metric to Amazon CloudWatch.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceMetricDefinition *> * _Nullable metricDefinitions;

/**
 <p>The registry path of the Docker image that contains the training algorithm. For information about docker registry paths for built-in algorithms, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-algo-docker-registry-paths.html">Algorithms Provided by Amazon SageMaker: Common Parameters</a>. Amazon SageMaker supports both <code>registry/repository[:tag]</code> and <code>registry/repository[@digest]</code> image path formats. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html">Using Your Own Algorithms with Amazon SageMaker</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingImage;

/**
 <p>The input mode that the algorithm supports. For the input modes that Amazon SageMaker algorithms support, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>. If an algorithm supports the <code>File</code> input mode, Amazon SageMaker downloads the training data from S3 to the provisioned ML storage Volume, and mounts the directory to docker volume for training container. If an algorithm supports the <code>Pipe</code> input mode, Amazon SageMaker streams data directly from S3 to the container. </p><p> In File mode, make sure you provision ML storage volume with sufficient capacity to accommodate the data download from S3. In addition to the training data, the ML storage volume also stores the output model. The algorithm container use ML storage volume to also store intermediate information, if any. </p><p> For distributed algorithms using File mode, training data is distributed uniformly, and your training duration is predictable if the input data objects size is approximately same. Amazon SageMaker does not split the files any further for model training. If the object sizes are skewed, training won't be optimal as the data distribution is also skewed where one host in a training cluster is overloaded, thus becoming bottleneck in training. </p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTrainingInputMode trainingInputMode;

@end

/**
 <p>Specifies the validation and image scan statuses of the algorithm.</p>
 */
@interface AWSSageMakerServiceAlgorithmStatusDetails : AWSModel


/**
 <p>The status of the scan of the algorithm's Docker image container.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceAlgorithmStatusItem *> * _Nullable imageScanStatuses;

/**
 <p>The status of algorithm validation.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceAlgorithmStatusItem *> * _Nullable validationStatuses;

@end

/**
 <p>Represents the overall status of an algorithm.</p>
 Required parameters: [Name, Status]
 */
@interface AWSSageMakerServiceAlgorithmStatusItem : AWSModel


/**
 <p>if the overall status is <code>Failed</code>, the reason for the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The name of the algorithm for which the overall status is being reported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceDetailedAlgorithmStatus status;

@end

/**
 <p>Provides summary information about an algorithm.</p>
 Required parameters: [AlgorithmName, AlgorithmArn, CreationTime, AlgorithmStatus]
 */
@interface AWSSageMakerServiceAlgorithmSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the algorithm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmArn;

/**
 <p>A brief description of the algorithm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmDescription;

/**
 <p>The name of the algorithm that is described by the summary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmName;

/**
 <p>The overall status of the algorithm.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAlgorithmStatus algorithmStatus;

/**
 <p>A timestamp that shows when the algorithm was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

@end

/**
 <p>Defines a training job and a batch transform job that Amazon SageMaker runs to validate your algorithm.</p><p>The data provided in the validation profile is made available to your buyers on AWS Marketplace.</p>
 Required parameters: [ProfileName, TrainingJobDefinition]
 */
@interface AWSSageMakerServiceAlgorithmValidationProfile : AWSModel


/**
 <p>The name of the profile for the algorithm. The name must have 1 to 63 characters. Valid characters are a-z, A-Z, 0-9, and - (hyphen).</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileName;

/**
 <p>The <code>TrainingJobDefinition</code> object that describes the training job that Amazon SageMaker runs to validate your algorithm.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrainingJobDefinition * _Nullable trainingJobDefinition;

/**
 <p>The <code>TransformJobDefinition</code> object that describes the transform job that Amazon SageMaker runs to validate your algorithm.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTransformJobDefinition * _Nullable transformJobDefinition;

@end

/**
 <p>Specifies configurations for one or more training jobs that Amazon SageMaker runs to test the algorithm.</p>
 Required parameters: [ValidationRole, ValidationProfiles]
 */
@interface AWSSageMakerServiceAlgorithmValidationSpecification : AWSModel


/**
 <p>An array of <code>AlgorithmValidationProfile</code> objects, each of which specifies a training job and batch transform job that Amazon SageMaker runs to validate your algorithm.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceAlgorithmValidationProfile *> * _Nullable validationProfiles;

/**
 <p>The IAM roles that Amazon SageMaker uses to run the training jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable validationRole;

@end

/**
 <p>Configures how labels are consolidated across human workers.</p>
 Required parameters: [AnnotationConsolidationLambdaArn]
 */
@interface AWSSageMakerServiceAnnotationConsolidationConfig : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of a Lambda function implements the logic for annotation consolidation.</p><p>For the built-in bounding box, image classification, semantic segmentation, and text classification task types, Amazon SageMaker Ground Truth provides the following Lambda functions:</p><ul><li><p><i>Bounding box</i> - Finds the most similar boxes from different workers based on the Jaccard index of the boxes.</p><p><code>arn:aws:lambda:us-east-1:432418664414:function:ACS-BoundingBox</code></p><p><code>arn:aws:lambda:us-east-2:266458841044:function:ACS-BoundingBox</code></p><p><code>arn:aws:lambda:us-west-2:081040173940:function:ACS-BoundingBox</code></p><p><code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-BoundingBox</code></p><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-BoundingBox</code></p><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-BoundingBox</code></p><p><code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-BoundingBox</code></p><p><code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-BoundingBox</code></p><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-BoundingBox</code></p><p><code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-BoundingBox</code></p><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-BoundingBox</code></p><p><code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-BoundingBox</code></p></li><li><p><i>Image classification</i> - Uses a variant of the Expectation Maximization approach to estimate the true class of an image based on annotations from individual workers.</p><p><code>arn:aws:lambda:us-east-1:432418664414:function:ACS-ImageMultiClass</code></p><p><code>arn:aws:lambda:us-east-2:266458841044:function:ACS-ImageMultiClass</code></p><p><code>arn:aws:lambda:us-west-2:081040173940:function:ACS-ImageMultiClass</code></p><p><code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-ImageMultiClass</code></p><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-ImageMultiClass</code></p><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-ImageMultiClass</code></p><p><code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-ImageMultiClass</code></p><p><code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-ImageMultiClass</code></p><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-ImageMultiClass</code></p><p><code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-ImageMultiClass</code></p><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-ImageMultiClass</code></p><p><code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-ImageMultiClass</code></p></li><li><p><i>Multi-label image classification</i> - Uses a variant of the Expectation Maximization approach to estimate the true classes of an image based on annotations from individual workers.</p><p><code>arn:aws:lambda:us-east-1:432418664414:function:ACS-ImageMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:us-east-2:266458841044:function:ACS-ImageMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:us-west-2:081040173940:function:ACS-ImageMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-ImageMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-ImageMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-ImageMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-ImageMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-ImageMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-ImageMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-ImageMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-ImageMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-ImageMultiClassMultiLabel</code></p></li><li><p><i>Semantic segmentation</i> - Treats each pixel in an image as a multi-class classification and treats pixel annotations from workers as "votes" for the correct label.</p><p><code>arn:aws:lambda:us-east-1:432418664414:function:ACS-SemanticSegmentation</code></p><p><code>arn:aws:lambda:us-east-2:266458841044:function:ACS-SemanticSegmentation</code></p><p><code>arn:aws:lambda:us-west-2:081040173940:function:ACS-SemanticSegmentation</code></p><p><code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-SemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-SemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-SemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-SemanticSegmentation</code></p><p><code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-SemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-SemanticSegmentation</code></p><p><code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-SemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-SemanticSegmentation</code></p><p><code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-SemanticSegmentation</code></p></li><li><p><i>Text classification</i> - Uses a variant of the Expectation Maximization approach to estimate the true class of text based on annotations from individual workers.</p><p><code>arn:aws:lambda:us-east-1:432418664414:function:ACS-TextMultiClass</code></p><p><code>arn:aws:lambda:us-east-2:266458841044:function:ACS-TextMultiClass</code></p><p><code>arn:aws:lambda:us-west-2:081040173940:function:ACS-TextMultiClass</code></p><p><code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-TextMultiClass</code></p><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-TextMultiClass</code></p><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-TextMultiClass</code></p><p><code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-TextMultiClass</code></p><p><code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-TextMultiClass</code></p><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-TextMultiClass</code></p><p><code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-TextMultiClass</code></p><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-TextMultiClass</code></p><p><code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-TextMultiClass</code></p></li><li><p><i>Multi-label text classification</i> - Uses a variant of the Expectation Maximization approach to estimate the true classes of text based on annotations from individual workers.</p><p><code>arn:aws:lambda:us-east-1:432418664414:function:ACS-TextMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:us-east-2:266458841044:function:ACS-TextMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:us-west-2:081040173940:function:ACS-TextMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-TextMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-TextMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-TextMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-TextMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-TextMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-TextMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-TextMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-TextMultiClassMultiLabel</code></p><p><code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-TextMultiClassMultiLabel</code></p></li><li><p><i>Named entity recognition</i> - Groups similar selections and calculates aggregate boundaries, resolving to most-assigned label.</p><p><code>arn:aws:lambda:us-east-1:432418664414:function:ACS-NamedEntityRecognition</code></p><p><code>arn:aws:lambda:us-east-2:266458841044:function:ACS-NamedEntityRecognition</code></p><p><code>arn:aws:lambda:us-west-2:081040173940:function:ACS-NamedEntityRecognition</code></p><p><code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-NamedEntityRecognition</code></p><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-NamedEntityRecognition</code></p><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-NamedEntityRecognition</code></p><p><code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-NamedEntityRecognition</code></p><p><code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-NamedEntityRecognition</code></p><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-NamedEntityRecognition</code></p><p><code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-NamedEntityRecognition</code></p><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-NamedEntityRecognition</code></p><p><code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-NamedEntityRecognition</code></p></li><li><p><i>Bounding box verification</i> - Uses a variant of the Expectation Maximization approach to estimate the true class of verification judgement for bounding box labels based on annotations from individual workers.</p><p><code>arn:aws:lambda:us-east-1:432418664414:function:ACS-VerificationBoundingBox</code></p><p><code>arn:aws:lambda:us-east-2:266458841044:function:ACS-VerificationBoundingBox</code></p><p><code>arn:aws:lambda:us-west-2:081040173940:function:ACS-VerificationBoundingBox</code></p><p><code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-VerificationBoundingBox</code></p><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-VerificationBoundingBox</code></p><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-VerificationBoundingBox</code></p><p><code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-VerificationBoundingBox</code></p><p><code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-VerificationBoundingBox</code></p><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-VerificationBoundingBox</code></p><p><code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-VerificationBoundingBox</code></p><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-VerificationBoundingBox</code></p><p><code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-VerificationBoundingBox</code></p></li><li><p><i>Semantic segmentation verification</i> - Uses a variant of the Expectation Maximization approach to estimate the true class of verification judgment for semantic segmentation labels based on annotations from individual workers.</p><p><code>arn:aws:lambda:us-east-1:432418664414:function:ACS-VerificationSemanticSegmentation</code></p><p><code>arn:aws:lambda:us-east-2:266458841044:function:ACS-VerificationSemanticSegmentation</code></p><p><code>arn:aws:lambda:us-west-2:081040173940:function:ACS-VerificationSemanticSegmentation</code></p><p><code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-VerificationSemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-VerificationSemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-VerificationSemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-VerificationSemanticSegmentation</code></p><p><code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-VerificationSemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-VerificationSemanticSegmentation</code></p><p><code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-VerificationSemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-VerificationSemanticSegmentation</code></p><p><code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-VerificationSemanticSegmentation</code></p></li><li><p><i>Bounding box adjustment</i> - Finds the most similar boxes from different workers based on the Jaccard index of the adjusted annotations.</p><p><code>arn:aws:lambda:us-east-1:432418664414:function:ACS-AdjustmentBoundingBox</code></p><p><code>arn:aws:lambda:us-east-2:266458841044:function:ACS-AdjustmentBoundingBox</code></p><p><code>arn:aws:lambda:us-west-2:081040173940:function:ACS-AdjustmentBoundingBox</code></p><p><code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-AdjustmentBoundingBox</code></p><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-AdjustmentBoundingBox</code></p><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-AdjustmentBoundingBox</code></p><p><code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-AdjustmentBoundingBox</code></p><p><code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-AdjustmentBoundingBox</code></p><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-AdjustmentBoundingBox</code></p><p><code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-AdjustmentBoundingBox</code></p><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-AdjustmentBoundingBox</code></p><p><code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-AdjustmentBoundingBox</code></p></li><li><p><i>Semantic segmentation adjustment</i> - Treats each pixel in an image as a multi-class classification and treats pixel adjusted annotations from workers as "votes" for the correct label.</p><p><code>arn:aws:lambda:us-east-1:432418664414:function:ACS-AdjustmentSemanticSegmentation</code></p><p><code>arn:aws:lambda:us-east-2:266458841044:function:ACS-AdjustmentSemanticSegmentation</code></p><p><code>arn:aws:lambda:us-west-2:081040173940:function:ACS-AdjustmentSemanticSegmentation</code></p><p><code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-AdjustmentSemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-AdjustmentSemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-AdjustmentSemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-AdjustmentSemanticSegmentation</code></p><p><code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-AdjustmentSemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-AdjustmentSemanticSegmentation</code></p><p><code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-AdjustmentSemanticSegmentation</code></p><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-AdjustmentSemanticSegmentation</code></p><p><code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-AdjustmentSemanticSegmentation</code></p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-annotation-consolidation.html">Annotation Consolidation</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable annotationConsolidationLambdaArn;

@end

/**
 <p>The app's details.</p>
 */
@interface AWSSageMakerServiceAppDetails : AWSModel


/**
 <p>The name of the app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appName;

/**
 <p>The type of app.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAppType appType;

/**
 <p>The creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAppStatus status;

/**
 <p>The user profile name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileName;

@end

/**
 <p>Configuration to run a processing job in a specified container image.</p>
 Required parameters: [ImageUri]
 */
@interface AWSSageMakerServiceAppSpecification : AWSModel


/**
 <p>The arguments for a container used to run a processing job.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable containerArguments;

/**
 <p>The entrypoint for a container used to run a processing job.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable containerEntrypoint;

/**
 <p>The container image to be run by the processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUri;

@end

/**
 
 */
@interface AWSSageMakerServiceAssociateTrialComponentRequest : AWSRequest


/**
 <p>The name of the component to associated with the trial.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentName;

/**
 <p>The name of the trial to associate with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialName;

@end

/**
 
 */
@interface AWSSageMakerServiceAssociateTrialComponentResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the trial.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialArn;

/**
 <p>The ARN of the trial component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentArn;

@end

/**
 <p>An AutoPilot job will return recommendations, or candidates. Each candidate has futher details about the steps involed, and the status.</p>
 Required parameters: [CandidateName, ObjectiveStatus, CandidateSteps, CandidateStatus, CreationTime, LastModifiedTime]
 */
@interface AWSSageMakerServiceAutoMLCandidate : AWSModel


/**
 <p>The candidate name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable candidateName;

/**
 <p>The candidate's status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceCandidateStatus candidateStatus;

/**
 <p>The candidate's steps.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceAutoMLCandidateStep *> * _Nullable candidateSteps;

/**
 <p>The creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The end time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The failure reason.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The candidate result from a job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceFinalAutoMLJobObjectiveMetric * _Nullable finalAutoMLJobObjectiveMetric;

/**
 <p>The inference containers.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceAutoMLContainerDefinition *> * _Nullable inferenceContainers;

/**
 <p>The last modified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The objective status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceObjectiveStatus objectiveStatus;

@end

/**
 <p>Information about the steps for a Candidate, and what step it is working on.</p>
 Required parameters: [CandidateStepType, CandidateStepArn, CandidateStepName]
 */
@interface AWSSageMakerServiceAutoMLCandidateStep : AWSModel


/**
 <p>The ARN for the Candidate's step.</p>
 */
@property (nonatomic, strong) NSString * _Nullable candidateStepArn;

/**
 <p>The name for the Candidate's step.</p>
 */
@property (nonatomic, strong) NSString * _Nullable candidateStepName;

/**
 <p>Whether the Candidate is at the transform, training, or processing step.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceCandidateStepType candidateStepType;

@end

/**
 <p>Similar to Channel. A channel is a named input source that training algorithms can consume. Refer to Channel for detailed descriptions.</p>
 Required parameters: [DataSource, TargetAttributeName]
 */
@interface AWSSageMakerServiceAutoMLChannel : AWSModel


/**
 <p>You can use Gzip or None. The default value is None.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceCompressionType compressionType;

/**
 <p>The data source.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAutoMLDataSource * _Nullable dataSource;

/**
 <p>The name of the target variable in supervised learning, a.k.a. 'y'.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetAttributeName;

@end

/**
 <p>A list of container definitions that describe the different containers that make up one AutoML candidate. Refer to ContainerDefinition for more details.</p>
 Required parameters: [Image, ModelDataUrl]
 */
@interface AWSSageMakerServiceAutoMLContainerDefinition : AWSModel


/**
 <p>Environment variables to set in the container. Refer to ContainerDefinition for more details.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environment;

/**
 <p>The ECR path of the container. Refer to ContainerDefinition for more details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable image;

/**
 <p>The location of the model artifacts. Refer to ContainerDefinition for more details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelDataUrl;

@end

/**
 <p>The data source for the AutoPilot job.</p>
 Required parameters: [S3DataSource]
 */
@interface AWSSageMakerServiceAutoMLDataSource : AWSModel


/**
 <p>The Amazon S3 location of the input data.</p><note><p>The input data must be in CSV format and contain at least 1000 rows.</p></note>
 */
@property (nonatomic, strong) AWSSageMakerServiceAutoMLS3DataSource * _Nullable s3DataSource;

@end

/**
 <p>Artifacts that are generation during a job.</p>
 */
@interface AWSSageMakerServiceAutoMLJobArtifacts : AWSModel


/**
 <p>The URL to the notebook location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable candidateDefinitionNotebookLocation;

/**
 <p>The URL to the notebook location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataExplorationNotebookLocation;

@end

/**
 <p>How long a job is allowed to run, or how many candidates a job is allowed to generate.</p>
 */
@interface AWSSageMakerServiceAutoMLJobCompletionCriteria : AWSModel


/**
 <p>The maximum time, in seconds, an AutoML job is allowed to wait for a trial to complete. It must be equal to or greater than MaxRuntimePerTrainingJobInSeconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAutoMLJobRuntimeInSeconds;

/**
 <p>The maximum number of times a training job is allowed to run.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCandidates;

/**
 <p>The maximum time, in seconds, a job is allowed to run.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRuntimePerTrainingJobInSeconds;

@end

/**
 <p>A collection of settings used for a job.</p>
 */
@interface AWSSageMakerServiceAutoMLJobConfig : AWSModel


/**
 <p>How long a job is allowed to run, or how many candidates a job is allowed to generate.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAutoMLJobCompletionCriteria * _Nullable completionCriteria;

/**
 <p>Security configuration for traffic encryption or Amazon VPC settings.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAutoMLSecurityConfig * _Nullable securityConfig;

@end

/**
 <p>Applies a metric to minimize or maximize for the job's objective.</p>
 Required parameters: [MetricName]
 */
@interface AWSSageMakerServiceAutoMLJobObjective : AWSModel


/**
 <p>The name of the metric.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAutoMLMetricEnum metricName;

@end

/**
 <p>Provides a summary about a job.</p>
 Required parameters: [AutoMLJobName, AutoMLJobArn, AutoMLJobStatus, AutoMLJobSecondaryStatus, CreationTime, LastModifiedTime]
 */
@interface AWSSageMakerServiceAutoMLJobSummary : AWSModel


/**
 <p>The ARN of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoMLJobArn;

/**
 <p>The name of the object you are requesting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoMLJobName;

/**
 <p>The job's secondary status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAutoMLJobSecondaryStatus autoMLJobSecondaryStatus;

/**
 <p>The job's status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAutoMLJobStatus autoMLJobStatus;

/**
 <p>When the job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The end time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The failure reason.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>When the job was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

@end

/**
 <p>The output data configuration.</p>
 Required parameters: [S3OutputPath]
 */
@interface AWSSageMakerServiceAutoMLOutputDataConfig : AWSModel


/**
 <p>The AWS KMS encryption key ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The Amazon S3 output path. Must be 128 characters or less.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3OutputPath;

@end

/**
 <p>The Amazon S3 data source.</p>
 Required parameters: [S3DataType, S3Uri]
 */
@interface AWSSageMakerServiceAutoMLS3DataSource : AWSModel


/**
 <p>The data type.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAutoMLS3DataType s3DataType;

/**
 <p>The URL to the Amazon S3 data source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Security options.</p>
 */
@interface AWSSageMakerServiceAutoMLSecurityConfig : AWSModel


/**
 <p>Whether to use traffic encryption between the container layers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableInterContainerTrafficEncryption;

/**
 <p>The key used to encrypt stored data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p>VPC configuration.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceVpcConfig * _Nullable vpcConfig;

@end

/**
 <p/>
 */
@interface AWSSageMakerServiceCaptureContentTypeHeader : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable csvContentTypes;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jsonContentTypes;

@end

/**
 <p/>
 Required parameters: [CaptureMode]
 */
@interface AWSSageMakerServiceCaptureOption : AWSModel


/**
 <p/>
 */
@property (nonatomic, assign) AWSSageMakerServiceCaptureMode captureMode;

@end

/**
 <p>A list of categorical hyperparameters to tune.</p>
 Required parameters: [Name, Values]
 */
@interface AWSSageMakerServiceCategoricalParameterRange : AWSModel


/**
 <p>The name of the categorical hyperparameter to tune.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of the categories for the hyperparameter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Defines the possible values for a categorical hyperparameter.</p>
 Required parameters: [Values]
 */
@interface AWSSageMakerServiceCategoricalParameterRangeSpecification : AWSModel


/**
 <p>The allowed categories for the hyperparameter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>A channel is a named input source that training algorithms can consume. </p>
 Required parameters: [ChannelName, DataSource]
 */
@interface AWSSageMakerServiceChannel : AWSModel


/**
 <p>The name of the channel. </p>
 */
@property (nonatomic, strong) NSString * _Nullable channelName;

/**
 <p>If training data is compressed, the compression type. The default value is <code>None</code>. <code>CompressionType</code> is used only in Pipe input mode. In File mode, leave this field unset or set it to None.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceCompressionType compressionType;

/**
 <p>The MIME type of the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The location of the channel data.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceDataSource * _Nullable dataSource;

/**
 <p>(Optional) The input mode to use for the data channel in a training job. If you don't set a value for <code>InputMode</code>, Amazon SageMaker uses the value set for <code>TrainingInputMode</code>. Use this parameter to override the <code>TrainingInputMode</code> setting in a <a>AlgorithmSpecification</a> request when you have a channel that needs a different input mode from the training job's general setting. To download the data from Amazon Simple Storage Service (Amazon S3) to the provisioned ML storage volume, and mount the directory to a Docker volume, use <code>File</code> input mode. To stream data directly from Amazon S3 to the container, choose <code>Pipe</code> input mode.</p><p>To use a model for incremental training, choose <code>File</code> input model.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTrainingInputMode inputMode;

/**
 <p/><p>Specify RecordIO as the value when input data is in raw format but the training algorithm requires the RecordIO format. In this case, Amazon SageMaker wraps each individual S3 object in a RecordIO record. If the input data is already in RecordIO format, you don't need to set this attribute. For more information, see <a href="https://mxnet.apache.org/api/architecture/note_data_loading#data-format">Create a Dataset Using RecordIO</a>. </p><p>In File mode, leave this field unset or set it to None.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceRecordWrapper recordWrapperType;

/**
 <p>A configuration for a shuffle option for input data in a channel. If you use <code>S3Prefix</code> for <code>S3DataType</code>, this shuffles the results of the S3 key prefix matches. If you use <code>ManifestFile</code>, the order of the S3 object references in the <code>ManifestFile</code> is shuffled. If you use <code>AugmentedManifestFile</code>, the order of the JSON lines in the <code>AugmentedManifestFile</code> is shuffled. The shuffling order is determined using the <code>Seed</code> value.</p><p>For Pipe input mode, shuffling is done at the start of every epoch. With large datasets this ensures that the order of the training data is different for each epoch, it helps reduce bias and possible overfitting. In a multi-node training job when ShuffleConfig is combined with <code>S3DataDistributionType</code> of <code>ShardedByS3Key</code>, the data is shuffled across nodes so that the content sent to a particular node on the first epoch might be sent to a different node on the second epoch.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceShuffleConfig * _Nullable shuffleConfig;

@end

/**
 <p>Defines a named input source, called a channel, to be used by an algorithm.</p>
 Required parameters: [Name, SupportedContentTypes, SupportedInputModes]
 */
@interface AWSSageMakerServiceChannelSpecification : AWSModel


/**
 <p>A brief description of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Indicates whether the channel is required by the algorithm.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isRequired;

/**
 <p>The name of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The allowed compression types, if data compression is used.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedCompressionTypes;

/**
 <p>The supported MIME types for the data.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedContentTypes;

/**
 <p>The allowed input mode, either FILE or PIPE.</p><p>In FILE mode, Amazon SageMaker copies the data from the input source onto the local Amazon Elastic Block Store (Amazon EBS) volumes before starting your training algorithm. This is the most commonly used input mode.</p><p>In PIPE mode, Amazon SageMaker streams input data from the source directly to your algorithm without using the EBS volume.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedInputModes;

@end

/**
 <p>Contains information about the output location for managed spot training checkpoint data. </p>
 Required parameters: [S3Uri]
 */
@interface AWSSageMakerServiceCheckpointConfig : AWSModel


/**
 <p>(Optional) The local directory where checkpoints are written. The default directory is <code>/opt/ml/checkpoints/</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable localPath;

/**
 <p>Identifies the S3 path where you want Amazon SageMaker to store checkpoints. For example, <code>s3://bucket-name/key-name-prefix</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Specifies summary information about a Git repository.</p>
 Required parameters: [CodeRepositoryName, CodeRepositoryArn, CreationTime, LastModifiedTime]
 */
@interface AWSSageMakerServiceCodeRepositorySummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Git repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeRepositoryArn;

/**
 <p>The name of the Git repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeRepositoryName;

/**
 <p>The date and time that the Git repository was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Configuration details for the Git repository, including the URL where it is located and the ARN of the AWS Secrets Manager secret that contains the credentials used to access the repository.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceGitConfig * _Nullable gitConfig;

/**
 <p>The date and time that the Git repository was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

@end

/**
 <p>Identifies a Amazon Cognito user group. A user group can be used in on or more work teams.</p>
 Required parameters: [UserPool, UserGroup, ClientId]
 */
@interface AWSSageMakerServiceCognitoMemberDefinition : AWSModel


/**
 <p>An identifier for an application client. You must create the app client ID using Amazon Cognito.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>An identifier for a user group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userGroup;

/**
 <p>An identifier for a user pool. The user pool must be in the same region as the service that you are calling.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPool;

@end

/**
 <p>Configuration information for tensor collections.</p>
 */
@interface AWSSageMakerServiceCollectionConfiguration : AWSModel


/**
 <p>The name of the tensor collection. The name must be unique relative to other rule configuration names.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>Parameter values for the tensor collection. The allowed parameters are <code>"name"</code>, <code>"include_regex"</code>, <code>"reduction_config"</code>, <code>"save_config"</code>, <code>"tensor_names"</code>, and <code>"save_histogram"</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable collectionParameters;

@end

/**
 <p>A summary of a model compilation job.</p>
 Required parameters: [CompilationJobName, CompilationJobArn, CreationTime, CompilationTargetDevice, CompilationJobStatus]
 */
@interface AWSSageMakerServiceCompilationJobSummary : AWSModel


/**
 <p>The time when the model compilation job completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable compilationEndTime;

/**
 <p>The Amazon Resource Name (ARN) of the model compilation job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable compilationJobArn;

/**
 <p>The name of the model compilation job that you want a summary for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable compilationJobName;

/**
 <p>The status of the model compilation job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceCompilationJobStatus compilationJobStatus;

/**
 <p>The time when the model compilation job started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable compilationStartTime;

/**
 <p>The type of device that the model will run on after compilation has completed.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTargetDevice compilationTargetDevice;

/**
 <p>The time when the model compilation job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The time when the model compilation job was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

@end

/**
 <p>Describes the container, as part of model definition.</p>
 */
@interface AWSSageMakerServiceContainerDefinition : AWSModel


/**
 <p>This parameter is ignored for models that contain only a <code>PrimaryContainer</code>.</p><p>When a <code>ContainerDefinition</code> is part of an inference pipeline, the value of the parameter uniquely identifies the container for the purposes of logging and metrics. For information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/inference-pipeline-logs-metrics.html">Use Logs and Metrics to Monitor an Inference Pipeline</a>. If you don't specify a value for this parameter for a <code>ContainerDefinition</code> that is part of an inference pipeline, a unique name is automatically assigned based on the position of the <code>ContainerDefinition</code> in the pipeline. If you specify a value for the <code>ContainerHostName</code> for any <code>ContainerDefinition</code> that is part of an inference pipeline, you must specify a value for the <code>ContainerHostName</code> parameter of every <code>ContainerDefinition</code> in that pipeline.</p>
 */
@property (nonatomic, strong) NSString * _Nullable containerHostname;

/**
 <p>The environment variables to set in the Docker container. Each key and value in the <code>Environment</code> string to string map can have length of up to 1024. We support up to 16 entries in the map. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environment;

/**
 <p>The Amazon EC2 Container Registry (Amazon ECR) path where inference code is stored. If you are using your own custom algorithm instead of an algorithm provided by Amazon SageMaker, the inference code must meet Amazon SageMaker requirements. Amazon SageMaker supports both <code>registry/repository[:tag]</code> and <code>registry/repository[@digest]</code> image path formats. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html">Using Your Own Algorithms with Amazon SageMaker</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable image;

/**
 <p>Whether the container hosts a single model or multiple models.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceContainerMode mode;

/**
 <p>The S3 path where the model artifacts, which result from model training, are stored. This path must point to a single gzip compressed tar archive (.tar.gz suffix). The S3 path is required for Amazon SageMaker built-in algorithms, but not if you use your own algorithms. For more information on built-in algorithms, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-algo-docker-registry-paths.html">Common Parameters</a>. </p><p>If you provide a value for this parameter, Amazon SageMaker uses AWS Security Token Service to download model artifacts from the S3 path you provide. AWS STS is activated in your IAM user account by default. If you previously deactivated AWS STS for a region, you need to reactivate AWS STS for that region. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p><important><p>If you use a built-in algorithm to create a model, Amazon SageMaker requires that you provide a S3 path to the model artifacts in <code>ModelDataUrl</code>.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable modelDataUrl;

/**
 <p>The name or Amazon Resource Name (ARN) of the model package to use to create the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelPackageName;

@end

/**
 <p>A list of continuous hyperparameters to tune.</p>
 Required parameters: [Name, MinValue, MaxValue]
 */
@interface AWSSageMakerServiceContinuousParameterRange : AWSModel


/**
 <p>The maximum value for the hyperparameter. The tuning job uses floating-point values between <code>MinValue</code> value and this value for tuning.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxValue;

/**
 <p>The minimum value for the hyperparameter. The tuning job uses floating-point values between this value and <code>MaxValue</code>for tuning.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minValue;

/**
 <p>The name of the continuous hyperparameter to tune.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The scale that hyperparameter tuning uses to search the hyperparameter range. For information about choosing a hyperparameter scale, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-ranges.html#scaling-type">Hyperparameter Scaling</a>. One of the following values:</p><dl><dt>Auto</dt><dd><p>Amazon SageMaker hyperparameter tuning chooses the best scale for the hyperparameter.</p></dd><dt>Linear</dt><dd><p>Hyperparameter tuning searches the values in the hyperparameter range by using a linear scale.</p></dd><dt>Logarithmic</dt><dd><p>Hyperparameter tuning searches the values in the hyperparameter range by using a logarithmic scale.</p><p>Logarithmic scaling works only for ranges that have only values greater than 0.</p></dd><dt>ReverseLogarithmic</dt><dd><p>Hyperparameter tuning searches the values in the hyperparameter range by using a reverse logarithmic scale.</p><p>Reverse logarithmic scaling works only for ranges that are entirely within the range 0&lt;=x&lt;1.0.</p></dd></dl>
 */
@property (nonatomic, assign) AWSSageMakerServiceHyperParameterScalingType scalingType;

@end

/**
 <p>Defines the possible values for a continuous hyperparameter.</p>
 Required parameters: [MinValue, MaxValue]
 */
@interface AWSSageMakerServiceContinuousParameterRangeSpecification : AWSModel


/**
 <p>The maximum floating-point value allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxValue;

/**
 <p>The minimum floating-point value allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minValue;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateAlgorithmInput : AWSRequest


/**
 <p>A description of the algorithm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmDescription;

/**
 <p>The name of the algorithm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmName;

/**
 <p>Whether to certify the algorithm so that it can be listed in AWS Marketplace.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable certifyForMarketplace;

/**
 <p>Specifies details about inference jobs that the algorithm runs, including the following:</p><ul><li><p>The Amazon ECR paths of containers that contain the inference code and model artifacts.</p></li><li><p>The instance types that the algorithm supports for transform jobs and real-time endpoints used for inference.</p></li><li><p>The input and output content formats that the algorithm supports for inference.</p></li></ul>
 */
@property (nonatomic, strong) AWSSageMakerServiceInferenceSpecification * _Nullable inferenceSpecification;

/**
 <p>Specifies details about training jobs run by this algorithm, including the following:</p><ul><li><p>The Amazon ECR path of the container and the version digest of the algorithm.</p></li><li><p>The hyperparameters that the algorithm supports.</p></li><li><p>The instance types that the algorithm supports for training.</p></li><li><p>Whether the algorithm supports distributed training.</p></li><li><p>The metrics that the algorithm emits to Amazon CloudWatch.</p></li><li><p>Which metrics that the algorithm emits can be used as the objective metric for hyperparameter tuning jobs.</p></li><li><p>The input channels that the algorithm supports for training data. For example, an algorithm might support <code>train</code>, <code>validation</code>, and <code>test</code> channels.</p></li></ul>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrainingSpecification * _Nullable trainingSpecification;

/**
 <p>Specifies configurations for one or more training jobs and that Amazon SageMaker runs to test the algorithm's training code and, optionally, one or more batch transform jobs that Amazon SageMaker runs to test the algorithm's inference code.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAlgorithmValidationSpecification * _Nullable validationSpecification;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateAlgorithmOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the new algorithm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateAppRequest : AWSRequest


/**
 <p>The name of the app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appName;

/**
 <p>The type of app.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAppType appType;

/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceResourceSpec * _Nullable resourceSpec;

/**
 <p>Each tag consists of a key and an optional value. Tag keys must be unique per resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>The user profile name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileName;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateAppResponse : AWSModel


/**
 <p>The app's Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable appArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateAutoMLJobRequest : AWSRequest


/**
 <p>Contains CompletionCriteria and SecurityConfig.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAutoMLJobConfig * _Nullable autoMLJobConfig;

/**
 <p>Identifies an AutoPilot job. Must be unique to your account and is case-insensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoMLJobName;

/**
 <p>Defines the job's objective. You provide a MetricName and AutoML will infer minimize or maximize. If this is not provided, the most commonly used ObjectiveMetric for problem type will be selected.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAutoMLJobObjective * _Nullable autoMLJobObjective;

/**
 <p>This will generate possible candidates without training a model. A candidate is a combination of data preprocessors, algorithms, and algorithm parameter settings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable generateCandidateDefinitionsOnly;

/**
 <p>Similar to InputDataConfig supported by Tuning. Format(s) supported: CSV. Minimum of 1000 rows.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceAutoMLChannel *> * _Nullable inputDataConfig;

/**
 <p>Similar to OutputDataConfig supported by Tuning. Format(s) supported: CSV.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAutoMLOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Defines the kind of preprocessing and algorithms intended for the candidates. Options include: BinaryClassification, MulticlassClassification, and Regression.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProblemType problemType;

/**
 <p>The ARN of the role that will be used to access the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Each tag consists of a key and an optional value. Tag keys must be unique per resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateAutoMLJobResponse : AWSModel


/**
 <p>When a job is created, it is assigned a unique ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoMLJobArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateCodeRepositoryInput : AWSRequest


/**
 <p>The name of the Git repository. The name must have 1 to 63 characters. Valid characters are a-z, A-Z, 0-9, and - (hyphen).</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeRepositoryName;

/**
 <p>Specifies details about the repository, including the URL where the repository is located, the default branch, and credentials to use to access the repository.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceGitConfig * _Nullable gitConfig;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateCodeRepositoryOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the new repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeRepositoryArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateCompilationJobRequest : AWSRequest


/**
 <p>A name for the model compilation job. The name must be unique within the AWS Region and within your AWS account. </p>
 */
@property (nonatomic, strong) NSString * _Nullable compilationJobName;

/**
 <p>Provides information about the location of input model artifacts, the name and shape of the expected data inputs, and the framework in which the model was trained.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceInputConfig * _Nullable inputConfig;

/**
 <p>Provides information about the output location for the compiled model and the target device the model runs on.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceOutputConfig * _Nullable outputConfig;

/**
 <p>The Amazon Resource Name (ARN) of an IAM role that enables Amazon SageMaker to perform tasks on your behalf. </p><p>During model compilation, Amazon SageMaker needs your permission to:</p><ul><li><p>Read input data from an S3 bucket</p></li><li><p>Write model artifacts to an S3 bucket</p></li><li><p>Write logs to Amazon CloudWatch Logs</p></li><li><p>Publish metrics to Amazon CloudWatch</p></li></ul><p>You grant permissions for all of these tasks to an IAM role. To pass this role to Amazon SageMaker, the caller of this API must have the <code>iam:PassRole</code> permission. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html">Amazon SageMaker Roles.</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Specifies a limit to how long a model compilation job can run. When the job reaches the time limit, Amazon SageMaker ends the compilation job. Use this API to cap model training costs.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceStoppingCondition * _Nullable stoppingCondition;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateCompilationJobResponse : AWSModel


/**
 <p>If the action is successful, the service sends back an HTTP 200 response. Amazon SageMaker returns the following data in JSON format:</p><ul><li><p><code>CompilationJobArn</code>: The Amazon Resource Name (ARN) of the compiled job.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable compilationJobArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateDomainRequest : AWSRequest


/**
 <p>The mode of authentication that member use to access the domain.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAuthMode authMode;

/**
 <p>The default user settings.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserSettings * _Nullable defaultUserSettings;

/**
 <p>A name for the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The AWS Key Management Service (KMS) encryption key ID. Encryption with a customer master key (CMK) is not supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable homeEfsFileSystemKmsKeyId;

/**
 <p>Security setting to limit to a set of subnets.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>Each tag consists of a key and an optional value. Tag keys must be unique per resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>Security setting to limit the domain's communication to a Amazon Virtual Private Cloud.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateDomainResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the created domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainArn;

/**
 <p>The URL to the created domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateEndpointConfigInput : AWSRequest


/**
 <p/>
 */
@property (nonatomic, strong) AWSSageMakerServiceDataCaptureConfig * _Nullable dataCaptureConfig;

/**
 <p>The name of the endpoint configuration. You specify this name in a <a>CreateEndpoint</a> request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointConfigName;

/**
 <p>The Amazon Resource Name (ARN) of a AWS Key Management Service key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance that hosts the endpoint.</p><p>The KmsKeyId can be any of the following formats: </p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias name ARN: <code>arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias</code></p></li></ul><p>The KMS key policy must grant permission to the IAM role that you specify in your <code>CreateEndpoint</code>, <code>UpdateEndpoint</code> requests. For more information, refer to the AWS Key Management Service section<a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html"> Using Key Policies in AWS KMS </a></p><note><p>Certain Nitro-based instances include local storage, dependent on the instance type. Local storage volumes are encrypted using a hardware module on the instance. You can't request a <code>KmsKeyId</code> when using an instance type with local storage. If any of the models that you specify in the <code>ProductionVariants</code> parameter use nitro-based instances with local storage, do not specify a value for the <code>KmsKeyId</code> parameter. If you specify a value for <code>KmsKeyId</code> when using any nitro-based instances with local storage, the call to <code>CreateEndpointConfig</code> fails.</p><p>For a list of instance types that support local instance storage, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html#instance-store-volumes">Instance Store Volumes</a>.</p><p>For more information about local instance storage encryption, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ssd-instance-store.html">SSD Instance Store Volumes</a>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>An list of <code>ProductionVariant</code> objects, one for each model that you want to host at this endpoint.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceProductionVariant *> * _Nullable productionVariants;

/**
 <p>A list of key-value pairs. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using Cost Allocation Tags</a> in the <i> AWS Billing and Cost Management User Guide</i>. </p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateEndpointConfigOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the endpoint configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointConfigArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateEndpointInput : AWSRequest


/**
 <p>The name of an endpoint configuration. For more information, see <a>CreateEndpointConfig</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointConfigName;

/**
 <p>The name of the endpoint. The name must be unique within an AWS Region in your AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>An array of key-value pairs. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using Cost Allocation Tags</a>in the <i>AWS Billing and Cost Management User Guide</i>. </p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateEndpointOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateExperimentRequest : AWSRequest


/**
 <p>The description of the experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the experiment as displayed. The name doesn't need to be unique. If you don't specify <code>DisplayName</code>, the value in <code>ExperimentName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The name of the experiment. The name must be unique in your AWS account and is not case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentName;

/**
 <p>A list of tags to associate with the experiment. You can use <a>Search</a> API to search on the tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateExperimentResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateFlowDefinitionRequest : AWSRequest


/**
 <p>The name of your flow definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowDefinitionName;

/**
 <p>An object containing information about the events that trigger a human workflow.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHumanLoopActivationConfig * _Nullable humanLoopActivationConfig;

/**
 <p>An object containing information about the tasks the human reviewers will perform.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHumanLoopConfig * _Nullable humanLoopConfig;

/**
 <p>Container for configuring the source of human task requests. Use to specify if Amazon Rekognition or Amazon Textract is used as an integration source.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHumanLoopRequestSource * _Nullable humanLoopRequestSource;

/**
 <p>An object containing information about where the human review results will be uploaded.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceFlowDefinitionOutputConfig * _Nullable outputConfig;

/**
 <p>The Amazon Resource Name (ARN) of the role needed to call other services on your behalf. For example, <code>arn:aws:iam::1234567890:role/service-role/AmazonSageMaker-ExecutionRole-20180111T151298</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>An array of key-value pairs that contain metadata to help you categorize and organize a flow definition. Each tag consists of a key and a value, both of which you define.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateFlowDefinitionResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the flow definition you create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowDefinitionArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateHumanTaskUiRequest : AWSRequest


/**
 <p>The name of the user interface you are creating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanTaskUiName;

/**
 <p>An array of key-value pairs that contain metadata to help you categorize and organize a human review workflow user interface. Each tag consists of a key and a value, both of which you define.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>The Liquid template for the worker user interface.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUiTemplate * _Nullable uiTemplate;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateHumanTaskUiResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the human review workflow user interface you create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanTaskUiArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateHyperParameterTuningJobRequest : AWSRequest


/**
 <p>The <a>HyperParameterTuningJobConfig</a> object that describes the tuning job, including the search strategy, the objective metric used to evaluate training jobs, ranges of parameters to search, and resource limits for the tuning job. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-how-it-works.html">How Hyperparameter Tuning Works</a>.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHyperParameterTuningJobConfig * _Nullable hyperParameterTuningJobConfig;

/**
 <p>The name of the tuning job. This name is the prefix for the names of all training jobs that this tuning job launches. The name must be unique within the same AWS account and AWS Region. The name must have { } to { } characters. Valid characters are a-z, A-Z, 0-9, and : + = @ _ % - (hyphen). The name is not case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hyperParameterTuningJobName;

/**
 <p>An array of key-value pairs. You can use tags to categorize your AWS resources in different ways, for example, by purpose, owner, or environment. For more information, see <a href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS Tagging Strategies</a>.</p><p>Tags that you specify for the tuning job are also added to all training jobs that the tuning job launches.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>The <a>HyperParameterTrainingJobDefinition</a> object that describes the training jobs that this tuning job launches, including static hyperparameters, input data configuration, output data configuration, resource configuration, and stopping condition.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHyperParameterTrainingJobDefinition * _Nullable trainingJobDefinition;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceHyperParameterTrainingJobDefinition *> * _Nullable trainingJobDefinitions;

/**
 <p>Specifies the configuration for starting the hyperparameter tuning job using one or more previous tuning jobs as a starting point. The results of previous tuning jobs are used to inform which combinations of hyperparameters to search over in the new tuning job.</p><p>All training jobs launched by the new hyperparameter tuning job are evaluated by using the objective metric. If you specify <code>IDENTICAL_DATA_AND_ALGORITHM</code> as the <code>WarmStartType</code> value for the warm start configuration, the training job that performs the best in the new tuning job is compared to the best training jobs from the parent tuning jobs. From these, the training job that performs the best as measured by the objective metric is returned as the overall best training job.</p><note><p>All training jobs launched by parent hyperparameter tuning jobs and the new hyperparameter tuning jobs count against the limit of training jobs for the tuning job.</p></note>
 */
@property (nonatomic, strong) AWSSageMakerServiceHyperParameterTuningJobWarmStartConfig * _Nullable warmStartConfig;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateHyperParameterTuningJobResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the tuning job. Amazon SageMaker assigns an ARN to a hyperparameter tuning job when you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hyperParameterTuningJobArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateLabelingJobRequest : AWSRequest


/**
 <p>Configures the labeling task and how it is presented to workers; including, but not limited to price, keywords, and batch size (task count).</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHumanTaskConfig * _Nullable humanTaskConfig;

/**
 <p>Input data for the labeling job, such as the Amazon S3 location of the data objects and the location of the manifest file that describes the data objects.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobInputConfig * _Nullable inputConfig;

/**
 <p>The attribute name to use for the label in the output manifest file. This is the key for the key/value pair formed with the label that a worker assigns to the object. The name can't end with "-metadata". If you are running a semantic segmentation labeling job, the attribute name must end with "-ref". If you are running any other kind of labeling job, the attribute name must not end with "-ref".</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelAttributeName;

/**
 <p>The S3 URL of the file that defines the categories used to label the data objects.</p><p>The file is a JSON structure in the following format:</p><p><code>{</code></p><p><code> "document-version": "2018-11-28"</code></p><p><code> "labels": [</code></p><p><code> {</code></p><p><code> "label": "<i>label 1</i>"</code></p><p><code> },</code></p><p><code> {</code></p><p><code> "label": "<i>label 2</i>"</code></p><p><code> },</code></p><p><code> ...</code></p><p><code> {</code></p><p><code> "label": "<i>label n</i>"</code></p><p><code> }</code></p><p><code> ]</code></p><p><code>}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable labelCategoryConfigS3Uri;

/**
 <p>Configures the information required to perform automated data labeling.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobAlgorithmsConfig * _Nullable labelingJobAlgorithmsConfig;

/**
 <p>The name of the labeling job. This name is used to identify the job in a list of labeling jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelingJobName;

/**
 <p>The location of the output data and the AWS Key Management Service key ID for the key used to encrypt the output data, if any.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobOutputConfig * _Nullable outputConfig;

/**
 <p>The Amazon Resource Number (ARN) that Amazon SageMaker assumes to perform tasks on your behalf during data labeling. You must grant this role the necessary permissions so that Amazon SageMaker can successfully complete data labeling.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>A set of conditions for stopping the labeling job. If any of the conditions are met, the job is automatically stopped. You can use these conditions to control the cost of data labeling.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobStoppingConditions * _Nullable stoppingConditions;

/**
 <p>An array of key/value pairs. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateLabelingJobResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the labeling job. You use this ARN to identify the labeling job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelingJobArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateModelInput : AWSRequest


/**
 <p>Specifies the containers in the inference pipeline.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceContainerDefinition *> * _Nullable containers;

/**
 <p>Isolates the model container. No inbound or outbound network calls can be made to or from the model container.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableNetworkIsolation;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker can assume to access model artifacts and docker image for deployment on ML compute instances or for batch transform jobs. Deploying on ML compute instances is part of model hosting. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html">Amazon SageMaker Roles</a>. </p><note><p>To be able to pass this role to Amazon SageMaker, the caller of this API must have the <code>iam:PassRole</code> permission.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleArn;

/**
 <p>The name of the new model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

/**
 <p>The location of the primary docker image containing inference code, associated artifacts, and custom environment map that the inference code uses when the model is deployed for predictions. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceContainerDefinition * _Nullable primaryContainer;

/**
 <p>An array of key-value pairs. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>. </p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>A <a>VpcConfig</a> object that specifies the VPC that you want your model to connect to. Control access to and from your model container by configuring the VPC. <code>VpcConfig</code> is used in hosting services and in batch transform. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/host-vpc.html">Protect Endpoints by Using an Amazon Virtual Private Cloud</a> and <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-vpc.html">Protect Data in Batch Transform Jobs by Using an Amazon Virtual Private Cloud</a>.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateModelOutput : AWSModel


/**
 <p>The ARN of the model created in Amazon SageMaker.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateModelPackageInput : AWSRequest


/**
 <p>Whether to certify the model package for listing on AWS Marketplace.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable certifyForMarketplace;

/**
 <p>Specifies details about inference jobs that can be run with models based on this model package, including the following:</p><ul><li><p>The Amazon ECR paths of containers that contain the inference code and model artifacts.</p></li><li><p>The instance types that the model package supports for transform jobs and real-time endpoints used for inference.</p></li><li><p>The input and output content formats that the model package supports for inference.</p></li></ul>
 */
@property (nonatomic, strong) AWSSageMakerServiceInferenceSpecification * _Nullable inferenceSpecification;

/**
 <p>A description of the model package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelPackageDescription;

/**
 <p>The name of the model package. The name must have 1 to 63 characters. Valid characters are a-z, A-Z, 0-9, and - (hyphen).</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelPackageName;

/**
 <p>Details about the algorithm that was used to create the model package.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceSourceAlgorithmSpecification * _Nullable sourceAlgorithmSpecification;

/**
 <p>Specifies configurations for one or more transform jobs that Amazon SageMaker runs to test the model package.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceModelPackageValidationSpecification * _Nullable validationSpecification;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateModelPackageOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the new model package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelPackageArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateMonitoringScheduleRequest : AWSRequest


/**
 <p>The configuration object that specifies the monitoring schedule and defines the monitoring job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceMonitoringScheduleConfig * _Nullable monitoringScheduleConfig;

/**
 <p>The name of the monitoring schedule. The name must be unique within an AWS Region within an AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleName;

/**
 <p>(Optional) An array of key-value pairs. For more information, see <a href=" https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateMonitoringScheduleResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the monitoring schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateNotebookInstanceInput : AWSRequest


/**
 <p>A list of Elastic Inference (EI) instance types to associate with this notebook instance. Currently, only one instance type can be associated with a notebook instance. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html">Using Elastic Inference in Amazon SageMaker</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable acceleratorTypes;

/**
 <p>An array of up to three Git repositories to associate with the notebook instance. These can be either the names of Git repositories stored as resources in your account, or the URL of Git repositories in <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit</a> or in any other Git repository. These repositories are cloned at the same level as the default repository of your notebook instance. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalCodeRepositories;

/**
 <p>A Git repository to associate with the notebook instance as its default code repository. This can be either the name of a Git repository stored as a resource in your account, or the URL of a Git repository in <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit</a> or in any other Git repository. When you open a notebook instance, it opens in the directory that contains this repository. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultCodeRepository;

/**
 <p>Sets whether Amazon SageMaker provides internet access to the notebook instance. If you set this to <code>Disabled</code> this notebook instance will be able to access resources only in your VPC, and will not be able to connect to Amazon SageMaker training and endpoint services unless your configure a NAT Gateway in your VPC.</p><p>For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/appendix-additional-considerations.html#appendix-notebook-and-internet-access">Notebook Instances Are Internet-Enabled by Default</a>. You can set the value of this parameter to <code>Disabled</code> only if you set a value for the <code>SubnetId</code> parameter.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceDirectInternetAccess directInternetAccess;

/**
 <p>The type of ML compute instance to launch for the notebook instance.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceInstanceType instanceType;

/**
 <p>The Amazon Resource Name (ARN) of a AWS Key Management Service key that Amazon SageMaker uses to encrypt data on the storage volume attached to your notebook instance. The KMS key you provide must be enabled. For information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/enabling-keys.html">Enabling and Disabling Keys</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of a lifecycle configuration to associate with the notebook instance. For information about lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleConfigName;

/**
 <p>The name of the new notebook instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceName;

/**
 <p> When you send any requests to AWS resources from the notebook instance, Amazon SageMaker assumes this role to perform tasks on your behalf. You must grant this role necessary permissions so Amazon SageMaker can perform these tasks. The policy must allow the Amazon SageMaker service principal (sagemaker.amazonaws.com) permissions to assume this role. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html">Amazon SageMaker Roles</a>. </p><note><p>To be able to pass this role to Amazon SageMaker, the caller of this API must have the <code>iam:PassRole</code> permission.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Whether root access is enabled or disabled for users of the notebook instance. The default value is <code>Enabled</code>.</p><note><p>Lifecycle configurations need root access to be able to set up a notebook instance. Because of this, lifecycle configurations associated with a notebook instance always run with root access even if you disable root access for users.</p></note>
 */
@property (nonatomic, assign) AWSSageMakerServiceRootAccess rootAccess;

/**
 <p>The VPC security group IDs, in the form sg-xxxxxxxx. The security groups must be for the same VPC as specified in the subnet. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The ID of the subnet in a VPC to which you would like to have a connectivity from your ML compute instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>A list of tags to associate with the notebook instance. You can add tags later by using the <code>CreateTags</code> API.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>The size, in GB, of the ML storage volume to attach to the notebook instance. The default value is 5 GB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSizeInGB;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigInput : AWSRequest


/**
 <p>The name of the lifecycle configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceLifecycleConfigName;

/**
 <p>A shell script that runs only once, when you create a notebook instance. The shell script must be a base64-encoded string.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceNotebookInstanceLifecycleHook *> * _Nullable onCreate;

/**
 <p>A shell script that runs every time you start a notebook instance, including when you create the notebook instance. The shell script must be a base64-encoded string.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceNotebookInstanceLifecycleHook *> * _Nullable onStart;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the lifecycle configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceLifecycleConfigArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateNotebookInstanceOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the notebook instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreatePresignedDomainUrlRequest : AWSRequest


/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The session expiration duration in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sessionExpirationDurationInSeconds;

/**
 <p>The name of the UserProfile to sign-in as.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileName;

@end

/**
 
 */
@interface AWSSageMakerServiceCreatePresignedDomainUrlResponse : AWSModel


/**
 <p>The presigned URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizedUrl;

@end

/**
 
 */
@interface AWSSageMakerServiceCreatePresignedNotebookInstanceUrlInput : AWSRequest


/**
 <p>The name of the notebook instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceName;

/**
 <p>The duration of the session, in seconds. The default is 12 hours.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sessionExpirationDurationInSeconds;

@end

/**
 
 */
@interface AWSSageMakerServiceCreatePresignedNotebookInstanceUrlOutput : AWSModel


/**
 <p>A JSON object that contains the URL string. </p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizedUrl;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateProcessingJobRequest : AWSRequest


/**
 <p>Configures the processing job to run a specified Docker container image.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAppSpecification * _Nullable appSpecification;

/**
 <p>Sets the environment variables in the Docker container.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environment;

/**
 <p>Configuration for the experiment.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceExperimentConfig * _Nullable experimentConfig;

/**
 <p>Networking options for a processing job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceNetworkConfig * _Nullable networkConfig;

/**
 <p>For each input, data is downloaded from S3 into the processing container before the processing job begins running if "S3InputMode" is set to <code>File</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceProcessingInput *> * _Nullable processingInputs;

/**
 <p> The name of the processing job. The name must be unique within an AWS Region in the AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable processingJobName;

/**
 <p>Output configuration for the processing job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceProcessingOutputConfig * _Nullable processingOutputConfig;

/**
 <p>Identifies the resources, ML compute instances, and ML storage volumes to deploy for a processing job. In distributed training, you specify more than one instance.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceProcessingResources * _Nullable processingResources;

/**
 <p>The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker can assume to perform tasks on your behalf.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The time limit for how long the processing job is allowed to run.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceProcessingStoppingCondition * _Nullable stoppingCondition;

/**
 <p>(Optional) An array of key-value pairs. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateProcessingJobResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable processingJobArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateTrainingJobRequest : AWSRequest


/**
 <p>The registry path of the Docker image that contains the training algorithm and algorithm-specific metadata, including the input mode. For more information about algorithms provided by Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>. For information about providing your own algorithms, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html">Using Your Own Algorithms with Amazon SageMaker</a>. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAlgorithmSpecification * _Nullable algorithmSpecification;

/**
 <p>Contains information about the output location for managed spot training checkpoint data.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceCheckpointConfig * _Nullable checkpointConfig;

/**
 <p>Configuration information for the debug hook parameters, collection configuration, and storage paths.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceDebugHookConfig * _Nullable debugHookConfig;

/**
 <p>Configuration information for debugging rules.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceDebugRuleConfiguration *> * _Nullable debugRuleConfigurations;

/**
 <p>To encrypt all communications between ML compute instances in distributed training, choose <code>True</code>. Encryption provides greater security for distributed training, but training might take longer. How long it takes depends on the amount of communication between compute instances, especially if you use a deep learning algorithm in distributed training. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/train-encrypt.html">Protect Communications Between ML Compute Instances in a Distributed Training Job</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableInterContainerTrafficEncryption;

/**
 <p>To train models using managed spot training, choose <code>True</code>. Managed spot training provides a fully managed and scalable infrastructure for training machine learning models. this option is useful when training jobs can be interrupted and when there is flexibility when the training job is run. </p><p>The complete and intermediate results of jobs are stored in an Amazon S3 bucket, and can be used as a starting point to train models incrementally. Amazon SageMaker provides metrics and logs in CloudWatch. They can be used to see when managed spot training jobs are running, interrupted, resumed, or completed. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableManagedSpotTraining;

/**
 <p>Isolates the training container. No inbound or outbound network calls can be made, except for calls between peers within a training cluster for distributed training. If you enable network isolation for training jobs that are configured to use a VPC, Amazon SageMaker downloads and uploads customer data and model artifacts through the specified VPC, but the training container does not have network access.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableNetworkIsolation;

/**
 <p>Configuration for the experiment.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceExperimentConfig * _Nullable experimentConfig;

/**
 <p>Algorithm-specific parameters that influence the quality of the model. You set hyperparameters before you start the learning process. For a list of hyperparameters for each training algorithm provided by Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>. </p><p>You can specify a maximum of 100 hyperparameters. Each hyperparameter is a key-value pair. Each key and value is limited to 256 characters, as specified by the <code>Length Constraint</code>. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable hyperParameters;

/**
 <p>An array of <code>Channel</code> objects. Each channel is a named input source. <code>InputDataConfig</code> describes the input data and its location. </p><p>Algorithms can accept input data from one or more channels. For example, an algorithm might have two channels of input data, <code>training_data</code> and <code>validation_data</code>. The configuration for each channel provides the S3, EFS, or FSx location where the input data is stored. It also provides information about the stored data: the MIME type, compression method, and whether the data is wrapped in RecordIO format. </p><p>Depending on the input mode that the algorithm supports, Amazon SageMaker either copies input data files from an S3 bucket to a local directory in the Docker container, or makes it available as input streams. For example, if you specify an EFS location, input data files will be made available as input streams. They do not need to be downloaded.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceChannel *> * _Nullable inputDataConfig;

/**
 <p>Specifies the path to the S3 location where you want to store model artifacts. Amazon SageMaker creates subfolders for the artifacts. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The resources, including the ML compute instances and ML storage volumes, to use for model training. </p><p>ML storage volumes store model artifacts and incremental states. Training algorithms might also use ML storage volumes for scratch space. If you want Amazon SageMaker to use the ML storage volume to store the training data, choose <code>File</code> as the <code>TrainingInputMode</code> in the algorithm specification. For distributed training algorithms, specify an instance count greater than 1.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceResourceConfig * _Nullable resourceConfig;

/**
 <p>The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker can assume to perform tasks on your behalf. </p><p>During model training, Amazon SageMaker needs your permission to read input data from an S3 bucket, download a Docker image that contains training code, write model artifacts to an S3 bucket, write logs to Amazon CloudWatch Logs, and publish metrics to Amazon CloudWatch. You grant permissions for all of these tasks to an IAM role. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html">Amazon SageMaker Roles</a>. </p><note><p>To be able to pass this role to Amazon SageMaker, the caller of this API must have the <code>iam:PassRole</code> permission.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Specifies a limit to how long a model training job can run. When the job reaches the time limit, Amazon SageMaker ends the training job. Use this API to cap model training costs.</p><p>To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms can use this 120-second window to save the model artifacts, so the results of training are not lost. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceStoppingCondition * _Nullable stoppingCondition;

/**
 <p>An array of key-value pairs. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>. </p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>Configuration of storage locations for TensorBoard output.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTensorBoardOutputConfig * _Nullable tensorBoardOutputConfig;

/**
 <p>The name of the training job. The name must be unique within an AWS Region in an AWS account. </p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobName;

/**
 <p>A <a>VpcConfig</a> object that specifies the VPC that you want your training job to connect to. Control access to and from your training container by configuring the VPC. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html">Protect Training Jobs by Using an Amazon Virtual Private Cloud</a>.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateTrainingJobResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the training job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateTransformJobRequest : AWSRequest


/**
 <p>Specifies the number of records to include in a mini-batch for an HTTP inference request. A <i>record</i><i/> is a single unit of input data that inference can be made on. For example, a single line in a CSV file is a record. </p><p>To enable the batch strategy, you must set the <code>SplitType</code> property to <code>Line</code>, <code>RecordIO</code>, or <code>TFRecord</code>.</p><p>To use only one record when making an HTTP invocation request to a container, set <code>BatchStrategy</code> to <code>SingleRecord</code> and <code>SplitType</code> to <code>Line</code>.</p><p>To fit as many records in a mini-batch as can fit within the <code>MaxPayloadInMB</code> limit, set <code>BatchStrategy</code> to <code>MultiRecord</code> and <code>SplitType</code> to <code>Line</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceBatchStrategy batchStrategy;

/**
 <p>The data structure used to specify the data to be used for inference in a batch transform job and to associate the data that is relevant to the prediction results in the output. The input filter provided allows you to exclude input data that is not needed for inference in a batch transform job. The output filter provided allows you to include input data relevant to interpreting the predictions in the output from the job. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html">Associate Prediction Results with their Corresponding Input Records</a>.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceDataProcessing * _Nullable dataProcessing;

/**
 <p>The environment variables to set in the Docker container. We support up to 16 key and values entries in the map.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environment;

/**
 <p>Configuration for the experiment.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceExperimentConfig * _Nullable experimentConfig;

/**
 <p>The maximum number of parallel requests that can be sent to each instance in a transform job. If <code>MaxConcurrentTransforms</code> is set to <code>0</code> or left unset, Amazon SageMaker checks the optional execution-parameters to determine the settings for your chosen algorithm. If the execution-parameters endpoint is not enabled, the default value is <code>1</code>. For more information on execution-parameters, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms-batch-code.html#your-algorithms-batch-code-how-containe-serves-requests">How Containers Serve Requests</a>. For built-in algorithms, you don't need to set a value for <code>MaxConcurrentTransforms</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxConcurrentTransforms;

/**
 <p>The maximum allowed size of the payload, in MB. A <i>payload</i> is the data portion of a record (without metadata). The value in <code>MaxPayloadInMB</code> must be greater than, or equal to, the size of a single record. To estimate the size of a record in MB, divide the size of your dataset by the number of records. To ensure that the records fit within the maximum payload size, we recommend using a slightly larger value. The default value is <code>6</code> MB. </p><p>For cases where the payload might be arbitrarily large and is transmitted using HTTP chunked encoding, set the value to <code>0</code>. This feature works only in supported algorithms. Currently, Amazon SageMaker built-in algorithms do not support HTTP chunked encoding.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxPayloadInMB;

/**
 <p>The name of the model that you want to use for the transform job. <code>ModelName</code> must be the name of an existing Amazon SageMaker model within an AWS Region in an AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

/**
 <p>(Optional) An array of key-value pairs. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>Describes the input source and the way the transform job consumes it.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTransformInput * _Nullable transformInput;

/**
 <p>The name of the transform job. The name must be unique within an AWS Region in an AWS account. </p>
 */
@property (nonatomic, strong) NSString * _Nullable transformJobName;

/**
 <p>Describes the results of the transform job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTransformOutput * _Nullable transformOutput;

/**
 <p>Describes the resources, including ML instance types and ML instance count, to use for the transform job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTransformResources * _Nullable transformResources;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateTransformJobResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the transform job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformJobArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateTrialComponentRequest : AWSRequest


/**
 <p>The name of the component as displayed. The name doesn't need to be unique. If <code>DisplayName</code> isn't specified, <code>TrialComponentName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>When the component ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The input artifacts for the component. Examples of input artifacts are datasets, algorithms, hyperparameters, source code, and instance types.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSageMakerServiceTrialComponentArtifact *> * _Nullable inputArtifacts;

/**
 <p>The output artifacts for the component. Examples of output artifacts are metrics, snapshots, logs, and images.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSageMakerServiceTrialComponentArtifact *> * _Nullable outputArtifacts;

/**
 <p>The hyperparameters for the component.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSageMakerServiceTrialComponentParameterValue *> * _Nullable parameters;

/**
 <p>When the component started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The status of the component. States include:</p><ul><li><p>InProgress</p></li><li><p>Completed</p></li><li><p>Failed</p></li></ul>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrialComponentStatus * _Nullable status;

/**
 <p>A list of tags to associate with the component. You can use <a>Search</a> API to search on the tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>The name of the component. The name must be unique in your AWS account and is not case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentName;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateTrialComponentResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the trial component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateTrialRequest : AWSRequest


/**
 <p>The name of the trial as displayed. The name doesn't need to be unique. If <code>DisplayName</code> isn't specified, <code>TrialName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The name of the experiment to associate the trial with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentName;

/**
 <p>A list of tags to associate with the trial. You can use <a>Search</a> API to search on the tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>The name of the trial. The name must be unique in your AWS account and is not case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialName;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateTrialResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the trial.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateUserProfileRequest : AWSRequest


/**
 <p>The ID of the associated Domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>A specifier for the type of value specified in SingleSignOnUserValue. Currently, the only supported value is "UserName". If the Domain's AuthMode is SSO, this field is required. If the Domain's AuthMode is not SSO, this field cannot be specified. </p>
 */
@property (nonatomic, strong) NSString * _Nullable singleSignOnUserIdentifier;

/**
 <p>The username of the associated AWS Single Sign-On User for this UserProfile. If the Domain's AuthMode is SSO, this field is required, and must match a valid username of a user in your directory. If the Domain's AuthMode is not SSO, this field cannot be specified. </p>
 */
@property (nonatomic, strong) NSString * _Nullable singleSignOnUserValue;

/**
 <p>Each tag consists of a key and an optional value. Tag keys must be unique per resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>A name for the UserProfile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileName;

/**
 <p>A collection of settings.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserSettings * _Nullable userSettings;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateUserProfileResponse : AWSModel


/**
 <p>The user profile Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileArn;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateWorkteamRequest : AWSRequest


/**
 <p>A description of the work team.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A list of <code>MemberDefinition</code> objects that contains objects that identify the Amazon Cognito user pool that makes up the work team. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html">Amazon Cognito User Pools</a>.</p><p>All of the <code>CognitoMemberDefinition</code> objects that make up the member definition must have the same <code>ClientId</code> and <code>UserPool</code> values.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceMemberDefinition *> * _Nullable memberDefinitions;

/**
 <p>Configures notification of workers regarding available or expiring work items.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceNotificationConfiguration * _Nullable notificationConfiguration;

/**
 <p>An array of key-value pairs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-resource-tags.html">Resource Tag</a> and <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using Cost Allocation Tags</a> in the <i> AWS Billing and Cost Management User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>The name of the work team. Use this name to identify the work team.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workteamName;

@end

/**
 
 */
@interface AWSSageMakerServiceCreateWorkteamResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the work team. You can use this ARN to identify the work team.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workteamArn;

@end

/**
 <p/>
 Required parameters: [InitialSamplingPercentage, DestinationS3Uri, CaptureOptions]
 */
@interface AWSSageMakerServiceDataCaptureConfig : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) AWSSageMakerServiceCaptureContentTypeHeader * _Nullable captureContentTypeHeader;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceCaptureOption *> * _Nullable captureOptions;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable destinationS3Uri;

/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableCapture;

/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable initialSamplingPercentage;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

@end

/**
 <p/>
 Required parameters: [EnableCapture, CaptureStatus, CurrentSamplingPercentage, DestinationS3Uri, KmsKeyId]
 */
@interface AWSSageMakerServiceDataCaptureConfigSummary : AWSModel


/**
 <p/>
 */
@property (nonatomic, assign) AWSSageMakerServiceCaptureStatus captureStatus;

/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentSamplingPercentage;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable destinationS3Uri;

/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableCapture;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

@end

/**
 <p>The data structure used to specify the data to be used for inference in a batch transform job and to associate the data that is relevant to the prediction results in the output. The input filter provided allows you to exclude input data that is not needed for inference in a batch transform job. The output filter provided allows you to include input data relevant to interpreting the predictions in the output from the job. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html">Associate Prediction Results with their Corresponding Input Records</a>.</p>
 */
@interface AWSSageMakerServiceDataProcessing : AWSModel


/**
 <p>A <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html#data-processing-operators">JSONPath</a> expression used to select a portion of the input data to pass to the algorithm. Use the <code>InputFilter</code> parameter to exclude fields, such as an ID column, from the input. If you want Amazon SageMaker to pass the entire input dataset to the algorithm, accept the default value <code>$</code>.</p><p>Examples: <code>"$"</code>, <code>"$[1:]"</code>, <code>"$.features"</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable inputFilter;

/**
 <p>Specifies the source of the data to join with the transformed data. The valid values are <code>None</code> and <code>Input</code>. The default value is <code>None</code>, which specifies not to join the input with the transformed data. If you want the batch transform job to join the original input data with the transformed data, set <code>JoinSource</code> to <code>Input</code>. </p><p>For JSON or JSONLines objects, such as a JSON array, Amazon SageMaker adds the transformed data to the input JSON object in an attribute called <code>SageMakerOutput</code>. The joined result for JSON must be a key-value pair object. If the input is not a key-value pair object, Amazon SageMaker creates a new JSON file. In the new JSON file, and the input data is stored under the <code>SageMakerInput</code> key and the results are stored in <code>SageMakerOutput</code>.</p><p>For CSV files, Amazon SageMaker combines the transformed data with the input data at the end of the input data and stores it in the output file. The joined data has the joined input data followed by the transformed data and the output is a CSV file. </p>
 */
@property (nonatomic, assign) AWSSageMakerServiceJoinSource joinSource;

/**
 <p>A <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html#data-processing-operators">JSONPath</a> expression used to select a portion of the joined dataset to save in the output file for a batch transform job. If you want Amazon SageMaker to store the entire input dataset in the output file, leave the default value, <code>$</code>. If you specify indexes that aren't within the dimension size of the joined dataset, you get an error.</p><p>Examples: <code>"$"</code>, <code>"$[0,5:]"</code>, <code>"$['id','SageMakerOutput']"</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable outputFilter;

@end

/**
 <p>Describes the location of the channel data.</p>
 */
@interface AWSSageMakerServiceDataSource : AWSModel


/**
 <p>The file system that is associated with a channel.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceFileSystemDataSource * _Nullable fileSystemDataSource;

/**
 <p>The S3 location of the data source that is associated with a channel.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceS3DataSource * _Nullable s3DataSource;

@end

/**
 <p>Configuration information for the debug hook parameters, collection configuration, and storage paths.</p>
 Required parameters: [S3OutputPath]
 */
@interface AWSSageMakerServiceDebugHookConfig : AWSModel


/**
 <p>Configuration information for tensor collections.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceCollectionConfiguration *> * _Nullable collectionConfigurations;

/**
 <p>Configuration information for the debug hook parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable hookParameters;

/**
 <p>Path to local storage location for tensors. Defaults to <code>/opt/ml/output/tensors/</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable localPath;

/**
 <p>Path to Amazon S3 storage location for tensors.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3OutputPath;

@end

/**
 <p>Configuration information for debugging rules.</p>
 Required parameters: [RuleConfigurationName, RuleEvaluatorImage]
 */
@interface AWSSageMakerServiceDebugRuleConfiguration : AWSModel


/**
 <p>The instance type to deploy for a training job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingInstanceType instanceType;

/**
 <p>Path to local storage location for output of rules. Defaults to <code>/opt/ml/processing/output/rule/</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable localPath;

/**
 <p>The name of the rule configuration. It must be unique relative to other rule configuration names.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleConfigurationName;

/**
 <p>The Amazon Elastic Container (ECR) Image for the managed rule evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleEvaluatorImage;

/**
 <p> Runtime configuration for rule container.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable ruleParameters;

/**
 <p>Path to Amazon S3 storage location for rules.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3OutputPath;

/**
 <p>The size, in GB, of the ML storage volume attached to the processing instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSizeInGB;

@end

/**
 <p>Information about the status of the rule evaluation.</p>
 */
@interface AWSSageMakerServiceDebugRuleEvaluationStatus : AWSModel


/**
 <p>Timestamp when the rule evaluation status was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the rule configuration</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleConfigurationName;

/**
 <p>The Amazon Resource Name (ARN) of the rule evaluation job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleEvaluationJobArn;

/**
 <p>Status of the rule evaluation.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceRuleEvaluationStatus ruleEvaluationStatus;

/**
 <p>Details from the rule evaluation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusDetails;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteAlgorithmInput : AWSRequest


/**
 <p>The name of the algorithm to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteAppRequest : AWSRequest


/**
 <p>The name of the app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appName;

/**
 <p>The type of app.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAppType appType;

/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The user profile name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteCodeRepositoryInput : AWSRequest


/**
 <p>The name of the Git repository to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeRepositoryName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteDomainRequest : AWSRequest


/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The retention policy for this domain, which specifies whether resources will be retained after the Domain is deleted. By default, all resources are retained (not automatically deleted). </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceRetentionPolicy * _Nullable retentionPolicy;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteEndpointConfigInput : AWSRequest


/**
 <p>The name of the endpoint configuration that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointConfigName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteEndpointInput : AWSRequest


/**
 <p>The name of the endpoint that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteExperimentRequest : AWSRequest


/**
 <p>The name of the experiment to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteExperimentResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the experiment that is being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentArn;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteFlowDefinitionRequest : AWSRequest


/**
 <p>The name of the flow definition you are deleting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowDefinitionName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteFlowDefinitionResponse : AWSModel


@end

/**
 
 */
@interface AWSSageMakerServiceDeleteModelInput : AWSRequest


/**
 <p>The name of the model to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteModelPackageInput : AWSRequest


/**
 <p>The name of the model package. The name must have 1 to 63 characters. Valid characters are a-z, A-Z, 0-9, and - (hyphen).</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelPackageName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteMonitoringScheduleRequest : AWSRequest


/**
 <p>The name of the monitoring schedule to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteNotebookInstanceInput : AWSRequest


/**
 <p>The name of the Amazon SageMaker notebook instance to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteNotebookInstanceLifecycleConfigInput : AWSRequest


/**
 <p>The name of the lifecycle configuration to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceLifecycleConfigName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteTagsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource whose tags you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>An array or one or more tag keys to delete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteTagsOutput : AWSModel


@end

/**
 
 */
@interface AWSSageMakerServiceDeleteTrialComponentRequest : AWSRequest


/**
 <p>The name of the component to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteTrialComponentResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the component is being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentArn;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteTrialRequest : AWSRequest


/**
 <p>The name of the trial to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteTrialResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the trial that is being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialArn;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteUserProfileRequest : AWSRequest


/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The user profile name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteWorkteamRequest : AWSRequest


/**
 <p>The name of the work team to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workteamName;

@end

/**
 
 */
@interface AWSSageMakerServiceDeleteWorkteamResponse : AWSModel


/**
 <p>Returns <code>true</code> if the work team was successfully deleted; otherwise, returns <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable success;

@end

/**
 <p>Gets the Amazon EC2 Container Registry path of the docker image of the model that is hosted in this <a>ProductionVariant</a>.</p><p>If you used the <code>registry/repository[:tag]</code> form to specify the image path of the primary container when you created the model hosted in this <code>ProductionVariant</code>, the path resolves to a path of the form <code>registry/repository[@digest]</code>. A digest is a hash value that identifies a specific version of an image. For information about Amazon ECR paths, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-pull-ecr-image.html">Pulling an Image</a> in the <i>Amazon ECR User Guide</i>.</p>
 */
@interface AWSSageMakerServiceDeployedImage : AWSModel


/**
 <p>The date and time when the image path for the model resolved to the <code>ResolvedImage</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable resolutionTime;

/**
 <p>The specific digest path of the image hosted in this <code>ProductionVariant</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resolvedImage;

/**
 <p>The image path you specified when you created the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable specifiedImage;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeAlgorithmInput : AWSRequest


/**
 <p>The name of the algorithm to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeAlgorithmOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the algorithm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmArn;

/**
 <p>A brief summary about the algorithm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmDescription;

/**
 <p>The name of the algorithm being described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmName;

/**
 <p>The current status of the algorithm.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAlgorithmStatus algorithmStatus;

/**
 <p>Details about the current status of the algorithm.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAlgorithmStatusDetails * _Nullable algorithmStatusDetails;

/**
 <p>Whether the algorithm is certified to be listed in AWS Marketplace.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable certifyForMarketplace;

/**
 <p>A timestamp specifying when the algorithm was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Details about inference jobs that the algorithm runs.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceInferenceSpecification * _Nullable inferenceSpecification;

/**
 <p>The product identifier of the algorithm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>Details about training jobs run by this algorithm.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrainingSpecification * _Nullable trainingSpecification;

/**
 <p>Details about configurations for one or more training jobs that Amazon SageMaker runs to test the algorithm.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAlgorithmValidationSpecification * _Nullable validationSpecification;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeAppRequest : AWSRequest


/**
 <p>The name of the app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appName;

/**
 <p>The type of app.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAppType appType;

/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The user profile name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeAppResponse : AWSModel


/**
 <p>The app's Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable appArn;

/**
 <p>The name of the app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable appName;

/**
 <p>The type of app.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAppType appType;

/**
 <p>The creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The failure reason.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The timestamp of the last health check.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastHealthCheckTimestamp;

/**
 <p>The timestamp of the last user's activity.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUserActivityTimestamp;

/**
 <p>The instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceResourceSpec * _Nullable resourceSpec;

/**
 <p>The status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAppStatus status;

/**
 <p>The user profile name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeAutoMLJobRequest : AWSRequest


/**
 <p>Request information about a job using that job's unique name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoMLJobName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeAutoMLJobResponse : AWSModel


/**
 <p>Returns the job's ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoMLJobArn;

/**
 <p>Returns information on the job's artifacts found in AutoMLJobArtifacts.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAutoMLJobArtifacts * _Nullable autoMLJobArtifacts;

/**
 <p>Returns the job's config.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAutoMLJobConfig * _Nullable autoMLJobConfig;

/**
 <p>Returns the name of a job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoMLJobName;

/**
 <p>Returns the job's objective.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAutoMLJobObjective * _Nullable autoMLJobObjective;

/**
 <p>Returns the job's AutoMLJobSecondaryStatus.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAutoMLJobSecondaryStatus autoMLJobSecondaryStatus;

/**
 <p>Returns the job's AutoMLJobStatus.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAutoMLJobStatus autoMLJobStatus;

/**
 <p>Returns the job's BestCandidate.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAutoMLCandidate * _Nullable bestCandidate;

/**
 <p>Returns the job's creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Returns the job's end time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>Returns the job's FailureReason.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>Returns the job's output from GenerateCandidateDefinitionsOnly.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable generateCandidateDefinitionsOnly;

/**
 <p>Returns the job's input data config.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceAutoMLChannel *> * _Nullable inputDataConfig;

/**
 <p>Returns the job's last modified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>Returns the job's output data config.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAutoMLOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Returns the job's problem type.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProblemType problemType;

/**
 <p>This contains ProblemType, AutoMLJobObjective and CompletionCriteria. They're auto-inferred values, if not provided by you. If you do provide them, then they'll be the same as provided.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceResolvedAttributes * _Nullable resolvedAttributes;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that has read permission to the input data location and write permission to the output data location in Amazon S3.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeCodeRepositoryInput : AWSRequest


/**
 <p>The name of the Git repository to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeRepositoryName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeCodeRepositoryOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Git repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeRepositoryArn;

/**
 <p>The name of the Git repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeRepositoryName;

/**
 <p>The date and time that the repository was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Configuration details about the repository, including the URL where the repository is located, the default branch, and the Amazon Resource Name (ARN) of the AWS Secrets Manager secret that contains the credentials used to access the repository.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceGitConfig * _Nullable gitConfig;

/**
 <p>The date and time that the repository was last changed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeCompilationJobRequest : AWSRequest


/**
 <p>The name of the model compilation job that you want information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable compilationJobName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeCompilationJobResponse : AWSModel


/**
 <p>The time when the model compilation job on a compilation job instance ended. For a successful or stopped job, this is when the job's model artifacts have finished uploading. For a failed job, this is when Amazon SageMaker detected that the job failed. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable compilationEndTime;

/**
 <p>The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker assumes to perform the model compilation job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable compilationJobArn;

/**
 <p>The name of the model compilation job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable compilationJobName;

/**
 <p>The status of the model compilation job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceCompilationJobStatus compilationJobStatus;

/**
 <p>The time when the model compilation job started the <code>CompilationJob</code> instances. </p><p>You are billed for the time between this timestamp and the timestamp in the <a>DescribeCompilationJobResponse$CompilationEndTime</a> field. In Amazon CloudWatch Logs, the start time might be later than this time. That's because it takes time to download the compilation job, which depends on the size of the compilation job container. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable compilationStartTime;

/**
 <p>The time that the model compilation job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>If a model compilation job failed, the reason it failed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>Information about the location in Amazon S3 of the input model artifacts, the name and shape of the expected data inputs, and the framework in which the model was trained.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceInputConfig * _Nullable inputConfig;

/**
 <p>The time that the status of the model compilation job was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>Information about the location in Amazon S3 that has been configured for storing the model artifacts used in the compilation job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceModelArtifacts * _Nullable modelArtifacts;

/**
 <p>Information about the output location for the compiled model and the target device that the model runs on.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceOutputConfig * _Nullable outputConfig;

/**
 <p>The Amazon Resource Name (ARN) of the model compilation job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Specifies a limit to how long a model compilation job can run. When the job reaches the time limit, Amazon SageMaker ends the compilation job. Use this API to cap model training costs.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceStoppingCondition * _Nullable stoppingCondition;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeDomainRequest : AWSRequest


/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeDomainResponse : AWSModel


/**
 <p>The domain's authentication mode.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAuthMode authMode;

/**
 <p>The creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Settings which are applied to all UserProfile in this domain, if settings are not explicitly specified in a given UserProfile. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserSettings * _Nullable defaultUserSettings;

/**
 <p>The domain's Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainArn;

/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The domain name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The failure reason.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The ID of the Amazon Elastic File System (EFS) managed by this Domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable homeEfsFileSystemId;

/**
 <p>The AWS Key Management Service encryption key ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable homeEfsFileSystemKmsKeyId;

/**
 <p>The last modified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The SSO managed application instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable singleSignOnManagedApplicationInstanceId;

/**
 <p>The status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceDomainStatus status;

/**
 <p>Security setting to limit to a set of subnets.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The domain's URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

/**
 <p>The ID of the Amazon Virtual Private Cloud.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeEndpointConfigInput : AWSRequest


/**
 <p>The name of the endpoint configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointConfigName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeEndpointConfigOutput : AWSModel


/**
 <p>A timestamp that shows when the endpoint configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p/>
 */
@property (nonatomic, strong) AWSSageMakerServiceDataCaptureConfig * _Nullable dataCaptureConfig;

/**
 <p>The Amazon Resource Name (ARN) of the endpoint configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointConfigArn;

/**
 <p>Name of the Amazon SageMaker endpoint configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointConfigName;

/**
 <p>AWS KMS key ID Amazon SageMaker uses to encrypt data when storing it on the ML storage volume attached to the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>An array of <code>ProductionVariant</code> objects, one for each model that you want to host at this endpoint.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceProductionVariant *> * _Nullable productionVariants;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeEndpointInput : AWSRequest


/**
 <p>The name of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeEndpointOutput : AWSModel


/**
 <p>A timestamp that shows when the endpoint was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p/>
 */
@property (nonatomic, strong) AWSSageMakerServiceDataCaptureConfigSummary * _Nullable dataCaptureConfig;

/**
 <p>The Amazon Resource Name (ARN) of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

/**
 <p>The name of the endpoint configuration associated with this endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointConfigName;

/**
 <p>Name of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>The status of the endpoint.</p><ul><li><p><code>OutOfService</code>: Endpoint is not available to take incoming requests.</p></li><li><p><code>Creating</code>: <a>CreateEndpoint</a> is executing.</p></li><li><p><code>Updating</code>: <a>UpdateEndpoint</a> or <a>UpdateEndpointWeightsAndCapacities</a> is executing.</p></li><li><p><code>SystemUpdating</code>: Endpoint is undergoing maintenance and cannot be updated or deleted or re-scaled until it has completed. This maintenance operation does not change any customer-specified values such as VPC config, KMS encryption, model, instance type, or instance count.</p></li><li><p><code>RollingBack</code>: Endpoint fails to scale up or down or change its variant weight and is in the process of rolling back to its previous configuration. Once the rollback completes, endpoint returns to an <code>InService</code> status. This transitional status only applies to an endpoint that has autoscaling enabled and is undergoing variant weight or capacity changes as part of an <a>UpdateEndpointWeightsAndCapacities</a> call or when the <a>UpdateEndpointWeightsAndCapacities</a> operation is called explicitly.</p></li><li><p><code>InService</code>: Endpoint is available to process incoming requests.</p></li><li><p><code>Deleting</code>: <a>DeleteEndpoint</a> is executing.</p></li><li><p><code>Failed</code>: Endpoint could not be created, updated, or re-scaled. Use <a>DescribeEndpointOutput$FailureReason</a> for information about the failure. <a>DeleteEndpoint</a> is the only operation that can be performed on a failed endpoint.</p></li></ul>
 */
@property (nonatomic, assign) AWSSageMakerServiceEndpointStatus endpointStatus;

/**
 <p>If the status of the endpoint is <code>Failed</code>, the reason why it failed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>A timestamp that shows when the endpoint was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p> An array of <a>ProductionVariantSummary</a> objects, one for each model hosted behind this endpoint. </p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceProductionVariantSummary *> * _Nullable productionVariants;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeExperimentRequest : AWSRequest


/**
 <p>The name of the experiment to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeExperimentResponse : AWSModel


/**
 <p>Who created the experiment.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable createdBy;

/**
 <p>When the experiment was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The description of the experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the experiment as displayed. If <code>DisplayName</code> isn't specified, <code>ExperimentName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The Amazon Resource Name (ARN) of the experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentArn;

/**
 <p>The name of the experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentName;

/**
 <p>Who last modified the experiment.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable lastModifiedBy;

/**
 <p>When the experiment was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The ARN of the source and, optionally, the type.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceExperimentSource * _Nullable source;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeFlowDefinitionRequest : AWSRequest


/**
 <p>The name of the flow definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowDefinitionName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeFlowDefinitionResponse : AWSModel


/**
 <p>The timestamp when the flow definition was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The Amazon Resource Name (ARN) of the flow defintion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowDefinitionArn;

/**
 <p>The Amazon Resource Name (ARN) of the flow definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowDefinitionName;

/**
 <p>The status of the flow definition. Valid values are listed below.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceFlowDefinitionStatus flowDefinitionStatus;

/**
 <p>An object containing information about what triggers a human review workflow.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHumanLoopActivationConfig * _Nullable humanLoopActivationConfig;

/**
 <p>An object containing information about who works on the task, the workforce task price, and other task details.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHumanLoopConfig * _Nullable humanLoopConfig;

/**
 <p>Container for configuring the source of human task requests. Used to specify if Amazon Rekognition or Amazon Textract is used as an integration source.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHumanLoopRequestSource * _Nullable humanLoopRequestSource;

/**
 <p>An object containing information about the output file.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceFlowDefinitionOutputConfig * _Nullable outputConfig;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) execution role for the flow definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeHumanTaskUiRequest : AWSRequest


/**
 <p>The name of the human task user interface you want information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanTaskUiName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeHumanTaskUiResponse : AWSModel


/**
 <p>The timestamp when the human task user interface was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The Amazon Resource Name (ARN) of the human task user interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanTaskUiArn;

/**
 <p>The name of the human task user interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanTaskUiName;

/**
 <p>Container for user interface template information.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUiTemplateInfo * _Nullable uiTemplate;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeHyperParameterTuningJobRequest : AWSRequest


/**
 <p>The name of the tuning job to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hyperParameterTuningJobName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeHyperParameterTuningJobResponse : AWSModel


/**
 <p>A <a>TrainingJobSummary</a> object that describes the training job that completed with the best current <a>HyperParameterTuningJobObjective</a>.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHyperParameterTrainingJobSummary * _Nullable bestTrainingJob;

/**
 <p>The date and time that the tuning job started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>If the tuning job failed, the reason it failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The date and time that the tuning job ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable hyperParameterTuningEndTime;

/**
 <p>The Amazon Resource Name (ARN) of the tuning job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hyperParameterTuningJobArn;

/**
 <p>The <a>HyperParameterTuningJobConfig</a> object that specifies the configuration of the tuning job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHyperParameterTuningJobConfig * _Nullable hyperParameterTuningJobConfig;

/**
 <p>The name of the tuning job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hyperParameterTuningJobName;

/**
 <p>The status of the tuning job: InProgress, Completed, Failed, Stopping, or Stopped.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceHyperParameterTuningJobStatus hyperParameterTuningJobStatus;

/**
 <p>The date and time that the status of the tuning job was modified. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The <a>ObjectiveStatusCounters</a> object that specifies the number of training jobs, categorized by the status of their final objective metric, that this tuning job launched.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceObjectiveStatusCounters * _Nullable objectiveStatusCounters;

/**
 <p>If the hyperparameter tuning job is an warm start tuning job with a <code>WarmStartType</code> of <code>IDENTICAL_DATA_AND_ALGORITHM</code>, this is the <a>TrainingJobSummary</a> for the training job with the best objective metric value of all training jobs launched by this tuning job and all parent jobs specified for the warm start tuning job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHyperParameterTrainingJobSummary * _Nullable overallBestTrainingJob;

/**
 <p>The <a>HyperParameterTrainingJobDefinition</a> object that specifies the definition of the training jobs that this tuning job launches.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHyperParameterTrainingJobDefinition * _Nullable trainingJobDefinition;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceHyperParameterTrainingJobDefinition *> * _Nullable trainingJobDefinitions;

/**
 <p>The <a>TrainingJobStatusCounters</a> object that specifies the number of training jobs, categorized by status, that this tuning job launched.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrainingJobStatusCounters * _Nullable trainingJobStatusCounters;

/**
 <p>The configuration for starting the hyperparameter parameter tuning job using one or more previous tuning jobs as a starting point. The results of previous tuning jobs are used to inform which combinations of hyperparameters to search over in the new tuning job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHyperParameterTuningJobWarmStartConfig * _Nullable warmStartConfig;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeLabelingJobRequest : AWSRequest


/**
 <p>The name of the labeling job to return information for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelingJobName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeLabelingJobResponse : AWSModel


/**
 <p>The date and time that the labeling job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>If the job failed, the reason that it failed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>Configuration information required for human workers to complete a labeling task.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHumanTaskConfig * _Nullable humanTaskConfig;

/**
 <p>Input configuration information for the labeling job, such as the Amazon S3 location of the data objects and the location of the manifest file that describes the data objects.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobInputConfig * _Nullable inputConfig;

/**
 <p>A unique identifier for work done as part of a labeling job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobReferenceCode;

/**
 <p>The attribute used as the label in the output manifest file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelAttributeName;

/**
 <p>The S3 location of the JSON file that defines the categories used to label data objects. Please note the following label-category limits:</p><ul><li><p>Semantic segmentation labeling jobs using automated labeling: 20 labels</p></li><li><p>Box bounding labeling jobs (all): 10 labels</p></li></ul><p>The file is a JSON structure in the following format:</p><p><code>{</code></p><p><code> "document-version": "2018-11-28"</code></p><p><code> "labels": [</code></p><p><code> {</code></p><p><code> "label": "<i>label 1</i>"</code></p><p><code> },</code></p><p><code> {</code></p><p><code> "label": "<i>label 2</i>"</code></p><p><code> },</code></p><p><code> ...</code></p><p><code> {</code></p><p><code> "label": "<i>label n</i>"</code></p><p><code> }</code></p><p><code> ]</code></p><p><code>}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable labelCategoryConfigS3Uri;

/**
 <p>Provides a breakdown of the number of data objects labeled by humans, the number of objects labeled by machine, the number of objects than couldn't be labeled, and the total number of objects labeled. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelCounters * _Nullable labelCounters;

/**
 <p>Configuration information for automated data labeling.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobAlgorithmsConfig * _Nullable labelingJobAlgorithmsConfig;

/**
 <p>The Amazon Resource Name (ARN) of the labeling job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelingJobArn;

/**
 <p>The name assigned to the labeling job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelingJobName;

/**
 <p>The location of the output produced by the labeling job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobOutput * _Nullable labelingJobOutput;

/**
 <p>The processing status of the labeling job. </p>
 */
@property (nonatomic, assign) AWSSageMakerServiceLabelingJobStatus labelingJobStatus;

/**
 <p>The date and time that the labeling job was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The location of the job's output data and the AWS Key Management Service key ID for the key used to encrypt the output data, if any.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobOutputConfig * _Nullable outputConfig;

/**
 <p>The Amazon Resource Name (ARN) that Amazon SageMaker assumes to perform tasks on your behalf during data labeling.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>A set of conditions for stopping a labeling job. If any of the conditions are met, the job is automatically stopped.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobStoppingConditions * _Nullable stoppingConditions;

/**
 <p>An array of key/value pairs. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeModelInput : AWSRequest


/**
 <p>The name of the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeModelOutput : AWSModel


/**
 <p>The containers in the inference pipeline.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceContainerDefinition *> * _Nullable containers;

/**
 <p>A timestamp that shows when the model was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>If <code>True</code>, no inbound or outbound network calls can be made to or from the model container.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableNetworkIsolation;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that you specified for the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleArn;

/**
 <p>The Amazon Resource Name (ARN) of the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelArn;

/**
 <p>Name of the Amazon SageMaker model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

/**
 <p>The location of the primary inference code, associated artifacts, and custom environment map that the inference code uses when it is deployed in production. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceContainerDefinition * _Nullable primaryContainer;

/**
 <p>A <a>VpcConfig</a> object that specifies the VPC that this model has access to. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/host-vpc.html">Protect Endpoints by Using an Amazon Virtual Private Cloud</a></p>
 */
@property (nonatomic, strong) AWSSageMakerServiceVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeModelPackageInput : AWSRequest


/**
 <p>The name of the model package to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelPackageName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeModelPackageOutput : AWSModel


/**
 <p>Whether the model package is certified for listing on AWS Marketplace.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable certifyForMarketplace;

/**
 <p>A timestamp specifying when the model package was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Details about inference jobs that can be run with models based on this model package.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceInferenceSpecification * _Nullable inferenceSpecification;

/**
 <p>The Amazon Resource Name (ARN) of the model package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelPackageArn;

/**
 <p>A brief summary of the model package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelPackageDescription;

/**
 <p>The name of the model package being described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelPackageName;

/**
 <p>The current status of the model package.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceModelPackageStatus modelPackageStatus;

/**
 <p>Details about the current status of the model package.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceModelPackageStatusDetails * _Nullable modelPackageStatusDetails;

/**
 <p>Details about the algorithm that was used to create the model package.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceSourceAlgorithmSpecification * _Nullable sourceAlgorithmSpecification;

/**
 <p>Configurations for one or more transform jobs that Amazon SageMaker runs to test the model package.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceModelPackageValidationSpecification * _Nullable validationSpecification;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeMonitoringScheduleRequest : AWSRequest


/**
 <p>Name of a previously created monitoring schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeMonitoringScheduleResponse : AWSModel


/**
 <p>The time at which the monitoring job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p> The name of the endpoint for the monitoring job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>A string, up to one KB in size, that contains the reason a monitoring job failed, if it failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The time at which the monitoring job was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>Describes metadata on the last execution to run, if there was one.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceMonitoringExecutionSummary * _Nullable lastMonitoringExecutionSummary;

/**
 <p>The Amazon Resource Name (ARN) of the monitoring schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleArn;

/**
 <p>The configuration object that specifies the monitoring schedule and defines the monitoring job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceMonitoringScheduleConfig * _Nullable monitoringScheduleConfig;

/**
 <p>Name of the monitoring schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleName;

/**
 <p>The status of an monitoring job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceScheduleStatus monitoringScheduleStatus;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeNotebookInstanceInput : AWSRequest


/**
 <p>The name of the notebook instance that you want information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigInput : AWSRequest


/**
 <p>The name of the lifecycle configuration to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceLifecycleConfigName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigOutput : AWSModel


/**
 <p>A timestamp that tells when the lifecycle configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>A timestamp that tells when the lifecycle configuration was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The Amazon Resource Name (ARN) of the lifecycle configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceLifecycleConfigArn;

/**
 <p>The name of the lifecycle configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceLifecycleConfigName;

/**
 <p>The shell script that runs only once, when you create a notebook instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceNotebookInstanceLifecycleHook *> * _Nullable onCreate;

/**
 <p>The shell script that runs every time you start a notebook instance, including when you create the notebook instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceNotebookInstanceLifecycleHook *> * _Nullable onStart;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeNotebookInstanceOutput : AWSModel


/**
 <p>A list of the Elastic Inference (EI) instance types associated with this notebook instance. Currently only one EI instance type can be associated with a notebook instance. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html">Using Elastic Inference in Amazon SageMaker</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable acceleratorTypes;

/**
 <p>An array of up to three Git repositories associated with the notebook instance. These can be either the names of Git repositories stored as resources in your account, or the URL of Git repositories in <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit</a> or in any other Git repository. These repositories are cloned at the same level as the default repository of your notebook instance. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalCodeRepositories;

/**
 <p>A timestamp. Use this parameter to return the time when the notebook instance was created</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The Git repository associated with the notebook instance as its default code repository. This can be either the name of a Git repository stored as a resource in your account, or the URL of a Git repository in <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit</a> or in any other Git repository. When you open a notebook instance, it opens in the directory that contains this repository. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultCodeRepository;

/**
 <p>Describes whether Amazon SageMaker provides internet access to the notebook instance. If this value is set to <i>Disabled</i>, the notebook instance does not have internet access, and cannot connect to Amazon SageMaker training and endpoint services.</p><p>For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/appendix-additional-considerations.html#appendix-notebook-and-internet-access">Notebook Instances Are Internet-Enabled by Default</a>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceDirectInternetAccess directInternetAccess;

/**
 <p>If status is <code>Failed</code>, the reason it failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The type of ML compute instance running on the notebook instance.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceInstanceType instanceType;

/**
 <p>The AWS KMS key ID Amazon SageMaker uses to encrypt data when storing it on the ML storage volume attached to the instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>A timestamp. Use this parameter to retrieve the time when the notebook instance was last modified. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The network interface IDs that Amazon SageMaker created at the time of creating the instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The Amazon Resource Name (ARN) of the notebook instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceArn;

/**
 <p>Returns the name of a notebook instance lifecycle configuration.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceLifecycleConfigName;

/**
 <p>The name of the Amazon SageMaker notebook instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceName;

/**
 <p>The status of the notebook instance.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceNotebookInstanceStatus notebookInstanceStatus;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role associated with the instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Whether root access is enabled or disabled for users of the notebook instance.</p><note><p>Lifecycle configurations need root access to be able to set up a notebook instance. Because of this, lifecycle configurations associated with a notebook instance always run with root access even if you disable root access for users.</p></note>
 */
@property (nonatomic, assign) AWSSageMakerServiceRootAccess rootAccess;

/**
 <p>The IDs of the VPC security groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The ID of the VPC subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The URL that you use to connect to the Jupyter notebook that is running in your notebook instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

/**
 <p>The size, in GB, of the ML storage volume attached to the notebook instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSizeInGB;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeProcessingJobRequest : AWSRequest


/**
 <p>The name of the processing job. The name must be unique within an AWS Region in the AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable processingJobName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeProcessingJobResponse : AWSModel


/**
 <p>Configures the processing job to run a specified container image.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAppSpecification * _Nullable appSpecification;

/**
 <p>The ARN of an AutoML job associated with this processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoMLJobArn;

/**
 <p>The time at which the processing job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The environment variables set in the Docker container.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environment;

/**
 <p>An optional string, up to one KB in size, that contains metadata from the processing container when the processing job exits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exitMessage;

/**
 <p>The configuration information used to create an experiment.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceExperimentConfig * _Nullable experimentConfig;

/**
 <p>A string, up to one KB in size, that contains the reason a processing job failed, if it failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The time at which the processing job was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The ARN of a monitoring schedule for an endpoint associated with this processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleArn;

/**
 <p>Networking options for a processing job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceNetworkConfig * _Nullable networkConfig;

/**
 <p>The time at which the processing job completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable processingEndTime;

/**
 <p>The inputs for a processing job.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceProcessingInput *> * _Nullable processingInputs;

/**
 <p>The Amazon Resource Name (ARN) of the processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable processingJobArn;

/**
 <p>The name of the processing job. The name must be unique within an AWS Region in the AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable processingJobName;

/**
 <p>Provides the status of a processing job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingJobStatus processingJobStatus;

/**
 <p>Output configuration for the processing job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceProcessingOutputConfig * _Nullable processingOutputConfig;

/**
 <p>Identifies the resources, ML compute instances, and ML storage volumes to deploy for a processing job. In distributed training, you specify more than one instance.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceProcessingResources * _Nullable processingResources;

/**
 <p>The time at which the processing job started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable processingStartTime;

/**
 <p>The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker can assume to perform tasks on your behalf.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The time limit for how long the processing job is allowed to run.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceProcessingStoppingCondition * _Nullable stoppingCondition;

/**
 <p>The ARN of a training job associated with this processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobArn;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeSubscribedWorkteamRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the subscribed work team to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workteamArn;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeSubscribedWorkteamResponse : AWSModel


/**
 <p>A <code>Workteam</code> instance that contains information about the work team.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceSubscribedWorkteam * _Nullable subscribedWorkteam;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeTrainingJobRequest : AWSRequest


/**
 <p>The name of the training job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeTrainingJobResponse : AWSModel


/**
 <p>Information about the algorithm used for training, and algorithm metadata. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAlgorithmSpecification * _Nullable algorithmSpecification;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable autoMLJobArn;

/**
 <p>The billable time in seconds.</p><p>You can calculate the savings from using managed spot training using the formula <code>(1 - BillableTimeInSeconds / TrainingTimeInSeconds) * 100</code>. For example, if <code>BillableTimeInSeconds</code> is 100 and <code>TrainingTimeInSeconds</code> is 500, the savings is 80%.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable billableTimeInSeconds;

/**
 <p>Contains information about the output location for managed spot training checkpoint data. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceCheckpointConfig * _Nullable checkpointConfig;

/**
 <p>A timestamp that indicates when the training job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Configuration information for the debug hook parameters, collection configuration, and storage paths.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceDebugHookConfig * _Nullable debugHookConfig;

/**
 <p>Configuration information for debugging rules.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceDebugRuleConfiguration *> * _Nullable debugRuleConfigurations;

/**
 <p>Status about the debug rule evaluation.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceDebugRuleEvaluationStatus *> * _Nullable debugRuleEvaluationStatuses;

/**
 <p>To encrypt all communications between ML compute instances in distributed training, choose <code>True</code>. Encryption provides greater security for distributed training, but training might take longer. How long it takes depends on the amount of communication between compute instances, especially if you use a deep learning algorithms in distributed training.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableInterContainerTrafficEncryption;

/**
 <p>A Boolean indicating whether managed spot training is enabled (<code>True</code>) or not (<code>False</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableManagedSpotTraining;

/**
 <p>If you want to allow inbound or outbound network calls, except for calls between peers within a training cluster for distributed training, choose <code>True</code>. If you enable network isolation for training jobs that are configured to use a VPC, Amazon SageMaker downloads and uploads customer data and model artifacts through the specified VPC, but the training container does not have network access.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableNetworkIsolation;

/**
 <p>Configuration for the experiment.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceExperimentConfig * _Nullable experimentConfig;

/**
 <p>If the training job failed, the reason it failed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>A collection of <code>MetricData</code> objects that specify the names, values, and dates and times that the training algorithm emitted to Amazon CloudWatch.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceMetricData *> * _Nullable finalMetricDataList;

/**
 <p>Algorithm-specific parameters. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable hyperParameters;

/**
 <p>An array of <code>Channel</code> objects that describes each data input channel. </p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceChannel *> * _Nullable inputDataConfig;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SageMaker Ground Truth labeling job that created the transform or training job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelingJobArn;

/**
 <p>A timestamp that indicates when the status of the training job was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>Information about the Amazon S3 location that is configured for storing model artifacts. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceModelArtifacts * _Nullable modelArtifacts;

/**
 <p>The S3 path where model artifacts that you configured when creating the job are stored. Amazon SageMaker creates subfolders for model artifacts. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Resources, including ML compute instances and ML storage volumes, that are configured for model training. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceResourceConfig * _Nullable resourceConfig;

/**
 <p>The AWS Identity and Access Management (IAM) role configured for the training job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p> Provides detailed information about the state of the training job. For detailed information on the secondary status of the training job, see <code>StatusMessage</code> under <a>SecondaryStatusTransition</a>.</p><p>Amazon SageMaker provides primary statuses and secondary statuses that apply to each of them:</p><dl><dt>InProgress</dt><dd><ul><li><p><code>Starting</code> - Starting the training job.</p></li><li><p><code>Downloading</code> - An optional stage for algorithms that support <code>File</code> training input mode. It indicates that data is being downloaded to the ML storage volumes.</p></li><li><p><code>Training</code> - Training is in progress.</p></li><li><p><code>Interrupted</code> - The job stopped because the managed spot training instances were interrupted. </p></li><li><p><code>Uploading</code> - Training is complete and the model artifacts are being uploaded to the S3 location.</p></li></ul></dd><dt>Completed</dt><dd><ul><li><p><code>Completed</code> - The training job has completed.</p></li></ul></dd><dt>Failed</dt><dd><ul><li><p><code>Failed</code> - The training job has failed. The reason for the failure is returned in the <code>FailureReason</code> field of <code>DescribeTrainingJobResponse</code>.</p></li></ul></dd><dt>Stopped</dt><dd><ul><li><p><code>MaxRuntimeExceeded</code> - The job stopped because it exceeded the maximum allowed runtime.</p></li><li><p><code>MaxWaitTmeExceeded</code> - The job stopped because it exceeded the maximum allowed wait time.</p></li><li><p><code>Stopped</code> - The training job has stopped.</p></li></ul></dd><dt>Stopping</dt><dd><ul><li><p><code>Stopping</code> - Stopping the training job.</p></li></ul></dd></dl><important><p>Valid values for <code>SecondaryStatus</code> are subject to change. </p></important><p>We no longer support the following secondary statuses:</p><ul><li><p><code>LaunchingMLInstances</code></p></li><li><p><code>PreparingTrainingStack</code></p></li><li><p><code>DownloadingTrainingImage</code></p></li></ul>
 */
@property (nonatomic, assign) AWSSageMakerServiceSecondaryStatus secondaryStatus;

/**
 <p>A history of all of the secondary statuses that the training job has transitioned through.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceSecondaryStatusTransition *> * _Nullable secondaryStatusTransitions;

/**
 <p>Specifies a limit to how long a model training job can run. It also specifies the maximum time to wait for a spot instance. When the job reaches the time limit, Amazon SageMaker ends the training job. Use this API to cap model training costs.</p><p>To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms can use this 120-second window to save the model artifacts, so the results of training are not lost. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceStoppingCondition * _Nullable stoppingCondition;

/**
 <p>Configuration of storage locations for TensorBoard output.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTensorBoardOutputConfig * _Nullable tensorBoardOutputConfig;

/**
 <p>Indicates the time when the training job ends on training instances. You are billed for the time interval between the value of <code>TrainingStartTime</code> and this time. For successful jobs and stopped jobs, this is the time after model artifacts are uploaded. For failed jobs, this is the time when Amazon SageMaker detects a job failure.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable trainingEndTime;

/**
 <p>The Amazon Resource Name (ARN) of the training job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobArn;

/**
 <p> Name of the model training job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobName;

/**
 <p>The status of the training job.</p><p>Amazon SageMaker provides the following training job statuses:</p><ul><li><p><code>InProgress</code> - The training is in progress.</p></li><li><p><code>Completed</code> - The training job has completed.</p></li><li><p><code>Failed</code> - The training job has failed. To see the reason for the failure, see the <code>FailureReason</code> field in the response to a <code>DescribeTrainingJobResponse</code> call.</p></li><li><p><code>Stopping</code> - The training job is stopping.</p></li><li><p><code>Stopped</code> - The training job has stopped.</p></li></ul><p>For more detailed information, see <code>SecondaryStatus</code>. </p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTrainingJobStatus trainingJobStatus;

/**
 <p>Indicates the time when the training job starts on training instances. You are billed for the time interval between this time and the value of <code>TrainingEndTime</code>. The start time in CloudWatch Logs might be later than this time. The difference is due to the time it takes to download the training data and to the size of the training container.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable trainingStartTime;

/**
 <p>The training time in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable trainingTimeInSeconds;

/**
 <p>The Amazon Resource Name (ARN) of the associated hyperparameter tuning job if the training job was launched by a hyperparameter tuning job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tuningJobArn;

/**
 <p>A <a>VpcConfig</a> object that specifies the VPC that this training job has access to. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html">Protect Training Jobs by Using an Amazon Virtual Private Cloud</a>.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceVpcConfig * _Nullable vpcConfig;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeTransformJobRequest : AWSRequest


/**
 <p>The name of the transform job that you want to view details of.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformJobName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeTransformJobResponse : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable autoMLJobArn;

/**
 <p>Specifies the number of records to include in a mini-batch for an HTTP inference request. A <i>record</i><i/> is a single unit of input data that inference can be made on. For example, a single line in a CSV file is a record. </p><p>To enable the batch strategy, you must set <code>SplitType</code> to <code>Line</code>, <code>RecordIO</code>, or <code>TFRecord</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceBatchStrategy batchStrategy;

/**
 <p>A timestamp that shows when the transform Job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The data structure used to specify the data to be used for inference in a batch transform job and to associate the data that is relevant to the prediction results in the output. The input filter provided allows you to exclude input data that is not needed for inference in a batch transform job. The output filter provided allows you to include input data relevant to interpreting the predictions in the output from the job. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html">Associate Prediction Results with their Corresponding Input Records</a>.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceDataProcessing * _Nullable dataProcessing;

/**
 <p>The environment variables to set in the Docker container. We support up to 16 key and values entries in the map.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environment;

/**
 <p>Configuration for the experiment.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceExperimentConfig * _Nullable experimentConfig;

/**
 <p>If the transform job failed, <code>FailureReason</code> describes why it failed. A transform job creates a log file, which includes error messages, and stores it as an Amazon S3 object. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/logging-cloudwatch.html">Log Amazon SageMaker Events with Amazon CloudWatch</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SageMaker Ground Truth labeling job that created the transform or training job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelingJobArn;

/**
 <p>The maximum number of parallel requests on each instance node that can be launched in a transform job. The default value is 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxConcurrentTransforms;

/**
 <p>The maximum payload size, in MB, used in the transform job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxPayloadInMB;

/**
 <p>The name of the model used in the transform job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

/**
 <p>Indicates when the transform job has been completed, or has stopped or failed. You are billed for the time interval between this time and the value of <code>TransformStartTime</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable transformEndTime;

/**
 <p>Describes the dataset to be transformed and the Amazon S3 location where it is stored.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTransformInput * _Nullable transformInput;

/**
 <p>The Amazon Resource Name (ARN) of the transform job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformJobArn;

/**
 <p>The name of the transform job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformJobName;

/**
 <p>The status of the transform job. If the transform job failed, the reason is returned in the <code>FailureReason</code> field.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTransformJobStatus transformJobStatus;

/**
 <p>Identifies the Amazon S3 location where you want Amazon SageMaker to save the results from the transform job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTransformOutput * _Nullable transformOutput;

/**
 <p>Describes the resources, including ML instance types and ML instance count, to use for the transform job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTransformResources * _Nullable transformResources;

/**
 <p>Indicates when the transform job starts on ML instances. You are billed for the time interval between this time and the value of <code>TransformEndTime</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable transformStartTime;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeTrialComponentRequest : AWSRequest


/**
 <p>The name of the trial component to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeTrialComponentResponse : AWSModel


/**
 <p>Who created the component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable createdBy;

/**
 <p>When the component was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The name of the component as displayed. If <code>DisplayName</code> isn't specified, <code>TrialComponentName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>When the component ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The input artifacts of the component.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSageMakerServiceTrialComponentArtifact *> * _Nullable inputArtifacts;

/**
 <p>Who last modified the component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable lastModifiedBy;

/**
 <p>When the component was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The metrics for the component.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTrialComponentMetricSummary *> * _Nullable metrics;

/**
 <p>The output artifacts of the component.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSageMakerServiceTrialComponentArtifact *> * _Nullable outputArtifacts;

/**
 <p>The hyperparameters of the component.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSageMakerServiceTrialComponentParameterValue *> * _Nullable parameters;

/**
 <p>The Amazon Resource Name (ARN) of the source and, optionally, the job type.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrialComponentSource * _Nullable source;

/**
 <p>When the component started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The status of the component. States include:</p><ul><li><p>InProgress</p></li><li><p>Completed</p></li><li><p>Failed</p></li></ul>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrialComponentStatus * _Nullable status;

/**
 <p>The Amazon Resource Name (ARN) of the trial component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentArn;

/**
 <p>The name of the trial component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeTrialRequest : AWSRequest


/**
 <p>The name of the trial to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeTrialResponse : AWSModel


/**
 <p>Who created the trial.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable createdBy;

/**
 <p>When the trial was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The name of the trial as displayed. If <code>DisplayName</code> isn't specified, <code>TrialName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The name of the experiment the trial is part of.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentName;

/**
 <p>Who last modified the trial.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable lastModifiedBy;

/**
 <p>When the trial was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The Amazon Resource Name (ARN) of the source and, optionally, the job type.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrialSource * _Nullable source;

/**
 <p>The Amazon Resource Name (ARN) of the trial.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialArn;

/**
 <p>The name of the trial.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeUserProfileRequest : AWSRequest


/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The user profile name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeUserProfileResponse : AWSModel


/**
 <p>The creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The failure reason.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The home Amazon Elastic File System (EFS) Uid.</p>
 */
@property (nonatomic, strong) NSString * _Nullable homeEfsFileSystemUid;

/**
 <p>The last modified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The SSO user identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable singleSignOnUserIdentifier;

/**
 <p>The SSO user value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable singleSignOnUserValue;

/**
 <p>The status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceUserProfileStatus status;

/**
 <p>The user profile Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileArn;

/**
 <p>The user profile name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileName;

/**
 <p>A collection of settings.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserSettings * _Nullable userSettings;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeWorkforceRequest : AWSRequest


/**
 <p>The name of the private workforce whose access you want to restrict. <code>WorkforceName</code> is automatically set to <code>default</code> when a workforce is created and cannot be modified. </p>
 */
@property (nonatomic, strong) NSString * _Nullable workforceName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeWorkforceResponse : AWSModel


/**
 <p>A single private workforce, which is automatically created when you create your first private work team. You can create one private work force in each AWS Region. By default, any workforce-related API operation used in a specific region will apply to the workforce created in that region. To learn how to create a private workforce, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private.html">Create a Private Workforce</a>.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceWorkforce * _Nullable workforce;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeWorkteamRequest : AWSRequest


/**
 <p>The name of the work team to return a description of.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workteamName;

@end

/**
 
 */
@interface AWSSageMakerServiceDescribeWorkteamResponse : AWSModel


/**
 <p>A <code>Workteam</code> instance that contains information about the work team. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceWorkteam * _Nullable workteam;

@end

/**
 <p>Specifies weight and capacity values for a production variant.</p>
 Required parameters: [VariantName]
 */
@interface AWSSageMakerServiceDesiredWeightAndCapacity : AWSModel


/**
 <p>The variant's capacity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredInstanceCount;

/**
 <p>The variant's weight.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredWeight;

/**
 <p>The name of the variant to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable variantName;

@end

/**
 
 */
@interface AWSSageMakerServiceDisassociateTrialComponentRequest : AWSRequest


/**
 <p>The name of the component to disassociate from the trial.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentName;

/**
 <p>The name of the trial to disassociate from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialName;

@end

/**
 
 */
@interface AWSSageMakerServiceDisassociateTrialComponentResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the trial.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialArn;

/**
 <p>The ARN of the trial component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentArn;

@end

/**
 <p>The domain's details.</p>
 */
@interface AWSSageMakerServiceDomainDetails : AWSModel


/**
 <p>The creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The domain's Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainArn;

/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The domain name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The last modified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceDomainStatus status;

/**
 <p>The domain's URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>Provides summary information for an endpoint configuration.</p>
 Required parameters: [EndpointConfigName, EndpointConfigArn, CreationTime]
 */
@interface AWSSageMakerServiceEndpointConfigSummary : AWSModel


/**
 <p>A timestamp that shows when the endpoint configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The Amazon Resource Name (ARN) of the endpoint configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointConfigArn;

/**
 <p>The name of the endpoint configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointConfigName;

@end

/**
 <p>Input object for the endpoint</p>
 Required parameters: [EndpointName, LocalPath]
 */
@interface AWSSageMakerServiceEndpointInput : AWSModel


/**
 <p>An endpoint in customer's account which has enabled <code>DataCaptureConfig</code> enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>Path to the filesystem where the endpoint data is available to the container.</p>
 */
@property (nonatomic, strong) NSString * _Nullable localPath;

/**
 <p>Whether input data distributed in Amazon S3 is fully replicated or sharded by an S3 key. Defauts to <code>FullyReplicated</code></p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingS3DataDistributionType s3DataDistributionType;

/**
 <p>Whether the <code>Pipe</code> or <code>File</code> is used as the input mode for transfering data for the monitoring job. <code>Pipe</code> mode is recommended for large datasets. <code>File</code> mode is useful for small files that fit in memory. Defaults to <code>File</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingS3InputMode s3InputMode;

@end

/**
 <p>Provides summary information for an endpoint.</p>
 Required parameters: [EndpointName, EndpointArn, CreationTime, LastModifiedTime, EndpointStatus]
 */
@interface AWSSageMakerServiceEndpointSummary : AWSModel


/**
 <p>A timestamp that shows when the endpoint was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The Amazon Resource Name (ARN) of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

/**
 <p>The name of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>The status of the endpoint.</p><ul><li><p><code>OutOfService</code>: Endpoint is not available to take incoming requests.</p></li><li><p><code>Creating</code>: <a>CreateEndpoint</a> is executing.</p></li><li><p><code>Updating</code>: <a>UpdateEndpoint</a> or <a>UpdateEndpointWeightsAndCapacities</a> is executing.</p></li><li><p><code>SystemUpdating</code>: Endpoint is undergoing maintenance and cannot be updated or deleted or re-scaled until it has completed. This maintenance operation does not change any customer-specified values such as VPC config, KMS encryption, model, instance type, or instance count.</p></li><li><p><code>RollingBack</code>: Endpoint fails to scale up or down or change its variant weight and is in the process of rolling back to its previous configuration. Once the rollback completes, endpoint returns to an <code>InService</code> status. This transitional status only applies to an endpoint that has autoscaling enabled and is undergoing variant weight or capacity changes as part of an <a>UpdateEndpointWeightsAndCapacities</a> call or when the <a>UpdateEndpointWeightsAndCapacities</a> operation is called explicitly.</p></li><li><p><code>InService</code>: Endpoint is available to process incoming requests.</p></li><li><p><code>Deleting</code>: <a>DeleteEndpoint</a> is executing.</p></li><li><p><code>Failed</code>: Endpoint could not be created, updated, or re-scaled. Use <a>DescribeEndpointOutput$FailureReason</a> for information about the failure. <a>DeleteEndpoint</a> is the only operation that can be performed on a failed endpoint.</p></li></ul><p>To get a list of endpoints with a specified status, use the <a>ListEndpointsInput$StatusEquals</a> filter.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceEndpointStatus endpointStatus;

/**
 <p>A timestamp that shows when the endpoint was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

@end

/**
 <p>The properties of an experiment as returned by the <a>Search</a> API.</p>
 */
@interface AWSSageMakerServiceExperiment : AWSModel


/**
 <p>Information about the user who created or modified an experiment, trial, or trial component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable createdBy;

/**
 <p>When the experiment was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The description of the experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the experiment as displayed. If <code>DisplayName</code> isn't specified, <code>ExperimentName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The Amazon Resource Name (ARN) of the experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentArn;

/**
 <p>The name of the experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentName;

/**
 <p>Information about the user who created or modified an experiment, trial, or trial component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable lastModifiedBy;

/**
 <p>When the experiment was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The source of the experiment.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceExperimentSource * _Nullable source;

/**
 <p>The list of tags that are associated with the experiment. You can use <a>Search</a> API to search on the tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

@end

/**
 <p>Configuration for the experiment.</p>
 */
@interface AWSSageMakerServiceExperimentConfig : AWSModel


/**
 <p>The name of the experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentName;

/**
 <p>Display name for the trial component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentDisplayName;

/**
 <p>The name of the trial.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialName;

@end

/**
 <p>The source of the experiment.</p>
 Required parameters: [SourceArn]
 */
@interface AWSSageMakerServiceExperimentSource : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>The source type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

@end

/**
 <p>A summary of the properties of an experiment. To get the complete set of properties, call the <a>DescribeExperiment</a> API and provide the <code>ExperimentName</code>.</p>
 */
@interface AWSSageMakerServiceExperimentSummary : AWSModel


/**
 <p>When the experiment was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The name of the experiment as displayed. If <code>DisplayName</code> isn't specified, <code>ExperimentName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The Amazon Resource Name (ARN) of the experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentArn;

/**
 <p>The name of the experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentName;

/**
 <p>The source of the experiment.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceExperimentSource * _Nullable experimentSource;

/**
 <p>When the experiment was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

@end

/**
 <p>Specifies a file system data source for a channel.</p>
 Required parameters: [FileSystemId, FileSystemAccessMode, FileSystemType, DirectoryPath]
 */
@interface AWSSageMakerServiceFileSystemDataSource : AWSModel


/**
 <p>The full path to the directory to associate with the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directoryPath;

/**
 <p>The access mode of the mount of the directory associated with the channel. A directory can be mounted either in <code>ro</code> (read-only) or <code>rw</code> (read-write) mode.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceFileSystemAccessMode fileSystemAccessMode;

/**
 <p>The file system id.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileSystemId;

/**
 <p>The file system type. </p>
 */
@property (nonatomic, assign) AWSSageMakerServiceFileSystemType fileSystemType;

@end

/**
 <p>A conditional statement for a search expression that includes a resource property, a Boolean operator, and a value. Resources that match the statement are returned in the results from the <a>Search</a> API.</p><p>If you specify a <code>Value</code>, but not an <code>Operator</code>, Amazon SageMaker uses the equals operator.</p><p>In search, there are several property types:</p><dl><dt>Metrics</dt><dd><p>To define a metric filter, enter a value using the form <code>"Metrics.&lt;name&gt;"</code>, where <code>&lt;name&gt;</code> is a metric name. For example, the following filter searches for training jobs with an <code>"accuracy"</code> metric greater than <code>"0.9"</code>:</p><p><code>{</code></p><p><code>"Name": "Metrics.accuracy",</code></p><p><code>"Operator": "GreaterThan",</code></p><p><code>"Value": "0.9"</code></p><p><code>}</code></p></dd><dt>HyperParameters</dt><dd><p>To define a hyperparameter filter, enter a value with the form <code>"HyperParameters.&lt;name&gt;"</code>. Decimal hyperparameter values are treated as a decimal in a comparison if the specified <code>Value</code> is also a decimal value. If the specified <code>Value</code> is an integer, the decimal hyperparameter values are treated as integers. For example, the following filter is satisfied by training jobs with a <code>"learning_rate"</code> hyperparameter that is less than <code>"0.5"</code>:</p><p><code> {</code></p><p><code> "Name": "HyperParameters.learning_rate",</code></p><p><code> "Operator": "LessThan",</code></p><p><code> "Value": "0.5"</code></p><p><code> }</code></p></dd><dt>Tags</dt><dd><p>To define a tag filter, enter a value with the form <code>Tags.&lt;key&gt;</code>.</p></dd></dl>
 Required parameters: [Name]
 */
@interface AWSSageMakerServiceFilter : AWSModel


/**
 <p>A resource property name. For example, <code>TrainingJobName</code>. For valid property names, see <a>SearchRecord</a>. You must specify a valid property for the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A Boolean binary operator that is used to evaluate the filter. The operator field contains one of the following values:</p><dl><dt>Equals</dt><dd><p>The value of <code>Name</code> equals <code>Value</code>.</p></dd><dt>NotEquals</dt><dd><p>The value of <code>Name</code> doesn't equal <code>Value</code>.</p></dd><dt>GreaterThan</dt><dd><p>The value of <code>Name</code> is greater than <code>Value</code>. Not supported for text properties.</p></dd><dt>GreaterThanOrEqualTo</dt><dd><p>The value of <code>Name</code> is greater than or equal to <code>Value</code>. Not supported for text properties.</p></dd><dt>LessThan</dt><dd><p>The value of <code>Name</code> is less than <code>Value</code>. Not supported for text properties.</p></dd><dt>LessThanOrEqualTo</dt><dd><p>The value of <code>Name</code> is less than or equal to <code>Value</code>. Not supported for text properties.</p></dd><dt>Contains</dt><dd><p>The value of <code>Name</code> contains the string <code>Value</code>. A <code>SearchExpression</code> can include only one <code>Contains</code> operator. Only supported for text properties.</p></dd><dt>Exists</dt><dd><p>The <code>Name</code> property exists.</p></dd><dt>NotExists</dt><dd><p>The <code>Name</code> property does not exist.</p></dd><dt>In</dt><dd><p>The value of <code>Name</code> is one of the comma delimited strings in <code>Value</code>. Only supported for text properties.</p></dd></dl>
 */
@property (nonatomic, assign) AWSSageMakerServiceOperator operator;

/**
 <p>A value used with <code>Name</code> and <code>Operator</code> to determine which resources satisfy the filter's condition. For numerical properties, <code>Value</code> must be an integer or floating-point decimal. For timestamp properties, <code>Value</code> must be an ISO 8601 date-time string of the following format: <code>YYYY-mm-dd'T'HH:MM:SS</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The candidate result from a job.</p>
 Required parameters: [MetricName, Value]
 */
@interface AWSSageMakerServiceFinalAutoMLJobObjectiveMetric : AWSModel


/**
 <p>The name of the metric.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAutoMLMetricEnum metricName;

/**
 <p>The metric type used.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAutoMLJobObjectiveType types;

/**
 <p>The value of the metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>Shows the final value for the objective metric for a training job that was launched by a hyperparameter tuning job. You define the objective metric in the <code>HyperParameterTuningJobObjective</code> parameter of <a>HyperParameterTuningJobConfig</a>.</p>
 Required parameters: [MetricName, Value]
 */
@interface AWSSageMakerServiceFinalHyperParameterTuningJobObjectiveMetric : AWSModel


/**
 <p>The name of the objective metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>Whether to minimize or maximize the objective metric. Valid values are Minimize and Maximize.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceHyperParameterTuningJobObjectiveType types;

/**
 <p>The value of the objective metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>Contains information about where human output will be stored.</p>
 Required parameters: [S3OutputPath]
 */
@interface AWSSageMakerServiceFlowDefinitionOutputConfig : AWSModel


/**
 <p>The Amazon Key Management Service (KMS) key ID for server-side encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The Amazon S3 path where the object containing human output will be made available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3OutputPath;

@end

/**
 <p>Contains summary information about the flow definition.</p>
 Required parameters: [FlowDefinitionName, FlowDefinitionArn, FlowDefinitionStatus, CreationTime]
 */
@interface AWSSageMakerServiceFlowDefinitionSummary : AWSModel


/**
 <p>The timestamp when SageMaker created the flow definition.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The reason why the flow definition creation failed. A failure reason is returned only when the flow definition status is <code>Failed</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The Amazon Resource Name (ARN) of the flow definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowDefinitionArn;

/**
 <p>The name of the flow definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowDefinitionName;

/**
 <p>The status of the flow definition. Valid values:</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceFlowDefinitionStatus flowDefinitionStatus;

@end

/**
 
 */
@interface AWSSageMakerServiceGetSearchSuggestionsRequest : AWSRequest


/**
 <p>The name of the Amazon SageMaker resource to search for.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceResourceType resource;

/**
 <p>Limits the property names that are included in the response.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceSuggestionQuery * _Nullable suggestionQuery;

@end

/**
 
 */
@interface AWSSageMakerServiceGetSearchSuggestionsResponse : AWSModel


/**
 <p>A list of property names for a <code>Resource</code> that match a <code>SuggestionQuery</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServicePropertyNameSuggestion *> * _Nullable propertyNameSuggestions;

@end

/**
 <p>Specifies configuration details for a Git repository in your AWS account.</p>
 Required parameters: [RepositoryUrl]
 */
@interface AWSSageMakerServiceGitConfig : AWSModel


/**
 <p>The default branch for the Git repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable branch;

/**
 <p>The URL where the Git repository is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryUrl;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Secrets Manager secret that contains the credentials used to access the git repository. The secret must have a staging label of <code>AWSCURRENT</code> and must be in the following format:</p><p><code>{"username": <i>UserName</i>, "password": <i>Password</i>}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable secretArn;

@end

/**
 <p>Specifies configuration details for a Git repository when the repository is updated.</p>
 */
@interface AWSSageMakerServiceGitConfigForUpdate : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the AWS Secrets Manager secret that contains the credentials used to access the git repository. The secret must have a staging label of <code>AWSCURRENT</code> and must be in the following format:</p><p><code>{"username": <i>UserName</i>, "password": <i>Password</i>}</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable secretArn;

@end

/**
 <p>Defines under what conditions SageMaker creates a human loop. Used within . See for the required format of activation conditions.</p>
 Required parameters: [HumanLoopActivationConditions]
 */
@interface AWSSageMakerServiceHumanLoopActivationConditionsConfig : AWSModel


/**
 <p>JSON expressing use-case specific conditions declaratively. If any condition is matched, atomic tasks are created against the configured work team. The set of conditions is different for Rekognition and Textract. For more information about how to structure the JSON, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/a2i-human-fallback-conditions-json-schema.html">JSON Schema for Human Loop Activation Conditions in Amazon Augmented AI</a> in the <i>Amazon SageMaker Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopActivationConditions;

@end

/**
 <p>Provides information about how and under what conditions SageMaker creates a human loop. If <code>HumanLoopActivationConfig</code> is not given, then all requests go to humans.</p>
 Required parameters: [HumanLoopActivationConditionsConfig]
 */
@interface AWSSageMakerServiceHumanLoopActivationConfig : AWSModel


/**
 <p>Container structure for defining under what conditions SageMaker creates a human loop.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHumanLoopActivationConditionsConfig * _Nullable humanLoopActivationConditionsConfig;

@end

/**
 <p>Describes the work to be performed by human workers.</p>
 Required parameters: [WorkteamArn, HumanTaskUiArn, TaskTitle, TaskDescription, TaskCount]
 */
@interface AWSSageMakerServiceHumanLoopConfig : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the human task user interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanTaskUiArn;

/**
 <p>Defines the amount of money paid to an Amazon Mechanical Turk worker for each task performed. </p><p>Use one of the following prices for bounding box tasks. Prices are in US dollars and should be based on the complexity of the task; the longer it takes in your initial testing, the more you should offer.</p><ul><li><p>0.036</p></li><li><p>0.048</p></li><li><p>0.060</p></li><li><p>0.072</p></li><li><p>0.120</p></li><li><p>0.240</p></li><li><p>0.360</p></li><li><p>0.480</p></li><li><p>0.600</p></li><li><p>0.720</p></li><li><p>0.840</p></li><li><p>0.960</p></li><li><p>1.080</p></li><li><p>1.200</p></li></ul><p>Use one of the following prices for image classification, text classification, and custom tasks. Prices are in US dollars.</p><ul><li><p>0.012</p></li><li><p>0.024</p></li><li><p>0.036</p></li><li><p>0.048</p></li><li><p>0.060</p></li><li><p>0.072</p></li><li><p>0.120</p></li><li><p>0.240</p></li><li><p>0.360</p></li><li><p>0.480</p></li><li><p>0.600</p></li><li><p>0.720</p></li><li><p>0.840</p></li><li><p>0.960</p></li><li><p>1.080</p></li><li><p>1.200</p></li></ul><p>Use one of the following prices for semantic segmentation tasks. Prices are in US dollars.</p><ul><li><p>0.840</p></li><li><p>0.960</p></li><li><p>1.080</p></li><li><p>1.200</p></li></ul><p>Use one of the following prices for Textract AnalyzeDocument Important Form Key Amazon Augmented AI review tasks. Prices are in US dollars.</p><ul><li><p>2.400 </p></li><li><p>2.280 </p></li><li><p>2.160 </p></li><li><p>2.040 </p></li><li><p>1.920 </p></li><li><p>1.800 </p></li><li><p>1.680 </p></li><li><p>1.560 </p></li><li><p>1.440 </p></li><li><p>1.320 </p></li><li><p>1.200 </p></li><li><p>1.080 </p></li><li><p>0.960 </p></li><li><p>0.840 </p></li><li><p>0.720 </p></li><li><p>0.600 </p></li><li><p>0.480 </p></li><li><p>0.360 </p></li><li><p>0.240 </p></li><li><p>0.120 </p></li><li><p>0.072 </p></li><li><p>0.060 </p></li><li><p>0.048 </p></li><li><p>0.036 </p></li><li><p>0.024 </p></li><li><p>0.012 </p></li></ul><p>Use one of the following prices for Rekognition DetectModerationLabels Amazon Augmented AI review tasks. Prices are in US dollars.</p><ul><li><p>1.200 </p></li><li><p>1.080 </p></li><li><p>0.960 </p></li><li><p>0.840 </p></li><li><p>0.720 </p></li><li><p>0.600 </p></li><li><p>0.480 </p></li><li><p>0.360 </p></li><li><p>0.240 </p></li><li><p>0.120 </p></li><li><p>0.072 </p></li><li><p>0.060 </p></li><li><p>0.048 </p></li><li><p>0.036 </p></li><li><p>0.024 </p></li><li><p>0.012 </p></li></ul><p>Use one of the following prices for Amazon Augmented AI custom human review tasks. Prices are in US dollars.</p><ul><li><p>1.200 </p></li><li><p>1.080 </p></li><li><p>0.960 </p></li><li><p>0.840 </p></li><li><p>0.720 </p></li><li><p>0.600 </p></li><li><p>0.480 </p></li><li><p>0.360 </p></li><li><p>0.240 </p></li><li><p>0.120 </p></li><li><p>0.072 </p></li><li><p>0.060 </p></li><li><p>0.048 </p></li><li><p>0.036 </p></li><li><p>0.024 </p></li><li><p>0.012 </p></li></ul>
 */
@property (nonatomic, strong) AWSSageMakerServicePublicWorkforceTaskPrice * _Nullable publicWorkforceTaskPrice;

/**
 <p>The length of time that a task remains available for labeling by human workers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable taskAvailabilityLifetimeInSeconds;

/**
 <p>The number of distinct workers who will perform the same task on each object. For example, if <code>TaskCount</code> is set to <code>3</code> for an image classification labeling job, three workers will classify each input image. Increasing <code>TaskCount</code> can improve label accuracy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable taskCount;

/**
 <p>A description for the human worker task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskDescription;

/**
 <p>Keywords used to describe the task so that workers can discover the task.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable taskKeywords;

/**
 <p>The amount of time that a worker has to complete a task.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable taskTimeLimitInSeconds;

/**
 <p>A title for the human worker task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskTitle;

/**
 <p>Amazon Resource Name (ARN) of a team of workers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workteamArn;

@end

/**
 <p>Container for configuring the source of human task requests.</p>
 Required parameters: [AwsManagedHumanLoopRequestSource]
 */
@interface AWSSageMakerServiceHumanLoopRequestSource : AWSModel


/**
 <p>Specifies whether Amazon Rekognition or Amazon Textract are used as the integration source. The default field settings and JSON parsing rules are different based on the integration source. Valid values:</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAwsManagedHumanLoopRequestSource awsManagedHumanLoopRequestSource;

@end

/**
 <p>Information required for human workers to complete a labeling task.</p>
 Required parameters: [WorkteamArn, UiConfig, PreHumanTaskLambdaArn, TaskTitle, TaskDescription, NumberOfHumanWorkersPerDataObject, TaskTimeLimitInSeconds, AnnotationConsolidationConfig]
 */
@interface AWSSageMakerServiceHumanTaskConfig : AWSModel


/**
 <p>Configures how labels are consolidated across human workers.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAnnotationConsolidationConfig * _Nullable annotationConsolidationConfig;

/**
 <p>Defines the maximum number of data objects that can be labeled by human workers at the same time. Also referred to as batch size. Each object may have more than one worker at one time. The default value is 1000 objects.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxConcurrentTaskCount;

/**
 <p>The number of human workers that will label an object. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfHumanWorkersPerDataObject;

/**
 <p>The Amazon Resource Name (ARN) of a Lambda function that is run before a data object is sent to a human worker. Use this function to provide input to a custom labeling job.</p><p>For the built-in bounding box, image classification, semantic segmentation, and text classification task types, Amazon SageMaker Ground Truth provides the following Lambda functions:</p><p><b>US East (Northern Virginia) (us-east-1):</b></p><ul><li><p><code>arn:aws:lambda:us-east-1:432418664414:function:PRE-BoundingBox</code></p></li><li><p><code>arn:aws:lambda:us-east-1:432418664414:function:PRE-ImageMultiClass</code></p></li><li><p><code>arn:aws:lambda:us-east-1:432418664414:function:PRE-ImageMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:us-east-1:432418664414:function:PRE-SemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:us-east-1:432418664414:function:PRE-TextMultiClass</code></p></li><li><p><code>arn:aws:lambda:us-east-1:432418664414:function:PRE-TextMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:us-east-1:432418664414:function:PRE-NamedEntityRecognition</code></p></li><li><p><code>arn:aws:lambda:us-east-1:432418664414:function:PRE-VerificationBoundingBox</code></p></li><li><p><code>arn:aws:lambda:us-east-1:432418664414:function:PRE-VerificationSemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:us-east-1:432418664414:function:PRE-AdjustmentBoundingBox</code></p></li><li><p><code>arn:aws:lambda:us-east-1:432418664414:function:PRE-AdjustmentSemanticSegmentation</code></p></li></ul><p><b>US East (Ohio) (us-east-2):</b></p><ul><li><p><code>arn:aws:lambda:us-east-2:266458841044:function:PRE-BoundingBox</code></p></li><li><p><code>arn:aws:lambda:us-east-2:266458841044:function:PRE-ImageMultiClass</code></p></li><li><p><code>arn:aws:lambda:us-east-2:266458841044:function:PRE-ImageMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:us-east-2:266458841044:function:PRE-SemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:us-east-2:266458841044:function:PRE-TextMultiClass</code></p></li><li><p><code>arn:aws:lambda:us-east-2:266458841044:function:PRE-TextMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:us-east-2:266458841044:function:PRE-NamedEntityRecognition</code></p></li><li><p><code>arn:aws:lambda:us-east-2:266458841044:function:PRE-VerificationBoundingBox</code></p></li><li><p><code>arn:aws:lambda:us-east-2:266458841044:function:PRE-VerificationSemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:us-east-2:266458841044:function:PRE-AdjustmentBoundingBox</code></p></li><li><p><code>arn:aws:lambda:us-east-2:266458841044:function:PRE-AdjustmentSemanticSegmentation</code></p></li></ul><p><b>US West (Oregon) (us-west-2):</b></p><ul><li><p><code>arn:aws:lambda:us-west-2:081040173940:function:PRE-BoundingBox</code></p></li><li><p><code>arn:aws:lambda:us-west-2:081040173940:function:PRE-ImageMultiClass</code></p></li><li><p><code>arn:aws:lambda:us-west-2:081040173940:function:PRE-ImageMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:us-west-2:081040173940:function:PRE-SemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:us-west-2:081040173940:function:PRE-TextMultiClass</code></p></li><li><p><code>arn:aws:lambda:us-west-2:081040173940:function:PRE-TextMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:us-west-2:081040173940:function:PRE-NamedEntityRecognition</code></p></li><li><p><code>arn:aws:lambda:us-west-2:081040173940:function:PRE-VerificationBoundingBox</code></p></li><li><p><code>arn:aws:lambda:us-west-2:081040173940:function:PRE-VerificationSemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:us-west-2:081040173940:function:PRE-AdjustmentBoundingBox</code></p></li><li><p><code>arn:aws:lambda:us-west-2:081040173940:function:PRE-AdjustmentSemanticSegmentation</code></p></li></ul><p><b>Canada (Central) (ca-central-1):</b></p><ul><li><p><code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-BoundingBox</code></p></li><li><p><code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-ImageMultiClass</code></p></li><li><p><code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-ImageMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-SemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-TextMultiClass</code></p></li><li><p><code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-TextMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-NamedEntityRecognition</code></p></li><li><p><code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-VerificationBoundingBox</code></p></li><li><p><code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-VerificationSemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-AdjustmentBoundingBox</code></p></li><li><p><code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-AdjustmentSemanticSegmentation</code></p></li></ul><p><b>EU (Ireland) (eu-west-1):</b></p><ul><li><p><code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-BoundingBox</code></p></li><li><p><code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-ImageMultiClass</code></p></li><li><p><code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-ImageMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-SemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-TextMultiClass</code></p></li><li><p><code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-TextMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-NamedEntityRecognition</code></p></li><li><p><code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-VerificationBoundingBox</code></p></li><li><p><code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-VerificationSemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-AdjustmentBoundingBox</code></p></li><li><p><code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-AdjustmentSemanticSegmentation</code></p></li></ul><p><b>EU (London) (eu-west-2):</b></p><ul><li><p><code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-BoundingBox</code></p></li><li><p><code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-ImageMultiClass</code></p></li><li><p><code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-ImageMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-SemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-TextMultiClass</code></p></li><li><p><code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-TextMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-NamedEntityRecognition</code></p></li><li><p><code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-VerificationBoundingBox</code></p></li><li><p><code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-VerificationSemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-AdjustmentBoundingBox</code></p></li><li><p><code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-AdjustmentSemanticSegmentation</code></p></li></ul><p><b>EU Frankfurt (eu-central-1):</b></p><ul><li><p><code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-BoundingBox</code></p></li><li><p><code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-ImageMultiClass</code></p></li><li><p><code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-ImageMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-SemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-TextMultiClass</code></p></li><li><p><code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-TextMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-NamedEntityRecognition</code></p></li><li><p><code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-VerificationBoundingBox</code></p></li><li><p><code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-VerificationSemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-AdjustmentBoundingBox</code></p></li><li><p><code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-AdjustmentSemanticSegmentation</code></p></li></ul><p><b>Asia Pacific (Tokyo) (ap-northeast-1):</b></p><ul><li><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-BoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-ImageMultiClass</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-ImageMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-SemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-TextMultiClass</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-TextMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-NamedEntityRecognition</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-VerificationBoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-VerificationSemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-AdjustmentBoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-AdjustmentSemanticSegmentation</code></p></li></ul><p><b>Asia Pacific (Seoul) (ap-northeast-2):</b></p><ul><li><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-BoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-ImageMultiClass</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-ImageMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-SemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-TextMultiClass</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-TextMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-NamedEntityRecognition</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-VerificationBoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-VerificationSemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-AdjustmentBoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-AdjustmentSemanticSegmentation</code></p></li></ul><p><b>Asia Pacific (Mumbai) (ap-south-1):</b></p><ul><li><p><code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-BoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-ImageMultiClass</code></p></li><li><p><code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-ImageMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-SemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-TextMultiClass</code></p></li><li><p><code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-TextMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-NamedEntityRecognition</code></p></li><li><p><code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-VerificationBoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-VerificationSemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-AdjustmentBoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-AdjustmentSemanticSegmentation</code></p></li></ul><p><b>Asia Pacific (Singapore) (ap-southeast-1):</b></p><ul><li><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-BoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-ImageMultiClass</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-ImageMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-SemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-TextMultiClass</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-TextMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-NamedEntityRecognition</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-VerificationBoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-VerificationSemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-AdjustmentBoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-AdjustmentSemanticSegmentation</code></p></li></ul><p><b>Asia Pacific (Sydney) (ap-southeast-2):</b></p><ul><li><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-BoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-ImageMultiClass</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-ImageMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-SemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-TextMultiClass</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-TextMultiClassMultiLabel</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-NamedEntityRecognition</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-VerificationBoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-VerificationSemanticSegmentation</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-AdjustmentBoundingBox</code></p></li><li><p><code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-AdjustmentSemanticSegmentation</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable preHumanTaskLambdaArn;

/**
 <p>The price that you pay for each task performed by an Amazon Mechanical Turk worker.</p>
 */
@property (nonatomic, strong) AWSSageMakerServicePublicWorkforceTaskPrice * _Nullable publicWorkforceTaskPrice;

/**
 <p>The length of time that a task remains available for labeling by human workers. <b>If you choose the Amazon Mechanical Turk workforce, the maximum is 12 hours (43200)</b>. The default value is 864000 seconds (10 days). For private and vendor workforces, the maximum is as listed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable taskAvailabilityLifetimeInSeconds;

/**
 <p>A description of the task for your human workers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskDescription;

/**
 <p>Keywords used to describe the task so that workers on Amazon Mechanical Turk can discover the task.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable taskKeywords;

/**
 <p>The amount of time that a worker has to complete a task.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable taskTimeLimitInSeconds;

/**
 <p>A title for the task for your human workers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskTitle;

/**
 <p>Information about the user interface that workers use to complete the labeling task.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUiConfig * _Nullable uiConfig;

/**
 <p>The Amazon Resource Name (ARN) of the work team assigned to complete the tasks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workteamArn;

@end

/**
 <p>Container for human task user interface information.</p>
 Required parameters: [HumanTaskUiName, HumanTaskUiArn, CreationTime]
 */
@interface AWSSageMakerServiceHumanTaskUiSummary : AWSModel


/**
 <p>A timestamp when SageMaker created the human task user interface.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The Amazon Resource Name (ARN) of the human task user interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanTaskUiArn;

/**
 <p>The name of the human task user interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanTaskUiName;

@end

/**
 <p>Specifies which training algorithm to use for training jobs that a hyperparameter tuning job launches and the metrics to monitor.</p>
 Required parameters: [TrainingInputMode]
 */
@interface AWSSageMakerServiceHyperParameterAlgorithmSpecification : AWSModel


/**
 <p>The name of the resource algorithm to use for the hyperparameter tuning job. If you specify a value for this parameter, do not specify a value for <code>TrainingImage</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmName;

/**
 <p>An array of <a>MetricDefinition</a> objects that specify the metrics that the algorithm emits.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceMetricDefinition *> * _Nullable metricDefinitions;

/**
 <p> The registry path of the Docker image that contains the training algorithm. For information about Docker registry paths for built-in algorithms, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-algo-docker-registry-paths.html">Algorithms Provided by Amazon SageMaker: Common Parameters</a>. Amazon SageMaker supports both <code>registry/repository[:tag]</code> and <code>registry/repository[@digest]</code> image path formats. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html">Using Your Own Algorithms with Amazon SageMaker</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingImage;

/**
 <p>The input mode that the algorithm supports: File or Pipe. In File input mode, Amazon SageMaker downloads the training data from Amazon S3 to the storage volume that is attached to the training instance and mounts the directory to the Docker volume for the training container. In Pipe input mode, Amazon SageMaker streams data directly from Amazon S3 to the container. </p><p>If you specify File mode, make sure that you provision the storage volume that is attached to the training instance with enough capacity to accommodate the training data downloaded from Amazon S3, the model artifacts, and intermediate information.</p><p/><p>For more information about input modes, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>. </p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTrainingInputMode trainingInputMode;

@end

/**
 <p>Defines a hyperparameter to be used by an algorithm.</p>
 Required parameters: [Name, Type]
 */
@interface AWSSageMakerServiceHyperParameterSpecification : AWSModel


/**
 <p>The default value for this hyperparameter. If a default value is specified, a hyperparameter cannot be required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>A brief description of the hyperparameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Indicates whether this hyperparameter is required.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isRequired;

/**
 <p>Indicates whether this hyperparameter is tunable in a hyperparameter tuning job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTunable;

/**
 <p>The name of this hyperparameter. The name must be unique.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The allowed range for this hyperparameter.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceParameterRange * _Nullable range;

/**
 <p>The type of this hyperparameter. The valid types are <code>Integer</code>, <code>Continuous</code>, <code>Categorical</code>, and <code>FreeText</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceParameterType types;

@end

/**
 <p>Defines the training jobs launched by a hyperparameter tuning job.</p>
 Required parameters: [AlgorithmSpecification, RoleArn, OutputDataConfig, ResourceConfig, StoppingCondition]
 */
@interface AWSSageMakerServiceHyperParameterTrainingJobDefinition : AWSModel


/**
 <p>The <a>HyperParameterAlgorithmSpecification</a> object that specifies the resource algorithm to use for the training jobs that the tuning job launches.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHyperParameterAlgorithmSpecification * _Nullable algorithmSpecification;

/**
 <p>Contains information about the output location for managed spot training checkpoint data. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceCheckpointConfig * _Nullable checkpointConfig;

/**
 <p>The job definition name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable definitionName;

/**
 <p>To encrypt all communications between ML compute instances in distributed training, choose <code>True</code>. Encryption provides greater security for distributed training, but training might take longer. How long it takes depends on the amount of communication between compute instances, especially if you use a deep learning algorithm in distributed training.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableInterContainerTrafficEncryption;

/**
 <p>A Boolean indicating whether managed spot training is enabled (<code>True</code>) or not (<code>False</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableManagedSpotTraining;

/**
 <p>Isolates the training container. No inbound or outbound network calls can be made, except for calls between peers within a training cluster for distributed training. If network isolation is used for training jobs that are configured to use a VPC, Amazon SageMaker downloads and uploads customer data and model artifacts through the specified VPC, but the training container does not have network access.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableNetworkIsolation;

/**
 <p>Specifies ranges of integer, continuous, and categorical hyperparameters that a hyperparameter tuning job searches. The hyperparameter tuning job launches training jobs with hyperparameter values within these ranges to find the combination of values that result in the training job with the best performance as measured by the objective metric of the hyperparameter tuning job.</p><note><p>You can specify a maximum of 20 hyperparameters that a hyperparameter tuning job can search over. Every possible value of a categorical parameter range counts against this limit.</p></note>
 */
@property (nonatomic, strong) AWSSageMakerServiceParameterRanges * _Nullable hyperParameterRanges;

/**
 <p>An array of <a>Channel</a> objects that specify the input for the training jobs that the tuning job launches.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceChannel *> * _Nullable inputDataConfig;

/**
 <p>Specifies the path to the Amazon S3 bucket where you store model artifacts from the training jobs that the tuning job launches.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The resources, including the compute instances and storage volumes, to use for the training jobs that the tuning job launches.</p><p>Storage volumes store model artifacts and incremental states. Training algorithms might also use storage volumes for scratch space. If you want Amazon SageMaker to use the storage volume to store the training data, choose <code>File</code> as the <code>TrainingInputMode</code> in the algorithm specification. For distributed training algorithms, specify an instance count greater than 1.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceResourceConfig * _Nullable resourceConfig;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role associated with the training jobs that the tuning job launches.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Specifies the values of hyperparameters that do not change for the tuning job.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable staticHyperParameters;

/**
 <p>Specifies a limit to how long a model hyperparameter training job can run. It also specifies how long you are willing to wait for a managed spot training job to complete. When the job reaches the a limit, Amazon SageMaker ends the training job. Use this API to cap model training costs.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceStoppingCondition * _Nullable stoppingCondition;

/**
 <p>Defines the objective metric for a hyperparameter tuning job. Hyperparameter tuning uses the value of this metric to evaluate the training jobs it launches, and returns the training job that results in either the highest or lowest value for this metric, depending on the value you specify for the <code>Type</code> parameter.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHyperParameterTuningJobObjective * _Nullable tuningObjective;

/**
 <p>The <a>VpcConfig</a> object that specifies the VPC that you want the training jobs that this hyperparameter tuning job launches to connect to. Control access to and from your training container by configuring the VPC. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html">Protect Training Jobs by Using an Amazon Virtual Private Cloud</a>.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>Specifies summary information about a training job.</p>
 Required parameters: [TrainingJobName, TrainingJobArn, CreationTime, TrainingJobStatus, TunedHyperParameters]
 */
@interface AWSSageMakerServiceHyperParameterTrainingJobSummary : AWSModel


/**
 <p>The date and time that the training job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The reason that the training job failed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The <a>FinalHyperParameterTuningJobObjectiveMetric</a> object that specifies the value of the objective metric of the tuning job that launched this training job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceFinalHyperParameterTuningJobObjectiveMetric * _Nullable finalHyperParameterTuningJobObjectiveMetric;

/**
 <p>The status of the objective metric for the training job:</p><ul><li><p>Succeeded: The final objective metric for the training job was evaluated by the hyperparameter tuning job and used in the hyperparameter tuning process.</p></li></ul><ul><li><p>Pending: The training job is in progress and evaluation of its final objective metric is pending.</p></li></ul><ul><li><p>Failed: The final objective metric for the training job was not evaluated, and was not used in the hyperparameter tuning process. This typically occurs when the training job failed or did not emit an objective metric.</p></li></ul>
 */
@property (nonatomic, assign) AWSSageMakerServiceObjectiveStatus objectiveStatus;

/**
 <p>Specifies the time when the training job ends on training instances. You are billed for the time interval between the value of <code>TrainingStartTime</code> and this time. For successful jobs and stopped jobs, this is the time after model artifacts are uploaded. For failed jobs, this is the time when Amazon SageMaker detects a job failure.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable trainingEndTime;

/**
 <p>The Amazon Resource Name (ARN) of the training job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobArn;

/**
 <p>The training job definition name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobDefinitionName;

/**
 <p>The name of the training job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobName;

/**
 <p>The status of the training job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTrainingJobStatus trainingJobStatus;

/**
 <p>The date and time that the training job started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable trainingStartTime;

/**
 <p>A list of the hyperparameters for which you specified ranges to search.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tunedHyperParameters;

/**
 <p>The HyperParameter tuning job that launched the training job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tuningJobName;

@end

/**
 <p>Configures a hyperparameter tuning job.</p>
 Required parameters: [Strategy, ResourceLimits]
 */
@interface AWSSageMakerServiceHyperParameterTuningJobConfig : AWSModel


/**
 <p>The <a>HyperParameterTuningJobObjective</a> object that specifies the objective metric for this tuning job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceHyperParameterTuningJobObjective * _Nullable hyperParameterTuningJobObjective;

/**
 <p>The <a>ParameterRanges</a> object that specifies the ranges of hyperparameters that this tuning job searches.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceParameterRanges * _Nullable parameterRanges;

/**
 <p>The <a>ResourceLimits</a> object that specifies the maximum number of training jobs and parallel training jobs for this tuning job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceResourceLimits * _Nullable resourceLimits;

/**
 <p>Specifies how hyperparameter tuning chooses the combinations of hyperparameter values to use for the training job it launches. To use the Bayesian search strategy, set this to <code>Bayesian</code>. To randomly search, set it to <code>Random</code>. For information about search strategies, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-how-it-works.html">How Hyperparameter Tuning Works</a>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceHyperParameterTuningJobStrategyType strategy;

/**
 <p>Specifies whether to use early stopping for training jobs launched by the hyperparameter tuning job. This can be one of the following values (the default value is <code>OFF</code>):</p><dl><dt>OFF</dt><dd><p>Training jobs launched by the hyperparameter tuning job do not use early stopping.</p></dd><dt>AUTO</dt><dd><p>Amazon SageMaker stops training jobs launched by the hyperparameter tuning job when they are unlikely to perform better than previously completed training jobs. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-early-stopping.html">Stop Training Jobs Early</a>.</p></dd></dl>
 */
@property (nonatomic, assign) AWSSageMakerServiceTrainingJobEarlyStoppingType trainingJobEarlyStoppingType;

/**
 <p>The tuning job's completion criteria.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTuningJobCompletionCriteria * _Nullable tuningJobCompletionCriteria;

@end

/**
 <p>Defines the objective metric for a hyperparameter tuning job. Hyperparameter tuning uses the value of this metric to evaluate the training jobs it launches, and returns the training job that results in either the highest or lowest value for this metric, depending on the value you specify for the <code>Type</code> parameter.</p>
 Required parameters: [Type, MetricName]
 */
@interface AWSSageMakerServiceHyperParameterTuningJobObjective : AWSModel


/**
 <p>The name of the metric to use for the objective metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>Whether to minimize or maximize the objective metric.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceHyperParameterTuningJobObjectiveType types;

@end

/**
 <p>Provides summary information about a hyperparameter tuning job.</p>
 Required parameters: [HyperParameterTuningJobName, HyperParameterTuningJobArn, HyperParameterTuningJobStatus, Strategy, CreationTime, TrainingJobStatusCounters, ObjectiveStatusCounters]
 */
@interface AWSSageMakerServiceHyperParameterTuningJobSummary : AWSModel


/**
 <p>The date and time that the tuning job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The date and time that the tuning job ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable hyperParameterTuningEndTime;

/**
 <p>The Amazon Resource Name (ARN) of the tuning job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hyperParameterTuningJobArn;

/**
 <p>The name of the tuning job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hyperParameterTuningJobName;

/**
 <p>The status of the tuning job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceHyperParameterTuningJobStatus hyperParameterTuningJobStatus;

/**
 <p>The date and time that the tuning job was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The <a>ObjectiveStatusCounters</a> object that specifies the numbers of training jobs, categorized by objective metric status, that this tuning job launched.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceObjectiveStatusCounters * _Nullable objectiveStatusCounters;

/**
 <p>The <a>ResourceLimits</a> object that specifies the maximum number of training jobs and parallel training jobs allowed for this tuning job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceResourceLimits * _Nullable resourceLimits;

/**
 <p>Specifies the search strategy hyperparameter tuning uses to choose which hyperparameters to use for each iteration. Currently, the only valid value is Bayesian.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceHyperParameterTuningJobStrategyType strategy;

/**
 <p>The <a>TrainingJobStatusCounters</a> object that specifies the numbers of training jobs, categorized by status, that this tuning job launched.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrainingJobStatusCounters * _Nullable trainingJobStatusCounters;

@end

/**
 <p>Specifies the configuration for a hyperparameter tuning job that uses one or more previous hyperparameter tuning jobs as a starting point. The results of previous tuning jobs are used to inform which combinations of hyperparameters to search over in the new tuning job.</p><p>All training jobs launched by the new hyperparameter tuning job are evaluated by using the objective metric, and the training job that performs the best is compared to the best training jobs from the parent tuning jobs. From these, the training job that performs the best as measured by the objective metric is returned as the overall best training job.</p><note><p>All training jobs launched by parent hyperparameter tuning jobs and the new hyperparameter tuning jobs count against the limit of training jobs for the tuning job.</p></note>
 Required parameters: [ParentHyperParameterTuningJobs, WarmStartType]
 */
@interface AWSSageMakerServiceHyperParameterTuningJobWarmStartConfig : AWSModel


/**
 <p>An array of hyperparameter tuning jobs that are used as the starting point for the new hyperparameter tuning job. For more information about warm starting a hyperparameter tuning job, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-warm-start.html">Using a Previous Hyperparameter Tuning Job as a Starting Point</a>.</p><p>Hyperparameter tuning jobs created before October 1, 2018 cannot be used as parent jobs for warm start tuning jobs.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceParentHyperParameterTuningJob *> * _Nullable parentHyperParameterTuningJobs;

/**
 <p>Specifies one of the following:</p><dl><dt>IDENTICAL_DATA_AND_ALGORITHM</dt><dd><p>The new hyperparameter tuning job uses the same input data and training image as the parent tuning jobs. You can change the hyperparameter ranges to search and the maximum number of training jobs that the hyperparameter tuning job launches. You cannot use a new version of the training algorithm, unless the changes in the new version do not affect the algorithm itself. For example, changes that improve logging or adding support for a different data format are allowed. You can also change hyperparameters from tunable to static, and from static to tunable, but the total number of static plus tunable hyperparameters must remain the same as it is in all parent jobs. The objective metric for the new tuning job must be the same as for all parent jobs.</p></dd><dt>TRANSFER_LEARNING</dt><dd><p>The new hyperparameter tuning job can include input data, hyperparameter ranges, maximum number of concurrent training jobs, and maximum number of training jobs that are different than those of its parent hyperparameter tuning jobs. The training image can also be a different version from the version used in the parent hyperparameter tuning job. You can also change hyperparameters from tunable to static, and from static to tunable, but the total number of static plus tunable hyperparameters must remain the same as it is in all parent jobs. The objective metric for the new tuning job must be the same as for all parent jobs.</p></dd></dl>
 */
@property (nonatomic, assign) AWSSageMakerServiceHyperParameterTuningJobWarmStartType warmStartType;

@end

/**
 <p>Defines how to perform inference generation after a training job is run.</p>
 Required parameters: [Containers, SupportedTransformInstanceTypes, SupportedRealtimeInferenceInstanceTypes, SupportedContentTypes, SupportedResponseMIMETypes]
 */
@interface AWSSageMakerServiceInferenceSpecification : AWSModel


/**
 <p>The Amazon ECR registry path of the Docker image that contains the inference code.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceModelPackageContainerDefinition *> * _Nullable containers;

/**
 <p>The supported MIME types for the input data.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedContentTypes;

/**
 <p>A list of the instance types that are used to generate inferences in real-time.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedRealtimeInferenceInstanceTypes;

/**
 <p>The supported MIME types for the output data.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedResponseMIMETypes;

/**
 <p>A list of the instance types on which a transformation job can be run or on which an endpoint can be deployed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedTransformInstanceTypes;

@end

/**
 <p>Contains information about the location of input model artifacts, the name and shape of the expected data inputs, and the framework in which the model was trained.</p>
 Required parameters: [S3Uri, DataInputConfig, Framework]
 */
@interface AWSSageMakerServiceInputConfig : AWSModel


/**
 <p>Specifies the name and shape of the expected data inputs for your trained model with a JSON dictionary form. The data inputs are <a>InputConfig$Framework</a> specific. </p><ul><li><p><code>TensorFlow</code>: You must specify the name and shape (NHWC format) of the expected data inputs using a dictionary format for your trained model. The dictionary formats required for the console and CLI are different.</p><ul><li><p>Examples for one input:</p><ul><li><p>If using the console, <code>{"input":[1,1024,1024,3]}</code></p></li><li><p>If using the CLI, <code>{\"input\":[1,1024,1024,3]}</code></p></li></ul></li><li><p>Examples for two inputs:</p><ul><li><p>If using the console, <code>{"data1": [1,28,28,1], "data2":[1,28,28,1]}</code></p></li><li><p>If using the CLI, <code>{\"data1\": [1,28,28,1], \"data2\":[1,28,28,1]}</code></p></li></ul></li></ul></li><li><p><code>KERAS</code>: You must specify the name and shape (NCHW format) of expected data inputs using a dictionary format for your trained model. Note that while Keras model artifacts should be uploaded in NHWC (channel-last) format, <code>DataInputConfig</code> should be specified in NCHW (channel-first) format. The dictionary formats required for the console and CLI are different.</p><ul><li><p>Examples for one input:</p><ul><li><p>If using the console, <code>{"input_1":[1,3,224,224]}</code></p></li><li><p>If using the CLI, <code>{\"input_1\":[1,3,224,224]}</code></p></li></ul></li><li><p>Examples for two inputs:</p><ul><li><p>If using the console, <code>{"input_1": [1,3,224,224], "input_2":[1,3,224,224]} </code></p></li><li><p>If using the CLI, <code>{\"input_1\": [1,3,224,224], \"input_2\":[1,3,224,224]}</code></p></li></ul></li></ul></li><li><p><code>MXNET/ONNX</code>: You must specify the name and shape (NCHW format) of the expected data inputs in order using a dictionary format for your trained model. The dictionary formats required for the console and CLI are different.</p><ul><li><p>Examples for one input:</p><ul><li><p>If using the console, <code>{"data":[1,3,1024,1024]}</code></p></li><li><p>If using the CLI, <code>{\"data\":[1,3,1024,1024]}</code></p></li></ul></li><li><p>Examples for two inputs:</p><ul><li><p>If using the console, <code>{"var1": [1,1,28,28], "var2":[1,1,28,28]} </code></p></li><li><p>If using the CLI, <code>{\"var1\": [1,1,28,28], \"var2\":[1,1,28,28]}</code></p></li></ul></li></ul></li><li><p><code>PyTorch</code>: You can either specify the name and shape (NCHW format) of expected data inputs in order using a dictionary format for your trained model or you can specify the shape only using a list format. The dictionary formats required for the console and CLI are different. The list formats for the console and CLI are the same.</p><ul><li><p>Examples for one input in dictionary format:</p><ul><li><p>If using the console, <code>{"input0":[1,3,224,224]}</code></p></li><li><p>If using the CLI, <code>{\"input0\":[1,3,224,224]}</code></p></li></ul></li><li><p>Example for one input in list format: <code>[[1,3,224,224]]</code></p></li><li><p>Examples for two inputs in dictionary format:</p><ul><li><p>If using the console, <code>{"input0":[1,3,224,224], "input1":[1,3,224,224]}</code></p></li><li><p>If using the CLI, <code>{\"input0\":[1,3,224,224], \"input1\":[1,3,224,224]} </code></p></li></ul></li><li><p>Example for two inputs in list format: <code>[[1,3,224,224], [1,3,224,224]]</code></p></li></ul></li><li><p><code>XGBOOST</code>: input data name and shape are not needed.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable dataInputConfig;

/**
 <p>Identifies the framework in which the model was trained. For example: TENSORFLOW.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceFramework framework;

/**
 <p>The S3 path where the model artifacts, which result from model training, are stored. This path must point to a single gzip compressed tar archive (.tar.gz suffix).</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>For a hyperparameter of the integer type, specifies the range that a hyperparameter tuning job searches.</p>
 Required parameters: [Name, MinValue, MaxValue]
 */
@interface AWSSageMakerServiceIntegerParameterRange : AWSModel


/**
 <p>The maximum value of the hyperparameter to search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxValue;

/**
 <p>The minimum value of the hyperparameter to search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minValue;

/**
 <p>The name of the hyperparameter to search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The scale that hyperparameter tuning uses to search the hyperparameter range. For information about choosing a hyperparameter scale, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-ranges.html#scaling-type">Hyperparameter Scaling</a>. One of the following values:</p><dl><dt>Auto</dt><dd><p>Amazon SageMaker hyperparameter tuning chooses the best scale for the hyperparameter.</p></dd><dt>Linear</dt><dd><p>Hyperparameter tuning searches the values in the hyperparameter range by using a linear scale.</p></dd><dt>Logarithmic</dt><dd><p>Hyperparameter tuning searches the values in the hyperparameter range by using a logarithmic scale.</p><p>Logarithmic scaling works only for ranges that have only values greater than 0.</p></dd></dl>
 */
@property (nonatomic, assign) AWSSageMakerServiceHyperParameterScalingType scalingType;

@end

/**
 <p>Defines the possible values for an integer hyperparameter.</p>
 Required parameters: [MinValue, MaxValue]
 */
@interface AWSSageMakerServiceIntegerParameterRangeSpecification : AWSModel


/**
 <p>The maximum integer value allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxValue;

/**
 <p>The minimum integer value allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minValue;

@end

/**
 <p>Jupyter server's app settings.</p>
 */
@interface AWSSageMakerServiceJupyterServerAppSettings : AWSModel


/**
 <p>The default instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceResourceSpec * _Nullable defaultResourceSpec;

@end

/**
 <p>The kernel gateway app settings.</p>
 */
@interface AWSSageMakerServiceKernelGatewayAppSettings : AWSModel


/**
 <p>The default instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceResourceSpec * _Nullable defaultResourceSpec;

@end

/**
 <p>Provides a breakdown of the number of objects labeled.</p>
 */
@interface AWSSageMakerServiceLabelCounters : AWSModel


/**
 <p>The total number of objects that could not be labeled due to an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedNonRetryableError;

/**
 <p>The total number of objects labeled by a human worker.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable humanLabeled;

/**
 <p>The total number of objects labeled by automated data labeling.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable machineLabeled;

/**
 <p>The total number of objects labeled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalLabeled;

/**
 <p>The total number of objects not yet labeled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unlabeled;

@end

/**
 <p>Provides counts for human-labeled tasks in the labeling job.</p>
 */
@interface AWSSageMakerServiceLabelCountersForWorkteam : AWSModel


/**
 <p>The total number of data objects labeled by a human worker.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable humanLabeled;

/**
 <p>The total number of data objects that need to be labeled by a human worker.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pendingHuman;

/**
 <p>The total number of tasks in the labeling job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable total;

@end

/**
 <p>Provides configuration information for auto-labeling of your data objects. A <code>LabelingJobAlgorithmsConfig</code> object must be supplied in order to use auto-labeling.</p>
 Required parameters: [LabelingJobAlgorithmSpecificationArn]
 */
@interface AWSSageMakerServiceLabelingJobAlgorithmsConfig : AWSModel


/**
 <p>At the end of an auto-label job Amazon SageMaker Ground Truth sends the Amazon Resource Nam (ARN) of the final model used for auto-labeling. You can use this model as the starting point for subsequent similar jobs by providing the ARN of the model here. </p>
 */
@property (nonatomic, strong) NSString * _Nullable initialActiveLearningModelArn;

/**
 <p>Specifies the Amazon Resource Name (ARN) of the algorithm used for auto-labeling. You must select one of the following ARNs:</p><ul><li><p><i>Image classification</i></p><p><code>arn:aws:sagemaker:<i>region</i>:027400017018:labeling-job-algorithm-specification/image-classification</code></p></li><li><p><i>Text classification</i></p><p><code>arn:aws:sagemaker:<i>region</i>:027400017018:labeling-job-algorithm-specification/text-classification</code></p></li><li><p><i>Object detection</i></p><p><code>arn:aws:sagemaker:<i>region</i>:027400017018:labeling-job-algorithm-specification/object-detection</code></p></li><li><p><i>Semantic Segmentation</i></p><p><code>arn:aws:sagemaker:<i>region</i>:027400017018:labeling-job-algorithm-specification/semantic-segmentation</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable labelingJobAlgorithmSpecificationArn;

/**
 <p>Provides configuration information for a labeling job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobResourceConfig * _Nullable labelingJobResourceConfig;

@end

/**
 <p>Attributes of the data specified by the customer. Use these to describe the data to be labeled.</p>
 */
@interface AWSSageMakerServiceLabelingJobDataAttributes : AWSModel


/**
 <p>Declares that your content is free of personally identifiable information or adult content. Amazon SageMaker may restrict the Amazon Mechanical Turk workers that can view your task based on this information.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable contentClassifiers;

@end

/**
 <p>Provides information about the location of input data.</p>
 Required parameters: [S3DataSource]
 */
@interface AWSSageMakerServiceLabelingJobDataSource : AWSModel


/**
 <p>The Amazon S3 location of the input data objects.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobS3DataSource * _Nullable s3DataSource;

@end

/**
 <p>Provides summary information for a work team.</p>
 Required parameters: [JobReferenceCode, WorkRequesterAccountId, CreationTime]
 */
@interface AWSSageMakerServiceLabelingJobForWorkteamSummary : AWSModel


/**
 <p>The date and time that the labeling job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>A unique identifier for a labeling job. You can use this to refer to a specific labeling job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobReferenceCode;

/**
 <p>Provides information about the progress of a labeling job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelCountersForWorkteam * _Nullable labelCounters;

/**
 <p>The name of the labeling job that the work team is assigned to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelingJobName;

/**
 <p>The configured number of workers per data object.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfHumanWorkersPerDataObject;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable workRequesterAccountId;

@end

/**
 <p>Input configuration information for a labeling job.</p>
 Required parameters: [DataSource]
 */
@interface AWSSageMakerServiceLabelingJobInputConfig : AWSModel


/**
 <p>Attributes of the data specified by the customer.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobDataAttributes * _Nullable dataAttributes;

/**
 <p>The location of the input data.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobDataSource * _Nullable dataSource;

@end

/**
 <p>Specifies the location of the output produced by the labeling job. </p>
 Required parameters: [OutputDatasetS3Uri]
 */
@interface AWSSageMakerServiceLabelingJobOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the most recent Amazon SageMaker model trained as part of automated data labeling. </p>
 */
@property (nonatomic, strong) NSString * _Nullable finalActiveLearningModelArn;

/**
 <p>The Amazon S3 bucket location of the manifest file for labeled data. </p>
 */
@property (nonatomic, strong) NSString * _Nullable outputDatasetS3Uri;

@end

/**
 <p>Output configuration information for a labeling job.</p>
 Required parameters: [S3OutputPath]
 */
@interface AWSSageMakerServiceLabelingJobOutputConfig : AWSModel


/**
 <p>The AWS Key Management Service ID of the key used to encrypt the output data, if any.</p><p>If you use a KMS key ID or an alias of your master key, the Amazon SageMaker execution role must include permissions to call <code>kms:Encrypt</code>. If you don't provide a KMS key ID, Amazon SageMaker uses the default KMS key for Amazon S3 for your role's account. Amazon SageMaker uses server-side encryption with KMS-managed keys for <code>LabelingJobOutputConfig</code>. If you use a bucket policy with an <code>s3:PutObject</code> permission that only allows objects with server-side encryption, set the condition key of <code>s3:x-amz-server-side-encryption</code> to <code>"aws:kms"</code>. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html">KMS-Managed Encryption Keys</a> in the <i>Amazon Simple Storage Service Developer Guide.</i></p><p>The KMS key policy must grant permission to the IAM role that you specify in your <code>CreateLabelingJob</code> request. For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">Using Key Policies in AWS KMS</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The Amazon S3 location to write output data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3OutputPath;

@end

/**
 <p>Provides configuration information for labeling jobs.</p>
 */
@interface AWSSageMakerServiceLabelingJobResourceConfig : AWSModel


/**
 <p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance(s) that run the training job. The <code>VolumeKmsKeyId</code> can be any of the following formats:</p><ul><li><p>// KMS Key ID</p><p><code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>// Amazon Resource Name (ARN) of a KMS Key</p><p><code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

@end

/**
 <p>The Amazon S3 location of the input data objects.</p>
 Required parameters: [ManifestS3Uri]
 */
@interface AWSSageMakerServiceLabelingJobS3DataSource : AWSModel


/**
 <p>The Amazon S3 location of the manifest file that describes the input data objects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable manifestS3Uri;

@end

/**
 <p>A set of conditions for stopping a labeling job. If any of the conditions are met, the job is automatically stopped. You can use these conditions to control the cost of data labeling.</p><note><p>Labeling jobs fail after 30 days with an appropriate client error message.</p></note>
 */
@interface AWSSageMakerServiceLabelingJobStoppingConditions : AWSModel


/**
 <p>The maximum number of objects that can be labeled by human workers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxHumanLabeledObjectCount;

/**
 <p>The maximum number of input data objects that should be labeled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxPercentageOfInputDatasetLabeled;

@end

/**
 <p>Provides summary information about a labeling job.</p>
 Required parameters: [LabelingJobName, LabelingJobArn, CreationTime, LastModifiedTime, LabelingJobStatus, LabelCounters, WorkteamArn, PreHumanTaskLambdaArn]
 */
@interface AWSSageMakerServiceLabelingJobSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Lambda function used to consolidate the annotations from individual workers into a label for a data object. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-annotation-consolidation.html">Annotation Consolidation</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable annotationConsolidationLambdaArn;

/**
 <p>The date and time that the job was created (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>If the <code>LabelingJobStatus</code> field is <code>Failed</code>, this field contains a description of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>Input configuration for the labeling job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobInputConfig * _Nullable inputConfig;

/**
 <p>Counts showing the progress of the labeling job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelCounters * _Nullable labelCounters;

/**
 <p>The Amazon Resource Name (ARN) assigned to the labeling job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelingJobArn;

/**
 <p>The name of the labeling job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelingJobName;

/**
 <p>The location of the output produced by the labeling job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceLabelingJobOutput * _Nullable labelingJobOutput;

/**
 <p>The current status of the labeling job. </p>
 */
@property (nonatomic, assign) AWSSageMakerServiceLabelingJobStatus labelingJobStatus;

/**
 <p>The date and time that the job was last modified (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The Amazon Resource Name (ARN) of a Lambda function. The function is run before each data object is sent to a worker.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preHumanTaskLambdaArn;

/**
 <p>The Amazon Resource Name (ARN) of the work team assigned to the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workteamArn;

@end

/**
 
 */
@interface AWSSageMakerServiceListAlgorithmsInput : AWSRequest


/**
 <p>A filter that returns only algorithms created after the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only algorithms created before the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>The maximum number of algorithms to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in the algorithm name. This filter returns only algorithms whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the response to a previous <code>ListAlgorithms</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of algorithms, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The parameter by which to sort the results. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAlgorithmSortBy sortBy;

/**
 <p>The sort order for the results. The default is <code>Ascending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

@end

/**
 
 */
@interface AWSSageMakerServiceListAlgorithmsOutput : AWSModel


/**
 <p>&gt;An array of <code>AlgorithmSummary</code> objects, each of which lists an algorithm.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceAlgorithmSummary *> * _Nullable algorithmSummaryList;

/**
 <p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of algorithms, use it in the subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListAppsRequest : AWSRequest


/**
 <p>A parameter to search for the domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainIdEquals;

/**
 <p>Returns a list up to a specified limit.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The parameter by which to sort the results. The default is CreationTime.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAppSortKey sortBy;

/**
 <p>The sort order for the results. The default is Ascending.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

/**
 <p>A parameter to search by user profile name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileNameEquals;

@end

/**
 
 */
@interface AWSSageMakerServiceListAppsResponse : AWSModel


/**
 <p>The list of apps.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceAppDetails *> * _Nullable apps;

/**
 <p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListAutoMLJobsRequest : AWSRequest


/**
 <p>Request a list of jobs, using a filter for time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>Request a list of jobs, using a filter for time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>Request a list of jobs, using a filter for time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeAfter;

/**
 <p>Request a list of jobs, using a filter for time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeBefore;

/**
 <p>Request a list of jobs up to a specified limit.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Request a list of jobs, using a search filter for name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The parameter by which to sort the results. The default is AutoMLJobName.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAutoMLSortBy sortBy;

/**
 <p>The sort order for the results. The default is Descending.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAutoMLSortOrder sortOrder;

/**
 <p>Request a list of jobs, using a filter for status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAutoMLJobStatus statusEquals;

@end

/**
 
 */
@interface AWSSageMakerServiceListAutoMLJobsResponse : AWSModel


/**
 <p>Returns a summary list of jobs.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceAutoMLJobSummary *> * _Nullable autoMLJobSummaries;

/**
 <p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListCandidatesForAutoMLJobRequest : AWSRequest


/**
 <p>List the Candidates created for the job by providing the job's name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoMLJobName;

/**
 <p>List the Candidates for the job and filter by candidate name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable candidateNameEquals;

/**
 <p>List the job's Candidates up to a specified limit.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The parameter by which to sort the results. The default is Descending.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceCandidateSortBy sortBy;

/**
 <p>The sort order for the results. The default is Ascending.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAutoMLSortOrder sortOrder;

/**
 <p>List the Candidates for the job and filter by status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceCandidateStatus statusEquals;

@end

/**
 
 */
@interface AWSSageMakerServiceListCandidatesForAutoMLJobResponse : AWSModel


/**
 <p>Summaries about the Candidates.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceAutoMLCandidate *> * _Nullable candidates;

/**
 <p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListCodeRepositoriesInput : AWSRequest


/**
 <p>A filter that returns only Git repositories that were created after the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only Git repositories that were created before the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>A filter that returns only Git repositories that were last modified after the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeAfter;

/**
 <p>A filter that returns only Git repositories that were last modified before the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeBefore;

/**
 <p>The maximum number of Git repositories to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in the Git repositories name. This filter returns only repositories whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of a <code>ListCodeRepositoriesOutput</code> request was truncated, the response includes a <code>NextToken</code>. To get the next set of Git repositories, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The field to sort results by. The default is <code>Name</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceCodeRepositorySortBy sortBy;

/**
 <p>The sort order for results. The default is <code>Ascending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceCodeRepositorySortOrder sortOrder;

@end

/**
 
 */
@interface AWSSageMakerServiceListCodeRepositoriesOutput : AWSModel


/**
 <p>Gets a list of summaries of the Git repositories. Each summary specifies the following values for the repository: </p><ul><li><p>Name</p></li><li><p>Amazon Resource Name (ARN)</p></li><li><p>Creation time</p></li><li><p>Last modified time</p></li><li><p>Configuration information, including the URL location of the repository and the ARN of the AWS Secrets Manager secret that contains the credentials used to access the repository.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceCodeRepositorySummary *> * _Nullable codeRepositorySummaryList;

/**
 <p>If the result of a <code>ListCodeRepositoriesOutput</code> request was truncated, the response includes a <code>NextToken</code>. To get the next set of Git repositories, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListCompilationJobsRequest : AWSRequest


/**
 <p>A filter that returns the model compilation jobs that were created after a specified time. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns the model compilation jobs that were created before a specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>A filter that returns the model compilation jobs that were modified after a specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeAfter;

/**
 <p>A filter that returns the model compilation jobs that were modified before a specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeBefore;

/**
 <p>The maximum number of model compilation jobs to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A filter that returns the model compilation jobs whose name contains a specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of the previous <code>ListCompilationJobs</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of model compilation jobs, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The field by which to sort results. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceListCompilationJobsSortBy sortBy;

/**
 <p>The sort order for results. The default is <code>Ascending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

/**
 <p>A filter that retrieves model compilation jobs with a specific <a>DescribeCompilationJobResponse$CompilationJobStatus</a> status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceCompilationJobStatus statusEquals;

@end

/**
 
 */
@interface AWSSageMakerServiceListCompilationJobsResponse : AWSModel


/**
 <p>An array of <a>CompilationJobSummary</a> objects, each describing a model compilation job. </p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceCompilationJobSummary *> * _Nullable compilationJobSummaries;

/**
 <p>If the response is truncated, Amazon SageMaker returns this <code>NextToken</code>. To retrieve the next set of model compilation jobs, use this token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListDomainsRequest : AWSRequest


/**
 <p>Returns a list up to a specified limit.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListDomainsResponse : AWSModel


/**
 <p>The list of domains.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceDomainDetails *> * _Nullable domains;

/**
 <p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListEndpointConfigsInput : AWSRequest


/**
 <p>A filter that returns only endpoint configurations with a creation time greater than or equal to the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only endpoint configurations created before the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>The maximum number of training jobs to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in the endpoint configuration name. This filter returns only endpoint configurations whose name contains the specified string. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of the previous <code>ListEndpointConfig</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of endpoint configurations, use the token in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The field to sort results by. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceEndpointConfigSortKey sortBy;

/**
 <p>The sort order for results. The default is <code>Descending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceOrderKey sortOrder;

@end

/**
 
 */
@interface AWSSageMakerServiceListEndpointConfigsOutput : AWSModel


/**
 <p>An array of endpoint configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceEndpointConfigSummary *> * _Nullable endpointConfigs;

/**
 <p> If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of endpoint configurations, use it in the subsequent request </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListEndpointsInput : AWSRequest


/**
 <p>A filter that returns only endpoints with a creation time greater than or equal to the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only endpoints that were created before the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p> A filter that returns only endpoints that were modified after the specified timestamp. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeAfter;

/**
 <p> A filter that returns only endpoints that were modified before the specified timestamp. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeBefore;

/**
 <p>The maximum number of endpoints to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in endpoint names. This filter returns only endpoints whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of a <code>ListEndpoints</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of endpoints, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Sorts the list of results. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceEndpointSortKey sortBy;

/**
 <p>The sort order for results. The default is <code>Descending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceOrderKey sortOrder;

/**
 <p> A filter that returns only endpoints with the specified status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceEndpointStatus statusEquals;

@end

/**
 
 */
@interface AWSSageMakerServiceListEndpointsOutput : AWSModel


/**
 <p> An array or endpoint objects. </p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceEndpointSummary *> * _Nullable endpoints;

/**
 <p> If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of training jobs, use it in the subsequent request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListExperimentsRequest : AWSRequest


/**
 <p>A filter that returns only experiments created after the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAfter;

/**
 <p>A filter that returns only experiments created before the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdBefore;

/**
 <p>The maximum number of experiments to return in the response. The default value is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous call to <code>ListExperiments</code> didn't return the full set of experiments, the call returns a token for getting the next set of experiments.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The property used to sort results. The default value is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortExperimentsBy sortBy;

/**
 <p>The sort order. The default value is <code>Descending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

@end

/**
 
 */
@interface AWSSageMakerServiceListExperimentsResponse : AWSModel


/**
 <p>A list of the summaries of your experiments.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceExperimentSummary *> * _Nullable experimentSummaries;

/**
 <p>A token for getting the next set of experiments, if there are any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListFlowDefinitionsRequest : AWSRequest


/**
 <p>A filter that returns only flow definitions with a creation time greater than or equal to the specified timestamp.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only flow definitions that were created before the specified timestamp.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>The total number of items to return. If the total number of available items is more than the value specified in <code>MaxResults</code>, then a <code>NextToken</code> will be provided in the output that you can use to resume pagination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to resume pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An optional value that specifies whether you want the results sorted in <code>Ascending</code> or <code>Descending</code> order.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

@end

/**
 
 */
@interface AWSSageMakerServiceListFlowDefinitionsResponse : AWSModel


/**
 <p>An array of objects describing the flow definitions.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceFlowDefinitionSummary *> * _Nullable flowDefinitionSummaries;

/**
 <p>A token to resume pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListHumanTaskUisRequest : AWSRequest


/**
 <p>A filter that returns only human task user interfaces with a creation time greater than or equal to the specified timestamp.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only human task user interfaces that were created before the specified timestamp.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>The total number of items to return. If the total number of available items is more than the value specified in <code>MaxResults</code>, then a <code>NextToken</code> will be provided in the output that you can use to resume pagination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to resume pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An optional value that specifies whether you want the results sorted in <code>Ascending</code> or <code>Descending</code> order.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

@end

/**
 
 */
@interface AWSSageMakerServiceListHumanTaskUisResponse : AWSModel


/**
 <p>An array of objects describing the human task user interfaces.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceHumanTaskUiSummary *> * _Nullable humanTaskUiSummaries;

/**
 <p>A token to resume pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListHyperParameterTuningJobsRequest : AWSRequest


/**
 <p>A filter that returns only tuning jobs that were created after the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only tuning jobs that were created before the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>A filter that returns only tuning jobs that were modified after the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeAfter;

/**
 <p>A filter that returns only tuning jobs that were modified before the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeBefore;

/**
 <p>The maximum number of tuning jobs to return. The default value is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in the tuning job name. This filter returns only tuning jobs whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of the previous <code>ListHyperParameterTuningJobs</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of tuning jobs, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The field to sort results by. The default is <code>Name</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceHyperParameterTuningJobSortByOptions sortBy;

/**
 <p>The sort order for results. The default is <code>Ascending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

/**
 <p>A filter that returns only tuning jobs with the specified status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceHyperParameterTuningJobStatus statusEquals;

@end

/**
 
 */
@interface AWSSageMakerServiceListHyperParameterTuningJobsResponse : AWSModel


/**
 <p>A list of <a>HyperParameterTuningJobSummary</a> objects that describe the tuning jobs that the <code>ListHyperParameterTuningJobs</code> request returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceHyperParameterTuningJobSummary *> * _Nullable hyperParameterTuningJobSummaries;

/**
 <p>If the result of this <code>ListHyperParameterTuningJobs</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of tuning jobs, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListLabelingJobsForWorkteamRequest : AWSRequest


/**
 <p>A filter that returns only labeling jobs created after the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only labeling jobs created before the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>A filter the limits jobs to only the ones whose job reference code contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobReferenceCodeContains;

/**
 <p>The maximum number of labeling jobs to return in each page of the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the result of the previous <code>ListLabelingJobsForWorkteam</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of labeling jobs, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The field to sort results by. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceListLabelingJobsForWorkteamSortByOptions sortBy;

/**
 <p>The sort order for results. The default is <code>Ascending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

/**
 <p>The Amazon Resource Name (ARN) of the work team for which you want to see labeling jobs for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workteamArn;

@end

/**
 
 */
@interface AWSSageMakerServiceListLabelingJobsForWorkteamResponse : AWSModel


/**
 <p>An array of <code>LabelingJobSummary</code> objects, each describing a labeling job.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceLabelingJobForWorkteamSummary *> * _Nullable labelingJobSummaryList;

/**
 <p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of labeling jobs, use it in the subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListLabelingJobsRequest : AWSRequest


/**
 <p>A filter that returns only labeling jobs created after the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only labeling jobs created before the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>A filter that returns only labeling jobs modified after the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeAfter;

/**
 <p>A filter that returns only labeling jobs modified before the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeBefore;

/**
 <p>The maximum number of labeling jobs to return in each page of the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in the labeling job name. This filter returns only labeling jobs whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of the previous <code>ListLabelingJobs</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of labeling jobs, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The field to sort results by. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortBy sortBy;

/**
 <p>The sort order for results. The default is <code>Ascending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

/**
 <p>A filter that retrieves only labeling jobs with a specific status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceLabelingJobStatus statusEquals;

@end

/**
 
 */
@interface AWSSageMakerServiceListLabelingJobsResponse : AWSModel


/**
 <p>An array of <code>LabelingJobSummary</code> objects, each describing a labeling job.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceLabelingJobSummary *> * _Nullable labelingJobSummaryList;

/**
 <p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of labeling jobs, use it in the subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListModelPackagesInput : AWSRequest


/**
 <p>A filter that returns only model packages created after the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only model packages created before the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>The maximum number of model packages to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in the model package name. This filter returns only model packages whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the response to a previous <code>ListModelPackages</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of model packages, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The parameter by which to sort the results. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceModelPackageSortBy sortBy;

/**
 <p>The sort order for the results. The default is <code>Ascending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

@end

/**
 
 */
@interface AWSSageMakerServiceListModelPackagesOutput : AWSModel


/**
 <p>An array of <code>ModelPackageSummary</code> objects, each of which lists a model package.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceModelPackageSummary *> * _Nullable modelPackageSummaryList;

/**
 <p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of model packages, use it in the subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListModelsInput : AWSRequest


/**
 <p>A filter that returns only models with a creation time greater than or equal to the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only models created before the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>The maximum number of models to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in the training job name. This filter returns only models in the training job whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the response to a previous <code>ListModels</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of models, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Sorts the list of results. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceModelSortKey sortBy;

/**
 <p>The sort order for results. The default is <code>Descending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceOrderKey sortOrder;

@end

/**
 
 */
@interface AWSSageMakerServiceListModelsOutput : AWSModel


/**
 <p>An array of <code>ModelSummary</code> objects, each of which lists a model.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceModelSummary *> * _Nullable models;

/**
 <p> If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of models, use it in the subsequent request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListMonitoringExecutionsRequest : AWSRequest


/**
 <p>A filter that returns only jobs created after a specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only jobs created before a specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>Name of a specific endpoint to fetch jobs for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>A filter that returns only jobs modified before a specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeAfter;

/**
 <p>A filter that returns only jobs modified after a specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeBefore;

/**
 <p>The maximum number of jobs to return in the response. The default value is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Name of a specific schedule to fetch jobs for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleName;

/**
 <p>The token returned if the response is truncated. To retrieve the next set of job executions, use it in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Filter for jobs scheduled after a specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable scheduledTimeAfter;

/**
 <p>Filter for jobs scheduled before a specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable scheduledTimeBefore;

/**
 <p>Whether to sort results by <code>Status</code>, <code>CreationTime</code>, <code>ScheduledTime</code> field. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceMonitoringExecutionSortKey sortBy;

/**
 <p>Whether to sort the results in <code>Ascending</code> or <code>Descending</code> order. The default is <code>Descending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

/**
 <p>A filter that retrieves only jobs with a specific status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceExecutionStatus statusEquals;

@end

/**
 
 */
@interface AWSSageMakerServiceListMonitoringExecutionsResponse : AWSModel


/**
 <p>A JSON array in which each element is a summary for a monitoring execution.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceMonitoringExecutionSummary *> * _Nullable monitoringExecutionSummaries;

/**
 <p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of jobs, use it in the subsequent reques</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListMonitoringSchedulesRequest : AWSRequest


/**
 <p>A filter that returns only monitoring schedules created after a specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only monitoring schedules created before a specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>Name of a specific endpoint to fetch schedules for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>A filter that returns only monitoring schedules modified after a specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeAfter;

/**
 <p>A filter that returns only monitoring schedules modified before a specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeBefore;

/**
 <p>The maximum number of jobs to return in the response. The default value is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Filter for monitoring schedules whose name contains a specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>The token returned if the response is truncated. To retrieve the next set of job executions, use it in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Whether to sort results by <code>Status</code>, <code>CreationTime</code>, <code>ScheduledTime</code> field. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceMonitoringScheduleSortKey sortBy;

/**
 <p>Whether to sort the results in <code>Ascending</code> or <code>Descending</code> order. The default is <code>Descending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

/**
 <p>A filter that returns only monitoring schedules modified before a specified time.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceScheduleStatus statusEquals;

@end

/**
 
 */
@interface AWSSageMakerServiceListMonitoringSchedulesResponse : AWSModel


/**
 <p>A JSON array in which each element is a summary for a monitoring schedule.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceMonitoringScheduleSummary *> * _Nullable monitoringScheduleSummaries;

/**
 <p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of jobs, use it in the subsequent reques</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListNotebookInstanceLifecycleConfigsInput : AWSRequest


/**
 <p>A filter that returns only lifecycle configurations that were created after the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only lifecycle configurations that were created before the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>A filter that returns only lifecycle configurations that were modified after the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeAfter;

/**
 <p>A filter that returns only lifecycle configurations that were modified before the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeBefore;

/**
 <p>The maximum number of lifecycle configurations to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in the lifecycle configuration name. This filter returns only lifecycle configurations whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of a <code>ListNotebookInstanceLifecycleConfigs</code> request was truncated, the response includes a <code>NextToken</code>. To get the next set of lifecycle configurations, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Sorts the list of results. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceNotebookInstanceLifecycleConfigSortKey sortBy;

/**
 <p>The sort order for results.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceNotebookInstanceLifecycleConfigSortOrder sortOrder;

@end

/**
 
 */
@interface AWSSageMakerServiceListNotebookInstanceLifecycleConfigsOutput : AWSModel


/**
 <p>If the response is truncated, Amazon SageMaker returns this token. To get the next set of lifecycle configurations, use it in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of <code>NotebookInstanceLifecycleConfiguration</code> objects, each listing a lifecycle configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceNotebookInstanceLifecycleConfigSummary *> * _Nullable notebookInstanceLifecycleConfigs;

@end

/**
 
 */
@interface AWSSageMakerServiceListNotebookInstancesInput : AWSRequest


/**
 <p>A filter that returns only notebook instances with associated with the specified git repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable additionalCodeRepositoryEquals;

/**
 <p>A filter that returns only notebook instances that were created after the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only notebook instances that were created before the specified time (timestamp). </p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>A string in the name or URL of a Git repository associated with this notebook instance. This filter returns only notebook instances associated with a git repository with a name that contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultCodeRepositoryContains;

/**
 <p>A filter that returns only notebook instances that were modified after the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeAfter;

/**
 <p>A filter that returns only notebook instances that were modified before the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeBefore;

/**
 <p>The maximum number of notebook instances to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in the notebook instances' name. This filter returns only notebook instances whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p> If the previous call to the <code>ListNotebookInstances</code> is truncated, the response includes a <code>NextToken</code>. You can use this token in your subsequent <code>ListNotebookInstances</code> request to fetch the next set of notebook instances. </p><note><p>You might specify a filter or a sort order in your request. When response is truncated, you must use the same values for the filer and sort order in the next request. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A string in the name of a notebook instances lifecycle configuration associated with this notebook instance. This filter returns only notebook instances associated with a lifecycle configuration with a name that contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceLifecycleConfigNameContains;

/**
 <p>The field to sort results by. The default is <code>Name</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceNotebookInstanceSortKey sortBy;

/**
 <p>The sort order for results. </p>
 */
@property (nonatomic, assign) AWSSageMakerServiceNotebookInstanceSortOrder sortOrder;

/**
 <p>A filter that returns only notebook instances with the specified status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceNotebookInstanceStatus statusEquals;

@end

/**
 
 */
@interface AWSSageMakerServiceListNotebookInstancesOutput : AWSModel


/**
 <p>If the response to the previous <code>ListNotebookInstances</code> request was truncated, Amazon SageMaker returns this token. To retrieve the next set of notebook instances, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of <code>NotebookInstanceSummary</code> objects, one for each notebook instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceNotebookInstanceSummary *> * _Nullable notebookInstances;

@end

/**
 
 */
@interface AWSSageMakerServiceListProcessingJobsRequest : AWSRequest


/**
 <p>A filter that returns only processing jobs created after the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only processing jobs created after the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>A filter that returns only processing jobs modified after the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeAfter;

/**
 <p>A filter that returns only processing jobs modified before the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeBefore;

/**
 <p>The maximum number of processing jobs to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in the processing job name. This filter returns only processing jobs whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of the previous <code>ListProcessingJobs</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of processing jobs, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The field to sort results by. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortBy sortBy;

/**
 <p>The sort order for results. The default is <code>Ascending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

/**
 <p>A filter that retrieves only processing jobs with a specific status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingJobStatus statusEquals;

@end

/**
 
 */
@interface AWSSageMakerServiceListProcessingJobsResponse : AWSModel


/**
 <p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of processing jobs, use it in the subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of <code>ProcessingJobSummary</code> objects, each listing a processing job.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceProcessingJobSummary *> * _Nullable processingJobSummaries;

@end

/**
 
 */
@interface AWSSageMakerServiceListSubscribedWorkteamsRequest : AWSRequest


/**
 <p>The maximum number of work teams to return in each page of the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in the work team name. This filter returns only work teams whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of the previous <code>ListSubscribedWorkteams</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of labeling jobs, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSSageMakerServiceListSubscribedWorkteamsResponse : AWSModel


/**
 <p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of work teams, use it in the subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of <code>Workteam</code> objects, each describing a work team.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceSubscribedWorkteam *> * _Nullable subscribedWorkteams;

@end

/**
 
 */
@interface AWSSageMakerServiceListTagsInput : AWSRequest


/**
 <p>Maximum number of tags to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> If the response to the previous <code>ListTags</code> request is truncated, Amazon SageMaker returns this token. To retrieve the next set of tags, use it in the subsequent request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon Resource Name (ARN) of the resource whose tags you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSSageMakerServiceListTagsOutput : AWSModel


/**
 <p> If response is truncated, Amazon SageMaker includes a token in the response. You can use this token in your subsequent request to fetch next set of tokens. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of <code>Tag</code> objects, each with a tag key and a value.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobRequest : AWSRequest


/**
 <p>The name of the tuning job whose training jobs you want to list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hyperParameterTuningJobName;

/**
 <p>The maximum number of training jobs to return. The default value is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the result of the previous <code>ListTrainingJobsForHyperParameterTuningJob</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of training jobs, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The field to sort results by. The default is <code>Name</code>.</p><p>If the value of this field is <code>FinalObjectiveMetricValue</code>, any training jobs that did not return an objective metric are not listed.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTrainingJobSortByOptions sortBy;

/**
 <p>The sort order for results. The default is <code>Ascending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

/**
 <p>A filter that returns only training jobs with the specified status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTrainingJobStatus statusEquals;

@end

/**
 
 */
@interface AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobResponse : AWSModel


/**
 <p>If the result of this <code>ListTrainingJobsForHyperParameterTuningJob</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of training jobs, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <a>TrainingJobSummary</a> objects that describe the training jobs that the <code>ListTrainingJobsForHyperParameterTuningJob</code> request returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceHyperParameterTrainingJobSummary *> * _Nullable trainingJobSummaries;

@end

/**
 
 */
@interface AWSSageMakerServiceListTrainingJobsRequest : AWSRequest


/**
 <p>A filter that returns only training jobs created after the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only training jobs created before the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>A filter that returns only training jobs modified after the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeAfter;

/**
 <p>A filter that returns only training jobs modified before the specified time (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeBefore;

/**
 <p>The maximum number of training jobs to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in the training job name. This filter returns only training jobs whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of the previous <code>ListTrainingJobs</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of training jobs, use the token in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The field to sort results by. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortBy sortBy;

/**
 <p>The sort order for results. The default is <code>Ascending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

/**
 <p>A filter that retrieves only training jobs with a specific status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTrainingJobStatus statusEquals;

@end

/**
 
 */
@interface AWSSageMakerServiceListTrainingJobsResponse : AWSModel


/**
 <p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of training jobs, use it in the subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of <code>TrainingJobSummary</code> objects, each listing a training job.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTrainingJobSummary *> * _Nullable trainingJobSummaries;

@end

/**
 
 */
@interface AWSSageMakerServiceListTransformJobsRequest : AWSRequest


/**
 <p>A filter that returns only transform jobs created after the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeAfter;

/**
 <p>A filter that returns only transform jobs created before the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimeBefore;

/**
 <p>A filter that returns only transform jobs modified after the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeAfter;

/**
 <p>A filter that returns only transform jobs modified before the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTimeBefore;

/**
 <p>The maximum number of transform jobs to return in the response. The default value is <code>10</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in the transform job name. This filter returns only transform jobs whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of the previous <code>ListTransformJobs</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of transform jobs, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The field to sort results by. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortBy sortBy;

/**
 <p>The sort order for results. The default is <code>Descending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

/**
 <p>A filter that retrieves only transform jobs with a specific status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTransformJobStatus statusEquals;

@end

/**
 
 */
@interface AWSSageMakerServiceListTransformJobsResponse : AWSModel


/**
 <p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of transform jobs, use it in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of <code>TransformJobSummary</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTransformJobSummary *> * _Nullable transformJobSummaries;

@end

/**
 
 */
@interface AWSSageMakerServiceListTrialComponentsRequest : AWSRequest


/**
 <p>A filter that returns only components created after the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAfter;

/**
 <p>A filter that returns only components created before the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdBefore;

/**
 <p>A filter that returns only components that are part of the specified experiment. If you specify <code>ExperimentName</code>, you can't filter by <code>SourceArn</code> or <code>TrialName</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentName;

/**
 <p>The maximum number of components to return in the response. The default value is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous call to <code>ListTrialComponents</code> didn't return the full set of components, the call returns a token for getting the next set of components.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The property used to sort results. The default value is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortTrialComponentsBy sortBy;

/**
 <p>The sort order. The default value is <code>Descending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

/**
 <p>A filter that returns only components that have the specified source Amazon Resource Name (ARN). If you specify <code>SourceArn</code>, you can't filter by <code>ExperimentName</code> or <code>TrialName</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>A filter that returns only components that are part of the specified trial. If you specify <code>TrialName</code>, you can't filter by <code>ExperimentName</code> or <code>SourceArn</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialName;

@end

/**
 
 */
@interface AWSSageMakerServiceListTrialComponentsResponse : AWSModel


/**
 <p>A token for getting the next set of components, if there are any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of the summaries of your trial components.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTrialComponentSummary *> * _Nullable trialComponentSummaries;

@end

/**
 
 */
@interface AWSSageMakerServiceListTrialsRequest : AWSRequest


/**
 <p>A filter that returns only trials created after the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAfter;

/**
 <p>A filter that returns only trials created before the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdBefore;

/**
 <p>A filter that returns only trials that are part of the specified experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentName;

/**
 <p>The maximum number of trials to return in the response. The default value is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous call to <code>ListTrials</code> didn't return the full set of trials, the call returns a token for getting the next set of trials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The property used to sort results. The default value is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortTrialsBy sortBy;

/**
 <p>The sort order. The default value is <code>Descending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

/**
 <p>A filter that returns only trials that are associated with the specified trial component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentName;

@end

/**
 
 */
@interface AWSSageMakerServiceListTrialsResponse : AWSModel


/**
 <p>A token for getting the next set of trials, if there are any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of the summaries of your trials.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTrialSummary *> * _Nullable trialSummaries;

@end

/**
 
 */
@interface AWSSageMakerServiceListUserProfilesRequest : AWSRequest


/**
 <p>A parameter by which to filter the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainIdEquals;

/**
 <p>Returns a list up to a specified limit.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The parameter by which to sort the results. The default is CreationTime.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceUserProfileSortKey sortBy;

/**
 <p>The sort order for the results. The default is Ascending.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

/**
 <p>A parameter by which to filter the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileNameContains;

@end

/**
 
 */
@interface AWSSageMakerServiceListUserProfilesResponse : AWSModel


/**
 <p>If the previous response was truncated, you will receive this token. Use it in your next request to receive the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of user profiles.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceUserProfileDetails *> * _Nullable userProfiles;

@end

/**
 
 */
@interface AWSSageMakerServiceListWorkteamsRequest : AWSRequest


/**
 <p>The maximum number of work teams to return in each page of the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string in the work team's name. This filter returns only work teams whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of the previous <code>ListWorkteams</code> request was truncated, the response includes a <code>NextToken</code>. To retrieve the next set of labeling jobs, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The field to sort results by. The default is <code>CreationTime</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceListWorkteamsSortByOptions sortBy;

/**
 <p>The sort order for results. The default is <code>Ascending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSortOrder sortOrder;

@end

/**
 
 */
@interface AWSSageMakerServiceListWorkteamsResponse : AWSModel


/**
 <p>If the response is truncated, Amazon SageMaker returns this token. To retrieve the next set of work teams, use it in the subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of <code>Workteam</code> objects, each describing a work team.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceWorkteam *> * _Nullable workteams;

@end

/**
 <p>Defines the Amazon Cognito user group that is part of a work team.</p>
 */
@interface AWSSageMakerServiceMemberDefinition : AWSModel


/**
 <p>The Amazon Cognito user group that is part of the work team.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceCognitoMemberDefinition * _Nullable cognitoMemberDefinition;

@end

/**
 <p>The name, value, and date and time of a metric that was emitted to Amazon CloudWatch.</p>
 */
@interface AWSSageMakerServiceMetricData : AWSModel


/**
 <p>The name of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The date and time that the algorithm emitted the metric.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

/**
 <p>The value of the metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>Specifies a metric that the training algorithm writes to <code>stderr</code> or <code>stdout</code> . Amazon SageMakerhyperparameter tuning captures all defined metrics. You specify one metric that a hyperparameter tuning job uses as its objective metric to choose the best training job.</p>
 Required parameters: [Name, Regex]
 */
@interface AWSSageMakerServiceMetricDefinition : AWSModel


/**
 <p>The name of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A regular expression that searches the output of a training job and gets the value of the metric. For more information about using regular expressions to define metrics, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-metrics.html">Defining Objective Metrics</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regex;

@end

/**
 <p>Provides information about the location that is configured for storing model artifacts. </p>
 Required parameters: [S3ModelArtifacts]
 */
@interface AWSSageMakerServiceModelArtifacts : AWSModel


/**
 <p>The path of the S3 object that contains the model artifacts. For example, <code>s3://bucket-name/keynameprefix/model.tar.gz</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3ModelArtifacts;

@end

/**
 <p>Describes the Docker container for the model package.</p>
 Required parameters: [Image]
 */
@interface AWSSageMakerServiceModelPackageContainerDefinition : AWSModel


/**
 <p>The DNS host name for the Docker container.</p>
 */
@property (nonatomic, strong) NSString * _Nullable containerHostname;

/**
 <p>The Amazon EC2 Container Registry (Amazon ECR) path where inference code is stored.</p><p>If you are using your own custom algorithm instead of an algorithm provided by Amazon SageMaker, the inference code must meet Amazon SageMaker requirements. Amazon SageMaker supports both <code>registry/repository[:tag]</code> and <code>registry/repository[@digest]</code> image path formats. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html">Using Your Own Algorithms with Amazon SageMaker</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable image;

/**
 <p>An MD5 hash of the training algorithm that identifies the Docker image used for training.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageDigest;

/**
 <p>The Amazon S3 path where the model artifacts, which result from model training, are stored. This path must point to a single <code>gzip</code> compressed tar archive (<code>.tar.gz</code> suffix).</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelDataUrl;

/**
 <p>The AWS Marketplace product ID of the model package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

@end

/**
 <p>Specifies the validation and image scan statuses of the model package.</p>
 Required parameters: [ValidationStatuses]
 */
@interface AWSSageMakerServiceModelPackageStatusDetails : AWSModel


/**
 <p>The status of the scan of the Docker image container for the model package.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceModelPackageStatusItem *> * _Nullable imageScanStatuses;

/**
 <p>The validation status of the model package.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceModelPackageStatusItem *> * _Nullable validationStatuses;

@end

/**
 <p>Represents the overall status of a model package.</p>
 Required parameters: [Name, Status]
 */
@interface AWSSageMakerServiceModelPackageStatusItem : AWSModel


/**
 <p>if the overall status is <code>Failed</code>, the reason for the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The name of the model package for which the overall status is being reported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceDetailedModelPackageStatus status;

@end

/**
 <p>Provides summary information about a model package.</p>
 Required parameters: [ModelPackageName, ModelPackageArn, CreationTime, ModelPackageStatus]
 */
@interface AWSSageMakerServiceModelPackageSummary : AWSModel


/**
 <p>A timestamp that shows when the model package was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The Amazon Resource Name (ARN) of the model package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelPackageArn;

/**
 <p>A brief description of the model package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelPackageDescription;

/**
 <p>The name of the model package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelPackageName;

/**
 <p>The overall status of the model package.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceModelPackageStatus modelPackageStatus;

@end

/**
 <p>Contains data, such as the inputs and targeted instance types that are used in the process of validating the model package.</p><p>The data provided in the validation profile is made available to your buyers on AWS Marketplace.</p>
 Required parameters: [ProfileName, TransformJobDefinition]
 */
@interface AWSSageMakerServiceModelPackageValidationProfile : AWSModel


/**
 <p>The name of the profile for the model package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileName;

/**
 <p>The <code>TransformJobDefinition</code> object that describes the transform job used for the validation of the model package.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTransformJobDefinition * _Nullable transformJobDefinition;

@end

/**
 <p>Specifies batch transform jobs that Amazon SageMaker runs to validate your model package.</p>
 Required parameters: [ValidationRole, ValidationProfiles]
 */
@interface AWSSageMakerServiceModelPackageValidationSpecification : AWSModel


/**
 <p>An array of <code>ModelPackageValidationProfile</code> objects, each of which specifies a batch transform job that Amazon SageMaker runs to validate your model package.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceModelPackageValidationProfile *> * _Nullable validationProfiles;

/**
 <p>The IAM roles to be used for the validation of the model package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable validationRole;

@end

/**
 <p>Provides summary information about a model.</p>
 Required parameters: [ModelName, ModelArn, CreationTime]
 */
@interface AWSSageMakerServiceModelSummary : AWSModel


/**
 <p>A timestamp that indicates when the model was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The Amazon Resource Name (ARN) of the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelArn;

/**
 <p>The name of the model that you want a summary for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

@end

/**
 <p>Container image configuration object for the monitoring job.</p>
 Required parameters: [ImageUri]
 */
@interface AWSSageMakerServiceMonitoringAppSpecification : AWSModel


/**
 <p>An array of arguments for the container used to run the monitoring job.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable containerArguments;

/**
 <p>Specifies the entrypoint for a container used to run the monitoring job.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable containerEntrypoint;

/**
 <p>The container image to be run by the monitoring job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUri;

/**
 <p>An Amazon S3 URI to a script that is called after analysis has been performed. Applicable only for the built-in (first party) containers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable postAnalyticsProcessorSourceUri;

/**
 <p>An Amazon S3 URI to a script that is called per row prior to running analysis. It can base64 decode the payload and convert it into a flatted json so that the built-in container can use the converted data. Applicable only for the built-in (first party) containers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recordPreprocessorSourceUri;

@end

/**
 <p>Configuration for monitoring constraints and monitoring statistics. These baseline resources are compared against the results of the current job from the series of jobs scheduled to collect data periodically.</p>
 */
@interface AWSSageMakerServiceMonitoringBaselineConfig : AWSModel


/**
 <p>The baseline constraint file in Amazon S3 that the current monitoring job should validated against.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceMonitoringConstraintsResource * _Nullable constraintsResource;

/**
 <p>The baseline statistics file in Amazon S3 that the current monitoring job should be validated against.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceMonitoringStatisticsResource * _Nullable statisticsResource;

@end

/**
 <p>Configuration for the cluster used to run model monitoring jobs.</p>
 Required parameters: [InstanceCount, InstanceType, VolumeSizeInGB]
 */
@interface AWSSageMakerServiceMonitoringClusterConfig : AWSModel


/**
 <p>The number of ML compute instances to use in the model monitoring job. For distributed processing jobs, specify a value greater than 1. The default value is 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>The ML compute instance type for the processing job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingInstanceType instanceType;

/**
 <p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance(s) that run the model monitoring job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p>The size of the ML storage volume, in gigabytes, that you want to provision. You must specify sufficient ML storage for your scenario.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSizeInGB;

@end

/**
 <p>The constraints resource for a monitoring job.</p>
 */
@interface AWSSageMakerServiceMonitoringConstraintsResource : AWSModel


/**
 <p>The Amazon S3 URI for the constraints resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Summary of information about the last monitoring job to run.</p>
 Required parameters: [MonitoringScheduleName, ScheduledTime, CreationTime, LastModifiedTime, MonitoringExecutionStatus]
 */
@interface AWSSageMakerServiceMonitoringExecutionSummary : AWSModel


/**
 <p>The time at which the monitoring job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The name of teh endpoint used to run the monitoring job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>Contains the reason a monitoring job failed, if it failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>A timestamp that indicates the last time the monitoring job was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The status of the monitoring job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceExecutionStatus monitoringExecutionStatus;

/**
 <p>The name of the monitoring schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleName;

/**
 <p>The Amazon Resource Name (ARN) of the monitoring job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable processingJobArn;

/**
 <p>The time the monitoring job was scheduled.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable scheduledTime;

@end

/**
 <p>The inputs for a monitoring job.</p>
 Required parameters: [EndpointInput]
 */
@interface AWSSageMakerServiceMonitoringInput : AWSModel


/**
 <p>The endpoint for a monitoring job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceEndpointInput * _Nullable endpointInput;

@end

/**
 <p>Defines the monitoring job.</p>
 Required parameters: [MonitoringInputs, MonitoringOutputConfig, MonitoringResources, MonitoringAppSpecification, RoleArn]
 */
@interface AWSSageMakerServiceMonitoringJobDefinition : AWSModel


/**
 <p>Baseline configuration used to validate that the data conforms to the specified constraints and statistics</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceMonitoringBaselineConfig * _Nullable baselineConfig;

/**
 <p>Sets the environment variables in the Docker container.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environment;

/**
 <p>Configures the monitoring job to run a specified Docker container image.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceMonitoringAppSpecification * _Nullable monitoringAppSpecification;

/**
 <p>The array of inputs for the monitoring job. Currently we support monitoring an Amazon SageMaker Endpoint.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceMonitoringInput *> * _Nullable monitoringInputs;

/**
 <p>The array of outputs from the monitoring job to be uploaded to Amazon Simple Storage Service (Amazon S3).</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceMonitoringOutputConfig * _Nullable monitoringOutputConfig;

/**
 <p>Identifies the resources, ML compute instances, and ML storage volumes to deploy for a monitoring job. In distributed processing, you specify more than one instance.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceMonitoringResources * _Nullable monitoringResources;

/**
 <p>Specifies networking options for an monitoring job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceNetworkConfig * _Nullable networkConfig;

/**
 <p>The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker can assume to perform tasks on your behalf.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Specifies a time limit for how long the monitoring job is allowed to run.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceMonitoringStoppingCondition * _Nullable stoppingCondition;

@end

/**
 <p>The output object for a monitoring job.</p>
 Required parameters: [S3Output]
 */
@interface AWSSageMakerServiceMonitoringOutput : AWSModel


/**
 <p>The Amazon S3 storage location where the results of a monitoring job are saved.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceMonitoringS3Output * _Nullable s3Output;

@end

/**
 <p>The output configuration for monitoring jobs.</p>
 Required parameters: [MonitoringOutputs]
 */
@interface AWSSageMakerServiceMonitoringOutputConfig : AWSModel


/**
 <p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the model artifacts at rest using Amazon S3 server-side encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>Monitoring outputs for monitoring jobs. This is where the output of the periodic monitoring jobs is uploaded.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceMonitoringOutput *> * _Nullable monitoringOutputs;

@end

/**
 <p>Identifies the resources to deploy for a monitoring job.</p>
 Required parameters: [ClusterConfig]
 */
@interface AWSSageMakerServiceMonitoringResources : AWSModel


/**
 <p>The configuration for the cluster resources used to run the processing job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceMonitoringClusterConfig * _Nullable clusterConfig;

@end

/**
 <p>Information about where and how you want to store the results of a monitoring job.</p>
 Required parameters: [S3Uri, LocalPath]
 */
@interface AWSSageMakerServiceMonitoringS3Output : AWSModel


/**
 <p>The local path to the Amazon S3 storage location where Amazon SageMaker saves the results of a monitoring job. LocalPath is an absolute path for the output data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable localPath;

/**
 <p>Whether to upload the results of the monitoring job continuously or after the job completes.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingS3UploadMode s3UploadMode;

/**
 <p>A URI that identifies the Amazon S3 storage location where Amazon SageMaker saves the results of a monitoring job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Configures the monitoring schedule and defines the monitoring job.</p>
 Required parameters: [MonitoringJobDefinition]
 */
@interface AWSSageMakerServiceMonitoringScheduleConfig : AWSModel


/**
 <p>Defines the monitoring job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceMonitoringJobDefinition * _Nullable monitoringJobDefinition;

/**
 <p>Configures the monitoring schedule.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceScheduleConfig * _Nullable scheduleConfig;

@end

/**
 <p>Summarizes the monitoring schedule.</p>
 Required parameters: [MonitoringScheduleName, MonitoringScheduleArn, CreationTime, LastModifiedTime, MonitoringScheduleStatus]
 */
@interface AWSSageMakerServiceMonitoringScheduleSummary : AWSModel


/**
 <p>The creation time of the monitoring schedule.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The name of the endpoint using the monitoring schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>The last time the monitoring schedule was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The Amazon Resource Name (ARN) of the monitoring schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleArn;

/**
 <p>The name of the monitoring schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleName;

/**
 <p>The status of the monitoring schedule.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceScheduleStatus monitoringScheduleStatus;

@end

/**
 <p>The statistics resource for a monitoring job.</p>
 */
@interface AWSSageMakerServiceMonitoringStatisticsResource : AWSModel


/**
 <p>The Amazon S3 URI for the statistics resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>A time limit for how long the monitoring job is allowed to run before stopping.</p>
 Required parameters: [MaxRuntimeInSeconds]
 */
@interface AWSSageMakerServiceMonitoringStoppingCondition : AWSModel


/**
 <p>The maximum runtime allowed in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRuntimeInSeconds;

@end

/**
 <p>A list of nested <a>Filter</a> objects. A resource must satisfy the conditions of all filters to be included in the results returned from the <a>Search</a> API.</p><p>For example, to filter on a training job's <code>InputDataConfig</code> property with a specific channel name and <code>S3Uri</code> prefix, define the following filters:</p><ul><li><p><code>'{Name:"InputDataConfig.ChannelName", "Operator":"Equals", "Value":"train"}',</code></p></li><li><p><code>'{Name:"InputDataConfig.DataSource.S3DataSource.S3Uri", "Operator":"Contains", "Value":"mybucket/catdata"}'</code></p></li></ul>
 Required parameters: [NestedPropertyName, Filters]
 */
@interface AWSSageMakerServiceNestedFilters : AWSModel


/**
 <p>A list of filters. Each filter acts on a property. Filters must contain at least one <code>Filters</code> value. For example, a <code>NestedFilters</code> call might include a filter on the <code>PropertyName</code> parameter of the <code>InputDataConfig</code> property: <code>InputDataConfig.DataSource.S3DataSource.S3Uri</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceFilter *> * _Nullable filters;

/**
 <p>The name of the property to use in the nested filters. The value must match a listed property name, such as <code>InputDataConfig</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nestedPropertyName;

@end

/**
 <p>Networking options for a job, such as network traffic encryption between containers, whether to allow inbound and outbound network calls to and from containers, and the VPC subnets and security groups to use for VPC-enabled jobs.</p>
 */
@interface AWSSageMakerServiceNetworkConfig : AWSModel


/**
 <p>Whether to encrypt all communications between distributed processing jobs. Choose <code>True</code> to encrypt communications. Encryption provides greater security for distributed processing jobs, but the processing might take longer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableInterContainerTrafficEncryption;

/**
 <p>Whether to allow inbound and outbound network calls to and from the containers used for the processing job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableNetworkIsolation;

/**
 <p>Specifies a VPC that your training jobs and hosted models have access to. Control access to and from your training and model containers by configuring the VPC. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/host-vpc.html">Protect Endpoints by Using an Amazon Virtual Private Cloud</a> and <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html">Protect Training Jobs by Using an Amazon Virtual Private Cloud</a>. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>Provides a summary of a notebook instance lifecycle configuration.</p>
 Required parameters: [NotebookInstanceLifecycleConfigName, NotebookInstanceLifecycleConfigArn]
 */
@interface AWSSageMakerServiceNotebookInstanceLifecycleConfigSummary : AWSModel


/**
 <p>A timestamp that tells when the lifecycle configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>A timestamp that tells when the lifecycle configuration was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The Amazon Resource Name (ARN) of the lifecycle configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceLifecycleConfigArn;

/**
 <p>The name of the lifecycle configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceLifecycleConfigName;

@end

/**
 <p>Contains the notebook instance lifecycle configuration script.</p><p>Each lifecycle configuration script has a limit of 16384 characters.</p><p>The value of the <code>$PATH</code> environment variable that is available to both scripts is <code>/sbin:bin:/usr/sbin:/usr/bin</code>.</p><p>View CloudWatch Logs for notebook instance lifecycle configurations in log group <code>/aws/sagemaker/NotebookInstances</code> in log stream <code>[notebook-instance-name]/[LifecycleConfigHook]</code>.</p><p>Lifecycle configuration scripts cannot run for longer than 5 minutes. If a script runs for longer than 5 minutes, it fails and the notebook instance is not created or started.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 */
@interface AWSSageMakerServiceNotebookInstanceLifecycleHook : AWSModel


/**
 <p>A base64-encoded string that contains a shell script for a notebook instance lifecycle configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

@end

/**
 <p>Provides summary information for an Amazon SageMaker notebook instance.</p>
 Required parameters: [NotebookInstanceName, NotebookInstanceArn]
 */
@interface AWSSageMakerServiceNotebookInstanceSummary : AWSModel


/**
 <p>An array of up to three Git repositories associated with the notebook instance. These can be either the names of Git repositories stored as resources in your account, or the URL of Git repositories in <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit</a> or in any other Git repository. These repositories are cloned at the same level as the default repository of your notebook instance. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalCodeRepositories;

/**
 <p>A timestamp that shows when the notebook instance was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The Git repository associated with the notebook instance as its default code repository. This can be either the name of a Git repository stored as a resource in your account, or the URL of a Git repository in <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit</a> or in any other Git repository. When you open a notebook instance, it opens in the directory that contains this repository. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultCodeRepository;

/**
 <p>The type of ML compute instance that the notebook instance is running on.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceInstanceType instanceType;

/**
 <p>A timestamp that shows when the notebook instance was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The Amazon Resource Name (ARN) of the notebook instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceArn;

/**
 <p>The name of a notebook instance lifecycle configuration associated with this notebook instance.</p><p>For information about notebook instance lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceLifecycleConfigName;

/**
 <p>The name of the notebook instance that you want a summary for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceName;

/**
 <p>The status of the notebook instance.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceNotebookInstanceStatus notebookInstanceStatus;

/**
 <p>The URL that you use to connect to the Jupyter instance running in your notebook instance. </p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>Configures SNS notifications of available or expiring work items for work teams.</p>
 */
@interface AWSSageMakerServiceNotificationConfiguration : AWSModel


/**
 <p>The ARN for the SNS topic to which notifications should be published.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationTopicArn;

@end

/**
 <p>Specifies the number of training jobs that this hyperparameter tuning job launched, categorized by the status of their objective metric. The objective metric status shows whether the final objective metric for the training job has been evaluated by the tuning job and used in the hyperparameter tuning process.</p>
 */
@interface AWSSageMakerServiceObjectiveStatusCounters : AWSModel


/**
 <p>The number of training jobs whose final objective metric was not evaluated and used in the hyperparameter tuning process. This typically occurs when the training job failed or did not emit an objective metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failed;

/**
 <p>The number of training jobs that are in progress and pending evaluation of their final objective metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pending;

/**
 <p>The number of training jobs whose final objective metric was evaluated by the hyperparameter tuning job and used in the hyperparameter tuning process.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable succeeded;

@end

/**
 <p>Contains information about the output location for the compiled model and the device (target) that the model runs on.</p>
 Required parameters: [S3OutputLocation, TargetDevice]
 */
@interface AWSSageMakerServiceOutputConfig : AWSModel


/**
 <p>Identifies the S3 path where you want Amazon SageMaker to store the model artifacts. For example, s3://bucket-name/key-name-prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3OutputLocation;

/**
 <p>Identifies the device that you want to run your model on after it has been compiled. For example: ml_c5.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTargetDevice targetDevice;

@end

/**
 <p>Provides information about how to store model training results (model artifacts).</p>
 Required parameters: [S3OutputPath]
 */
@interface AWSSageMakerServiceOutputDataConfig : AWSModel


/**
 <p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the model artifacts at rest using Amazon S3 server-side encryption. The <code>KmsKeyId</code> can be any of the following formats: </p><ul><li><p>// KMS Key ID</p><p><code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>// Amazon Resource Name (ARN) of a KMS Key</p><p><code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>// KMS Key Alias</p><p><code>"alias/ExampleAlias"</code></p></li><li><p>// Amazon Resource Name (ARN) of a KMS Key Alias</p><p><code>"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"</code></p></li></ul><p>If you use a KMS key ID or an alias of your master key, the Amazon SageMaker execution role must include permissions to call <code>kms:Encrypt</code>. If you don't provide a KMS key ID, Amazon SageMaker uses the default KMS key for Amazon S3 for your role's account. Amazon SageMaker uses server-side encryption with KMS-managed keys for <code>OutputDataConfig</code>. If you use a bucket policy with an <code>s3:PutObject</code> permission that only allows objects with server-side encryption, set the condition key of <code>s3:x-amz-server-side-encryption</code> to <code>"aws:kms"</code>. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html">KMS-Managed Encryption Keys</a> in the <i>Amazon Simple Storage Service Developer Guide.</i></p><p>The KMS key policy must grant permission to the IAM role that you specify in your <code>CreateTrainingJob</code>, <code>CreateTransformJob</code>, or <code>CreateHyperParameterTuningJob</code> requests. For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">Using Key Policies in AWS KMS</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>Identifies the S3 path where you want Amazon SageMaker to store the model artifacts. For example, <code>s3://bucket-name/key-name-prefix</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3OutputPath;

@end

/**
 <p>Defines the possible values for categorical, continuous, and integer hyperparameters to be used by an algorithm.</p>
 */
@interface AWSSageMakerServiceParameterRange : AWSModel


/**
 <p>A <code>CategoricalParameterRangeSpecification</code> object that defines the possible values for a categorical hyperparameter.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceCategoricalParameterRangeSpecification * _Nullable categoricalParameterRangeSpecification;

/**
 <p>A <code>ContinuousParameterRangeSpecification</code> object that defines the possible values for a continuous hyperparameter.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceContinuousParameterRangeSpecification * _Nullable continuousParameterRangeSpecification;

/**
 <p>A <code>IntegerParameterRangeSpecification</code> object that defines the possible values for an integer hyperparameter.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceIntegerParameterRangeSpecification * _Nullable integerParameterRangeSpecification;

@end

/**
 <p>Specifies ranges of integer, continuous, and categorical hyperparameters that a hyperparameter tuning job searches. The hyperparameter tuning job launches training jobs with hyperparameter values within these ranges to find the combination of values that result in the training job with the best performance as measured by the objective metric of the hyperparameter tuning job.</p><note><p>You can specify a maximum of 20 hyperparameters that a hyperparameter tuning job can search over. Every possible value of a categorical parameter range counts against this limit.</p></note>
 */
@interface AWSSageMakerServiceParameterRanges : AWSModel


/**
 <p>The array of <a>CategoricalParameterRange</a> objects that specify ranges of categorical hyperparameters that a hyperparameter tuning job searches.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceCategoricalParameterRange *> * _Nullable categoricalParameterRanges;

/**
 <p>The array of <a>ContinuousParameterRange</a> objects that specify ranges of continuous hyperparameters that a hyperparameter tuning job searches.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceContinuousParameterRange *> * _Nullable continuousParameterRanges;

/**
 <p>The array of <a>IntegerParameterRange</a> objects that specify ranges of integer hyperparameters that a hyperparameter tuning job searches.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceIntegerParameterRange *> * _Nullable integerParameterRanges;

@end

/**
 <p>The trial that a trial component is associated with and the experiment the trial is part of. A component might not be associated with a trial. A component can be associated with multiple trials.</p>
 */
@interface AWSSageMakerServiceParent : AWSModel


/**
 <p>The name of the experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentName;

/**
 <p>The name of the trial.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialName;

@end

/**
 <p>A previously completed or stopped hyperparameter tuning job to be used as a starting point for a new hyperparameter tuning job.</p>
 */
@interface AWSSageMakerServiceParentHyperParameterTuningJob : AWSModel


/**
 <p>The name of the hyperparameter tuning job to be used as a starting point for a new hyperparameter tuning job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hyperParameterTuningJobName;

@end

/**
 <p>Configuration for the cluster used to run a processing job.</p>
 Required parameters: [InstanceCount, InstanceType, VolumeSizeInGB]
 */
@interface AWSSageMakerServiceProcessingClusterConfig : AWSModel


/**
 <p>The number of ML compute instances to use in the processing job. For distributed processing jobs, specify a value greater than 1. The default value is 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>The ML compute instance type for the processing job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingInstanceType instanceType;

/**
 <p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance(s) that run the processing job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p>The size of the ML storage volume in gigabytes that you want to provision. You must specify sufficient ML storage for your scenario.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSizeInGB;

@end

/**
 <p>The inputs for a processing job.</p>
 Required parameters: [InputName, S3Input]
 */
@interface AWSSageMakerServiceProcessingInput : AWSModel


/**
 <p>The name of the inputs for the processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable inputName;

/**
 <p>The S3 inputs for the processing job. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceProcessingS3Input * _Nullable s3Input;

@end

/**
 <p>An Amazon SageMaker processing job that is used to analyze data and evaluate models. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/processing-job.html">Process Data and Evaluate Models</a>.</p>
 */
@interface AWSSageMakerServiceProcessingJob : AWSModel


/**
 <p>Configuration to run a processing job in a specified container image.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAppSpecification * _Nullable appSpecification;

/**
 <p>The Amazon Resource Name (ARN) of the AutoML job associated with this processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoMLJobArn;

/**
 <p>The time the processing job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Sets the environment variables in the Docker container.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environment;

/**
 <p>A string, up to one KB in size, that contains metadata from the processing container when the processing job exits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exitMessage;

/**
 <p>Configuration for the experiment.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceExperimentConfig * _Nullable experimentConfig;

/**
 <p>A string, up to one KB in size, that contains the reason a processing job failed, if it failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The time the processing job was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The ARN of a monitoring schedule for an endpoint associated with this processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleArn;

/**
 <p>Networking options for a job, such as network traffic encryption between containers, whether to allow inbound and outbound network calls to and from containers, and the VPC subnets and security groups to use for VPC-enabled jobs.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceNetworkConfig * _Nullable networkConfig;

/**
 <p>The time that the processing job ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable processingEndTime;

/**
 <p>For each input, data is downloaded from S3 into the processing container before the processing job begins running if "S3InputMode" is set to <code>File</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceProcessingInput *> * _Nullable processingInputs;

/**
 <p>The ARN of the processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable processingJobArn;

/**
 <p>The name of the processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable processingJobName;

/**
 <p>The status of the processing job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingJobStatus processingJobStatus;

/**
 <p>The output configuration for the processing job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceProcessingOutputConfig * _Nullable processingOutputConfig;

/**
 <p>Identifies the resources, ML compute instances, and ML storage volumes to deploy for a processing job. In distributed training, you specify more than one instance.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceProcessingResources * _Nullable processingResources;

/**
 <p>The time that the processing job started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable processingStartTime;

/**
 <p>The ARN of the role used to create the processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Specifies a time limit for how long the processing job is allowed to run.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceProcessingStoppingCondition * _Nullable stoppingCondition;

/**
 <p>An array of key-value pairs. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>The ARN of the training job associated with this processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobArn;

@end

/**
 <p>Summary of information about a processing job.</p>
 Required parameters: [ProcessingJobName, ProcessingJobArn, CreationTime, ProcessingJobStatus]
 */
@interface AWSSageMakerServiceProcessingJobSummary : AWSModel


/**
 <p>The time at which the processing job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>An optional string, up to one KB in size, that contains metadata from the processing container when the processing job exits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exitMessage;

/**
 <p>A string, up to one KB in size, that contains the reason a processing job failed, if it failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>A timestamp that indicates the last time the processing job was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The time at which the processing job completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable processingEndTime;

/**
 <p>The Amazon Resource Name (ARN) of the processing job..</p>
 */
@property (nonatomic, strong) NSString * _Nullable processingJobArn;

/**
 <p>The name of the processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable processingJobName;

/**
 <p>The status of the processing job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingJobStatus processingJobStatus;

@end

/**
 <p>Describes the results of a processing job.</p>
 Required parameters: [OutputName, S3Output]
 */
@interface AWSSageMakerServiceProcessingOutput : AWSModel


/**
 <p>The name for the processing job output.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputName;

/**
 <p>Configuration for processing job outputs in Amazon S3.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceProcessingS3Output * _Nullable s3Output;

@end

/**
 <p>The output configuration for the processing job.</p>
 Required parameters: [Outputs]
 */
@interface AWSSageMakerServiceProcessingOutputConfig : AWSModel


/**
 <p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the processing job output. <code>KmsKeyId</code> can be an ID of a KMS key, ARN of a KMS key, alias of a KMS key, or alias of a KMS key. The <code>KmsKeyId</code> is applied to all outputs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>Output configuration information for a processing job.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceProcessingOutput *> * _Nullable outputs;

@end

/**
 <p>Identifies the resources, ML compute instances, and ML storage volumes to deploy for a processing job. In distributed training, you specify more than one instance.</p>
 Required parameters: [ClusterConfig]
 */
@interface AWSSageMakerServiceProcessingResources : AWSModel


/**
 <p>The configuration for the resources in a cluster used to run the processing job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceProcessingClusterConfig * _Nullable clusterConfig;

@end

/**
 <p>Information about where and how you want to obtain the inputs for an processing job.</p>
 Required parameters: [S3Uri, LocalPath, S3DataType, S3InputMode]
 */
@interface AWSSageMakerServiceProcessingS3Input : AWSModel


/**
 <p>The local path to the Amazon S3 bucket where you want Amazon SageMaker to download the inputs to run a processing job. <code>LocalPath</code> is an absolute path to the input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable localPath;

/**
 <p>Whether to use <code>Gzip</code> compression for Amazon S3 storage.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingS3CompressionType s3CompressionType;

/**
 <p>Whether the data stored in Amazon S3 is <code>FullyReplicated</code> or <code>ShardedByS3Key</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingS3DataDistributionType s3DataDistributionType;

/**
 <p>Whether you use an <code>S3Prefix</code> or a <code>ManifestFile</code> for the data type. If you choose <code>S3Prefix</code>, <code>S3Uri</code> identifies a key name prefix. Amazon SageMaker uses all objects with the specified key name prefix for the processing job. If you choose <code>ManifestFile</code>, <code>S3Uri</code> identifies an object that is a manifest file containing a list of object keys that you want Amazon SageMaker to use for the processing job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingS3DataType s3DataType;

/**
 <p>Whether to use <code>File</code> or <code>Pipe</code> input mode. In <code>File</code> mode, Amazon SageMaker copies the data from the input source onto the local Amazon Elastic Block Store (Amazon EBS) volumes before starting your training algorithm. This is the most commonly used input mode. In <code>Pipe</code> mode, Amazon SageMaker streams input data from the source directly to your algorithm without using the EBS volume.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingS3InputMode s3InputMode;

/**
 <p>The URI for the Amazon S3 storage where you want Amazon SageMaker to download the artifacts needed to run a processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Information about where and how you want to store the results of an processing job.</p>
 Required parameters: [S3Uri, LocalPath, S3UploadMode]
 */
@interface AWSSageMakerServiceProcessingS3Output : AWSModel


/**
 <p>The local path to the Amazon S3 bucket where you want Amazon SageMaker to save the results of an processing job. <code>LocalPath</code> is an absolute path to the input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable localPath;

/**
 <p>Whether to upload the results of the processing job continuously or after the job completes.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProcessingS3UploadMode s3UploadMode;

/**
 <p>A URI that identifies the Amazon S3 bucket where you want Amazon SageMaker to save the results of a processing job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Specifies a time limit for how long the processing job is allowed to run.</p>
 Required parameters: [MaxRuntimeInSeconds]
 */
@interface AWSSageMakerServiceProcessingStoppingCondition : AWSModel


/**
 <p>Specifies the maximum runtime in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRuntimeInSeconds;

@end

/**
 <p>Identifies a model that you want to host and the resources to deploy for hosting it. If you are deploying multiple models, tell Amazon SageMaker how to distribute traffic among the models by specifying variant weights. </p>
 Required parameters: [VariantName, ModelName, InitialInstanceCount, InstanceType]
 */
@interface AWSSageMakerServiceProductionVariant : AWSModel


/**
 <p>The size of the Elastic Inference (EI) instance to use for the production variant. EI instances provide on-demand GPU computing for inference. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html">Using Elastic Inference in Amazon SageMaker</a>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProductionVariantAcceleratorType acceleratorType;

/**
 <p>Number of instances to launch initially.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable initialInstanceCount;

/**
 <p>Determines initial traffic distribution among all of the models that you specify in the endpoint configuration. The traffic to a production variant is determined by the ratio of the <code>VariantWeight</code> to the sum of all <code>VariantWeight</code> values across all ProductionVariants. If unspecified, it defaults to 1.0. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable initialVariantWeight;

/**
 <p>The ML compute instance type.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProductionVariantInstanceType instanceType;

/**
 <p>The name of the model that you want to host. This is the name that you specified when creating the model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

/**
 <p>The name of the production variant.</p>
 */
@property (nonatomic, strong) NSString * _Nullable variantName;

@end

/**
 <p>Describes weight and capacities for a production variant associated with an endpoint. If you sent a request to the <code>UpdateEndpointWeightsAndCapacities</code> API and the endpoint status is <code>Updating</code>, you get different desired and current values. </p>
 Required parameters: [VariantName]
 */
@interface AWSSageMakerServiceProductionVariantSummary : AWSModel


/**
 <p>The number of instances associated with the variant.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentInstanceCount;

/**
 <p>The weight associated with the variant.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentWeight;

/**
 <p>An array of <code>DeployedImage</code> objects that specify the Amazon EC2 Container Registry paths of the inference images deployed on instances of this <code>ProductionVariant</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceDeployedImage *> * _Nullable deployedImages;

/**
 <p>The number of instances requested in the <code>UpdateEndpointWeightsAndCapacities</code> request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredInstanceCount;

/**
 <p>The requested weight, as specified in the <code>UpdateEndpointWeightsAndCapacities</code> request. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredWeight;

/**
 <p>The name of the variant.</p>
 */
@property (nonatomic, strong) NSString * _Nullable variantName;

@end

/**
 <p>Part of the <code>SuggestionQuery</code> type. Specifies a hint for retrieving property names that begin with the specified text.</p>
 Required parameters: [PropertyNameHint]
 */
@interface AWSSageMakerServicePropertyNameQuery : AWSModel


/**
 <p>Text that begins a property's name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyNameHint;

@end

/**
 <p>A property name returned from a <code>GetSearchSuggestions</code> call that specifies a value in the <code>PropertyNameQuery</code> field.</p>
 */
@interface AWSSageMakerServicePropertyNameSuggestion : AWSModel


/**
 <p>A suggested property name based on what you entered in the search textbox in the Amazon SageMaker console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyName;

@end

/**
 <p>Defines the amount of money paid to an Amazon Mechanical Turk worker for each task performed. </p><p>Use one of the following prices for bounding box tasks. Prices are in US dollars and should be based on the complexity of the task; the longer it takes in your initial testing, the more you should offer.</p><ul><li><p>0.036</p></li><li><p>0.048</p></li><li><p>0.060</p></li><li><p>0.072</p></li><li><p>0.120</p></li><li><p>0.240</p></li><li><p>0.360</p></li><li><p>0.480</p></li><li><p>0.600</p></li><li><p>0.720</p></li><li><p>0.840</p></li><li><p>0.960</p></li><li><p>1.080</p></li><li><p>1.200</p></li></ul><p>Use one of the following prices for image classification, text classification, and custom tasks. Prices are in US dollars.</p><ul><li><p>0.012</p></li><li><p>0.024</p></li><li><p>0.036</p></li><li><p>0.048</p></li><li><p>0.060</p></li><li><p>0.072</p></li><li><p>0.120</p></li><li><p>0.240</p></li><li><p>0.360</p></li><li><p>0.480</p></li><li><p>0.600</p></li><li><p>0.720</p></li><li><p>0.840</p></li><li><p>0.960</p></li><li><p>1.080</p></li><li><p>1.200</p></li></ul><p>Use one of the following prices for semantic segmentation tasks. Prices are in US dollars.</p><ul><li><p>0.840</p></li><li><p>0.960</p></li><li><p>1.080</p></li><li><p>1.200</p></li></ul><p>Use one of the following prices for Textract AnalyzeDocument Important Form Key Amazon Augmented AI review tasks. Prices are in US dollars.</p><ul><li><p>2.400 </p></li><li><p>2.280 </p></li><li><p>2.160 </p></li><li><p>2.040 </p></li><li><p>1.920 </p></li><li><p>1.800 </p></li><li><p>1.680 </p></li><li><p>1.560 </p></li><li><p>1.440 </p></li><li><p>1.320 </p></li><li><p>1.200 </p></li><li><p>1.080 </p></li><li><p>0.960 </p></li><li><p>0.840 </p></li><li><p>0.720 </p></li><li><p>0.600 </p></li><li><p>0.480 </p></li><li><p>0.360 </p></li><li><p>0.240 </p></li><li><p>0.120 </p></li><li><p>0.072 </p></li><li><p>0.060 </p></li><li><p>0.048 </p></li><li><p>0.036 </p></li><li><p>0.024 </p></li><li><p>0.012 </p></li></ul><p>Use one of the following prices for Rekognition DetectModerationLabels Amazon Augmented AI review tasks. Prices are in US dollars.</p><ul><li><p>1.200 </p></li><li><p>1.080 </p></li><li><p>0.960 </p></li><li><p>0.840 </p></li><li><p>0.720 </p></li><li><p>0.600 </p></li><li><p>0.480 </p></li><li><p>0.360 </p></li><li><p>0.240 </p></li><li><p>0.120 </p></li><li><p>0.072 </p></li><li><p>0.060 </p></li><li><p>0.048 </p></li><li><p>0.036 </p></li><li><p>0.024 </p></li><li><p>0.012 </p></li></ul><p>Use one of the following prices for Amazon Augmented AI custom human review tasks. Prices are in US dollars.</p><ul><li><p>1.200 </p></li><li><p>1.080 </p></li><li><p>0.960 </p></li><li><p>0.840 </p></li><li><p>0.720 </p></li><li><p>0.600 </p></li><li><p>0.480 </p></li><li><p>0.360 </p></li><li><p>0.240 </p></li><li><p>0.120 </p></li><li><p>0.072 </p></li><li><p>0.060 </p></li><li><p>0.048 </p></li><li><p>0.036 </p></li><li><p>0.024 </p></li><li><p>0.012 </p></li></ul>
 */
@interface AWSSageMakerServicePublicWorkforceTaskPrice : AWSModel


/**
 <p>Defines the amount of money paid to an Amazon Mechanical Turk worker in United States dollars.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUSD * _Nullable amountInUsd;

@end

/**
 
 */
@interface AWSSageMakerServiceRenderUiTemplateRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) that has access to the S3 objects that are used by the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>A <code>RenderableTask</code> object containing a representative task to render.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceRenderableTask * _Nullable task;

/**
 <p>A <code>Template</code> object containing the worker UI template to render.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUiTemplate * _Nullable uiTemplate;

@end

/**
 
 */
@interface AWSSageMakerServiceRenderUiTemplateResponse : AWSModel


/**
 <p>A list of one or more <code>RenderingError</code> objects if any were encountered while rendering the template. If there were no errors, the list is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceRenderingError *> * _Nullable errors;

/**
 <p>A Liquid template that renders the HTML for the worker UI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable renderedContent;

@end

/**
 <p>Contains input values for a task.</p>
 Required parameters: [Input]
 */
@interface AWSSageMakerServiceRenderableTask : AWSModel


/**
 <p>A JSON object that contains values for the variables defined in the template. It is made available to the template under the substitution variable <code>task.input</code>. For example, if you define a variable <code>task.input.text</code> in your template, you can supply the variable in the JSON object as <code>"text": "sample text"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable input;

@end

/**
 <p>A description of an error that occurred while rendering the template.</p>
 Required parameters: [Code, Message]
 */
@interface AWSSageMakerServiceRenderingError : AWSModel


/**
 <p>A unique identifier for a specific class of errors.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>A human-readable message describing the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>The resolved attributes.</p>
 */
@interface AWSSageMakerServiceResolvedAttributes : AWSModel


/**
 <p>Applies a metric to minimize or maximize for the job's objective.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAutoMLJobObjective * _Nullable autoMLJobObjective;

/**
 <p>How long a job is allowed to run, or how many candidates a job is allowed to generate.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAutoMLJobCompletionCriteria * _Nullable completionCriteria;

/**
 <p>The problem type.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceProblemType problemType;

@end

/**
 <p>Describes the resources, including ML compute instances and ML storage volumes, to use for model training. </p>
 Required parameters: [InstanceType, InstanceCount, VolumeSizeInGB]
 */
@interface AWSSageMakerServiceResourceConfig : AWSModel


/**
 <p>The number of ML compute instances to use. For distributed training, provide a value greater than 1. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>The ML compute instance type. </p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTrainingInstanceType instanceType;

/**
 <p>The AWS KMS key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance(s) that run the training job.</p><note><p>Certain Nitro-based instances include local storage, dependent on the instance type. Local storage volumes are encrypted using a hardware module on the instance. You can't request a <code>VolumeKmsKeyId</code> when using an instance type with local storage.</p><p>For a list of instance types that support local instance storage, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html#instance-store-volumes">Instance Store Volumes</a>.</p><p>For more information about local instance storage encryption, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ssd-instance-store.html">SSD Instance Store Volumes</a>.</p></note><p>The <code>VolumeKmsKeyId</code> can be in any of the following formats:</p><ul><li><p>// KMS Key ID</p><p><code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li><li><p>// Amazon Resource Name (ARN) of a KMS Key</p><p><code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

/**
 <p>The size of the ML storage volume that you want to provision. </p><p>ML storage volumes store model artifacts and incremental states. Training algorithms might also use the ML storage volume for scratch space. If you want to store the training data in the ML storage volume, choose <code>File</code> as the <code>TrainingInputMode</code> in the algorithm specification. </p><p>You must specify sufficient ML storage for your scenario. </p><note><p> Amazon SageMaker supports only the General Purpose SSD (gp2) ML storage volume type. </p></note><note><p>Certain Nitro-based instances include local storage with a fixed total size, dependent on the instance type. When using these instances for training, Amazon SageMaker mounts the local instance storage instead of Amazon EBS gp2 storage. You can't request a <code>VolumeSizeInGB</code> greater than the total size of the local instance storage.</p><p>For a list of instance types that support local instance storage, including the total size per instance type, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html#instance-store-volumes">Instance Store Volumes</a>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSizeInGB;

@end

/**
 <p>Specifies the maximum number of training jobs and parallel training jobs that a hyperparameter tuning job can launch.</p>
 Required parameters: [MaxNumberOfTrainingJobs, MaxParallelTrainingJobs]
 */
@interface AWSSageMakerServiceResourceLimits : AWSModel


/**
 <p>The maximum number of training jobs that a hyperparameter tuning job can launch.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxNumberOfTrainingJobs;

/**
 <p>The maximum number of concurrent training jobs that a hyperparameter tuning job can launch.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxParallelTrainingJobs;

@end

/**
 <p>The instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance. The ARN is stored as metadata in Amazon SageMaker Studio notebooks.</p>
 */
@interface AWSSageMakerServiceResourceSpec : AWSModel


/**
 <p>The instance type.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAppInstanceType instanceType;

/**
 <p>The Amazon Resource Name (ARN) of the SageMaker image created on the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sageMakerImageArn;

@end

/**
 <p>The retention policy for data stored on an Amazon Elastic File System (EFS) volume.</p>
 */
@interface AWSSageMakerServiceRetentionPolicy : AWSModel


/**
 <p>The default is <code>Retain</code>, which specifies to keep the data stored on the EFS volume.</p><p>Specify <code>Delete</code> to delete the data stored on the EFS volume.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceRetentionType homeEfsFileSystem;

@end

/**
 <p>Describes the S3 data source.</p>
 Required parameters: [S3DataType, S3Uri]
 */
@interface AWSSageMakerServiceS3DataSource : AWSModel


/**
 <p>A list of one or more attribute names to use that are found in a specified augmented manifest file.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributeNames;

/**
 <p>If you want Amazon SageMaker to replicate the entire dataset on each ML compute instance that is launched for model training, specify <code>FullyReplicated</code>. </p><p>If you want Amazon SageMaker to replicate a subset of data on each ML compute instance that is launched for model training, specify <code>ShardedByS3Key</code>. If there are <i>n</i> ML compute instances launched for a training job, each instance gets approximately 1/<i>n</i> of the number of S3 objects. In this case, model training on each machine uses only the subset of training data. </p><p>Don't choose more ML compute instances for training than available S3 objects. If you do, some nodes won't get any data and you will pay for nodes that aren't getting any training data. This applies in both File and Pipe modes. Keep this in mind when developing algorithms. </p><p>In distributed training, where you use multiple ML compute EC2 instances, you might choose <code>ShardedByS3Key</code>. If the algorithm requires copying training data to the ML storage volume (when <code>TrainingInputMode</code> is set to <code>File</code>), this copies 1/<i>n</i> of the number of objects. </p>
 */
@property (nonatomic, assign) AWSSageMakerServiceS3DataDistribution s3DataDistributionType;

/**
 <p>If you choose <code>S3Prefix</code>, <code>S3Uri</code> identifies a key name prefix. Amazon SageMaker uses all objects that match the specified key name prefix for model training. </p><p>If you choose <code>ManifestFile</code>, <code>S3Uri</code> identifies an object that is a manifest file containing a list of object keys that you want Amazon SageMaker to use for model training. </p><p>If you choose <code>AugmentedManifestFile</code>, S3Uri identifies an object that is an augmented manifest file in JSON lines format. This file contains the data you want to use for model training. <code>AugmentedManifestFile</code> can only be used if the Channel's input mode is <code>Pipe</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceS3DataType s3DataType;

/**
 <p>Depending on the value specified for the <code>S3DataType</code>, identifies either a key name prefix or a manifest. For example: </p><ul><li><p> A key name prefix might look like this: <code>s3://bucketname/exampleprefix</code>. </p></li><li><p> A manifest might look like this: <code>s3://bucketname/example.manifest</code></p><p> The manifest is an S3 object which is a JSON file with the following format: </p><p> The preceding JSON matches the following <code>s3Uris</code>: </p><p><code>[ {"prefix": "s3://customer_bucket/some/prefix/"},</code></p><p><code>"relative/path/to/custdata-1",</code></p><p><code>"relative/path/custdata-2",</code></p><p><code>...</code></p><p><code>"relative/path/custdata-N"</code></p><p><code>]</code></p><p> The preceding JSON matches the following <code>s3Uris</code>: </p><p><code>s3://customer_bucket/some/prefix/relative/path/to/custdata-1</code></p><p><code>s3://customer_bucket/some/prefix/relative/path/custdata-2</code></p><p><code>...</code></p><p><code>s3://customer_bucket/some/prefix/relative/path/custdata-N</code></p><p>The complete set of <code>s3uris</code> in this manifest is the input data for the channel for this datasource. The object that each <code>s3uris</code> points to must be readable by the IAM role that Amazon SageMaker uses to perform tasks on your behalf. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Configuration details about the monitoring schedule.</p>
 Required parameters: [ScheduleExpression]
 */
@interface AWSSageMakerServiceScheduleConfig : AWSModel


/**
 <p>A cron expression that describes details about the monitoring schedule.</p><p>Currently the only supported cron expressions are:</p><ul><li><p>If you want to set the job to start every hour, please use the following:</p><p><code>Hourly: cron(0 * ? * * *)</code></p></li><li><p>If you want to start the job daily:</p><p><code>cron(0 [00-23] ? * * *)</code></p></li></ul><p>For example, the following are valid cron expressions:</p><ul><li><p>Daily at noon UTC: <code>cron(0 12 ? * * *)</code></p></li><li><p>Daily at midnight UTC: <code>cron(0 0 ? * * *)</code></p></li></ul><p>To support running every 6, 12 hours, the following are also supported:</p><p><code>cron(0 [00-23]/[01-24] ? * * *)</code></p><p>For example, the following are valid cron expressions:</p><ul><li><p>Every 12 hours, starting at 5pm UTC: <code>cron(0 17/12 ? * * *)</code></p></li><li><p>Every two hours starting at midnight: <code>cron(0 0/2 ? * * *)</code></p></li></ul><note><ul><li><p>Even though the cron expression is set to start at 5PM UTC, note that there could be a delay of 0-20 minutes from the actual requested time to run the execution. </p></li><li><p>We recommend that if you would like a daily schedule, you do not provide this parameter. Amazon SageMaker will pick a time for running every day.</p></li></ul></note>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleExpression;

@end

/**
 <p>A multi-expression that searches for the specified resource or resources in a search. All resource objects that satisfy the expression's condition are included in the search results. You must specify at least one subexpression, filter, or nested filter. A <code>SearchExpression</code> can contain up to twenty elements.</p><p>A <code>SearchExpression</code> contains the following components:</p><ul><li><p>A list of <code>Filter</code> objects. Each filter defines a simple Boolean expression comprised of a resource property name, Boolean operator, and value. A <code>SearchExpression</code> can include only one <code>Contains</code> operator.</p></li><li><p>A list of <code>NestedFilter</code> objects. Each nested filter defines a list of Boolean expressions using a list of resource properties. A nested filter is satisfied if a single object in the list satisfies all Boolean expressions.</p></li><li><p>A list of <code>SearchExpression</code> objects. A search expression object can be nested in a list of search expression objects.</p></li><li><p>A Boolean operator: <code>And</code> or <code>Or</code>.</p></li></ul>
 */
@interface AWSSageMakerServiceSearchExpression : AWSModel


/**
 <p>A list of filter objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceFilter *> * _Nullable filters;

/**
 <p>A list of nested filter objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceNestedFilters *> * _Nullable nestedFilters;

/**
 <p>A Boolean operator used to evaluate the search expression. If you want every conditional statement in all lists to be satisfied for the entire search expression to be true, specify <code>And</code>. If only a single conditional statement needs to be true for the entire search expression to be true, specify <code>Or</code>. The default value is <code>And</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceBooleanOperator operator;

/**
 <p>A list of search expression objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceSearchExpression *> * _Nullable subExpressions;

@end

/**
 <p>A single resource returned as part of the <a>Search</a> API response.</p>
 */
@interface AWSSageMakerServiceSearchRecord : AWSModel


/**
 <p>The properties of an experiment.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceExperiment * _Nullable experiment;

/**
 <p>The properties of a training job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrainingJob * _Nullable trainingJob;

/**
 <p>The properties of a trial.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrial * _Nullable trial;

/**
 <p>The properties of a trial component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrialComponent * _Nullable trialComponent;

@end

/**
 
 */
@interface AWSSageMakerServiceSearchRequest : AWSRequest


/**
 <p>The maximum number of results to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If more than <code>MaxResults</code> resources match the specified <code>SearchExpression</code>, the response includes a <code>NextToken</code>. The <code>NextToken</code> can be passed to the next <code>SearchRequest</code> to continue retrieving results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the Amazon SageMaker resource to search for.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceResourceType resource;

/**
 <p>A Boolean conditional statement. Resources must satisfy this condition to be included in search results. You must provide at least one subexpression, filter, or nested filter. The maximum number of recursive <code>SubExpressions</code>, <code>NestedFilters</code>, and <code>Filters</code> that can be included in a <code>SearchExpression</code> object is 50.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceSearchExpression * _Nullable searchExpression;

/**
 <p>The name of the resource property used to sort the <code>SearchResults</code>. The default is <code>LastModifiedTime</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sortBy;

/**
 <p>How <code>SearchResults</code> are ordered. Valid values are <code>Ascending</code> or <code>Descending</code>. The default is <code>Descending</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceSearchSortOrder sortOrder;

@end

/**
 
 */
@interface AWSSageMakerServiceSearchResponse : AWSModel


/**
 <p>If the result of the previous <code>Search</code> request was truncated, the response includes a NextToken. To retrieve the next set of results, use the token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>SearchRecord</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceSearchRecord *> * _Nullable results;

@end

/**
 <p>An array element of <a>DescribeTrainingJobResponse$SecondaryStatusTransitions</a>. It provides additional details about a status that the training job has transitioned through. A training job can be in one of several states, for example, starting, downloading, training, or uploading. Within each state, there are a number of intermediate states. For example, within the starting state, Amazon SageMaker could be starting the training job or launching the ML instances. These transitional states are referred to as the job's secondary status. </p><p/>
 Required parameters: [Status, StartTime]
 */
@interface AWSSageMakerServiceSecondaryStatusTransition : AWSModel


/**
 <p>A timestamp that shows when the training job transitioned out of this secondary status state into another secondary status state or when the training job has ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>A timestamp that shows when the training job transitioned to the current secondary status state.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>Contains a secondary status information from a training job.</p><p>Status might be one of the following secondary statuses:</p><dl><dt>InProgress</dt><dd><ul><li><p><code>Starting</code> - Starting the training job.</p></li><li><p><code>Downloading</code> - An optional stage for algorithms that support <code>File</code> training input mode. It indicates that data is being downloaded to the ML storage volumes.</p></li><li><p><code>Training</code> - Training is in progress.</p></li><li><p><code>Uploading</code> - Training is complete and the model artifacts are being uploaded to the S3 location.</p></li></ul></dd><dt>Completed</dt><dd><ul><li><p><code>Completed</code> - The training job has completed.</p></li></ul></dd><dt>Failed</dt><dd><ul><li><p><code>Failed</code> - The training job has failed. The reason for the failure is returned in the <code>FailureReason</code> field of <code>DescribeTrainingJobResponse</code>.</p></li></ul></dd><dt>Stopped</dt><dd><ul><li><p><code>MaxRuntimeExceeded</code> - The job stopped because it exceeded the maximum allowed runtime.</p></li><li><p><code>Stopped</code> - The training job has stopped.</p></li></ul></dd><dt>Stopping</dt><dd><ul><li><p><code>Stopping</code> - Stopping the training job.</p></li></ul></dd></dl><p>We no longer support the following secondary statuses:</p><ul><li><p><code>LaunchingMLInstances</code></p></li><li><p><code>PreparingTrainingStack</code></p></li><li><p><code>DownloadingTrainingImage</code></p></li></ul>
 */
@property (nonatomic, assign) AWSSageMakerServiceSecondaryStatus status;

/**
 <p>A detailed description of the progress within a secondary status. </p><p>Amazon SageMaker provides secondary statuses and status messages that apply to each of them:</p><dl><dt>Starting</dt><dd><ul><li><p>Starting the training job.</p></li><li><p>Launching requested ML instances.</p></li><li><p>Insufficient capacity error from EC2 while launching instances, retrying!</p></li><li><p>Launched instance was unhealthy, replacing it!</p></li><li><p>Preparing the instances for training.</p></li></ul></dd><dt>Training</dt><dd><ul><li><p>Downloading the training image.</p></li><li><p>Training image download completed. Training in progress.</p></li></ul></dd></dl><important><p>Status messages are subject to change. Therefore, we recommend not including them in code that programmatically initiates actions. For examples, don't use status messages in if statements.</p></important><p>To have an overview of your training job's progress, view <code>TrainingJobStatus</code> and <code>SecondaryStatus</code> in <a>DescribeTrainingJob</a>, and <code>StatusMessage</code> together. For example, at the start of a training job, you might see the following:</p><ul><li><p><code>TrainingJobStatus</code> - InProgress</p></li><li><p><code>SecondaryStatus</code> - Training</p></li><li><p><code>StatusMessage</code> - Downloading the training image</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 <p>The sharing settings.</p>
 */
@interface AWSSageMakerServiceSharingSettings : AWSModel


/**
 <p>The notebook output option.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceNotebookOutputOption notebookOutputOption;

/**
 <p>The AWS Key Management Service encryption key ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3KmsKeyId;

/**
 <p>The Amazon S3 output path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3OutputPath;

@end

/**
 <p>A configuration for a shuffle option for input data in a channel. If you use <code>S3Prefix</code> for <code>S3DataType</code>, the results of the S3 key prefix matches are shuffled. If you use <code>ManifestFile</code>, the order of the S3 object references in the <code>ManifestFile</code> is shuffled. If you use <code>AugmentedManifestFile</code>, the order of the JSON lines in the <code>AugmentedManifestFile</code> is shuffled. The shuffling order is determined using the <code>Seed</code> value.</p><p>For Pipe input mode, when <code>ShuffleConfig</code> is specified shuffling is done at the start of every epoch. With large datasets, this ensures that the order of the training data is different for each epoch, and it helps reduce bias and possible overfitting. In a multi-node training job when <code>ShuffleConfig</code> is combined with <code>S3DataDistributionType</code> of <code>ShardedByS3Key</code>, the data is shuffled across nodes so that the content sent to a particular node on the first epoch might be sent to a different node on the second epoch.</p>
 Required parameters: [Seed]
 */
@interface AWSSageMakerServiceShuffleConfig : AWSModel


/**
 <p>Determines the shuffling order in <code>ShuffleConfig</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable seed;

@end

/**
 <p>Specifies an algorithm that was used to create the model package. The algorithm must be either an algorithm resource in your Amazon SageMaker account or an algorithm in AWS Marketplace that you are subscribed to.</p>
 Required parameters: [AlgorithmName]
 */
@interface AWSSageMakerServiceSourceAlgorithm : AWSModel


/**
 <p>The name of an algorithm that was used to create the model package. The algorithm must be either an algorithm resource in your Amazon SageMaker account or an algorithm in AWS Marketplace that you are subscribed to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithmName;

/**
 <p>The Amazon S3 path where the model artifacts, which result from model training, are stored. This path must point to a single <code>gzip</code> compressed tar archive (<code>.tar.gz</code> suffix).</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelDataUrl;

@end

/**
 <p>A list of algorithms that were used to create a model package.</p>
 Required parameters: [SourceAlgorithms]
 */
@interface AWSSageMakerServiceSourceAlgorithmSpecification : AWSModel


/**
 <p>A list of the algorithms that were used to create a model package.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceSourceAlgorithm *> * _Nullable sourceAlgorithms;

@end

/**
 <p>A list of IP address ranges (<a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>). Used to create an allow list of IP addresses for a private workforce. For more information, see .</p>
 Required parameters: [Cidrs]
 */
@interface AWSSageMakerServiceSourceIpConfig : AWSModel


/**
 <p>A list of one to four <a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">Classless Inter-Domain Routing</a> (CIDR) values.</p><p>Maximum: Four CIDR values</p><note><p>The following Length Constraints apply to individual CIDR values in the CIDR value list.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cidrs;

@end

/**
 
 */
@interface AWSSageMakerServiceStartMonitoringScheduleRequest : AWSRequest


/**
 <p>The name of the schedule to start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleName;

@end

/**
 
 */
@interface AWSSageMakerServiceStartNotebookInstanceInput : AWSRequest


/**
 <p>The name of the notebook instance to start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceName;

@end

/**
 
 */
@interface AWSSageMakerServiceStopAutoMLJobRequest : AWSRequest


/**
 <p>The name of the object you are requesting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoMLJobName;

@end

/**
 
 */
@interface AWSSageMakerServiceStopCompilationJobRequest : AWSRequest


/**
 <p>The name of the model compilation job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable compilationJobName;

@end

/**
 
 */
@interface AWSSageMakerServiceStopHyperParameterTuningJobRequest : AWSRequest


/**
 <p>The name of the tuning job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hyperParameterTuningJobName;

@end

/**
 
 */
@interface AWSSageMakerServiceStopLabelingJobRequest : AWSRequest


/**
 <p>The name of the labeling job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelingJobName;

@end

/**
 
 */
@interface AWSSageMakerServiceStopMonitoringScheduleRequest : AWSRequest


/**
 <p>The name of the schedule to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleName;

@end

/**
 
 */
@interface AWSSageMakerServiceStopNotebookInstanceInput : AWSRequest


/**
 <p>The name of the notebook instance to terminate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceName;

@end

/**
 
 */
@interface AWSSageMakerServiceStopProcessingJobRequest : AWSRequest


/**
 <p>The name of the processing job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable processingJobName;

@end

/**
 
 */
@interface AWSSageMakerServiceStopTrainingJobRequest : AWSRequest


/**
 <p>The name of the training job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobName;

@end

/**
 
 */
@interface AWSSageMakerServiceStopTransformJobRequest : AWSRequest


/**
 <p>The name of the transform job to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformJobName;

@end

/**
 <p>Specifies a limit to how long a model training or compilation job can run. It also specifies how long you are willing to wait for a managed spot training job to complete. When the job reaches the time limit, Amazon SageMaker ends the training or compilation job. Use this API to cap model training costs.</p><p>To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms can use this 120-second window to save the model artifacts, so the results of training are not lost. </p><p>The training algorithms provided by Amazon SageMaker automatically save the intermediate results of a model training job when possible. This attempt to save artifacts is only a best effort case as model might not be in a state from which it can be saved. For example, if training has just started, the model might not be ready to save. When saved, this intermediate data is a valid model artifact. You can use it to create a model with <code>CreateModel</code>.</p><note><p>The Neural Topic Model (NTM) currently does not support saving intermediate model artifacts. When training NTMs, make sure that the maximum runtime is sufficient for the training job to complete.</p></note>
 */
@interface AWSSageMakerServiceStoppingCondition : AWSModel


/**
 <p>The maximum length of time, in seconds, that the training or compilation job can run. If job does not complete during this time, Amazon SageMaker ends the job. If value is not specified, default value is 1 day. The maximum value is 28 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRuntimeInSeconds;

/**
 <p>The maximum length of time, in seconds, how long you are willing to wait for a managed spot training job to complete. It is the amount of time spent waiting for Spot capacity plus the amount of time the training job runs. It must be equal to or greater than <code>MaxRuntimeInSeconds</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxWaitTimeInSeconds;

@end

/**
 <p>Describes a work team of a vendor that does the a labelling job.</p>
 Required parameters: [WorkteamArn]
 */
@interface AWSSageMakerServiceSubscribedWorkteam : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable listingId;

/**
 <p>The description of the vendor from the Amazon Marketplace.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marketplaceDescription;

/**
 <p>The title of the service provided by the vendor in the Amazon Marketplace.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marketplaceTitle;

/**
 <p>The name of the vendor in the Amazon Marketplace.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sellerName;

/**
 <p>The Amazon Resource Name (ARN) of the vendor that you have subscribed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workteamArn;

@end

/**
 <p>Specified in the <a>GetSearchSuggestions</a> request. Limits the property names that are included in the response.</p>
 */
@interface AWSSageMakerServiceSuggestionQuery : AWSModel


/**
 <p>Defines a property name hint. Only property names that begin with the specified hint are included in the response.</p>
 */
@property (nonatomic, strong) AWSSageMakerServicePropertyNameQuery * _Nullable propertyNameQuery;

@end

/**
 <p>Describes a tag. </p>
 Required parameters: [Key, Value]
 */
@interface AWSSageMakerServiceTag : AWSModel


/**
 <p>The tag key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The tag value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The TensorBoard app settings.</p>
 */
@interface AWSSageMakerServiceTensorBoardAppSettings : AWSModel


/**
 <p>The default instance type and the Amazon Resource Name (ARN) of the SageMaker image created on the instance.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceResourceSpec * _Nullable defaultResourceSpec;

@end

/**
 <p>Configuration of storage locations for TensorBoard output.</p>
 Required parameters: [S3OutputPath]
 */
@interface AWSSageMakerServiceTensorBoardOutputConfig : AWSModel


/**
 <p>Path to local storage location for tensorBoard output. Defaults to <code>/opt/ml/output/tensorboard</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable localPath;

/**
 <p>Path to Amazon S3 storage location for TensorBoard output.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3OutputPath;

@end

/**
 <p>Contains information about a training job.</p>
 */
@interface AWSSageMakerServiceTrainingJob : AWSModel


/**
 <p>Information about the algorithm used for training, and algorithm metadata.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceAlgorithmSpecification * _Nullable algorithmSpecification;

/**
 <p>The Amazon Resource Name (ARN) of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoMLJobArn;

/**
 <p>The billable time in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable billableTimeInSeconds;

/**
 <p>Contains information about the output location for managed spot training checkpoint data. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceCheckpointConfig * _Nullable checkpointConfig;

/**
 <p>A timestamp that indicates when the training job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Configuration information for the debug hook parameters, collection configuration, and storage paths.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceDebugHookConfig * _Nullable debugHookConfig;

/**
 <p>Information about the debug rule configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceDebugRuleConfiguration *> * _Nullable debugRuleConfigurations;

/**
 <p>Information about the evaluation status of the rules for the training job.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceDebugRuleEvaluationStatus *> * _Nullable debugRuleEvaluationStatuses;

/**
 <p>To encrypt all communications between ML compute instances in distributed training, choose <code>True</code>. Encryption provides greater security for distributed training, but training might take longer. How long it takes depends on the amount of communication between compute instances, especially if you use a deep learning algorithm in distributed training.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableInterContainerTrafficEncryption;

/**
 <p>When true, enables managed spot training using Amazon EC2 Spot instances to run training jobs instead of on-demand instances. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html">Managed Spot Training</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableManagedSpotTraining;

/**
 <p>If the <code>TrainingJob</code> was created with network isolation, the value is set to <code>true</code>. If network isolation is enabled, nodes can't communicate beyond the VPC they run in.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableNetworkIsolation;

/**
 <p>Configuration for the experiment.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceExperimentConfig * _Nullable experimentConfig;

/**
 <p>If the training job failed, the reason it failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>A list of final metric values that are set when the training job completes. Used only if the training job was configured to use metrics.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceMetricData *> * _Nullable finalMetricDataList;

/**
 <p>Algorithm-specific parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable hyperParameters;

/**
 <p>An array of <code>Channel</code> objects that describes each data input channel.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceChannel *> * _Nullable inputDataConfig;

/**
 <p>The Amazon Resource Name (ARN) of the labeling job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable labelingJobArn;

/**
 <p>A timestamp that indicates when the status of the training job was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>Information about the Amazon S3 location that is configured for storing model artifacts.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceModelArtifacts * _Nullable modelArtifacts;

/**
 <p>The S3 path where model artifacts that you configured when creating the job are stored. Amazon SageMaker creates subfolders for model artifacts.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>Resources, including ML compute instances and ML storage volumes, that are configured for model training.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceResourceConfig * _Nullable resourceConfig;

/**
 <p>The AWS Identity and Access Management (IAM) role configured for the training job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p> Provides detailed information about the state of the training job. For detailed information about the secondary status of the training job, see <code>StatusMessage</code> under <a>SecondaryStatusTransition</a>.</p><p>Amazon SageMaker provides primary statuses and secondary statuses that apply to each of them:</p><dl><dt>InProgress</dt><dd><ul><li><p><code>Starting</code> - Starting the training job.</p></li><li><p><code>Downloading</code> - An optional stage for algorithms that support <code>File</code> training input mode. It indicates that data is being downloaded to the ML storage volumes.</p></li><li><p><code>Training</code> - Training is in progress.</p></li><li><p><code>Uploading</code> - Training is complete and the model artifacts are being uploaded to the S3 location.</p></li></ul></dd><dt>Completed</dt><dd><ul><li><p><code>Completed</code> - The training job has completed.</p></li></ul></dd><dt>Failed</dt><dd><ul><li><p><code>Failed</code> - The training job has failed. The reason for the failure is returned in the <code>FailureReason</code> field of <code>DescribeTrainingJobResponse</code>.</p></li></ul></dd><dt>Stopped</dt><dd><ul><li><p><code>MaxRuntimeExceeded</code> - The job stopped because it exceeded the maximum allowed runtime.</p></li><li><p><code>Stopped</code> - The training job has stopped.</p></li></ul></dd><dt>Stopping</dt><dd><ul><li><p><code>Stopping</code> - Stopping the training job.</p></li></ul></dd></dl><important><p>Valid values for <code>SecondaryStatus</code> are subject to change. </p></important><p>We no longer support the following secondary statuses:</p><ul><li><p><code>LaunchingMLInstances</code></p></li><li><p><code>PreparingTrainingStack</code></p></li><li><p><code>DownloadingTrainingImage</code></p></li></ul>
 */
@property (nonatomic, assign) AWSSageMakerServiceSecondaryStatus secondaryStatus;

/**
 <p>A history of all of the secondary statuses that the training job has transitioned through.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceSecondaryStatusTransition *> * _Nullable secondaryStatusTransitions;

/**
 <p>Specifies a limit to how long a model training job can run. When the job reaches the time limit, Amazon SageMaker ends the training job. Use this API to cap model training costs.</p><p>To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code> signal, which delays job termination for 120 seconds. Algorithms can use this 120-second window to save the model artifacts, so the results of training are not lost. </p>
 */
@property (nonatomic, strong) AWSSageMakerServiceStoppingCondition * _Nullable stoppingCondition;

/**
 <p>An array of key-value pairs. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>Configuration of storage locations for TensorBoard output.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTensorBoardOutputConfig * _Nullable tensorBoardOutputConfig;

/**
 <p>Indicates the time when the training job ends on training instances. You are billed for the time interval between the value of <code>TrainingStartTime</code> and this time. For successful jobs and stopped jobs, this is the time after model artifacts are uploaded. For failed jobs, this is the time when Amazon SageMaker detects a job failure.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable trainingEndTime;

/**
 <p>The Amazon Resource Name (ARN) of the training job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobArn;

/**
 <p>The name of the training job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobName;

/**
 <p>The status of the training job.</p><p>Training job statuses are:</p><ul><li><p><code>InProgress</code> - The training is in progress.</p></li><li><p><code>Completed</code> - The training job has completed.</p></li><li><p><code>Failed</code> - The training job has failed. To see the reason for the failure, see the <code>FailureReason</code> field in the response to a <code>DescribeTrainingJobResponse</code> call.</p></li><li><p><code>Stopping</code> - The training job is stopping.</p></li><li><p><code>Stopped</code> - The training job has stopped.</p></li></ul><p>For more detailed information, see <code>SecondaryStatus</code>. </p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTrainingJobStatus trainingJobStatus;

/**
 <p>Indicates the time when the training job starts on training instances. You are billed for the time interval between this time and the value of <code>TrainingEndTime</code>. The start time in CloudWatch Logs might be later than this time. The difference is due to the time it takes to download the training data and to the size of the training container.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable trainingStartTime;

/**
 <p>The training time in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable trainingTimeInSeconds;

/**
 <p>The Amazon Resource Name (ARN) of the associated hyperparameter tuning job if the training job was launched by a hyperparameter tuning job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tuningJobArn;

/**
 <p>A <a>VpcConfig</a> object that specifies the VPC that this training job has access to. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html">Protect Training Jobs by Using an Amazon Virtual Private Cloud</a>.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceVpcConfig * _Nullable vpcConfig;

@end

/**
 <p>Defines the input needed to run a training job using the algorithm.</p>
 Required parameters: [TrainingInputMode, InputDataConfig, OutputDataConfig, ResourceConfig, StoppingCondition]
 */
@interface AWSSageMakerServiceTrainingJobDefinition : AWSModel


/**
 <p>The hyperparameters used for the training job.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable hyperParameters;

/**
 <p>An array of <code>Channel</code> objects, each of which specifies an input source.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceChannel *> * _Nullable inputDataConfig;

/**
 <p>the path to the S3 bucket where you want to store model artifacts. Amazon SageMaker creates subfolders for the artifacts.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The resources, including the ML compute instances and ML storage volumes, to use for model training.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceResourceConfig * _Nullable resourceConfig;

/**
 <p>Specifies a limit to how long a model training job can run. When the job reaches the time limit, Amazon SageMaker ends the training job. Use this API to cap model training costs.</p><p>To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal, which delays job termination for 120 seconds. Algorithms can use this 120-second window to save the model artifacts.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceStoppingCondition * _Nullable stoppingCondition;

/**
 <p>The input mode used by the algorithm for the training job. For the input modes that Amazon SageMaker algorithms support, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>.</p><p>If an algorithm supports the <code>File</code> input mode, Amazon SageMaker downloads the training data from S3 to the provisioned ML storage Volume, and mounts the directory to docker volume for training container. If an algorithm supports the <code>Pipe</code> input mode, Amazon SageMaker streams data directly from S3 to the container.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTrainingInputMode trainingInputMode;

@end

/**
 <p>The numbers of training jobs launched by a hyperparameter tuning job, categorized by status.</p>
 */
@interface AWSSageMakerServiceTrainingJobStatusCounters : AWSModel


/**
 <p>The number of completed training jobs launched by the hyperparameter tuning job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable completed;

/**
 <p>The number of in-progress training jobs launched by a hyperparameter tuning job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inProgress;

/**
 <p>The number of training jobs that failed and can't be retried. A failed training job can't be retried if it failed because a client error occurred.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable nonRetryableError;

/**
 <p>The number of training jobs that failed, but can be retried. A failed training job can be retried only if it failed because an internal service error occurred.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retryableError;

/**
 <p>The number of training jobs launched by a hyperparameter tuning job that were manually stopped.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stopped;

@end

/**
 <p>Provides summary information about a training job.</p>
 Required parameters: [TrainingJobName, TrainingJobArn, CreationTime, TrainingJobStatus]
 */
@interface AWSSageMakerServiceTrainingJobSummary : AWSModel


/**
 <p>A timestamp that shows when the training job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p> Timestamp when the training job was last modified. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>A timestamp that shows when the training job ended. This field is set only if the training job has one of the terminal statuses (<code>Completed</code>, <code>Failed</code>, or <code>Stopped</code>). </p>
 */
@property (nonatomic, strong) NSDate * _Nullable trainingEndTime;

/**
 <p>The Amazon Resource Name (ARN) of the training job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobArn;

/**
 <p>The name of the training job that you want a summary for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingJobName;

/**
 <p>The status of the training job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTrainingJobStatus trainingJobStatus;

@end

/**
 <p>Defines how the algorithm is used for a training job.</p>
 Required parameters: [TrainingImage, SupportedTrainingInstanceTypes, TrainingChannels]
 */
@interface AWSSageMakerServiceTrainingSpecification : AWSModel


/**
 <p>A list of <code>MetricDefinition</code> objects, which are used for parsing metrics generated by the algorithm.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceMetricDefinition *> * _Nullable metricDefinitions;

/**
 <p>A list of the <code>HyperParameterSpecification</code> objects, that define the supported hyperparameters. This is required if the algorithm supports automatic model tuning.&gt;</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceHyperParameterSpecification *> * _Nullable supportedHyperParameters;

/**
 <p>A list of the instance types that this algorithm can use for training.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedTrainingInstanceTypes;

/**
 <p>A list of the metrics that the algorithm emits that can be used as the objective metric in a hyperparameter tuning job.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceHyperParameterTuningJobObjective *> * _Nullable supportedTuningJobObjectiveMetrics;

/**
 <p>Indicates whether the algorithm supports distributed training. If set to false, buyers can't request more than one instance during training.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsDistributedTraining;

/**
 <p>A list of <code>ChannelSpecification</code> objects, which specify the input sources to be used by the algorithm.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceChannelSpecification *> * _Nullable trainingChannels;

/**
 <p>The Amazon ECR registry path of the Docker image that contains the training algorithm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingImage;

/**
 <p>An MD5 hash of the training algorithm that identifies the Docker image used for training.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trainingImageDigest;

@end

/**
 <p>Describes the location of the channel data.</p>
 Required parameters: [S3DataSource]
 */
@interface AWSSageMakerServiceTransformDataSource : AWSModel


/**
 <p>The S3 location of the data source that is associated with a channel.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTransformS3DataSource * _Nullable s3DataSource;

@end

/**
 <p>Describes the input source of a transform job and the way the transform job consumes it.</p>
 Required parameters: [DataSource]
 */
@interface AWSSageMakerServiceTransformInput : AWSModel


/**
 <p>If your transform data is compressed, specify the compression type. Amazon SageMaker automatically decompresses the data for the transform job accordingly. The default value is <code>None</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceCompressionType compressionType;

/**
 <p>The multipurpose internet mail extension (MIME) type of the data. Amazon SageMaker uses the MIME type with each http call to transfer data to the transform job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>Describes the location of the channel data, which is, the S3 location of the input data that the model can consume.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTransformDataSource * _Nullable dataSource;

/**
 <p>The method to use to split the transform job's data files into smaller batches. Splitting is necessary when the total size of each object is too large to fit in a single request. You can also use data splitting to improve performance by processing multiple concurrent mini-batches. The default value for <code>SplitType</code> is <code>None</code>, which indicates that input data files are not split, and request payloads contain the entire contents of an input object. Set the value of this parameter to <code>Line</code> to split records on a newline character boundary. <code>SplitType</code> also supports a number of record-oriented binary data formats.</p><p>When splitting is enabled, the size of a mini-batch depends on the values of the <code>BatchStrategy</code> and <code>MaxPayloadInMB</code> parameters. When the value of <code>BatchStrategy</code> is <code>MultiRecord</code>, Amazon SageMaker sends the maximum number of records in each request, up to the <code>MaxPayloadInMB</code> limit. If the value of <code>BatchStrategy</code> is <code>SingleRecord</code>, Amazon SageMaker sends individual records in each request.</p><note><p>Some data formats represent a record as a binary payload wrapped with extra padding bytes. When splitting is applied to a binary data format, padding is removed if the value of <code>BatchStrategy</code> is set to <code>SingleRecord</code>. Padding is not removed if the value of <code>BatchStrategy</code> is set to <code>MultiRecord</code>.</p><p>For more information about <code>RecordIO</code>, see <a href="https://mxnet.apache.org/api/faq/recordio">Create a Dataset Using RecordIO</a> in the MXNet documentation. For more information about <code>TFRecord</code>, see <a href="https://www.tensorflow.org/guide/datasets#consuming_tfrecord_data">Consuming TFRecord data</a> in the TensorFlow documentation.</p></note>
 */
@property (nonatomic, assign) AWSSageMakerServiceSplitType splitType;

@end

/**
 <p>Defines the input needed to run a transform job using the inference specification specified in the algorithm.</p>
 Required parameters: [TransformInput, TransformOutput, TransformResources]
 */
@interface AWSSageMakerServiceTransformJobDefinition : AWSModel


/**
 <p>A string that determines the number of records included in a single mini-batch.</p><p><code>SingleRecord</code> means only one record is used per mini-batch. <code>MultiRecord</code> means a mini-batch is set to contain as many records that can fit within the <code>MaxPayloadInMB</code> limit.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceBatchStrategy batchStrategy;

/**
 <p>The environment variables to set in the Docker container. We support up to 16 key and values entries in the map.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable environment;

/**
 <p>The maximum number of parallel requests that can be sent to each instance in a transform job. The default value is 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxConcurrentTransforms;

/**
 <p>The maximum payload size allowed, in MB. A payload is the data portion of a record (without metadata).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxPayloadInMB;

/**
 <p>A description of the input source and the way the transform job consumes it.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTransformInput * _Nullable transformInput;

/**
 <p>Identifies the Amazon S3 location where you want Amazon SageMaker to save the results from the transform job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTransformOutput * _Nullable transformOutput;

/**
 <p>Identifies the ML compute instances for the transform job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTransformResources * _Nullable transformResources;

@end

/**
 <p>Provides a summary of a transform job. Multiple <code>TransformJobSummary</code> objects are returned as a list after in response to a <a>ListTransformJobs</a> call.</p>
 Required parameters: [TransformJobName, TransformJobArn, CreationTime, TransformJobStatus]
 */
@interface AWSSageMakerServiceTransformJobSummary : AWSModel


/**
 <p>A timestamp that shows when the transform Job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>If the transform job failed, the reason it failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>Indicates when the transform job was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>Indicates when the transform job ends on compute instances. For successful jobs and stopped jobs, this is the exact time recorded after the results are uploaded. For failed jobs, this is when Amazon SageMaker detected that the job failed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable transformEndTime;

/**
 <p>The Amazon Resource Name (ARN) of the transform job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformJobArn;

/**
 <p>The name of the transform job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transformJobName;

/**
 <p>The status of the transform job.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTransformJobStatus transformJobStatus;

@end

/**
 <p>Describes the results of a transform job.</p>
 Required parameters: [S3OutputPath]
 */
@interface AWSSageMakerServiceTransformOutput : AWSModel


/**
 <p>The MIME type used to specify the output data. Amazon SageMaker uses the MIME type with each http call to transfer data from the transform job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accept;

/**
 <p>Defines how to assemble the results of the transform job as a single S3 object. Choose a format that is most convenient to you. To concatenate the results in binary format, specify <code>None</code>. To add a newline character at the end of every transformed record, specify <code>Line</code>.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceAssemblyType assembleWith;

/**
 <p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the model artifacts at rest using Amazon S3 server-side encryption. The <code>KmsKeyId</code> can be any of the following formats: </p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias name ARN: <code>arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias</code></p></li></ul><p>If you don't provide a KMS key ID, Amazon SageMaker uses the default KMS key for Amazon S3 for your role's account. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html">KMS-Managed Encryption Keys</a> in the <i>Amazon Simple Storage Service Developer Guide.</i></p><p>The KMS key policy must grant permission to the IAM role that you specify in your <a>CreateModel</a> request. For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">Using Key Policies in AWS KMS</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The Amazon S3 path where you want Amazon SageMaker to store the results of the transform job. For example, <code>s3://bucket-name/key-name-prefix</code>.</p><p>For every S3 object used as input for the transform job, batch transform stores the transformed data with an .<code>out</code> suffix in a corresponding subfolder in the location in the output prefix. For example, for the input data stored at <code>s3://bucket-name/input-name-prefix/dataset01/data.csv</code>, batch transform stores the transformed data at <code>s3://bucket-name/output-name-prefix/input-name-prefix/data.csv.out</code>. Batch transform doesn't upload partially processed objects. For an input S3 object that contains multiple records, it creates an .<code>out</code> file only if the transform job succeeds on the entire file. When the input contains multiple S3 objects, the batch transform job processes the listed S3 objects and uploads only the output for successfully processed objects. If any object fails in the transform job batch transform marks the job as failed to prompt investigation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3OutputPath;

@end

/**
 <p>Describes the resources, including ML instance types and ML instance count, to use for transform job.</p>
 Required parameters: [InstanceType, InstanceCount]
 */
@interface AWSSageMakerServiceTransformResources : AWSModel


/**
 <p>The number of ML compute instances to use in the transform job. For distributed transform jobs, specify a value greater than 1. The default value is <code>1</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>The ML compute instance type for the transform job. If you are using built-in algorithms to transform moderately sized datasets, we recommend using ml.m4.xlarge or <code>ml.m5.large</code> instance types.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTransformInstanceType instanceType;

/**
 <p>The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt model data on the storage volume attached to the ML compute instance(s) that run the batch transform job. The <code>VolumeKmsKeyId</code> can be any of the following formats:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias name ARN: <code>arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable volumeKmsKeyId;

@end

/**
 <p>Describes the S3 data source.</p>
 Required parameters: [S3DataType, S3Uri]
 */
@interface AWSSageMakerServiceTransformS3DataSource : AWSModel


/**
 <p>If you choose <code>S3Prefix</code>, <code>S3Uri</code> identifies a key name prefix. Amazon SageMaker uses all objects with the specified key name prefix for batch transform. </p><p>If you choose <code>ManifestFile</code>, <code>S3Uri</code> identifies an object that is a manifest file containing a list of object keys that you want Amazon SageMaker to use for batch transform. </p><p>The following values are compatible: <code>ManifestFile</code>, <code>S3Prefix</code></p><p>The following value is not compatible: <code>AugmentedManifestFile</code></p>
 */
@property (nonatomic, assign) AWSSageMakerServiceS3DataType s3DataType;

/**
 <p>Depending on the value specified for the <code>S3DataType</code>, identifies either a key name prefix or a manifest. For example:</p><ul><li><p> A key name prefix might look like this: <code>s3://bucketname/exampleprefix</code>. </p></li><li><p> A manifest might look like this: <code>s3://bucketname/example.manifest</code></p><p> The manifest is an S3 object which is a JSON file with the following format: </p><p><code>[ {"prefix": "s3://customer_bucket/some/prefix/"},</code></p><p><code>"relative/path/to/custdata-1",</code></p><p><code>"relative/path/custdata-2",</code></p><p><code>...</code></p><p><code>"relative/path/custdata-N"</code></p><p><code>]</code></p><p> The preceding JSON matches the following <code>s3Uris</code>: </p><p><code>s3://customer_bucket/some/prefix/relative/path/to/custdata-1</code></p><p><code>s3://customer_bucket/some/prefix/relative/path/custdata-2</code></p><p><code>...</code></p><p><code>s3://customer_bucket/some/prefix/relative/path/custdata-N</code></p><p> The complete set of <code>S3Uris</code> in this manifest constitutes the input data for the channel for this datasource. The object that each <code>S3Uris</code> points to must be readable by the IAM role that Amazon SageMaker uses to perform tasks on your behalf.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>The properties of a trial as returned by the <a>Search</a> API.</p>
 */
@interface AWSSageMakerServiceTrial : AWSModel


/**
 <p>Information about the user who created or modified an experiment, trial, or trial component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable createdBy;

/**
 <p>When the trial was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The name of the trial as displayed. If <code>DisplayName</code> isn't specified, <code>TrialName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The name of the experiment the trial is part of.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentName;

/**
 <p>Information about the user who created or modified an experiment, trial, or trial component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable lastModifiedBy;

/**
 <p>Who last modified the trial.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The source of the trial.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrialSource * _Nullable source;

/**
 <p>The list of tags that are associated with the trial. You can use <a>Search</a> API to search on the tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>The Amazon Resource Name (ARN) of the trial.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialArn;

/**
 <p>A list of the components associated with the trial. For each component, a summary of the component's properties is included.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTrialComponentSimpleSummary *> * _Nullable trialComponentSummaries;

/**
 <p>The name of the trial.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialName;

@end

/**
 <p>The properties of a trial component as returned by the <a>Search</a> API.</p>
 */
@interface AWSSageMakerServiceTrialComponent : AWSModel


/**
 <p>Information about the user who created or modified an experiment, trial, or trial component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable createdBy;

/**
 <p>When the component was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The name of the component as displayed. If <code>DisplayName</code> isn't specified, <code>TrialComponentName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>When the component ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The input artifacts of the component.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSageMakerServiceTrialComponentArtifact *> * _Nullable inputArtifacts;

/**
 <p>Information about the user who created or modified an experiment, trial, or trial component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable lastModifiedBy;

/**
 <p>When the component was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The metrics for the component.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTrialComponentMetricSummary *> * _Nullable metrics;

/**
 <p>The output artifacts of the component.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSageMakerServiceTrialComponentArtifact *> * _Nullable outputArtifacts;

/**
 <p>The hyperparameters of the component.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSageMakerServiceTrialComponentParameterValue *> * _Nullable parameters;

/**
 <p>An array of the parents of the component. A parent is a trial the component is associated with and the experiment the trial is part of. A component might not have any parents.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceParent *> * _Nullable parents;

/**
 <p>The Amazon Resource Name (ARN) and job type of the source of the component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrialComponentSource * _Nullable source;

/**
 <p>Details of the source of the component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrialComponentSourceDetail * _Nullable sourceDetail;

/**
 <p>When the component started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The status of the trial component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrialComponentStatus * _Nullable status;

/**
 <p>The list of tags that are associated with the component. You can use <a>Search</a> API to search on the tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceTag *> * _Nullable tags;

/**
 <p>The Amazon Resource Name (ARN) of the trial component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentArn;

/**
 <p>The name of the trial component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentName;

@end

/**
 <p>Represents an input or output artifact of a trial component. You specify <code>TrialComponentArtifact</code> as part of the <code>InputArtifacts</code> and <code>OutputArtifacts</code> parameters in the <a>CreateTrialComponent</a> request.</p><p>Examples of input artifacts are datasets, algorithms, hyperparameters, source code, and instance types. Examples of output artifacts are metrics, snapshots, logs, and images.</p>
 Required parameters: [Value]
 */
@interface AWSSageMakerServiceTrialComponentArtifact : AWSModel


/**
 <p>The media type of the artifact, which indicates the type of data in the artifact file. The media type consists of a <i>type</i> and a <i>subtype</i> concatenated with a slash (/) character, for example, text/csv, image/jpeg, and s3/uri. The type specifies the category of the media. The subtype specifies the kind of data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaType;

/**
 <p>The location of the artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>A summary of the metrics of a trial component.</p>
 */
@interface AWSSageMakerServiceTrialComponentMetricSummary : AWSModel


/**
 <p>The average value of the metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable avg;

/**
 <p>The number of samples used to generate the metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The most recent value of the metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable last;

/**
 <p>The maximum value of the metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max;

/**
 <p>The name of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The minimum value of the metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable min;

/**
 <p>The Amazon Resource Name (ARN) of the source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>The standard deviation of the metric.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stdDev;

/**
 <p>When the metric was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timeStamp;

@end

/**
 <p>The value of a hyperparameter. Only one of <code>NumberValue</code> or <code>StringValue</code> can be specified.</p><p>This object is specified in the <a>CreateTrialComponent</a> request.</p>
 */
@interface AWSSageMakerServiceTrialComponentParameterValue : AWSModel


/**
 <p>The numeric value of a numeric hyperparameter. If you specify a value for this parameter, you can't specify the <code>StringValue</code> parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberValue;

/**
 <p>The string value of a categorical hyperparameter. If you specify a value for this parameter, you can't specify the <code>NumberValue</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stringValue;

@end

/**
 <p>A short summary of a trial component.</p>
 */
@interface AWSSageMakerServiceTrialComponentSimpleSummary : AWSModel


/**
 <p>Information about the user who created or modified an experiment, trial, or trial component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable createdBy;

/**
 <p>When the component was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The Amazon Resource Name (ARN) of the trial component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentArn;

/**
 <p>The name of the trial component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentName;

/**
 <p>The Amazon Resource Name (ARN) and job type of the source of a trial component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrialComponentSource * _Nullable trialComponentSource;

@end

/**
 <p>The Amazon Resource Name (ARN) and job type of the source of a trial component.</p>
 Required parameters: [SourceArn]
 */
@interface AWSSageMakerServiceTrialComponentSource : AWSModel


/**
 <p>The source ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>The source job type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

@end

/**
 <p>Detailed information about the source of a trial component. Either <code>ProcessingJob</code> or <code>TrainingJob</code> is returned.</p>
 */
@interface AWSSageMakerServiceTrialComponentSourceDetail : AWSModel


/**
 <p>Information about a processing job that's the source of a trial component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceProcessingJob * _Nullable processingJob;

/**
 <p>The Amazon Resource Name (ARN) of the source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>Information about a training job that's the source of a trial component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrainingJob * _Nullable trainingJob;

@end

/**
 <p>The status of the trial component.</p>
 */
@interface AWSSageMakerServiceTrialComponentStatus : AWSModel


/**
 <p>If the component failed, a message describing why.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The status of the trial component.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceTrialComponentPrimaryStatus primaryStatus;

@end

/**
 <p>A summary of the properties of a trial component. To get all the properties, call the <a>DescribeTrialComponent</a> API and provide the <code>TrialComponentName</code>.</p>
 */
@interface AWSSageMakerServiceTrialComponentSummary : AWSModel


/**
 <p>Who created the component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable createdBy;

/**
 <p>When the component was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The name of the component as displayed. If <code>DisplayName</code> isn't specified, <code>TrialComponentName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>When the component ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>Who last modified the component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserContext * _Nullable lastModifiedBy;

/**
 <p>When the component was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>When the component started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The status of the component. States include:</p><ul><li><p>InProgress</p></li><li><p>Completed</p></li><li><p>Failed</p></li></ul>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrialComponentStatus * _Nullable status;

/**
 <p>The ARN of the trial component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentArn;

/**
 <p>The name of the trial component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentName;

/**
 <p>The Amazon Resource Name (ARN) and job type of the source of a trial component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrialComponentSource * _Nullable trialComponentSource;

@end

/**
 <p>The source of the trial.</p>
 Required parameters: [SourceArn]
 */
@interface AWSSageMakerServiceTrialSource : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 <p>The source job type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

@end

/**
 <p>A summary of the properties of a trial. To get the complete set of properties, call the <a>DescribeTrial</a> API and provide the <code>TrialName</code>.</p>
 */
@interface AWSSageMakerServiceTrialSummary : AWSModel


/**
 <p>When the trial was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The name of the trial as displayed. If <code>DisplayName</code> isn't specified, <code>TrialName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>When the trial was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The Amazon Resource Name (ARN) of the trial.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialArn;

/**
 <p>The name of the trial.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialName;

/**
 <p>The source of the trial.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrialSource * _Nullable trialSource;

@end

/**
 <p>The job completion criteria.</p>
 Required parameters: [TargetObjectiveMetricValue]
 */
@interface AWSSageMakerServiceTuningJobCompletionCriteria : AWSModel


/**
 <p>The objective metric's value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetObjectiveMetricValue;

@end

/**
 <p>Represents an amount of money in United States dollars/</p>
 */
@interface AWSSageMakerServiceUSD : AWSModel


/**
 <p>The fractional portion, in cents, of the amount. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cents;

/**
 <p>The whole number of dollars in the amount.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dollars;

/**
 <p>Fractions of a cent, in tenths.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tenthFractionsOfACent;

@end

/**
 <p>Provided configuration information for the worker UI for a labeling job. </p>
 */
@interface AWSSageMakerServiceUiConfig : AWSModel


/**
 <p>The Amazon S3 bucket location of the UI template. For more information about the contents of a UI template, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-custom-templates-step2.html"> Creating Your Custom Labeling Task Template</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uiTemplateS3Uri;

@end

/**
 <p>The Liquid template for the worker user interface.</p>
 Required parameters: [Content]
 */
@interface AWSSageMakerServiceUiTemplate : AWSModel


/**
 <p>The content of the Liquid template for the worker user interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

@end

/**
 <p>Container for user interface template information.</p>
 */
@interface AWSSageMakerServiceUiTemplateInfo : AWSModel


/**
 <p>The SHA-256 digest of the contents of the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentSha256;

/**
 <p>The URL for the user interface template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateCodeRepositoryInput : AWSRequest


/**
 <p>The name of the Git repository to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeRepositoryName;

/**
 <p>The configuration of the git repository, including the URL and the Amazon Resource Name (ARN) of the AWS Secrets Manager secret that contains the credentials used to access the repository. The secret must have a staging label of <code>AWSCURRENT</code> and must be in the following format:</p><p><code>{"username": <i>UserName</i>, "password": <i>Password</i>}</code></p>
 */
@property (nonatomic, strong) AWSSageMakerServiceGitConfigForUpdate * _Nullable gitConfig;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateCodeRepositoryOutput : AWSModel


/**
 <p>The ARN of the Git repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable codeRepositoryArn;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateDomainRequest : AWSRequest


/**
 <p>A collection of settings.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserSettings * _Nullable defaultUserSettings;

/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateDomainResponse : AWSModel


/**
 <p>The domain Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainArn;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateEndpointInput : AWSRequest


/**
 <p>The name of the new endpoint configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointConfigName;

/**
 <p>The name of the endpoint whose configuration you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

/**
 <p>When you are updating endpoint resources with <a>UpdateEndpointInput$RetainAllVariantProperties</a>, whose value is set to <code>true</code>, <code>ExcludeRetainedVariantProperties</code> specifies the list of type <a>VariantProperty</a> to override with the values provided by <code>EndpointConfig</code>. If you don't specify a value for <code>ExcludeAllVariantProperties</code>, no variant properties are overridden. </p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceVariantProperty *> * _Nullable excludeRetainedVariantProperties;

/**
 <p>When updating endpoint resources, enables or disables the retention of variant properties, such as the instance count or the variant weight. To retain the variant properties of an endpoint when updating it, set <code>RetainAllVariantProperties</code> to <code>true</code>. To use the variant properties specified in a new <code>EndpointConfig</code> call when updating an endpoint, set <code>RetainAllVariantProperties</code> to <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retainAllVariantProperties;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateEndpointOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesInput : AWSRequest


/**
 <p>An object that provides new capacity and weight values for a variant.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceDesiredWeightAndCapacity *> * _Nullable desiredWeightsAndCapacities;

/**
 <p>The name of an existing Amazon SageMaker endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointName;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the updated endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateExperimentRequest : AWSRequest


/**
 <p>The description of the experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the experiment as displayed. The name doesn't need to be unique. If <code>DisplayName</code> isn't specified, <code>ExperimentName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The name of the experiment to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentName;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateExperimentResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the experiment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable experimentArn;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateMonitoringScheduleRequest : AWSRequest


/**
 <p>The configuration object that specifies the monitoring schedule and defines the monitoring job.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceMonitoringScheduleConfig * _Nullable monitoringScheduleConfig;

/**
 <p>The name of the monitoring schedule. The name must be unique within an AWS Region within an AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleName;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateMonitoringScheduleResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the monitoring schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoringScheduleArn;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateNotebookInstanceInput : AWSRequest


/**
 <p>A list of the Elastic Inference (EI) instance types to associate with this notebook instance. Currently only one EI instance type can be associated with a notebook instance. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html">Using Elastic Inference in Amazon SageMaker</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable acceleratorTypes;

/**
 <p>An array of up to three Git repositories to associate with the notebook instance. These can be either the names of Git repositories stored as resources in your account, or the URL of Git repositories in <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit</a> or in any other Git repository. These repositories are cloned at the same level as the default repository of your notebook instance. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalCodeRepositories;

/**
 <p>The Git repository to associate with the notebook instance as its default code repository. This can be either the name of a Git repository stored as a resource in your account, or the URL of a Git repository in <a href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS CodeCommit</a> or in any other Git repository. When you open a notebook instance, it opens in the directory that contains this repository. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating Git Repositories with Amazon SageMaker Notebook Instances</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultCodeRepository;

/**
 <p>A list of the Elastic Inference (EI) instance types to remove from this notebook instance. This operation is idempotent. If you specify an accelerator type that is not associated with the notebook instance when you call this method, it does not throw an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disassociateAcceleratorTypes;

/**
 <p>A list of names or URLs of the default Git repositories to remove from this notebook instance. This operation is idempotent. If you specify a Git repository that is not associated with the notebook instance when you call this method, it does not throw an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disassociateAdditionalCodeRepositories;

/**
 <p>The name or URL of the default Git repository to remove from this notebook instance. This operation is idempotent. If you specify a Git repository that is not associated with the notebook instance when you call this method, it does not throw an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disassociateDefaultCodeRepository;

/**
 <p>Set to <code>true</code> to remove the notebook instance lifecycle configuration currently associated with the notebook instance. This operation is idempotent. If you specify a lifecycle configuration that is not associated with the notebook instance when you call this method, it does not throw an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disassociateLifecycleConfig;

/**
 <p>The Amazon ML compute instance type.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceInstanceType instanceType;

/**
 <p>The name of a lifecycle configuration to associate with the notebook instance. For information about lifestyle configurations, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step 2.1: (Optional) Customize a Notebook Instance</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleConfigName;

/**
 <p>The name of the notebook instance to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceName;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker can assume to access the notebook instance. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html">Amazon SageMaker Roles</a>. </p><note><p>To be able to pass this role to Amazon SageMaker, the caller of this API must have the <code>iam:PassRole</code> permission.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Whether root access is enabled or disabled for users of the notebook instance. The default value is <code>Enabled</code>.</p><note><p>If you set this to <code>Disabled</code>, users don't have root access on the notebook instance, but lifecycle configuration scripts still run with root permissions.</p></note>
 */
@property (nonatomic, assign) AWSSageMakerServiceRootAccess rootAccess;

/**
 <p>The size, in GB, of the ML storage volume to attach to the notebook instance. The default value is 5 GB. ML storage volumes are encrypted, so Amazon SageMaker can't determine the amount of available free space on the volume. Because of this, you can increase the volume size when you update a notebook instance, but you can't decrease the volume size. If you want to decrease the size of the ML storage volume in use, create a new notebook instance with the desired size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSizeInGB;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigInput : AWSRequest


/**
 <p>The name of the lifecycle configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notebookInstanceLifecycleConfigName;

/**
 <p>The shell script that runs only once, when you create a notebook instance. The shell script must be a base64-encoded string.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceNotebookInstanceLifecycleHook *> * _Nullable onCreate;

/**
 <p>The shell script that runs every time you start a notebook instance, including when you create the notebook instance. The shell script must be a base64-encoded string.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceNotebookInstanceLifecycleHook *> * _Nullable onStart;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigOutput : AWSModel


@end

/**
 
 */
@interface AWSSageMakerServiceUpdateNotebookInstanceOutput : AWSModel


@end

/**
 
 */
@interface AWSSageMakerServiceUpdateTrialComponentRequest : AWSRequest


/**
 <p>The name of the component as displayed. The name doesn't need to be unique. If <code>DisplayName</code> isn't specified, <code>TrialComponentName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>When the component ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>Replaces all of the component's input artifacts with the specified artifacts.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSageMakerServiceTrialComponentArtifact *> * _Nullable inputArtifacts;

/**
 <p>The input artifacts to remove from the component.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inputArtifactsToRemove;

/**
 <p>Replaces all of the component's output artifacts with the specified artifacts.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSageMakerServiceTrialComponentArtifact *> * _Nullable outputArtifacts;

/**
 <p>The output artifacts to remove from the component.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable outputArtifactsToRemove;

/**
 <p>Replaces all of the component's hyperparameters with the specified hyperparameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSSageMakerServiceTrialComponentParameterValue *> * _Nullable parameters;

/**
 <p>The hyperparameters to remove from the component.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable parametersToRemove;

/**
 <p>When the component started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The new status of the component.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTrialComponentStatus * _Nullable status;

/**
 <p>The name of the component to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentName;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateTrialComponentResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the trial component.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialComponentArn;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateTrialRequest : AWSRequest


/**
 <p>The name of the trial as displayed. The name doesn't need to be unique. If <code>DisplayName</code> isn't specified, <code>TrialName</code> is displayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The name of the trial to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialName;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateTrialResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the trial.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trialArn;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateUserProfileRequest : AWSRequest


/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The user profile name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileName;

/**
 <p>A collection of settings.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceUserSettings * _Nullable userSettings;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateUserProfileResponse : AWSModel


/**
 <p>The user profile Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileArn;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateWorkforceRequest : AWSRequest


/**
 <p>A list of one to four worker IP address ranges (<a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>) that can be used to access tasks assigned to this workforce.</p><p>Maximum: Four CIDR values</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceSourceIpConfig * _Nullable sourceIpConfig;

/**
 <p>The name of the private workforce whose access you want to restrict. <code>WorkforceName</code> is automatically set to <code>default</code> when a workforce is created and cannot be modified. </p>
 */
@property (nonatomic, strong) NSString * _Nullable workforceName;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateWorkforceResponse : AWSModel


/**
 <p>A single private workforce, which is automatically created when you create your first private work team. You can create one private work force in each AWS Region. By default, any workforce-related API operation used in a specific region will apply to the workforce created in that region. To learn how to create a private workforce, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private.html">Create a Private Workforce</a>.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceWorkforce * _Nullable workforce;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateWorkteamRequest : AWSRequest


/**
 <p>An updated description for the work team.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A list of <code>MemberDefinition</code> objects that contain the updated work team members.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceMemberDefinition *> * _Nullable memberDefinitions;

/**
 <p>Configures SNS topic notifications for available or expiring work items</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceNotificationConfiguration * _Nullable notificationConfiguration;

/**
 <p>The name of the work team to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workteamName;

@end

/**
 
 */
@interface AWSSageMakerServiceUpdateWorkteamResponse : AWSModel


/**
 <p>A <code>Workteam</code> object that describes the updated work team.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceWorkteam * _Nullable workteam;

@end

/**
 <p>Information about the user who created or modified an experiment, trial, or trial component.</p>
 */
@interface AWSSageMakerServiceUserContext : AWSModel


/**
 <p>The domain associated with the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The Amazon Resource Name (ARN) of the user's profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileArn;

/**
 <p>The name of the user's profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileName;

@end

/**
 <p>The user profile details.</p>
 */
@interface AWSSageMakerServiceUserProfileDetails : AWSModel


/**
 <p>The creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The domain ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The last modified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The status.</p>
 */
@property (nonatomic, assign) AWSSageMakerServiceUserProfileStatus status;

/**
 <p>The user profile name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userProfileName;

@end

/**
 <p>A collection of settings.</p>
 */
@interface AWSSageMakerServiceUserSettings : AWSModel


/**
 <p>The execution role for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionRole;

/**
 <p>The Jupyter server's app settings.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceJupyterServerAppSettings * _Nullable jupyterServerAppSettings;

/**
 <p>The kernel gateway app settings.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceKernelGatewayAppSettings * _Nullable kernelGatewayAppSettings;

/**
 <p>The security groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The sharing settings.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceSharingSettings * _Nullable sharingSettings;

/**
 <p>The TensorBoard app settings.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceTensorBoardAppSettings * _Nullable tensorBoardAppSettings;

@end

/**
 <p>Specifies a production variant property type for an Endpoint.</p><p>If you are updating an endpoint with the <a>UpdateEndpointInput$RetainAllVariantProperties</a> option set to <code>true</code>, the <code>VariantProperty</code> objects listed in <a>UpdateEndpointInput$ExcludeRetainedVariantProperties</a> override the existing variant properties of the endpoint.</p>
 Required parameters: [VariantPropertyType]
 */
@interface AWSSageMakerServiceVariantProperty : AWSModel


/**
 <p>The type of variant property. The supported values are:</p><ul><li><p><code>DesiredInstanceCount</code>: Overrides the existing variant instance counts using the <a>ProductionVariant$InitialInstanceCount</a> values in the <a>CreateEndpointConfigInput$ProductionVariants</a>.</p></li><li><p><code>DesiredWeight</code>: Overrides the existing variant weights using the <a>ProductionVariant$InitialVariantWeight</a> values in the <a>CreateEndpointConfigInput$ProductionVariants</a>.</p></li><li><p><code>DataCaptureConfig</code>: (Not currently supported.)</p></li></ul>
 */
@property (nonatomic, assign) AWSSageMakerServiceVariantPropertyType variantPropertyType;

@end

/**
 <p>Specifies a VPC that your training jobs and hosted models have access to. Control access to and from your training and model containers by configuring the VPC. For more information, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/host-vpc.html">Protect Endpoints by Using an Amazon Virtual Private Cloud</a> and <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html">Protect Training Jobs by Using an Amazon Virtual Private Cloud</a>. </p>
 Required parameters: [SecurityGroupIds, Subnets]
 */
@interface AWSSageMakerServiceVpcConfig : AWSModel


/**
 <p>The VPC security group IDs, in the form sg-xxxxxxxx. Specify the security groups for the VPC that is specified in the <code>Subnets</code> field.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The ID of the subnets in the VPC to which you want to connect your training job or model. For information about the availability of specific instance types, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/instance-types-az.html">Supported Instance Types and Availability Zones</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnets;

@end

/**
 <p>A single private workforce, which is automatically created when you create your first private work team. You can create one private work force in each AWS Region. By default, any workforce-related API operation used in a specific region will apply to the workforce created in that region. To learn how to create a private workforce, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private.html">Create a Private Workforce</a>.</p>
 Required parameters: [WorkforceName, WorkforceArn]
 */
@interface AWSSageMakerServiceWorkforce : AWSModel


/**
 <p>The most recent date that was used to successfully add one or more IP address ranges (<a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>) to a private workforce's allow list.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>A list of one to four IP address ranges (<a href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>) to be added to the workforce allow list.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceSourceIpConfig * _Nullable sourceIpConfig;

/**
 <p>The Amazon Resource Name (ARN) of the private workforce.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workforceArn;

/**
 <p>The name of the private workforce whose access you want to restrict. <code>WorkforceName</code> is automatically set to <code>default</code> when a workforce is created and cannot be modified. </p>
 */
@property (nonatomic, strong) NSString * _Nullable workforceName;

@end

/**
 <p>Provides details about a labeling work team.</p>
 Required parameters: [WorkteamName, MemberDefinitions, WorkteamArn, Description]
 */
@interface AWSSageMakerServiceWorkteam : AWSModel


/**
 <p>The date and time that the work team was created (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>A description of the work team.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date and time that the work team was last updated (timestamp).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>The Amazon Cognito user groups that make up the work team.</p>
 */
@property (nonatomic, strong) NSArray<AWSSageMakerServiceMemberDefinition *> * _Nullable memberDefinitions;

/**
 <p>Configures SNS notifications of available or expiring work items for work teams.</p>
 */
@property (nonatomic, strong) AWSSageMakerServiceNotificationConfiguration * _Nullable notificationConfiguration;

/**
 <p>The Amazon Marketplace identifier for a vendor's work team.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable productListingIds;

/**
 <p>The URI of the labeling job's user interface. Workers open this URI to start labeling your data objects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subDomain;

/**
 <p>The Amazon Resource Name (ARN) that identifies the work team.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workteamArn;

/**
 <p>The name of the work team.</p>
 */
@property (nonatomic, strong) NSString * _Nullable workteamName;

@end

NS_ASSUME_NONNULL_END
