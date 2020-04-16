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

FOUNDATION_EXPORT NSString *const AWSapi.mediatailorErrorDomain;

typedef NS_ENUM(NSInteger, AWSapi.mediatailorErrorType) {
    AWSapi.mediatailorErrorUnknown,
    AWSapi.mediatailorErrorBadRequest,
};

typedef NS_ENUM(NSInteger, AWSapi.mediatailorOriginManifestType) {
    AWSapi.mediatailorOriginManifestTypeUnknown,
    AWSapi.mediatailorOriginManifestTypeSinglePeriod,
    AWSapi.mediatailorOriginManifestTypeMultiPeriod,
};

typedef NS_ENUM(NSInteger, AWSapi.mediatailorMode) {
    AWSapi.mediatailorModeUnknown,
    AWSapi.mediatailorModeOff,
    AWSapi.mediatailorModeBehindLiveEdge,
};

@class AWSapi.mediatailorAvailSuppression;
@class AWSapi.mediatailorCdnConfiguration;
@class AWSapi.mediatailorDashConfiguration;
@class AWSapi.mediatailorDashConfigurationForPut;
@class AWSapi.mediatailorDeletePlaybackConfigurationRequest;
@class AWSapi.mediatailorDeletePlaybackConfigurationResponse;
@class AWSapi.mediatailorEmpty;
@class AWSapi.mediatailorGetPlaybackConfigurationRequest;
@class AWSapi.mediatailorGetPlaybackConfigurationResponse;
@class AWSapi.mediatailorHlsConfiguration;
@class AWSapi.mediatailorListPlaybackConfigurationsRequest;
@class AWSapi.mediatailorListPlaybackConfigurationsResponse;
@class AWSapi.mediatailorListTagsForResourceRequest;
@class AWSapi.mediatailorListTagsForResourceResponse;
@class AWSapi.mediatailorPlaybackConfiguration;
@class AWSapi.mediatailorLivePreRollConfiguration;
@class AWSapi.mediatailorPutPlaybackConfigurationRequest;
@class AWSapi.mediatailorPutPlaybackConfigurationResponse;
@class AWSapi.mediatailorTagResourceRequest;
@class AWSapi.mediatailorTagsModel;
@class AWSapi.mediatailorUntagResourceRequest;

/**
 <p>The configuration for Avail Suppression. Ad suppression can be used to turn off ad personalization in a long manifest, or if a viewer joins mid-break.</p>
 */
@interface AWSapi.mediatailorAvailSuppression : AWSModel


/**
 Sets the mode for avail suppression, also known as ad suppression. By default, ad suppression is off and all ad breaks are filled by MediaTailor with ads or slate.
 */
@property (nonatomic, assign) AWSapi.mediatailorMode mode;

/**
 The avail suppression value is a live edge offset time in HH:MM:SS. MediaTailor won't fill ad breaks on or behind this time in the manifest lookback window. 
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The configuration for using a content delivery network (CDN), like Amazon CloudFront, for content and ad segment management. </p>
 */
@interface AWSapi.mediatailorCdnConfiguration : AWSModel


/**
 <p>A non-default content delivery network (CDN) to serve ad segments. By default, AWS Elemental MediaTailor uses Amazon CloudFront with default cache settings as its CDN for ad segments. To set up an alternate CDN, create a rule in your CDN for the following origin: ads.mediatailor.&lt;region>.amazonaws.com. Then specify the rule's name in this AdSegmentUrlPrefix. When AWS Elemental MediaTailor serves a manifest, it reports your CDN as the source for ad segments.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adSegmentUrlPrefix;

/**
 <p>A content delivery network (CDN) to cache content segments, so that content requests don’t always have to go to the origin server. First, create a rule in your CDN for the content segment origin server. Then specify the rule's name in this ContentSegmentUrlPrefix. When AWS Elemental MediaTailor serves a manifest, it reports your CDN as the source for content segments.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentSegmentUrlPrefix;

@end

/**
 <p>The configuration for DASH content. </p>
 */
@interface AWSapi.mediatailorDashConfiguration : AWSModel


