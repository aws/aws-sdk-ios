//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <AWSCore/AWSCore.h>
#import "AWSTranscribeStreamingEventDecoder.h"
#import "AWSTranscribeStreamingClientDelegate.h"
#import "AWSTranscribeStreamingTranscriptResultStream+Helpers.h"

@implementation AWSTranscribeStreamingEventDecoder

+ (nullable AWSTranscribeStreamingTranscriptResultStream *)decodeEvent:(NSData *)data
                                                         decodingError:(NSError **)decodingErrorPointer  {
    
//    NSURL *destinationURL = [NSURL URLWithString:@"/transcribe_event_stream_data"];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSError *error = nil;
//    NSURL *temporaryDirectoryURL = [fileManager URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:destinationURL create:YES error:&error];
//    assert(error == nil);
//    NSString *temporaryFilename = @"data_chunk";
//    NSURL *temporaryFileURL = [temporaryDirectoryURL URLByAppendingPathComponent:temporaryFilename];
//    [data writeToURL:temporaryFileURL options:NSDataWritingAtomic error:&error];
//    assert(error == nil);
//    AWSDDLogError(@"Wrote data_chunk to %@", temporaryFileURL);
    
    BOOL messageLengthHeaderIsValid =
    [AWSTranscribeStreamingEventDecoder verifyMessageLengthHeaderForData:data
                                                          expectedLength:[data length]];
    
    if (!messageLengthHeaderIsValid) {
        *decodingErrorPointer = [NSError errorWithDomain:AWSTranscribeStreamingClientErrorDomain
                                            code:AWSTranscribeStreamingClientErrorCodeInvalidMessageLengthHeader
                                        userInfo:nil];
        return nil;
    }
    
    if(![AWSTranscribeStreamingEventDecoder verifyPreludeForData:data]) {
        *decodingErrorPointer = [NSError errorWithDomain:AWSTranscribeStreamingClientErrorDomain
                                            code:AWSTranscribeStreamingClientErrorCodeInvalidMessagePrelude
                                        userInfo:nil];
        return nil;
    }
    
    NSDictionary<NSString *, NSString *> *headers = [AWSTranscribeStreamingEventDecoder getHeadersForData:data];
    AWSDDLogVerbose(@"Response headers: %@", headers);

    NSString *body = [AWSTranscribeStreamingEventDecoder getBodyForData:data];
    AWSDDLogVerbose(@"First 100 bytes of body: %@", [body substringToIndex:MIN(100, body.length)]);
    
    AWSTranscribeStreamingTranscriptResultStream *resultStream = [AWSTranscribeStreamingTranscriptResultStream resultStreamForWSSBody:body
                                                                                                                              headers:headers
                                                                                                                                error:decodingErrorPointer];

    if (decodingErrorPointer && *decodingErrorPointer) {
        AWSDDLogError(@"Error deserializing response data into AWSTranscribeStreamingTranscriptResultStream: %@", *decodingErrorPointer);
    } else {
        AWSDDLogDebug(@"Created AWSTranscribeStreamingTranscriptResultStream from decoded message");
    }
    
    return resultStream;
}

+(bool)verifyMessageLengthHeaderForData:(NSData *)data
                         expectedLength:(NSUInteger)len {
    // TODO: Implement reverse process of encoding to verify the length
    return YES;
}

+(bool)verifyPreludeForData:(NSData *)data {
    // TODO: Implement reverse process of encoding to verify the prelude
    return YES;
}

+(NSDictionary<NSString *, NSString *> *)getHeadersForData:(NSData *)data {
    
    int headerLen = [AWSTranscribeStreamingEventDecoder getHeaderLengthForData:data];
    NSData *headerData = [data subdataWithRange:NSMakeRange(12, headerLen)];
    int currentPosition = 0;
    NSMutableDictionary<NSString *, NSString *> *dictionary = [NSMutableDictionary new];
    
    while (currentPosition < headerLen) {
        int currentHeaderLen = *(int *)[[headerData subdataWithRange:NSMakeRange(currentPosition, 1)]  bytes];
        currentPosition++;
        NSString *headerKey = [[NSString alloc] initWithData:[headerData subdataWithRange:NSMakeRange(currentPosition, currentHeaderLen)] encoding:NSUTF8StringEncoding];
        AWSDDLogVerbose(@"Header Name: %@", headerKey);
        currentPosition += currentHeaderLen;
        
        // skip header type info, always 7 while decoding
        currentPosition++;
        
        int currentHeaderValueLen = CFSwapInt16(*(UInt16 *)[[headerData subdataWithRange:NSMakeRange(currentPosition, 2)]  bytes]);
        currentPosition += 2;

        NSString *headerValue = [[NSString alloc] initWithData:[headerData subdataWithRange:NSMakeRange(currentPosition, currentHeaderValueLen)] encoding:NSUTF8StringEncoding];
        AWSDDLogVerbose(@"Header Value: %@", headerValue);

        dictionary[headerKey] = headerValue;

        currentPosition += currentHeaderValueLen;
    }
    
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

+(NSString *)getBodyForData:(NSData *)data {
    NSUInteger headerLen = [AWSTranscribeStreamingEventDecoder getHeaderLengthForData:data];
    NSUInteger messageLen = [data length];
    NSUInteger dataStartPos = 4 + 4 + 4 + headerLen;
    NSUInteger dataLen = messageLen - dataStartPos - 4;
    NSString *dataString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(dataStartPos, dataLen)] encoding:NSUTF8StringEncoding];
    return dataString;
}

+(int)getHeaderLengthForData:(NSData *)data {
    return CFSwapInt32(*(UInt32 *)[[data subdataWithRange:NSMakeRange(4, 8)]  bytes]);;
}

@end
