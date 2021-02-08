//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSLocationResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSLocationResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSLocationResources

+ (instancetype)sharedInstance {
    static AWSLocationResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSLocationResources new];
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
    \"apiVersion\":\"2020-11-19\",\
    \"endpointPrefix\":\"geo\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"Amazon Location Service\",\
    \"serviceId\":\"Location\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"geo\",\
    \"uid\":\"location-2020-11-19\"\
  },\
  \"operations\":{\
    \"AssociateTrackerConsumer\":{\
      \"name\":\"AssociateTrackerConsumer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/consumers\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"AssociateTrackerConsumerRequest\"},\
      \"output\":{\"shape\":\"AssociateTrackerConsumerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates an association between a geofence collection and a tracker resource. This allows the tracker resource to communicate location data to the linked geofence collection.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"BatchDeleteGeofence\":{\
      \"name\":\"BatchDeleteGeofence\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}/delete-geofences\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"BatchDeleteGeofenceRequest\"},\
      \"output\":{\"shape\":\"BatchDeleteGeofenceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a batch of geofences from a geofence collection.</p> <note> <p>This action deletes the resource permanently. You can't undo this action.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"BatchEvaluateGeofences\":{\
      \"name\":\"BatchEvaluateGeofences\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}/positions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"BatchEvaluateGeofencesRequest\"},\
      \"output\":{\"shape\":\"BatchEvaluateGeofencesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Used in geofence monitoring. Evaluates device positions against the position of geofences in a given geofence collection.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"BatchGetDevicePosition\":{\
      \"name\":\"BatchGetDevicePosition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/get-positions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"BatchGetDevicePositionRequest\"},\
      \"output\":{\"shape\":\"BatchGetDevicePositionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>A batch request to retrieve device positions.</p> <note> <p>The response will return the device positions from the last 24 hours.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"BatchPutGeofence\":{\
      \"name\":\"BatchPutGeofence\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}/put-geofences\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"BatchPutGeofenceRequest\"},\
      \"output\":{\"shape\":\"BatchPutGeofenceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>A batch request for storing geofences into a given geofence collection.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"BatchUpdateDevicePosition\":{\
      \"name\":\"BatchUpdateDevicePosition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/positions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"BatchUpdateDevicePositionRequest\"},\
      \"output\":{\"shape\":\"BatchUpdateDevicePositionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Uploads a position update for one or more devices to a tracker resource. The data is used for API queries requesting the device position and position history.</p> <note> <p>Limitation â Location data is sampled at a fixed rate of 1 position per 30 second interval, and retained for 1 year before it is deleted.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"CreateGeofenceCollection\":{\
      \"name\":\"CreateGeofenceCollection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/geofencing/v0/collections\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"CreateGeofenceCollectionRequest\"},\
      \"output\":{\"shape\":\"CreateGeofenceCollectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a geofence collection, which manages and stores geofences.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"},\
      \"idempotent\":true\
    },\
    \"CreateMap\":{\
      \"name\":\"CreateMap\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/maps/v0/maps\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"CreateMapRequest\"},\
      \"output\":{\"shape\":\"CreateMapResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a map resource in your AWS account, which provides map tiles of different styles sourced from global location data providers.</p> <note> <p>By using Maps, you agree that AWS may transmit your API queries to your selected third party provider for processing, which may be outside the AWS region you are currently using. For more information, see the <a href=\\\"https://aws.amazon.com/service-terms/\\\">AWS Service Terms</a> for Amazon Location Service. </p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"},\
      \"idempotent\":true\
    },\
    \"CreatePlaceIndex\":{\
      \"name\":\"CreatePlaceIndex\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/places/v0/indexes\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"CreatePlaceIndexRequest\"},\
      \"output\":{\"shape\":\"CreatePlaceIndexResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a Place index resource in your AWS account, which supports Places functions with geospatial data sourced from your chosen data provider.</p> <note> <p>By using Places, you agree that AWS may transmit your API queries to your selected third party provider for processing, which may be outside the AWS region you are currently using. </p> <p>Because of licensing limitations, you may not use HERE to store results for locations in Japan. For more information, see the <a href=\\\"https://aws.amazon.com/service-terms/\\\">AWS Service Terms</a> for Amazon Location Service.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"places.\"},\
      \"idempotent\":true\
    },\
    \"CreateTracker\":{\
      \"name\":\"CreateTracker\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/trackers\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"CreateTrackerRequest\"},\
      \"output\":{\"shape\":\"CreateTrackerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a tracker resource in your AWS account, which lets you retrieve current and historical location of devices.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"},\
      \"idempotent\":true\
    },\
    \"DeleteGeofenceCollection\":{\
      \"name\":\"DeleteGeofenceCollection\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DeleteGeofenceCollectionRequest\"},\
      \"output\":{\"shape\":\"DeleteGeofenceCollectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a geofence collection from your AWS account.</p> <note> <p>This action deletes the resource permanently. You can't undo this action. If the geofence collection is the target of a tracker resource, the devices will no longer be monitored.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"},\
      \"idempotent\":true\
    },\
    \"DeleteMap\":{\
      \"name\":\"DeleteMap\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/maps/v0/maps/{MapName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DeleteMapRequest\"},\
      \"output\":{\"shape\":\"DeleteMapResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a map resource from your AWS account.</p> <note> <p>This action deletes the resource permanently. You cannot undo this action. If the map is being used in an application, the map may not render.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"},\
      \"idempotent\":true\
    },\
    \"DeletePlaceIndex\":{\
      \"name\":\"DeletePlaceIndex\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/places/v0/indexes/{IndexName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DeletePlaceIndexRequest\"},\
      \"output\":{\"shape\":\"DeletePlaceIndexResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a Place index resource from your AWS account.</p> <note> <p>This action deletes the resource permanently. You cannot undo this action.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"places.\"},\
      \"idempotent\":true\
    },\
    \"DeleteTracker\":{\
      \"name\":\"DeleteTracker\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DeleteTrackerRequest\"},\
      \"output\":{\"shape\":\"DeleteTrackerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a tracker resource from your AWS account.</p> <note> <p>This action deletes the resource permanently. You can't undo this action. If the tracker resource is in use, you may encounter an error. Make sure that the target resource is not a dependency for your applications.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"},\
      \"idempotent\":true\
    },\
    \"DescribeGeofenceCollection\":{\
      \"name\":\"DescribeGeofenceCollection\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeGeofenceCollectionRequest\"},\
      \"output\":{\"shape\":\"DescribeGeofenceCollectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the geofence collection details.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"DescribeMap\":{\
      \"name\":\"DescribeMap\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/maps/v0/maps/{MapName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeMapRequest\"},\
      \"output\":{\"shape\":\"DescribeMapResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the map resource details.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"}\
    },\
    \"DescribePlaceIndex\":{\
      \"name\":\"DescribePlaceIndex\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/places/v0/indexes/{IndexName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribePlaceIndexRequest\"},\
      \"output\":{\"shape\":\"DescribePlaceIndexResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the Place index resource details.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"places.\"}\
    },\
    \"DescribeTracker\":{\
      \"name\":\"DescribeTracker\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeTrackerRequest\"},\
      \"output\":{\"shape\":\"DescribeTrackerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the tracker resource details.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"DisassociateTrackerConsumer\":{\
      \"name\":\"DisassociateTrackerConsumer\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/consumers/{ConsumerArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DisassociateTrackerConsumerRequest\"},\
      \"output\":{\"shape\":\"DisassociateTrackerConsumerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Removes the association bewteen a tracker resource and a geofence collection.</p> <note> <p>Once you unlink a tracker resource from a geofence collection, the tracker positions will no longer be automatically evaluated against geofences.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"GetDevicePosition\":{\
      \"name\":\"GetDevicePosition\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/devices/{DeviceId}/positions/latest\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetDevicePositionRequest\"},\
      \"output\":{\"shape\":\"GetDevicePositionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the latest device position.</p> <note> <p>Limitation â Device positions are deleted after one year.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"GetDevicePositionHistory\":{\
      \"name\":\"GetDevicePositionHistory\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/devices/{DeviceId}/list-positions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetDevicePositionHistoryRequest\"},\
      \"output\":{\"shape\":\"GetDevicePositionHistoryResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the device position history from a tracker resource within a specified range of time.</p> <note> <p>Limitation â Device positions are deleted after one year.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"GetGeofence\":{\
      \"name\":\"GetGeofence\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}/geofences/{GeofenceId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetGeofenceRequest\"},\
      \"output\":{\"shape\":\"GetGeofenceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the geofence details from a geofence collection.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"GetMapGlyphs\":{\
      \"name\":\"GetMapGlyphs\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/maps/v0/maps/{MapName}/glyphs/{FontStack}/{FontUnicodeRange}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetMapGlyphsRequest\"},\
      \"output\":{\"shape\":\"GetMapGlyphsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves glyphs used to display labels on a map.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"}\
    },\
    \"GetMapSprites\":{\
      \"name\":\"GetMapSprites\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/maps/v0/maps/{MapName}/sprites/{FileName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetMapSpritesRequest\"},\
      \"output\":{\"shape\":\"GetMapSpritesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the sprite sheet corresponding to a map resource. The sprite sheet is a PNG image paired with a JSON document describing the offsets of individual icons that will be displayed on a rendered map.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"}\
    },\
    \"GetMapStyleDescriptor\":{\
      \"name\":\"GetMapStyleDescriptor\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/maps/v0/maps/{MapName}/style-descriptor\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetMapStyleDescriptorRequest\"},\
      \"output\":{\"shape\":\"GetMapStyleDescriptorResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the map style descriptor from a map resource. </p> <p>The style descriptor contains speciï¬cations on how features render on a map. For example, what data to display, what order to display the data in, and the style for the data. Style descriptors follow the Mapbox Style Specification.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"}\
    },\
    \"GetMapTile\":{\
      \"name\":\"GetMapTile\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/maps/v0/maps/{MapName}/tiles/{Z}/{X}/{Y}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetMapTileRequest\"},\
      \"output\":{\"shape\":\"GetMapTileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a vector data tile from the map resource. Map tiles are used by clients to render a map. They are addressed using a grid arrangement with an X coordinate, Y coordinate, and Z (zoom) level. </p> <p>The origin (0, 0) is the top left of the map. Increasing the zoom level by 1 doubles both the X and Y dimensions, so a tile containing data for the entire world at (0/0/0) will be split into 4 tiles at zoom 1 (1/0/0, 1/0/1, 1/1/0, 1/1/1).</p>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"}\
    },\
    \"ListGeofenceCollections\":{\
      \"name\":\"ListGeofenceCollections\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/geofencing/v0/list-collections\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListGeofenceCollectionsRequest\"},\
      \"output\":{\"shape\":\"ListGeofenceCollectionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists geofence collections in your AWS account.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"ListGeofences\":{\
      \"name\":\"ListGeofences\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}/list-geofences\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListGeofencesRequest\"},\
      \"output\":{\"shape\":\"ListGeofencesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists geofences stored in a given geofence collection.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"ListMaps\":{\
      \"name\":\"ListMaps\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/maps/v0/list-maps\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListMapsRequest\"},\
      \"output\":{\"shape\":\"ListMapsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists map resources in your AWS account.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"}\
    },\
    \"ListPlaceIndexes\":{\
      \"name\":\"ListPlaceIndexes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/places/v0/list-indexes\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListPlaceIndexesRequest\"},\
      \"output\":{\"shape\":\"ListPlaceIndexesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists Place index resources in your AWS account.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"places.\"}\
    },\
    \"ListTrackerConsumers\":{\
      \"name\":\"ListTrackerConsumers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/list-consumers\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListTrackerConsumersRequest\"},\
      \"output\":{\"shape\":\"ListTrackerConsumersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists geofence collections currently associated to the given tracker resource.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"ListTrackers\":{\
      \"name\":\"ListTrackers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/list-trackers\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListTrackersRequest\"},\
      \"output\":{\"shape\":\"ListTrackersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists tracker resources in your AWS account.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"PutGeofence\":{\
      \"name\":\"PutGeofence\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}/geofences/{GeofenceId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"PutGeofenceRequest\"},\
      \"output\":{\"shape\":\"PutGeofenceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Stores a geofence to a given geofence collection, or updates the geometry of an existing geofence if a geofence ID is included in the request.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"SearchPlaceIndexForPosition\":{\
      \"name\":\"SearchPlaceIndexForPosition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/places/v0/indexes/{IndexName}/search/position\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"SearchPlaceIndexForPositionRequest\"},\
      \"output\":{\"shape\":\"SearchPlaceIndexForPositionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Reverse geocodes a given coordinate and returns a legible address. Allows you to search for Places or points of interest near a given position.</p> <note> <p>By using Places, you agree that AWS may transmit your API queries to your selected third party provider for processing, which may be outside the AWS region you are currently using. </p> <p>Because of licensing limitations, you may not use HERE to store results for locations in Japan. For more information, see the <a href=\\\"https://aws.amazon.com/service-terms/\\\">AWS Service Terms</a> for Amazon Location Service.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"places.\"}\
    },\
    \"SearchPlaceIndexForText\":{\
      \"name\":\"SearchPlaceIndexForText\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/places/v0/indexes/{IndexName}/search/text\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"SearchPlaceIndexForTextRequest\"},\
      \"output\":{\"shape\":\"SearchPlaceIndexForTextResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Geocodes free-form text, such as an address, name, city, or region to allow you to search for Places or points of interest. </p> <p>Includes the option to apply additional parameters to narrow your list of results.</p> <note> <p>You can search for places near a given position using <code>BiasPosition</code>, or filter results within a bounding box using <code>FilterBBox</code>. Providing both parameters simultaneously returns an error.</p> </note> <note> <p>By using Places, you agree that AWS may transmit your API queries to your selected third party provider for processing, which may be outside the AWS region you are currently using. </p> <p>Also, when using HERE as your data provider, you may not (a) use HERE Places for Asset Management, or (b) select the <code>Storage</code> option for the <code>IntendedUse</code> parameter when requesting Places in Japan. For more information, see the <a href=\\\"https://aws.amazon.com/service-terms/\\\">AWS Service Terms</a> for Amazon Location Service.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"places.\"}\
    }\
  },\
  \"shapes\":{\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>The request was denied due to insufficient access or permission. Check with an administrator to verify your permissions.</p>\",\
      \"error\":{\
        \"httpStatusCode\":403,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Arn\":{\
      \"type\":\"string\",\
      \"max\":1600,\
      \"min\":0,\
      \"pattern\":\"^arn(:[a-z0-9]+([.-][a-z0-9]+)*){2}(:([a-z0-9]+([.-][a-z0-9]+)*)?){2}:([^/].*)?$\"\
    },\
    \"ArnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Arn\"}\
    },\
    \"AssociateTrackerConsumerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConsumerArn\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"ConsumerArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the geofence collection to be associated to tracker resource. Used when you need to specify a resource across all AWS. </p> <ul> <li> <p>Format example: <code>arn:partition:service:region:account-id:resource-type:resource-id</code> </p> </li> </ul>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource to be associated with a geofence collection.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"AssociateTrackerConsumerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"BatchDeleteGeofenceError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Error\",\
        \"GeofenceId\"\
      ],\
      \"members\":{\
        \"Error\":{\
          \"shape\":\"BatchItemError\",\
          \"documentation\":\"<p>Contains details associated to the batch error.</p>\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The geofence associated with the error message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains error details for each geofence that failed to delete from the geofence collection.</p>\"\
    },\
    \"BatchDeleteGeofenceErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDeleteGeofenceError\"}\
    },\
    \"BatchDeleteGeofenceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionName\",\
        \"GeofenceIds\"\
      ],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The geofence collection storing the geofences to be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        },\
        \"GeofenceIds\":{\
          \"shape\":\"BatchDeleteGeofenceRequestGeofenceIdsList\",\
          \"documentation\":\"<p>The batch of geofences to be deleted.</p>\"\
        }\
      }\
    },\
    \"BatchDeleteGeofenceRequestGeofenceIdsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Id\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"BatchDeleteGeofenceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Errors\"],\
      \"members\":{\
        \"Errors\":{\
          \"shape\":\"BatchDeleteGeofenceErrorList\",\
          \"documentation\":\"<p>Contains error details for each geofence that failed to delete.</p>\"\
        }\
      }\
    },\
    \"BatchEvaluateGeofencesError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceId\",\
        \"Error\",\
        \"SampleTime\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The device associated with the position evaluation error.</p>\"\
        },\
        \"Error\":{\
          \"shape\":\"BatchItemError\",\
          \"documentation\":\"<p>Contains details associated to the batch error.</p>\"\
        },\
        \"SampleTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specifies a timestamp for when the error occurred in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains error details for each device that failed to evaluate its position against the geofences in a given geofence collection.</p>\"\
    },\
    \"BatchEvaluateGeofencesErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchEvaluateGeofencesError\"}\
    },\
    \"BatchEvaluateGeofencesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionName\",\
        \"DevicePositionUpdates\"\
      ],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The geofence collection used in evaluating the position of devices against its geofences.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        },\
        \"DevicePositionUpdates\":{\
          \"shape\":\"BatchEvaluateGeofencesRequestDevicePositionUpdatesList\",\
          \"documentation\":\"<p>Contains device details for each device to be evaluated against the given geofence collection.</p>\"\
        }\
      }\
    },\
    \"BatchEvaluateGeofencesRequestDevicePositionUpdatesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DevicePositionUpdate\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"BatchEvaluateGeofencesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Errors\"],\
      \"members\":{\
        \"Errors\":{\
          \"shape\":\"BatchEvaluateGeofencesErrorList\",\
          \"documentation\":\"<p>Contains error details for each device that failed to evaluate its position against the given geofence collection.</p>\"\
        }\
      }\
    },\
    \"BatchGetDevicePositionError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceId\",\
        \"Error\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the device that didn't return a position.</p>\"\
        },\
        \"Error\":{\
          \"shape\":\"BatchItemError\",\
          \"documentation\":\"<p>Contains details related to the error code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains error details for each device that didn't return a position.</p>\"\
    },\
    \"BatchGetDevicePositionErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchGetDevicePositionError\"}\
    },\
    \"BatchGetDevicePositionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceIds\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"DeviceIds\":{\
          \"shape\":\"BatchGetDevicePositionRequestDeviceIdsList\",\
          \"documentation\":\"<p>Devices whose position you want to retrieve.</p> <ul> <li> <p>For example, for two devices: <code>device-ids=DeviceId1&amp;device-ids=DeviceId2</code> </p> </li> </ul>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"BatchGetDevicePositionRequestTrackerNameString\",\
          \"documentation\":\"<p>The tracker resource retrieving the device position.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"BatchGetDevicePositionRequestDeviceIdsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Id\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"BatchGetDevicePositionRequestTrackerNameString\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"^[-._\\\\w]+$\"\
    },\
    \"BatchGetDevicePositionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DevicePositions\",\
        \"Errors\"\
      ],\
      \"members\":{\
        \"DevicePositions\":{\
          \"shape\":\"DevicePositionList\",\
          \"documentation\":\"<p>Contains device position details such as the device ID, position, and timestamps for when the position was received and sampled.</p>\"\
        },\
        \"Errors\":{\
          \"shape\":\"BatchGetDevicePositionErrorList\",\
          \"documentation\":\"<p>Contains error details for each device that failed to send its position to the tracker resource.</p>\"\
        }\
      }\
    },\
    \"BatchItemError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"BatchItemErrorCode\",\
          \"documentation\":\"<p>The error code associated with the batch request error.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A message with the reason for the batch request error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the batch request error details associated with the request.</p>\"\
    },\
    \"BatchItemErrorCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AccessDeniedError\",\
        \"ConflictError\",\
        \"InternalServerError\",\
        \"ResourceNotFoundError\",\
        \"ThrottlingError\",\
        \"ValidationError\"\
      ]\
    },\
    \"BatchPutGeofenceError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Error\",\
        \"GeofenceId\"\
      ],\
      \"members\":{\
        \"Error\":{\
          \"shape\":\"BatchItemError\",\
          \"documentation\":\"<p>Contains details associated to the batch error.</p>\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The geofence associated with the error message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains error details for each geofence that failed to be stored in a given geofence collection.</p>\"\
    },\
    \"BatchPutGeofenceErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchPutGeofenceError\"}\
    },\
    \"BatchPutGeofenceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionName\",\
        \"Entries\"\
      ],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The geofence collection storing the geofences.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        },\
        \"Entries\":{\
          \"shape\":\"BatchPutGeofenceRequestEntriesList\",\
          \"documentation\":\"<p>The batch of geofences to be stored in a geofence collection.</p>\"\
        }\
      }\
    },\
    \"BatchPutGeofenceRequestEntriesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchPutGeofenceRequestEntry\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"BatchPutGeofenceRequestEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GeofenceId\",\
        \"Geometry\"\
      ],\
      \"members\":{\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The identifier for the geofence to be stored in a given geofence collection.</p>\"\
        },\
        \"Geometry\":{\
          \"shape\":\"GeofenceGeometry\",\
          \"documentation\":\"<p>The geometry details for the geofence.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains geofence details. </p>\"\
    },\
    \"BatchPutGeofenceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Errors\",\
        \"Successes\"\
      ],\
      \"members\":{\
        \"Errors\":{\
          \"shape\":\"BatchPutGeofenceErrorList\",\
          \"documentation\":\"<p>Contains additional error details for each geofence that failed to be stored in a geofence collection.</p>\"\
        },\
        \"Successes\":{\
          \"shape\":\"BatchPutGeofenceSuccessList\",\
          \"documentation\":\"<p>Contains each geofence that was successfully stored in a geofence collection.</p>\"\
        }\
      }\
    },\
    \"BatchPutGeofenceSuccess\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"GeofenceId\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence was stored in a geofence collection in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The geofence successfully stored in a geofence collection.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains a summary of each geofence that was successfully stored in a given geofence collection.</p>\"\
    },\
    \"BatchPutGeofenceSuccessList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchPutGeofenceSuccess\"}\
    },\
    \"BatchUpdateDevicePositionError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceId\",\
        \"Error\",\
        \"SampleTime\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The device associated with the failed location update.</p>\"\
        },\
        \"Error\":{\
          \"shape\":\"BatchItemError\",\
          \"documentation\":\"<p>Contains details related to the error code such as the error code and error message.</p>\"\
        },\
        \"SampleTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when a position sample was attempted in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains error details for each device that failed to update its position.</p>\"\
    },\
    \"BatchUpdateDevicePositionErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchUpdateDevicePositionError\"}\
    },\
    \"BatchUpdateDevicePositionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrackerName\",\
        \"Updates\"\
      ],\
      \"members\":{\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        },\
        \"Updates\":{\
          \"shape\":\"BatchUpdateDevicePositionRequestUpdatesList\",\
          \"documentation\":\"<p>Contains the position update details for each device.</p>\"\
        }\
      }\
    },\
    \"BatchUpdateDevicePositionRequestUpdatesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DevicePositionUpdate\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"BatchUpdateDevicePositionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Errors\"],\
      \"members\":{\
        \"Errors\":{\
          \"shape\":\"BatchUpdateDevicePositionErrorList\",\
          \"documentation\":\"<p>Contains error details for each device that failed to update its position.</p>\"\
        }\
      }\
    },\
    \"Blob\":{\"type\":\"blob\"},\
    \"BoundingBox\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Double\"},\
      \"max\":6,\
      \"min\":4,\
      \"sensitive\":true\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>The request was unsuccessful due to a conflict.</p>\",\
      \"error\":{\
        \"httpStatusCode\":409,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CountryCode\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[A-Z]{3}$\"\
    },\
    \"CountryCodeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CountryCode\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"CreateGeofenceCollectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionName\",\
        \"PricingPlan\"\
      ],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>A custom name for the geofence collection.</p> <p>Requirements:</p> <ul> <li> <p>Contain only alphanumeric characters (AâZ, aâz, 0-9), hyphens (-), and underscores (_). </p> </li> <li> <p>Must be a unique geofence collection name.</p> </li> <li> <p>No spaces allowed. For example, <code>ExampleGeofenceCollection</code>.</p> </li> </ul>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>An optional description for the geofence collection.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>Specifies the pricing plan for your geofence collection. There's three pricing plan options:</p> <ul> <li> <p> <code>RequestBasedUsage</code> â Selects the \\\"Request-Based Usage\\\" pricing plan.</p> </li> <li> <p> <code>MobileAssetTracking</code> â Selects the \\\"Mobile Asset Tracking\\\" pricing plan.</p> </li> <li> <p> <code>MobileAssetManagement</code> â Selects the \\\"Mobile Asset Management\\\" pricing plan.</p> </li> </ul> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        }\
      }\
    },\
    \"CreateGeofenceCollectionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionArn\",\
        \"CollectionName\",\
        \"CreateTime\"\
      ],\
      \"members\":{\
        \"CollectionArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the geofence collection resource. Used when you need to specify a resource across all AWS. </p>\"\
        },\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name for the geofence collection.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence collection was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      }\
    },\
    \"CreateMapRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Configuration\",\
        \"MapName\",\
        \"PricingPlan\"\
      ],\
      \"members\":{\
        \"Configuration\":{\
          \"shape\":\"MapConfiguration\",\
          \"documentation\":\"<p>Specifies the map style selected from an available data provider.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>An optional description for the map resource.</p>\"\
        },\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name for the map resource.</p> <p>Requirements:</p> <ul> <li> <p>Must contain only alphanumeric characters (AâZ, aâz, 0â9), hyphens (-), and underscores (_). </p> </li> <li> <p>Must be a unique map resource name. </p> </li> <li> <p>No spaces allowed. For example, <code>ExampleMap</code>.</p> </li> </ul>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>Specifies the pricing plan for your map resource. There's three pricing plan options:</p> <ul> <li> <p> <code>RequestBasedUsage</code> â Selects the \\\"Request-Based Usage\\\" pricing plan.</p> </li> <li> <p> <code>MobileAssetTracking</code> â Selects the \\\"Mobile Asset Tracking\\\" pricing plan.</p> </li> <li> <p> <code>MobileAssetManagement</code> â Selects the \\\"Mobile Asset Management\\\" pricing plan.</p> </li> </ul> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        }\
      }\
    },\
    \"CreateMapResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"MapArn\",\
        \"MapName\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the map resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>\"\
        },\
        \"MapArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the map resource. Used when you need to specify a resource across all AWS.</p> <ul> <li> <p>Format example: <code>arn:partition:service:region:account-id:resource-type:resource-id</code> </p> </li> </ul>\"\
        },\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the map resource.</p>\"\
        }\
      }\
    },\
    \"CreatePlaceIndexRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSource\",\
        \"IndexName\",\
        \"PricingPlan\"\
      ],\
      \"members\":{\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the data provider of geospatial data.</p>\"\
        },\
        \"DataSourceConfiguration\":{\
          \"shape\":\"DataSourceConfiguration\",\
          \"documentation\":\"<p>Specifies the data storage option for requesting Places.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description for the Place index resource.</p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Place index resource. </p> <p>Requirements:</p> <ul> <li> <p>Contain only alphanumeric characters (A-Z, a-z, 0-9) , hyphens (-) and underscores (_) ).</p> </li> <li> <p>Must be a unique Place index resource name.</p> </li> <li> <p>No spaces allowed. For example, <code>ExamplePlaceIndex</code>.</p> </li> </ul>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>Specifies the pricing plan for your Place index resource. There's three pricing plan options:</p> <ul> <li> <p> <code>RequestBasedUsage</code> â Selects the \\\"Request-Based Usage\\\" pricing plan.</p> </li> <li> <p> <code>MobileAssetTracking</code> â Selects the \\\"Mobile Asset Tracking\\\" pricing plan.</p> </li> <li> <p> <code>MobileAssetManagement</code> â Selects the \\\"Mobile Asset Management\\\" pricing plan.</p> </li> </ul> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        }\
      }\
    },\
    \"CreatePlaceIndexResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"IndexArn\",\
        \"IndexName\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the Place index resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"IndexArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the Place index resource. Used when you need to specify a resource across all AWS. </p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name for the Place index resource.</p>\"\
        }\
      }\
    },\
    \"CreateTrackerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PricingPlan\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>An optional description for the tracker resource.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>Specifies the pricing plan for your tracker resource. There's three pricing plan options:</p> <ul> <li> <p> <code>RequestBasedUsage</code> â Selects the \\\"Request-Based Usage\\\" pricing plan.</p> </li> <li> <p> <code>MobileAssetTracking</code> â Selects the \\\"Mobile Asset Tracking\\\" pricing plan.</p> </li> <li> <p> <code>MobileAssetManagement</code> â Selects the \\\"Mobile Asset Management\\\" pricing plan.</p> </li> </ul> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name for the tracker resource.</p> <p>Requirements:</p> <ul> <li> <p>Contain only alphanumeric characters (A-Z, a-z, 0-9) , hyphens (-) and underscores (_).</p> </li> <li> <p>Must be a unique tracker resource name.</p> </li> <li> <p>No spaces allowed. For example, <code>ExampleTracker</code>.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"CreateTrackerResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"TrackerArn\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the tracker resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"TrackerArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the tracker resource. Used when you need to specify a resource across all AWS.</p>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource.</p>\"\
        }\
      }\
    },\
    \"DataSourceConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IntendedUse\":{\
          \"shape\":\"IntendedUse\",\
          \"documentation\":\"<p>Specifies how the results of an operation will be stored by the caller. </p> <p>Valid values include:</p> <ul> <li> <p> <code>SingleUse</code> specifies that the results won't be stored. </p> </li> <li> <p> <code>Storage</code> specifies that the result can be cached or stored in a database.</p> </li> </ul> <p>Default value: <code>SingleUse</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the data storage option chosen for requesting Places.</p> <note> <p>By using Places, you agree that AWS may transmit your API queries to your selected third party provider for processing, which may be outside the AWS region you are currently using. </p> <p>Also, when using HERE as your data provider, you may not (a) use HERE Places for Asset Management, or (b) select the <code>Storage</code> option for the <code>IntendedUse</code> parameter when requesting Places in Japan. For more information, see the <a href=\\\"https://aws.amazon.com/service-terms/\\\">AWS Service Terms</a> for Amazon Location Service.</p> </note>\"\
    },\
    \"DeleteGeofenceCollectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionName\"],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the geofence collection to be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        }\
      }\
    },\
    \"DeleteGeofenceCollectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteMapRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MapName\"],\
      \"members\":{\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the map resource to be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MapName\"\
        }\
      }\
    },\
    \"DeleteMapResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeletePlaceIndexRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"IndexName\"],\
      \"members\":{\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Place index resource to be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IndexName\"\
        }\
      }\
    },\
    \"DeletePlaceIndexResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteTrackerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrackerName\"],\
      \"members\":{\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource to be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"DeleteTrackerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeGeofenceCollectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionName\"],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the geofence collection.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        }\
      }\
    },\
    \"DescribeGeofenceCollectionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionArn\",\
        \"CollectionName\",\
        \"CreateTime\",\
        \"Description\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CollectionArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the geofence collection resource. Used when you need to specify a resource across all AWS. </p>\"\
        },\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the geofence collection.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description for the geofence collection.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence collection was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      }\
    },\
    \"DescribeMapRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MapName\"],\
      \"members\":{\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the map resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MapName\"\
        }\
      }\
    },\
    \"DescribeMapResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Configuration\",\
        \"CreateTime\",\
        \"DataSource\",\
        \"Description\",\
        \"MapArn\",\
        \"MapName\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"Configuration\":{\
          \"shape\":\"MapConfiguration\",\
          \"documentation\":\"<p>Specifies the map tile style selected from a partner data provider.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the map resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>\"\
        },\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the data provider for the associated map tiles.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description for the map resource.</p>\"\
        },\
        \"MapArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the map resource. Used when you need to specify a resource across all AWS.</p>\"\
        },\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The map style selected from an available provider.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the map resource was last update in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>\"\
        }\
      }\
    },\
    \"DescribePlaceIndexRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"IndexName\"],\
      \"members\":{\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Place index resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IndexName\"\
        }\
      }\
    },\
    \"DescribePlaceIndexResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"DataSource\",\
        \"DataSourceConfiguration\",\
        \"Description\",\
        \"IndexArn\",\
        \"IndexName\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the Place index resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The data provider of geospatial data.</p>\"\
        },\
        \"DataSourceConfiguration\":{\
          \"shape\":\"DataSourceConfiguration\",\
          \"documentation\":\"<p>The specified data storage option for requesting Places.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description for the Place index resource.</p>\"\
        },\
        \"IndexArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the Place index resource. Used when you need to specify a resource across all AWS. </p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Place index resource being described.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the Place index resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      }\
    },\
    \"DescribeTrackerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrackerName\"],\
      \"members\":{\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"DescribeTrackerResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"Description\",\
        \"TrackerArn\",\
        \"TrackerName\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the tracker resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description for the tracker resource.</p>\"\
        },\
        \"TrackerArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the tracker resource. Used when you need to specify a resource across all AWS.</p>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the tracker resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      }\
    },\
    \"DevicePosition\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Position\",\
        \"ReceivedTime\",\
        \"SampleTime\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The device whose position you retrieved.</p>\"\
        },\
        \"Position\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The last known device position.</p>\"\
        },\
        \"ReceivedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the tracker resource recieved the position in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"SampleTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the position was detected and sampled in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the device position details.</p>\"\
    },\
    \"DevicePositionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DevicePosition\"}\
    },\
    \"DevicePositionUpdate\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceId\",\
        \"Position\",\
        \"SampleTime\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The device associated to the position update.</p>\"\
        },\
        \"Position\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The latest device position defined in <a href=\\\"https://earth-info.nga.mil/GandG/wgs84/index.html\\\">WGS 84</a> format: <code>[Xlongitude, Ylatitude]</code>.</p>\"\
        },\
        \"SampleTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the position update was received in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the position update details for a device.</p>\"\
    },\
    \"DisassociateTrackerConsumerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConsumerArn\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"ConsumerArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the geofence collection to be disassociated from the tracker resource. Used when you need to specify a resource across all AWS. </p> <ul> <li> <p>Format example: <code>arn:partition:service:region:account-id:resource-type:resource-id</code> </p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConsumerArn\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource to be dissociated from the consumer.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"DisassociateTrackerConsumerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"Double\":{\
      \"type\":\"double\",\
      \"box\":true\
    },\
    \"GeofenceGeometry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Polygon\":{\
          \"shape\":\"LinearRings\",\
          \"documentation\":\"<p>An array of 1 or more linear rings. A linear ring is an array of 4 or more vertices, where the first and last vertex are the same to form a closed boundary. Each vertex is a 2-dimensional point of the form: <code>[longitude, latitude]</code>. </p> <p>The first linear ring is an outer ring, describing the polygon's boundary. Subsequent linear rings may be inner or outer rings to describe holes and islands. Outer rings must list their vertices in counter-clockwise order around the ring's center, where the left side is the polygon's exterior. Inner rings must list their vertices in clockwise order, where the left side is the polygon's interior.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the geofence geometry details.</p> <note> <p>Limitation â Amazon Location does not currently support polygons with holes, multipolygons, polygons that are wound clockwise, or that cross the antimeridian. </p> </note>\"\
    },\
    \"GetDevicePositionHistoryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceId\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The device whose position history you want to retrieve.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DeviceId\"\
        },\
        \"EndTimeExclusive\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specify the end time for the position history in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p> <ul> <li> <p>The given time for <code>EndTimeExclusive</code> must be after the time for <code>StartTimeInclusive</code>.</p> </li> </ul>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p> <p>Default value: <code>null</code> </p>\"\
        },\
        \"StartTimeInclusive\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specify the start time for the position history in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p> <ul> <li> <p>The given time for <code>EndTimeExclusive</code> must be after the time for <code>StartTimeInclusive</code>.</p> </li> </ul>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The tracker resource receiving the request for the device position history.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"GetDevicePositionHistoryResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"DevicePositions\"],\
      \"members\":{\
        \"DevicePositions\":{\
          \"shape\":\"DevicePositionList\",\
          \"documentation\":\"<p>Contains the position history details for the requested device.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>\"\
        }\
      }\
    },\
    \"GetDevicePositionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceId\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The device whose position you want to retreieve.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DeviceId\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The tracker resource receiving the position update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"GetDevicePositionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Position\",\
        \"ReceivedTime\",\
        \"SampleTime\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The device whose position you retrieved.</p>\"\
        },\
        \"Position\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The last known device position.</p>\"\
        },\
        \"ReceivedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the tracker resource recieved the position in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601 </a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"SampleTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the position was detected and sampled in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601 </a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      }\
    },\
    \"GetGeofenceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionName\",\
        \"GeofenceId\"\
      ],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The geofence collection storing the target geofence.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The geofence you're retrieving details for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"GeofenceId\"\
        }\
      }\
    },\
    \"GetGeofenceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"GeofenceId\",\
        \"Geometry\",\
        \"Status\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence collection was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The geofence identifier.</p>\"\
        },\
        \"Geometry\":{\
          \"shape\":\"GeofenceGeometry\",\
          \"documentation\":\"<p>Contains the geofence geometry details describing a polygon.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the state of the geofence. A geofence will hold one of the following states:</p> <ul> <li> <p> <code>ACTIVE</code> â The geofence has been indexed by the system. </p> </li> <li> <p> <code>PENDING</code> â The geofence is being processed by the system.</p> </li> <li> <p> <code>FAILED</code> â The geofence failed to be indexed by the system.</p> </li> <li> <p> <code>DELETED</code> â The geofence has been deleted from the system index.</p> </li> <li> <p> <code>DELETING</code> â The geofence is being deleted from the system index.</p> </li> </ul>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence collection was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      }\
    },\
    \"GetMapGlyphsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FontStack\",\
        \"FontUnicodeRange\",\
        \"MapName\"\
      ],\
      \"members\":{\
        \"FontStack\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A comma-separated list of fonts to load glyphs from in order of preference.. For example, <code>Noto Sans, Arial Unicode</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FontStack\"\
        },\
        \"FontUnicodeRange\":{\
          \"shape\":\"GetMapGlyphsRequestFontUnicodeRangeString\",\
          \"documentation\":\"<p>A Unicode range of characters to download glyphs for. Each response will contain 256 characters. For example, 0-255 includes all characters from range <code>U+0000</code> to <code>00FF</code>. Must be aligned to multiples of 256.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FontUnicodeRange\"\
        },\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The map resource associated with the glyph ï¬le.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MapName\"\
        }\
      }\
    },\
    \"GetMapGlyphsRequestFontUnicodeRangeString\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[0-9]+-[0-9]+\\\\.pbf$\"\
    },\
    \"GetMapGlyphsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Blob\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>The blob's content type.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The map glyph content type. For example, <code>application/octet-stream</code>.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        }\
      },\
      \"payload\":\"Blob\"\
    },\
    \"GetMapSpritesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FileName\",\
        \"MapName\"\
      ],\
      \"members\":{\
        \"FileName\":{\
          \"shape\":\"GetMapSpritesRequestFileNameString\",\
          \"documentation\":\"<p>The name of the sprite ï¬le. Use the following ï¬le names for the sprite sheet:</p> <ul> <li> <p> <code>sprites.png</code> </p> </li> <li> <p> <code>sprites@2x.png</code> for high pixel density displays</p> </li> </ul> <p>For the JSON document contain image offsets. Use the following ï¬le names:</p> <ul> <li> <p> <code>sprites.json</code> </p> </li> <li> <p> <code>sprites@2x.json</code> for high pixel density displays</p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FileName\"\
        },\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The map resource associated with the sprite ï¬le.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MapName\"\
        }\
      }\
    },\
    \"GetMapSpritesRequestFileNameString\":{\
      \"type\":\"string\",\
      \"pattern\":\"^sprites(@2x)?\\\\.(png|json)$\"\
    },\
    \"GetMapSpritesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Blob\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>Contains the body of the sprite sheet or JSON offset ï¬le.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The content type of the sprite sheet and offsets. For example, the sprite sheet content type is <code>image/png</code>, and the sprite offset JSON document is <code>application/json</code>. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        }\
      },\
      \"payload\":\"Blob\"\
    },\
    \"GetMapStyleDescriptorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MapName\"],\
      \"members\":{\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The map resource to retrieve the style descriptor from.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MapName\"\
        }\
      }\
    },\
    \"GetMapStyleDescriptorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Blob\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>Contains the body of the style descriptor.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The style descriptor's content type. For example, <code>application/json</code>.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        }\
      },\
      \"payload\":\"Blob\"\
    },\
    \"GetMapTileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MapName\",\
        \"X\",\
        \"Y\",\
        \"Z\"\
      ],\
      \"members\":{\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The map resource to retrieve the map tiles from.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MapName\"\
        },\
        \"X\":{\
          \"shape\":\"GetMapTileRequestXString\",\
          \"documentation\":\"<p>The X axis value for the map tile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"X\"\
        },\
        \"Y\":{\
          \"shape\":\"GetMapTileRequestYString\",\
          \"documentation\":\"<p>The Y axis value for the map tile. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Y\"\
        },\
        \"Z\":{\
          \"shape\":\"GetMapTileRequestZString\",\
          \"documentation\":\"<p>The zoom value for the map tile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Z\"\
        }\
      }\
    },\
    \"GetMapTileRequestXString\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\d+\"\
    },\
    \"GetMapTileRequestYString\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\d+\"\
    },\
    \"GetMapTileRequestZString\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\d+\"\
    },\
    \"GetMapTileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Blob\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>Contains Mapbox Vector Tile (MVT) data.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The map tile's content type. For example, <code>application/vnd.mapbox-vector-tile</code>.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        }\
      },\
      \"payload\":\"Blob\"\
    },\
    \"Id\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"^[-._\\\\p{L}\\\\p{N}]+$\"\
    },\
    \"IntendedUse\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SingleUse\",\
        \"Storage\"\
      ]\
    },\
    \"InternalServerException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>The request has failed to process because of an unknown server error, exception, or failure.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true,\
      \"retryable\":{\"throttling\":false}\
    },\
    \"LinearRing\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Position\"},\
      \"min\":4\
    },\
    \"LinearRings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LinearRing\"},\
      \"min\":1\
    },\
    \"ListGeofenceCollectionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListGeofenceCollectionsRequestMaxResultsInteger\",\
          \"documentation\":\"<p>An optional limit for the number of resources returned in a single call. </p> <p>Default value: <code>100</code> </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p> <p>Default value: <code>null</code> </p>\"\
        }\
      }\
    },\
    \"ListGeofenceCollectionsRequestMaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListGeofenceCollectionsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Entries\"],\
      \"members\":{\
        \"Entries\":{\
          \"shape\":\"ListGeofenceCollectionsResponseEntryList\",\
          \"documentation\":\"<p>Lists the geofence collections that exist in your AWS account.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>\"\
        }\
      }\
    },\
    \"ListGeofenceCollectionsResponseEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionName\",\
        \"CreateTime\",\
        \"Description\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the geofence collection.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence collection was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The description for the geofence collection</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specifies a timestamp for when the resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the geofence collection details.</p>\"\
    },\
    \"ListGeofenceCollectionsResponseEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListGeofenceCollectionsResponseEntry\"}\
    },\
    \"ListGeofenceResponseEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"GeofenceId\",\
        \"Geometry\",\
        \"Status\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence was stored in a geofence collection in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The geofence identifier.</p>\"\
        },\
        \"Geometry\":{\
          \"shape\":\"GeofenceGeometry\",\
          \"documentation\":\"<p>Contains the geofence geometry details describing a polygon.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the state of the geofence. A geofence will hold one of the following states:</p> <ul> <li> <p> <code>ACTIVE</code> â The geofence has been indexed by the system. </p> </li> <li> <p> <code>PENDING</code> â The geofence is being processed by the system.</p> </li> <li> <p> <code>FAILED</code> â The geofence failed to be indexed by the system.</p> </li> <li> <p> <code>DELETED</code> â The geofence has been deleted from the system index.</p> </li> <li> <p> <code>DELETING</code> â The geofence is being deleted from the system index.</p> </li> </ul>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains a list of geofences stored in a given geofence collection.</p>\"\
    },\
    \"ListGeofenceResponseEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListGeofenceResponseEntry\"}\
    },\
    \"ListGeofencesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionName\"],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the geofence collection storing the list of geofences.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p> <p>Default value: <code>null</code> </p>\"\
        }\
      }\
    },\
    \"ListGeofencesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Entries\"],\
      \"members\":{\
        \"Entries\":{\
          \"shape\":\"ListGeofenceResponseEntryList\",\
          \"documentation\":\"<p>Contains a list of geofences stored in the geofence collection.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>\"\
        }\
      }\
    },\
    \"ListMapsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListMapsRequestMaxResultsInteger\",\
          \"documentation\":\"<p>An optional limit for the number of resources returned in a single call. </p> <p>Default value: <code>100</code> </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page.</p> <p>Default value: <code>null</code> </p>\"\
        }\
      }\
    },\
    \"ListMapsRequestMaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListMapsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Entries\"],\
      \"members\":{\
        \"Entries\":{\
          \"shape\":\"ListMapsResponseEntryList\",\
          \"documentation\":\"<p>Contains a list of maps in your AWS account</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>\"\
        }\
      }\
    },\
    \"ListMapsResponseEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"DataSource\",\
        \"Description\",\
        \"MapName\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the map resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>\"\
        },\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the data provider for the associated map tiles.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The description for the map resource.</p>\"\
        },\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the associated map resource.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the map resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains details of an existing map resource in your AWS account.</p>\"\
    },\
    \"ListMapsResponseEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListMapsResponseEntry\"}\
    },\
    \"ListPlaceIndexesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListPlaceIndexesRequestMaxResultsInteger\",\
          \"documentation\":\"<p>An optional limit for the maximum number of results returned in a single call.</p> <p>Default value: <code>100</code> </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page.</p> <p>Default value: <code>null</code> </p>\"\
        }\
      }\
    },\
    \"ListPlaceIndexesRequestMaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListPlaceIndexesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Entries\"],\
      \"members\":{\
        \"Entries\":{\
          \"shape\":\"ListPlaceIndexesResponseEntryList\",\
          \"documentation\":\"<p>Lists the Place index resources that exist in your AWS account</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListPlaceIndexesResponseEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"DataSource\",\
        \"Description\",\
        \"IndexName\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the Place index resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The data provider of geospatial data.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description for the Place index resource.</p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Place index resource.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the Place index resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A Place index resource listed in your AWS account.</p>\"\
    },\
    \"ListPlaceIndexesResponseEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListPlaceIndexesResponseEntry\"}\
    },\
    \"ListTrackerConsumersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrackerName\"],\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListTrackerConsumersRequestMaxResultsInteger\",\
          \"documentation\":\"<p>An optional limit for the number of resources returned in a single call. </p> <p>Default value: <code>100</code> </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p> <p>Default value: <code>null</code> </p>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The tracker resource whose associated geofence collections you want to list.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"ListTrackerConsumersRequestMaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListTrackerConsumersResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConsumerArns\"],\
      \"members\":{\
        \"ConsumerArns\":{\
          \"shape\":\"ArnList\",\
          \"documentation\":\"<p>Contains the list of geofence collection ARNs associated to the tracker resource.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>\"\
        }\
      }\
    },\
    \"ListTrackersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListTrackersRequestMaxResultsInteger\",\
          \"documentation\":\"<p>An optional limit for the number of resources returned in a single call. </p> <p>Default value: <code>100</code> </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p> <p>Default value: <code>null</code> </p>\"\
        }\
      }\
    },\
    \"ListTrackersRequestMaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListTrackersResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Entries\"],\
      \"members\":{\
        \"Entries\":{\
          \"shape\":\"ListTrackersResponseEntryList\",\
          \"documentation\":\"<p>Contains tracker resources in your AWS account. Details include tracker name, description and timestamps for when the tracker was created and last updated.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>\"\
        }\
      }\
    },\
    \"ListTrackersResponseEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"Description\",\
        \"TrackerName\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the tracker resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The description for the tracker resource.</p>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the position was detected and sampled in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the tracker resource details.</p>\"\
    },\
    \"ListTrackersResponseEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListTrackersResponseEntry\"}\
    },\
    \"MapConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"Style\"],\
      \"members\":{\
        \"Style\":{\
          \"shape\":\"MapStyle\",\
          \"documentation\":\"<p>Specifies the map style selected from an available data provider.</p> <p>Valid styles: <code>VectorEsriStreets</code>, <code>VectorEsriTopographic</code>, <code>VectorEsriNavigation</code>, <code>VectorEsriDarkGrayCanvas</code>, <code>VectorEsriLightGrayCanvas</code>, <code>VectorHereBerlin</code>.</p> <note> <p>When using HERE as your data provider, and selecting the Style <code>VectorHereBerlin</code>, you may not use HERE Maps for Asset Management. See the <a href=\\\"https://aws.amazon.com/service-terms/\\\">AWS Service Terms</a> for Amazon Location Service. </p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the map tile style selected from an available provider.</p>\"\
    },\
    \"MapStyle\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"^[-._\\\\p{L}\\\\p{N}]+$\"\
    },\
    \"Place\":{\
      \"type\":\"structure\",\
      \"required\":[\"Geometry\"],\
      \"members\":{\
        \"AddressNumber\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The numerical portion of an address, such as a building number. </p>\"\
        },\
        \"Country\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A country/region specified using <a href=\\\"https://www.iso.org/iso-3166-country-codes.html\\\">ISO 3166</a> 3-digit country/region code. For example, <code>CAN</code>.</p>\"\
        },\
        \"Geometry\":{\"shape\":\"PlaceGeometry\"},\
        \"Label\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The full name and address of the point of interest such as a city, region, or country. For example, <code>123 Any Street, Any Town, USA</code>.</p>\"\
        },\
        \"Municipality\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A name for a local area, such as a city or town name. For example, <code>Toronto</code>.</p>\"\
        },\
        \"Neighborhood\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of a community district. For example, <code>Downtown</code>.</p>\"\
        },\
        \"PostalCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A group of numbers and letters in a country-specific format, which accompanies the address for the purpose of identifying a location. </p>\"\
        },\
        \"Region\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A name for an area or geographical division, such as a province or state name. For example, <code>British Columbia</code>.</p>\"\
        },\
        \"Street\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name for a street or a road to identify a location. For example, <code>Main Street</code>.</p>\"\
        },\
        \"SubRegion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A country, or an area that's part of a larger region . For example, <code>Metro Vancouver</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains details about addresses or points of interest that match the search criteria.</p>\"\
    },\
    \"PlaceGeometry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Point\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>A single point geometry specifies a location for a Place using <a href=\\\"https://gisgeography.com/wgs84-world-geodetic-system/\\\">WGS 84</a> coordinates:</p> <ul> <li> <p> <i>x</i> â Specifies the x coordinate or longitude. </p> </li> <li> <p> <i>y</i> â Specifies the y coordinate or latitude. </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Places uses a point geometry to specify a location or a Place.</p>\"\
    },\
    \"PlaceIndexSearchResultLimit\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"Position\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Double\"},\
      \"max\":2,\
      \"min\":2,\
      \"sensitive\":true\
    },\
    \"PricingPlan\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RequestBasedUsage\",\
        \"MobileAssetTracking\",\
        \"MobileAssetManagement\"\
      ]\
    },\
    \"PutGeofenceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionName\",\
        \"GeofenceId\",\
        \"Geometry\"\
      ],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The geofence collection to store the geofence in.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>An identifier for the geofence. For example, <code>ExampleGeofence-1</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"GeofenceId\"\
        },\
        \"Geometry\":{\
          \"shape\":\"GeofenceGeometry\",\
          \"documentation\":\"<p>Contains the polygon details to specify the position of the geofence.</p>\"\
        }\
      }\
    },\
    \"PutGeofenceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"GeofenceId\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The geofence identifier entered in the request.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      }\
    },\
    \"ResourceDescription\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"min\":0\
    },\
    \"ResourceName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"^[-._\\\\w]+$\"\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>The resource that you've entered was not found in your AWS account.</p>\",\
      \"error\":{\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"SearchForPositionResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"Place\"],\
      \"members\":{\
        \"Place\":{\
          \"shape\":\"Place\",\
          \"documentation\":\"<p>Contains details about the relevant point of interest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a single point of interest, or Place as a result of a search query obtained from a dataset configured in the Place index Resource.</p>\"\
    },\
    \"SearchForPositionResultList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SearchForPositionResult\"}\
    },\
    \"SearchForTextResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"Place\"],\
      \"members\":{\
        \"Place\":{\
          \"shape\":\"Place\",\
          \"documentation\":\"<p>Contains details about the relevant point of interest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains relevant Places returned by calling <code>SearchPlaceIndexForText</code>.</p>\"\
    },\
    \"SearchForTextResultList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SearchForTextResult\"}\
    },\
    \"SearchPlaceIndexForPositionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IndexName\",\
        \"Position\"\
      ],\
      \"members\":{\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Place index resource you want to use for the search.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IndexName\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PlaceIndexSearchResultLimit\",\
          \"documentation\":\"<p>An optional paramer. The maximum number of results returned per request. </p> <p>Default value: <code>50</code> </p>\"\
        },\
        \"Position\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>Specifies a coordinate for the query defined by a longitude, and latitude.</p> <ul> <li> <p>The first position is the X coordinate, or longitude.</p> </li> <li> <p>The second position is the Y coordinate, or latitude. </p> </li> </ul> <p>For example, <code>position=xLongitude&amp;position=yLatitude</code> .</p>\"\
        }\
      }\
    },\
    \"SearchPlaceIndexForPositionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Results\",\
        \"Summary\"\
      ],\
      \"members\":{\
        \"Results\":{\
          \"shape\":\"SearchForPositionResultList\",\
          \"documentation\":\"<p>Returns a list of Places closest to the specified position. Each result contains additional information about the Places returned.</p>\"\
        },\
        \"Summary\":{\
          \"shape\":\"SearchPlaceIndexForPositionSummary\",\
          \"documentation\":\"<p>Contains a summary of the request.</p>\"\
        }\
      }\
    },\
    \"SearchPlaceIndexForPositionSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSource\",\
        \"Position\"\
      ],\
      \"members\":{\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The data provider of geospatial data for the Place index resource.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PlaceIndexSearchResultLimit\",\
          \"documentation\":\"<p>An optional parameter. The maximum number of results returned per request. </p> <p>Default value: <code>50</code> </p>\"\
        },\
        \"Position\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The position given in the reverse geocoding request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A summary of the reverse geocoding request sent using <code>SearchPlaceIndexForPosition</code>.</p>\"\
    },\
    \"SearchPlaceIndexForTextRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IndexName\",\
        \"Text\"\
      ],\
      \"members\":{\
        \"BiasPosition\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>Searches for results closest to the given position. An optional parameter defined by longitude, and latitude.</p> <ul> <li> <p>The first <code>bias</code> position is the X coordinate, or longitude.</p> </li> <li> <p>The second <code>bias</code> position is the Y coordinate, or latitude. </p> </li> </ul> <p>For example, <code>bias=xLongitude&amp;bias=yLatitude</code>.</p>\"\
        },\
        \"FilterBBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Filters the results by returning only Places within the provided bounding box. An optional parameter.</p> <p>The first 2 <code>bbox</code> parameters describe the lower southwest corner:</p> <ul> <li> <p>The first <code>bbox</code> position is the X coordinate or longitude of the lower southwest corner.</p> </li> <li> <p>The second <code>bbox</code> position is the Y coordinate or latitude of the lower southwest corner.</p> </li> </ul> <p>For example, <code>bbox=xLongitudeSW&amp;bbox=yLatitudeSW</code>.</p> <p>The next <code>bbox</code> parameters describe the upper northeast corner:</p> <ul> <li> <p>The third <code>bbox</code> position is the X coordinate, or longitude of the upper northeast corner.</p> </li> <li> <p>The fourth <code>bbox</code> position is the Y coordinate, or longitude of the upper northeast corner.</p> </li> </ul> <p>For example, <code>bbox=xLongitudeNE&amp;bbox=yLatitudeNE</code> </p>\"\
        },\
        \"FilterCountries\":{\
          \"shape\":\"CountryCodeList\",\
          \"documentation\":\"<p>Limits the search to the given a list of countries/regions. An optional parameter.</p> <ul> <li> <p>Use the <a href=\\\"https://www.iso.org/iso-3166-country-codes.html\\\">ISO 3166</a> 3-digit country code. For example, Australia uses three upper-case characters: <code>AUS</code>.</p> </li> </ul>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Place index resource you want to use for the search.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IndexName\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PlaceIndexSearchResultLimit\",\
          \"documentation\":\"<p>An optional parameter. The maximum number of results returned per request. </p> <p>The default: <code>50</code> </p>\"\
        },\
        \"Text\":{\
          \"shape\":\"SyntheticSearchPlaceIndexForTextRequestString\",\
          \"documentation\":\"<p>The address, name, city, or region to be used in the search. In free-form text format. For example, <code>123 Any Street</code>.</p>\"\
        }\
      }\
    },\
    \"SearchPlaceIndexForTextResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Results\",\
        \"Summary\"\
      ],\
      \"members\":{\
        \"Results\":{\
          \"shape\":\"SearchForTextResultList\",\
          \"documentation\":\"<p>A list of Places closest to the specified position. Each result contains additional information about the specific point of interest. </p>\"\
        },\
        \"Summary\":{\
          \"shape\":\"SearchPlaceIndexForTextSummary\",\
          \"documentation\":\"<p>Contains a summary of the request. Contains the <code>BiasPosition</code>, <code>DataSource</code>, <code>FilterBBox</code>, <code>FilterCountries</code>, <code>MaxResults</code>, <code>ResultBBox</code>, and <code>Text</code>.</p>\"\
        }\
      }\
    },\
    \"SearchPlaceIndexForTextSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSource\",\
        \"Text\"\
      ],\
      \"members\":{\
        \"BiasPosition\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>Contains the coordinates for the bias position entered in the geocoding request.</p>\"\
        },\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The data provider of geospatial data for the Place index resource.</p>\"\
        },\
        \"FilterBBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Contains the coordinates for the optional bounding box coordinated entered in the geocoding request.</p>\"\
        },\
        \"FilterCountries\":{\
          \"shape\":\"CountryCodeList\",\
          \"documentation\":\"<p>Contains the country filter entered in the geocoding request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PlaceIndexSearchResultLimit\",\
          \"documentation\":\"<p>Contains the maximum number of results indicated for the request.</p>\"\
        },\
        \"ResultBBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>A bounding box that contains the search results within the specified area indicated by <code>FilterBBox</code>. A subset of bounding box specified using <code>FilterBBox</code>.</p>\"\
        },\
        \"Text\":{\
          \"shape\":\"SyntheticSearchPlaceIndexForTextSummaryString\",\
          \"documentation\":\"<p>The address, name, city or region to be used in the geocoding request. In free-form text format. For example, <code>Vancouver</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A summary of the geocoding request sent using <code>SearchPlaceIndexForText</code>.</p>\"\
    },\
    \"String\":{\"type\":\"string\"},\
    \"SyntheticSearchPlaceIndexForTextRequestString\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"SyntheticSearchPlaceIndexForTextSummaryString\":{\
      \"type\":\"string\",\
      \"sensitive\":true\
    },\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>The request was denied due to request throttling.</p>\",\
      \"error\":{\
        \"httpStatusCode\":429,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"retryable\":{\"throttling\":false}\
    },\
    \"Timestamp\":{\
      \"type\":\"timestamp\",\
      \"timestampFormat\":\"iso8601\"\
    },\
    \"Token\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1\
    },\
    \"ValidationException\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FieldList\",\
        \"Message\",\
        \"Reason\"\
      ],\
      \"members\":{\
        \"FieldList\":{\
          \"shape\":\"ValidationExceptionFieldList\",\
          \"documentation\":\"<p>The field where the invalid entry was detected.</p>\",\
          \"locationName\":\"fieldList\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"locationName\":\"message\"\
        },\
        \"Reason\":{\
          \"shape\":\"ValidationExceptionReason\",\
          \"documentation\":\"<p>A message with the reason for the validation exception error.</p>\",\
          \"locationName\":\"reason\"\
        }\
      },\
      \"documentation\":\"<p>The input failed to meet the constraints specified by the AWS service. </p>\",\
      \"error\":{\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ValidationExceptionField\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Message\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A message with the reason for the validation exception error.</p>\",\
          \"locationName\":\"message\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The field name where the invalid entry was detected.</p>\",\
          \"locationName\":\"name\"\
        }\
      },\
      \"documentation\":\"<p>The input failed to meet the constraints specified by the AWS service in a specified field. </p>\"\
    },\
    \"ValidationExceptionFieldList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ValidationExceptionField\"}\
    },\
    \"ValidationExceptionReason\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UnknownOperation\",\
        \"Missing\",\
        \"CannotParse\",\
        \"FieldValidationFailed\",\
        \"Other\"\
      ]\
    }\
  },\
  \"documentation\":\"<p>Suite of geospatial services including Maps, Places, Tracking, and Geofencing</p>\"\
}\
";
}

@end