/**
 <p>The URL generated by MediaTailor to initiate a playback session. The session uses server-side reporting. This setting is ignored in PUT operations. </p>
 */
@property (nonatomic, strong) NSString * _Nullable manifestEndpointPrefix;

/**
 <p>The setting that controls whether MediaTailor includes the Location tag in DASH manifests. MediaTailor populates the Location tag with the URL for manifest update requests, to be used by players that don't support sticky redirects. Disable this if you have CDN routing rules set up for accessing MediaTailor manifests, and you are either using client-side reporting or your players support sticky HTTP redirects. Valid values are DISABLED and EMT_DEFAULT. The EMT_DEFAULT setting enables the inclusion of the tag and is the default value. </p>
 */
@property (nonatomic, strong) NSString * _Nullable mpdLocation;

/**
 <p>The setting that controls whether MediaTailor handles manifests from the origin server as multi-period manifests or single-period manifests. If your origin server produces single-period manifests, set this to SINGLE_PERIOD. The default setting is MULTI_PERIOD. For multi-period manifests, omit this setting or set it to MULTI_PERIOD. </p>
 */
@property (nonatomic, assign) AWSapi.mediatailorOriginManifestType originManifestType;

@end

/**
 <p>The configuration for DASH PUT operations. </p>
 */
@interface AWSapi.mediatailorDashConfigurationForPut : AWSModel


/**
 <p>The setting that controls whether MediaTailor includes the Location tag in DASH manifests. MediaTailor populates the Location tag with the URL for manifest update requests, to be used by players that don't support sticky redirects. Disable this if you have CDN routing rules set up for accessing MediaTailor manifests, and you are either using client-side reporting or your players support sticky HTTP redirects. Valid values are DISABLED and EMT_DEFAULT. The EMT_DEFAULT setting enables the inclusion of the tag and is the default value. </p>
 */
@property (nonatomic, strong) NSString * _Nullable mpdLocation;

/**
 <p>The setting that controls whether MediaTailor handles manifests from the origin server as multi-period manifests or single-period manifests. If your origin server produces single-period manifests, set this to SINGLE_PERIOD. The default setting is MULTI_PERIOD. For multi-period manifests, omit this setting or set it to MULTI_PERIOD. </p>
 */
@property (nonatomic, assign) AWSapi.mediatailorOriginManifestType originManifestType;

@end

/**
 
 */
@interface AWSapi.mediatailorDeletePlaybackConfigurationRequest : AWSRequest


/**
 <p>The identifier for the playback configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSapi.mediatailorDeletePlaybackConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSapi.mediatailorEmpty : AWSModel


@end

/**
 
 */
@interface AWSapi.mediatailorGetPlaybackConfigurationRequest : AWSRequest


/**
 <p>The identifier for the playback configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSapi.mediatailorGetPlaybackConfigurationResponse : AWSModel


/**
 <p>The URL for the ad decision server (ADS). This includes the specification of static parameters and placeholders for dynamic parameters. AWS Elemental MediaTailor substitutes player-specific and session-specific parameters as needed when calling the ADS. Alternately, for testing, you can provide a static VAST URL. The maximum length is 25,000 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adDecisionServerUrl;

/**
 <p>The configuration for Avail Suppression. Ad suppression can be used to turn off ad personalization in a long manifest, or if a viewer joins mid-break.</p>
 */
@property (nonatomic, strong) AWSapi.mediatailorAvailSuppression * _Nullable availSuppression;

/**
 <p>The configuration for using a content delivery network (CDN), like Amazon CloudFront, for content and ad segment management. </p>
 */
@property (nonatomic, strong) AWSapi.mediatailorCdnConfiguration * _Nullable cdnConfiguration;

/**
 <p>The configuration for DASH content. </p>
 */
@property (nonatomic, strong) AWSapi.mediatailorDashConfiguration * _Nullable dashConfiguration;

/**
 <p>The configuration for HLS content. </p>
 */
@property (nonatomic, strong) AWSapi.mediatailorHlsConfiguration * _Nullable hlsConfiguration;

/**
 <p>The configuration for pre-roll ad insertion.</p>
 */
@property (nonatomic, strong) AWSapi.mediatailorLivePreRollConfiguration * _Nullable livePreRollConfiguration;

/**
 <p>The identifier for the playback configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The maximum duration of underfilled ad time (in seconds) allowed in an ad break.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable personalizationThresholdSeconds;

/**
 <p>The Amazon Resource Name (ARN) for the playback configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable playbackConfigurationArn;

/**
 <p>The URL that the player accesses to get a manifest from AWS Elemental MediaTailor. This session will use server-side reporting. </p>
 */
@property (nonatomic, strong) NSString * _Nullable playbackEndpointPrefix;

/**
 <p>The URL that the player uses to initialize a session that uses client-side reporting. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionInitializationEndpointPrefix;

/**
 <p>The URL for a high-quality video asset to transcode and use to fill in time that's not used by ads. AWS Elemental MediaTailor shows the slate to fill in gaps in media content. Configuring the slate is optional for non-VPAID playback configurations. For VPAID, the slate is required because MediaTailor provides it in the slots designated for dynamic ad content. The slate must be a high-quality asset that contains both audio and video. </p>
 */
@property (nonatomic, strong) NSString * _Nullable slateAdUrl;

/**
 <p>The tags assigned to the playback configuration. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The name that is used to associate this playback configuration with a custom transcode profile. This overrides the dynamic transcoding defaults of MediaTailor. Use this only if you have already set up custom profiles with the help of AWS Support.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcodeProfileName;

/**
 <p>The URL prefix for the master playlist for the stream, minus the asset ID. The maximum length is 512 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable videoContentSourceUrl;

@end

/**
 <p>The configuration for HLS content. </p>
 */
@interface AWSapi.mediatailorHlsConfiguration : AWSModel


/**
 <p>The URL that is used to initiate a playback session for devices that support Apple HLS. The session uses server-side reporting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable manifestEndpointPrefix;

@end

/**
 
 */
@interface AWSapi.mediatailorListPlaybackConfigurationsRequest : AWSRequest


/**
 <p>Maximum number of records to return. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Pagination token returned by the GET list request when results exceed the maximum allowed. Use the token to fetch the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapi.mediatailorListPlaybackConfigurationsResponse : AWSModel


/**
 <p>Array of playback configurations. This might be all the available configurations or a subset, depending on the settings that you provide and the total number of configurations stored. </p>
 */
@property (nonatomic, strong) NSArray<AWSapi.mediatailorPlaybackConfiguration *> * _Nullable items;

/**
 <p>Pagination token returned by the GET list request when results exceed the maximum allowed. Use the token to fetch the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapi.mediatailorListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for the playback configuration. You can get this from the response to any playback configuration request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSapi.mediatailorListTagsForResourceResponse : AWSModel


/**
 <p>A comma-separated list of tag key:value pairs. For example: {"Key1": "Value1","Key2": "Value2"}</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>The AWSMediaTailor configuration.</p>
 */
@interface AWSapi.mediatailorPlaybackConfiguration : AWSModel


/**
 <p>The URL for the ad decision server (ADS). This includes the specification of static parameters and placeholders for dynamic parameters. AWS Elemental MediaTailor substitutes player-specific and session-specific parameters as needed when calling the ADS. Alternately, for testing, you can provide a static VAST URL. The maximum length is 25,000 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adDecisionServerUrl;

/**
 <p>The configuration for Avail Suppression. Ad suppression can be used to turn off ad personalization in a long manifest, or if a viewer joins mid-break.</p>
 */
@property (nonatomic, strong) AWSapi.mediatailorAvailSuppression * _Nullable availSuppression;

/**
 <p>The configuration for using a content delivery network (CDN), like Amazon CloudFront, for content and ad segment management. </p>
 */
@property (nonatomic, strong) AWSapi.mediatailorCdnConfiguration * _Nullable cdnConfiguration;

/**
 <p>The configuration for DASH content. </p>
 */
@property (nonatomic, strong) AWSapi.mediatailorDashConfiguration * _Nullable dashConfiguration;

/**
 <p>The configuration for HLS content. </p>
 */
@property (nonatomic, strong) AWSapi.mediatailorHlsConfiguration * _Nullable hlsConfiguration;

/**
 <p>The identifier for the playback configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The maximum duration of underfilled ad time (in seconds) allowed in an ad break.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable personalizationThresholdSeconds;

/**
 <p>The Amazon Resource Name (ARN) for the playback configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable playbackConfigurationArn;

/**
 <p>The URL that the player accesses to get a manifest from AWS Elemental MediaTailor. This session will use server-side reporting. </p>
 */
@property (nonatomic, strong) NSString * _Nullable playbackEndpointPrefix;

/**
 <p>The URL that the player uses to initialize a session that uses client-side reporting. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionInitializationEndpointPrefix;

/**
 <p>The URL for a high-quality video asset to transcode and use to fill in time that's not used by ads. AWS Elemental MediaTailor shows the slate to fill in gaps in media content. Configuring the slate is optional for non-VPAID playback configurations. For VPAID, the slate is required because MediaTailor provides it in the slots designated for dynamic ad content. The slate must be a high-quality asset that contains both audio and video. </p>
 */
@property (nonatomic, strong) NSString * _Nullable slateAdUrl;

/**
 <p>The tags assigned to the playback configuration. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The name that is used to associate this playback configuration with a custom transcode profile. This overrides the dynamic transcoding defaults of MediaTailor. Use this only if you have already set up custom profiles with the help of AWS Support.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcodeProfileName;

/**
 <p>The URL prefix for the master playlist for the stream, minus the asset ID. The maximum length is 512 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable videoContentSourceUrl;

@end

/**
 <p>The configuration for pre-roll ad insertion.</p>
 */
@interface AWSapi.mediatailorLivePreRollConfiguration : AWSModel


/**
 <p>The URL for the ad decision server (ADS) for pre-roll ads. This includes the specification of static parameters and placeholders for dynamic parameters. AWS Elemental MediaTailor substitutes player-specific and session-specific parameters as needed when calling the ADS. Alternately, for testing, you can provide a static VAST URL. The maximum length is 25,000 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adDecisionServerUrl;

/**
 The maximum allowed duration for the pre-roll ad avail. AWS Elemental MediaTailor won't play pre-roll ads to exceed this duration, regardless of the total duration of ads that the ADS returns.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxDurationSeconds;

@end

/**
 
 */
@interface AWSapi.mediatailorPutPlaybackConfigurationRequest : AWSRequest


/**
 <p>The URL for the ad decision server (ADS). This includes the specification of static parameters and placeholders for dynamic parameters. AWS Elemental MediaTailor substitutes player-specific and session-specific parameters as needed when calling the ADS. Alternately, for testing you can provide a static VAST URL. The maximum length is 25,000 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adDecisionServerUrl;

/**
 <p>The configuration for Avail Suppression. Ad suppression can be used to turn off ad personalization in a long manifest, or if a viewer joins mid-break.</p>
 */
@property (nonatomic, strong) AWSapi.mediatailorAvailSuppression * _Nullable availSuppression;

/**
 <p>The configuration for using a content delivery network (CDN), like Amazon CloudFront, for content and ad segment management. </p>
 */
@property (nonatomic, strong) AWSapi.mediatailorCdnConfiguration * _Nullable cdnConfiguration;

/**
 <p>The configuration for DASH content. </p>
 */
@property (nonatomic, strong) AWSapi.mediatailorDashConfigurationForPut * _Nullable dashConfiguration;

/**
 <p>The configuration for pre-roll ad insertion.</p>
 */
@property (nonatomic, strong) AWSapi.mediatailorLivePreRollConfiguration * _Nullable livePreRollConfiguration;

/**
 <p>The identifier for the playback configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The maximum duration of underfilled ad time (in seconds) allowed in an ad break.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable personalizationThresholdSeconds;

/**
 <p>The URL for a high-quality video asset to transcode and use to fill in time that's not used by ads. AWS Elemental MediaTailor shows the slate to fill in gaps in media content. Configuring the slate is optional for non-VPAID configurations. For VPAID, the slate is required because MediaTailor provides it in the slots that are designated for dynamic ad content. The slate must be a high-quality asset that contains both audio and video. </p>
 */
@property (nonatomic, strong) NSString * _Nullable slateAdUrl;

/**
 <p>The tags to assign to the playback configuration. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The name that is used to associate this playback configuration with a custom transcode profile. This overrides the dynamic transcoding defaults of MediaTailor. Use this only if you have already set up custom profiles with the help of AWS Support.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcodeProfileName;

/**
 <p>The URL prefix for the master playlist for the stream, minus the asset ID. The maximum length is 512 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable videoContentSourceUrl;

@end

/**
 
 */
@interface AWSapi.mediatailorPutPlaybackConfigurationResponse : AWSModel


/**
 <p>The URL for the ad decision server (ADS). This includes the specification of static parameters and placeholders for dynamic parameters. AWS Elemental MediaTailor substitutes player-specific and session-specific parameters as needed when calling the ADS. Alternately, for testing, you can provide a static VAST URL. The maximum length is 25,000 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adDecisionServerUrl;

/**
 <p>The configuration for Avail Suppression. Ad suppression can be used to turn off ad personalization in a long manifest, or if a viewer joins mid-break.</p>
 */
@property (nonatomic, strong) AWSapi.mediatailorAvailSuppression * _Nullable availSuppression;

/**
 <p>The configuration for using a content delivery network (CDN), like Amazon CloudFront, for content and ad segment management. </p>
 */
@property (nonatomic, strong) AWSapi.mediatailorCdnConfiguration * _Nullable cdnConfiguration;

/**
 <p>The configuration for DASH content. </p>
 */
@property (nonatomic, strong) AWSapi.mediatailorDashConfiguration * _Nullable dashConfiguration;

/**
 <p>The configuration for HLS content. </p>
 */
@property (nonatomic, strong) AWSapi.mediatailorHlsConfiguration * _Nullable hlsConfiguration;

/**
 <p>The configuration for pre-roll ad insertion.</p>
 */
@property (nonatomic, strong) AWSapi.mediatailorLivePreRollConfiguration * _Nullable livePreRollConfiguration;

/**
 <p>The identifier for the playback configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The maximum duration of underfilled ad time (in seconds) allowed in an ad break.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable personalizationThresholdSeconds;

/**
 <p>The Amazon Resource Name (ARN) for the playback configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable playbackConfigurationArn;

/**
 <p>The URL that the player accesses to get a manifest from AWS Elemental MediaTailor. This session will use server-side reporting. </p>
 */
@property (nonatomic, strong) NSString * _Nullable playbackEndpointPrefix;

/**
 <p>The URL that the player uses to initialize a session that uses client-side reporting. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionInitializationEndpointPrefix;

/**
 <p>The URL for a high-quality video asset to transcode and use to fill in time that's not used by ads. AWS Elemental MediaTailor shows the slate to fill in gaps in media content. Configuring the slate is optional for non-VPAID playback configurations. For VPAID, the slate is required because MediaTailor provides it in the slots designated for dynamic ad content. The slate must be a high-quality asset that contains both audio and video. </p>
 */
@property (nonatomic, strong) NSString * _Nullable slateAdUrl;

/**
 <p>The tags assigned to the playback configuration. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The name that is used to associate this playback configuration with a custom transcode profile. This overrides the dynamic transcoding defaults of MediaTailor. Use this only if you have already set up custom profiles with the help of AWS Support.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcodeProfileName;

/**
 <p>The URL prefix for the master playlist for the stream, minus the asset ID. The maximum length is 512 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable videoContentSourceUrl;

@end

/**
 
 */
@interface AWSapi.mediatailorTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for the playback configuration. You can get this from the response to any playback configuration request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A comma-separated list of tag key:value pairs. For example: {"Key1": "Value1","Key2": "Value2"}</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>A set of tags assigned to a resource. </p>
 Required parameters: [Tags]
 */
@interface AWSapi.mediatailorTagsModel : AWSModel


/**
 <p>A comma-separated list of tag key:value pairs. For example: {"Key1": "Value1","Key2": "Value2"}</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSapi.mediatailorUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for the playback configuration. You can get this from the response to any playback configuration request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A comma-separated list of the tag keys to remove from the playback configuration. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

NS_ASSUME_NONNULL_END
