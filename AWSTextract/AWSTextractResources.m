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

#import "AWSTextractResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSTextractResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSTextractResources

+ (instancetype)sharedInstance {
    static AWSTextractResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSTextractResources new];
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
    \"apiVersion\":\"2018-06-27\",\
    \"endpointPrefix\":\"textract\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Textract\",\
    \"serviceId\":\"Textract\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"Textract\",\
    \"uid\":\"textract-2018-06-27\"\
  },\
  \"operations\":{\
    \"AnalyzeDocument\":{\
      \"name\":\"AnalyzeDocument\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AnalyzeDocumentRequest\"},\
      \"output\":{\"shape\":\"AnalyzeDocumentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"UnsupportedDocumentException\"},\
        {\"shape\":\"DocumentTooLargeException\"},\
        {\"shape\":\"BadDocumentException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Analyzes an input document for relationships between detected items. </p> <p>The types of information returned are as follows: </p> <ul> <li> <p>Words and lines that are related to nearby lines and words. The related information is returned in two <a>Block</a> objects each of type <code>KEY_VALUE_SET</code>: a KEY Block object and a VALUE Block object. For example, <i>Name: Ana Silva Carolina</i> contains a key and value. <i>Name:</i> is the key. <i>Ana Silva Carolina</i> is the value.</p> </li> <li> <p>Table and table cell data. A TABLE Block object contains information about a detected table. A CELL Block object is returned for each cell in a table.</p> </li> <li> <p>Selectable elements such as checkboxes and radio buttons. A SELECTION_ELEMENT Block object contains information about a selectable element.</p> </li> <li> <p>Lines and words of text. A LINE Block object contains one or more WORD Block objects.</p> </li> </ul> <p>You can choose which type of analysis to perform by specifying the <code>FeatureTypes</code> list. </p> <p>The output is returned in a list of <code>BLOCK</code> objects.</p> <p> <code>AnalyzeDocument</code> is a synchronous operation. To analyze documents asynchronously, use <a>StartDocumentAnalysis</a>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html\\\">Document Text Analysis</a>.</p>\"\
    },\
    \"DetectDocumentText\":{\
      \"name\":\"DetectDocumentText\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectDocumentTextRequest\"},\
      \"output\":{\"shape\":\"DetectDocumentTextResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"UnsupportedDocumentException\"},\
        {\"shape\":\"DocumentTooLargeException\"},\
        {\"shape\":\"BadDocumentException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Detects text in the input document. Amazon Textract can detect lines of text and the words that make up a line of text. The input document must be an image in JPG or PNG format. <code>DetectDocumentText</code> returns the detected text in an array of <a>Block</a> objects. </p> <p>Each document page has as an associated <code>Block</code> of type PAGE. Each PAGE <code>Block</code> object is the parent of LINE <code>Block</code> objects that represent the lines of detected text on a page. A LINE <code>Block</code> object is a parent for each word that makes up the line. Words are represented by <code>Block</code> objects of type WORD.</p> <p> <code>DetectDocumentText</code> is a synchronous operation. To analyze documents asynchronously, use <a>StartDocumentTextDetection</a>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html\\\">Document Text Detection</a>.</p>\"\
    },\
    \"GetDocumentAnalysis\":{\
      \"name\":\"GetDocumentAnalysis\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDocumentAnalysisRequest\"},\
      \"output\":{\"shape\":\"GetDocumentAnalysisResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidJobIdException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the results for an Amazon Textract asynchronous operation that analyzes text in a document.</p> <p>You start asynchronous text analysis by calling <a>StartDocumentAnalysis</a>, which returns a job identifier (<code>JobId</code>). When the text analysis operation finishes, Amazon Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS) topic that's registered in the initial call to <code>StartDocumentAnalysis</code>. To get the results of the text-detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetDocumentAnalysis</code>, and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartDocumentAnalysis</code>.</p> <p> <code>GetDocumentAnalysis</code> returns an array of <a>Block</a> objects. The following types of information are returned: </p> <ul> <li> <p>Words and lines that are related to nearby lines and words. The related information is returned in two <a>Block</a> objects each of type <code>KEY_VALUE_SET</code>: a KEY Block object and a VALUE Block object. For example, <i>Name: Ana Silva Carolina</i> contains a key and value. <i>Name:</i> is the key. <i>Ana Silva Carolina</i> is the value.</p> </li> <li> <p>Table and table cell data. A TABLE Block object contains information about a detected table. A CELL Block object is returned for each cell in a table.</p> </li> <li> <p>Selectable elements such as checkboxes and radio buttons. A SELECTION_ELEMENT Block object contains information about a selectable element.</p> </li> <li> <p>Lines and words of text. A LINE Block object contains one or more WORD Block objects.</p> </li> </ul> <p>Use the <code>MaxResults</code> parameter to limit the number of blocks returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetDocumentAnalysis</code>, and populate the <code>NextToken</code> request parameter with the token value that's returned from the previous call to <code>GetDocumentAnalysis</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html\\\">Document Text Analysis</a>.</p>\"\
    },\
    \"GetDocumentTextDetection\":{\
      \"name\":\"GetDocumentTextDetection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDocumentTextDetectionRequest\"},\
      \"output\":{\"shape\":\"GetDocumentTextDetectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidJobIdException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the results for an Amazon Textract asynchronous operation that detects text in a document. Amazon Textract can detect lines of text and the words that make up a line of text.</p> <p>You start asynchronous text detection by calling <a>StartDocumentTextDetection</a>, which returns a job identifier (<code>JobId</code>). When the text detection operation finishes, Amazon Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS) topic that's registered in the initial call to <code>StartDocumentTextDetection</code>. To get the results of the text-detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetDocumentTextDetection</code>, and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartDocumentTextDetection</code>.</p> <p> <code>GetDocumentTextDetection</code> returns an array of <a>Block</a> objects. </p> <p>Each document page has as an associated <code>Block</code> of type PAGE. Each PAGE <code>Block</code> object is the parent of LINE <code>Block</code> objects that represent the lines of detected text on a page. A LINE <code>Block</code> object is a parent for each word that makes up the line. Words are represented by <code>Block</code> objects of type WORD.</p> <p>Use the MaxResults parameter to limit the number of blocks that are returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetDocumentTextDetection</code>, and populate the <code>NextToken</code> request parameter with the token value that's returned from the previous call to <code>GetDocumentTextDetection</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html\\\">Document Text Detection</a>.</p>\"\
    },\
    \"StartDocumentAnalysis\":{\
      \"name\":\"StartDocumentAnalysis\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartDocumentAnalysisRequest\"},\
      \"output\":{\"shape\":\"StartDocumentAnalysisResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"UnsupportedDocumentException\"},\
        {\"shape\":\"DocumentTooLargeException\"},\
        {\"shape\":\"BadDocumentException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Starts asynchronous analysis of an input document for relationships between detected items such as key and value pairs, tables, and selection elements.</p> <p> <code>StartDocumentAnalysis</code> can analyze text in documents that are in JPG, PNG, and PDF format. The documents are stored in an Amazon S3 bucket. Use <a>DocumentLocation</a> to specify the bucket name and file name of the document. </p> <p> <code>StartDocumentAnalysis</code> returns a job identifier (<code>JobId</code>) that you use to get the results of the operation. When text analysis is finished, Amazon Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS) topic that you specify in <code>NotificationChannel</code>. To get the results of the text analysis operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetDocumentAnalysis</a>, and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartDocumentAnalysis</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html\\\">Document Text Analysis</a>.</p>\"\
    },\
    \"StartDocumentTextDetection\":{\
      \"name\":\"StartDocumentTextDetection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartDocumentTextDetectionRequest\"},\
      \"output\":{\"shape\":\"StartDocumentTextDetectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"UnsupportedDocumentException\"},\
        {\"shape\":\"DocumentTooLargeException\"},\
        {\"shape\":\"BadDocumentException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Starts the asynchronous detection of text in a document. Amazon Textract can detect lines of text and the words that make up a line of text.</p> <p> <code>StartDocumentTextDetection</code> can analyze text in documents that are in JPG, PNG, and PDF format. The documents are stored in an Amazon S3 bucket. Use <a>DocumentLocation</a> to specify the bucket name and file name of the document. </p> <p> <code>StartTextDetection</code> returns a job identifier (<code>JobId</code>) that you use to get the results of the operation. When text detection is finished, Amazon Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS) topic that you specify in <code>NotificationChannel</code>. To get the results of the text detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetDocumentTextDetection</a>, and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartDocumentTextDetection</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html\\\">Document Text Detection</a>.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You aren't authorized to perform the action.</p>\",\
      \"exception\":true\
    },\
    \"AnalyzeDocumentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Document\",\
        \"FeatureTypes\"\
      ],\
      \"members\":{\
        \"Document\":{\
          \"shape\":\"Document\",\
          \"documentation\":\"<p>The input document as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI to call Amazon Textract operations, you can't pass image bytes. The document must be an image in JPG or PNG format.</p> <p>If you are using an AWS SDK to call Amazon Textract, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. </p>\"\
        },\
        \"FeatureTypes\":{\
          \"shape\":\"FeatureTypes\",\
          \"documentation\":\"<p>A list of the types of analysis to perform. Add TABLES to the list to return information about the tables detected in the input document. Add FORMS to return detected fields and the associated text. To perform both types of analysis, add TABLES and FORMS to <code>FeatureTypes</code>.</p>\"\
        }\
      }\
    },\
    \"AnalyzeDocumentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentMetadata\":{\
          \"shape\":\"DocumentMetadata\",\
          \"documentation\":\"<p>Metadata about the analyzed document. An example is the number of pages.</p>\"\
        },\
        \"Blocks\":{\
          \"shape\":\"BlockList\",\
          \"documentation\":\"<p>The text that's detected and analyzed by <code>AnalyzeDocument</code>.</p>\"\
        }\
      }\
    },\
    \"BadDocumentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Amazon Textract isn't able to read the document.</p>\",\
      \"exception\":true\
    },\
    \"Block\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BlockType\":{\
          \"shape\":\"BlockType\",\
          \"documentation\":\"<p>The type of text that's recognized in a block. In text-detection operations, the following types are returned:</p> <ul> <li> <p> <i>PAGE</i> - Contains a list of the LINE Block objects that are detected on a document page.</p> </li> <li> <p> <i>WORD</i> - A word detected on a document page. A word is one or more ISO basic Latin script characters that aren't separated by spaces.</p> </li> <li> <p> <i>LINE</i> - A string of tab-delimited, contiguous words that's detected on a document page.</p> </li> </ul> <p>In text analysis operations, the following types are returned:</p> <ul> <li> <p> <i>PAGE</i> - Contains a list of child Block objects that are detected on a document page.</p> </li> <li> <p> <i>KEY_VALUE_SET</i> - Stores the KEY and VALUE Block objects for a field that's detected on a document page. Use the <code>EntityType</code> field to determine if a KEY_VALUE_SET object is a KEY Block object or a VALUE Block object. </p> </li> <li> <p> <i>WORD</i> - A word detected on a document page. A word is one or more ISO basic Latin script characters that aren't separated by spaces that's detected on a document page.</p> </li> <li> <p> <i>LINE</i> - A string of tab-delimited, contiguous words that's detected on a document page.</p> </li> <li> <p> <i>TABLE</i> - A table that's detected on a document page. A table is any grid-based information with 2 or more rows or columns with a cell span of 1 row and 1 column each. </p> </li> <li> <p> <i>CELL</i> - A cell within a detected table. The cell is the parent of the block that contains the text in the cell.</p> </li> <li> <p> <i>SELECTION_ELEMENT</i> - A selectable element such as a radio button or checkbox that's detected on a document page. Use the value of <code>SelectionStatus</code> to determine the status of the selection element.</p> </li> </ul>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The confidence that Amazon Textract has in the accuracy of the recognized text and the accuracy of the geometry points around the recognized text.</p>\"\
        },\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The word or line of text that's recognized by Amazon Textract. </p>\"\
        },\
        \"RowIndex\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The row in which a table cell is located. The first row position is 1. <code>RowIndex</code> isn't returned by <code>DetectDocumentText</code> and <code>GetDocumentTextDetection</code>.</p>\"\
        },\
        \"ColumnIndex\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The column in which a table cell appears. The first column position is 1. <code>ColumnIndex</code> isn't returned by <code>DetectDocumentText</code> and <code>GetDocumentTextDetection</code>.</p>\"\
        },\
        \"RowSpan\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The number of rows that a table spans. <code>RowSpan</code> isn't returned by <code>DetectDocumentText</code> and <code>GetDocumentTextDetection</code>.</p>\"\
        },\
        \"ColumnSpan\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The number of columns that a table cell spans. <code>ColumnSpan</code> isn't returned by <code>DetectDocumentText</code> and <code>GetDocumentTextDetection</code>. </p>\"\
        },\
        \"Geometry\":{\
          \"shape\":\"Geometry\",\
          \"documentation\":\"<p>The location of the recognized text on the image. It includes an axis-aligned, coarse bounding box that surrounds the text, and a finer-grain polygon for more accurate spatial information. </p>\"\
        },\
        \"Id\":{\
          \"shape\":\"NonEmptyString\",\
          \"documentation\":\"<p>The identifier for the recognized text. The identifier is only unique for a single operation. </p>\"\
        },\
        \"Relationships\":{\
          \"shape\":\"RelationshipList\",\
          \"documentation\":\"<p>A list of child blocks of the current block. For example a LINE object has child blocks for each WORD block that's part of the line of text. There aren't Relationship objects in the list for relationships that don't exist, such as when the current block has no child blocks. The list size can be the following:</p> <ul> <li> <p>0 - The block has no child blocks.</p> </li> <li> <p>1 - The block has child blocks.</p> </li> </ul>\"\
        },\
        \"EntityTypes\":{\
          \"shape\":\"EntityTypes\",\
          \"documentation\":\"<p>The type of entity. The following can be returned:</p> <ul> <li> <p> <i>KEY</i> - An identifier for a field on the document.</p> </li> <li> <p> <i>VALUE</i> - The field text.</p> </li> </ul> <p> <code>EntityTypes</code> isn't returned by <code>DetectDocumentText</code> and <code>GetDocumentTextDetection</code>.</p>\"\
        },\
        \"SelectionStatus\":{\
          \"shape\":\"SelectionStatus\",\
          \"documentation\":\"<p>The selection status of a selectable element such as a radio button or checkbox. </p>\"\
        },\
        \"Page\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The page in which a block was detected. <code>Page</code> is returned by asynchronous operations. Page values greater than 1 are only returned for multi-page documents that are in PDF format. A scanned image (JPG/PNG), even if it contains multiple document pages, is always considered to be a single-page document and the value of <code>Page</code> is always 1. Synchronous operations don't return <code>Page</code> as every input document is considered to be a single-page document.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A <code>Block</code> represents items that are recognized in a document within a group of pixels close to each other. The information returned in a <code>Block</code> depends on the type of operation. In document-text detection (for example <a>DetectDocumentText</a>), you get information about the detected words and lines of text. In text analysis (for example <a>AnalyzeDocument</a>), you can also get information about the fields, tables and selection elements that are detected in the document.</p> <p>An array of <code>Block</code> objects is returned by both synchronous and asynchronous operations. In synchronous operations, such as <a>DetectDocumentText</a>, the array of <code>Block</code> objects is the entire set of results. In asynchronous operations, such as <a>GetDocumentAnalysis</a>, the array is returned over one or more responses.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/textract/latest/dg/how-it-works.html\\\">How Amazon Textract Works</a>.</p>\"\
    },\
    \"BlockList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Block\"}\
    },\
    \"BlockType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"KEY_VALUE_SET\",\
        \"PAGE\",\
        \"LINE\",\
        \"WORD\",\
        \"TABLE\",\
        \"CELL\",\
        \"SELECTION_ELEMENT\"\
      ]\
    },\
    \"BoundingBox\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Width\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The width of the bounding box as a ratio of the overall document page width.</p>\"\
        },\
        \"Height\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The height of the bounding box as a ratio of the overall document page height.</p>\"\
        },\
        \"Left\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The left coordinate of the bounding box as a ratio of overall document page width.</p>\"\
        },\
        \"Top\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The top coordinate of the bounding box as a ratio of overall document page height.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The bounding box around the recognized text, key, value, table or table cell on a document page. The <code>left</code> (x-coordinate) and <code>top</code> (y-coordinate) are coordinates that represent the top and left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0). </p> <p>The <code>top</code> and <code>left</code> values returned are ratios of the overall document page size. For example, if the input image is 700 x 200 pixels, and the top-left coordinate of the bounding box is 350 x 50 pixels, the API returns a <code>left</code> value of 0.5 (350/700) and a <code>top</code> value of 0.25 (50/200).</p> <p>The <code>width</code> and <code>height</code> values represent the dimensions of the bounding box as a ratio of the overall document page dimension. For example, if the document page size is 700 x 200 pixels, and the bounding box width is 70 pixels, the width returned is 0.1. </p>\"\
    },\
    \"ClientRequestToken\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9-_]+$\"\
    },\
    \"DetectDocumentTextRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Document\"],\
      \"members\":{\
        \"Document\":{\
          \"shape\":\"Document\",\
          \"documentation\":\"<p>The input document as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI to call Amazon Textract operations, you can't pass image bytes. The document must be an image in JPG or PNG format.</p> <p>If you are using an AWS SDK to call Amazon Textract, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. </p>\"\
        }\
      }\
    },\
    \"DetectDocumentTextResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentMetadata\":{\
          \"shape\":\"DocumentMetadata\",\
          \"documentation\":\"<p>Metadata about the document. Contains the number of pages that are detected in the document.</p>\"\
        },\
        \"Blocks\":{\
          \"shape\":\"BlockList\",\
          \"documentation\":\"<p>An array of Block objects containing the text detected in the document.</p>\"\
        }\
      }\
    },\
    \"Document\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Bytes\":{\
          \"shape\":\"ImageBlob\",\
          \"documentation\":\"<p>A blob of base-64 encoded documents bytes. The maximum size of a document that's provided in a blob of bytes is 5 MB. The document bytes must be in PNG or JPG format.</p> <p>If you are using an AWS SDK to call Amazon Textract, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. </p>\"\
        },\
        \"S3Object\":{\
          \"shape\":\"S3Object\",\
          \"documentation\":\"<p>Identifies an S3 object as the document source. The maximum size of a document stored in an S3 bucket is 5 MB.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input document, either as bytes or as an S3 object.</p> <p>You pass image bytes to an Amazon Textract API operation by using the <code>Bytes</code> property. For example, you would use the <code>Bytes</code> property to pass a document loaded from a local file system. Image bytes passed by using the <code>Bytes</code> property must be base64 encoded. Your code might not need to encode document file bytes if you're using an AWS SDK to call Amazon Textract API operations. </p> <p>You pass images stored in an S3 bucket to an Amazon Textract API operation by using the <code>S3Object</code> property. Documents stored in an S3 bucket don't need to be base64 encoded.</p> <p>The AWS Region for the S3 bucket that contains the S3 object must match the AWS Region that you use for Amazon Textract operations.</p> <p>If you use the AWS CLI to call Amazon Textract operations, passing image bytes using the Bytes property isn't supported. You must first upload the document to an Amazon S3 bucket, and then call the operation using the S3Object property.</p> <p>For Amazon Textract to process an S3 object, the user must have permission to access the S3 object. </p>\"\
    },\
    \"DocumentLocation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Object\":{\
          \"shape\":\"S3Object\",\
          \"documentation\":\"<p>The Amazon S3 bucket that contains the input document.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon S3 bucket that contains the document to be processed. It's used by asynchronous operations such as <a>StartDocumentTextDetection</a>.</p> <p>The input document can be an image file in JPG or PNG format. It can also be a file in PDF format.</p>\"\
    },\
    \"DocumentMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Pages\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The number of pages detected in the document.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the input document.</p>\"\
    },\
    \"DocumentTooLargeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The document can't be processed because it's too large. The maximum document size for synchronous operations 5 MB. The maximum document size for asynchronous operations is 500 MB for PDF format files.</p>\",\
      \"exception\":true\
    },\
    \"EntityType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"KEY\",\
        \"VALUE\"\
      ]\
    },\
    \"EntityTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EntityType\"}\
    },\
    \"ErrorCode\":{\"type\":\"string\"},\
    \"FeatureType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TABLES\",\
        \"FORMS\"\
      ]\
    },\
    \"FeatureTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FeatureType\"}\
    },\
    \"Float\":{\"type\":\"float\"},\
    \"Geometry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>An axis-aligned coarse representation of the location of the recognized text on the document page.</p>\"\
        },\
        \"Polygon\":{\
          \"shape\":\"Polygon\",\
          \"documentation\":\"<p>Within the bounding box, a fine-grained polygon around the recognized text.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about where a recognized text, key, value, table, or table cell is located on a document page.</p>\"\
    },\
    \"GetDocumentAnalysisRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>A unique identifier for the text-detection job. The <code>JobId</code> is returned from <code>StartDocumentAnalysis</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return per paginated call. The largest value that you can specify is 1,000. If you specify a value greater than 1,000, a maximum of 1,000 results is returned. The default value is 1,000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there are more blocks to retrieve), Amazon Textract returns a pagination token in the response. You can use this pagination token to retrieve the next set of blocks.</p>\"\
        }\
      }\
    },\
    \"GetDocumentAnalysisResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentMetadata\":{\
          \"shape\":\"DocumentMetadata\",\
          \"documentation\":\"<p>Information about a document that Amazon Textract processed. <code>DocumentMetadata</code> is returned in every page of paginated responses from an Amazon Textract video operation.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the text detection job.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Textract returns this token. You can use this token in the subsequent request to retrieve the next set of text detection results.</p>\"\
        },\
        \"Blocks\":{\
          \"shape\":\"BlockList\",\
          \"documentation\":\"<p>The results of the text analysis operation.</p>\"\
        },\
        \"Warnings\":{\
          \"shape\":\"Warnings\",\
          \"documentation\":\"<p>A list of warnings that occurred during the document analysis operation.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>The current status of an asynchronous document analysis operation.</p>\"\
        }\
      }\
    },\
    \"GetDocumentTextDetectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>A unique identifier for the text detection job. The <code>JobId</code> is returned from <code>StartDocumentTextDetection</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return per paginated call. The largest value you can specify is 1,000. If you specify a value greater than 1,000, a maximum of 1,000 results is returned. The default value is 1,000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there are more blocks to retrieve), Amazon Textract returns a pagination token in the response. You can use this pagination token to retrieve the next set of blocks.</p>\"\
        }\
      }\
    },\
    \"GetDocumentTextDetectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentMetadata\":{\
          \"shape\":\"DocumentMetadata\",\
          \"documentation\":\"<p>Information about a document that Amazon Textract processed. <code>DocumentMetadata</code> is returned in every page of paginated responses from an Amazon Textract video operation.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the text detection job.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Textract returns this token. You can use this token in the subsequent request to retrieve the next set of text-detection results.</p>\"\
        },\
        \"Blocks\":{\
          \"shape\":\"BlockList\",\
          \"documentation\":\"<p>The results of the text-detection operation.</p>\"\
        },\
        \"Warnings\":{\
          \"shape\":\"Warnings\",\
          \"documentation\":\"<p>A list of warnings that occurred during the document text-detection operation.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>The current status of an asynchronous document text-detection operation. </p>\"\
        }\
      }\
    },\
    \"IdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyString\"}\
    },\
    \"IdempotentParameterMismatchException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A <code>ClientRequestToken</code> input parameter was reused with an operation, but at least one of the other input parameters is different from the previous call to the operation. </p>\",\
      \"exception\":true\
    },\
    \"ImageBlob\":{\
      \"type\":\"blob\",\
      \"max\":5242880,\
      \"min\":1\
    },\
    \"InternalServerError\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Amazon Textract experienced a service issue. Try your call again.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidJobIdException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An invalid job identifier was passed to <a>GetDocumentAnalysis</a> or to <a>GetDocumentAnalysis</a>.</p>\",\
      \"exception\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An input parameter violated a constraint. For example, in synchronous operations, an <code>InvalidParameterException</code> exception occurs when neither of the <code>S3Object</code> or <code>Bytes</code> values are supplied in the <code>Document</code> request parameter. Validate your parameter before calling the API operation again.</p>\",\
      \"exception\":true\
    },\
    \"InvalidS3ObjectException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Amazon Textract is unable to access the S3 object that's specified in the request.</p>\",\
      \"exception\":true\
    },\
    \"JobId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9-_]+$\"\
    },\
    \"JobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"SUCCEEDED\",\
        \"FAILED\",\
        \"PARTIAL_SUCCESS\"\
      ]\
    },\
    \"JobTag\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.\\\\-:]+\"\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An Amazon Textract service limit was exceeded. For example, if you start too many asynchronous jobs concurrently, calls to start operations (<code>StartDocumentTextDetection</code>, for example) raise a LimitExceededException exception (HTTP status code: 400) until the number of concurrently running jobs is below the Amazon Textract service limit. </p>\",\
      \"exception\":true\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"NonEmptyString\":{\
      \"type\":\"string\",\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"NotificationChannel\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SNSTopicArn\",\
        \"RoleArn\"\
      ],\
      \"members\":{\
        \"SNSTopicArn\":{\
          \"shape\":\"SNSTopicArn\",\
          \"documentation\":\"<p>The Amazon SNS topic that Amazon Textract posts the completion status to.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an IAM role that gives Amazon Textract publishing permissions to the Amazon SNS topic. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon Simple Notification Service (Amazon SNS) topic to which Amazon Textract publishes the completion status of an asynchronous document operation, such as <a>StartDocumentTextDetection</a>. </p>\"\
    },\
    \"Pages\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UInteger\"}\
    },\
    \"PaginationToken\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"Percent\":{\
      \"type\":\"float\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"Point\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"X\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The value of the X coordinate for a point on a <code>Polygon</code>.</p>\"\
        },\
        \"Y\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The value of the Y coordinate for a point on a <code>Polygon</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The X and Y coordinates of a point on a document page. The X and Y values returned are ratios of the overall document page size. For example, if the input document is 700 x 200 and the operation returns X=0.5 and Y=0.25, then the point is at the (350,50) pixel coordinate on the document page.</p> <p>An array of <code>Point</code> objects, <code>Polygon</code>, is returned by <a>DetectDocumentText</a>. <code>Polygon</code> represents a fine-grained polygon around detected text. For more information, see Geometry in the Amazon Textract Developer Guide. </p>\"\
    },\
    \"Polygon\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Point\"}\
    },\
    \"ProvisionedThroughputExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The number of requests exceeded your throughput limit. If you want to increase this limit, contact Amazon Textract.</p>\",\
      \"exception\":true\
    },\
    \"Relationship\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"RelationshipType\",\
          \"documentation\":\"<p>The type of relationship that the blocks in the IDs array have with the current block. The relationship can be <code>VALUE</code> or <code>CHILD</code>.</p>\"\
        },\
        \"Ids\":{\
          \"shape\":\"IdList\",\
          \"documentation\":\"<p>An array of IDs for related blocks. You can get the type of the relationship from the <code>Type</code> element.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about how blocks are related to each other. A <code>Block</code> object contains 0 or more <code>Relation</code> objects in a list, <code>Relationships</code>. For more information, see <a>Block</a>.</p> <p>The <code>Type</code> element provides the type of the relationship for all blocks in the <code>IDs</code> array. </p>\"\
    },\
    \"RelationshipList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Relationship\"}\
    },\
    \"RelationshipType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"VALUE\",\
        \"CHILD\"\
      ]\
    },\
    \"RoleArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"arn:([a-z\\\\d-]+):iam::\\\\d{12}:role/?[a-zA-Z_0-9+=,.@\\\\-_/]+\"\
    },\
    \"S3Bucket\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":3,\
      \"pattern\":\"[0-9A-Za-z\\\\.\\\\-_]*\"\
    },\
    \"S3Object\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>The name of the S3 bucket.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"S3ObjectName\",\
          \"documentation\":\"<p>The file name of the input document. It must be an image file (.JPG or .PNG format). Asynchronous operations also support PDF files.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"S3ObjectVersion\",\
          \"documentation\":\"<p>If the bucket has versioning enabled, you can specify the object version. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The S3 bucket name and file name that identifies the document.</p> <p>The AWS Region for the S3 bucket that contains the document must match the Region that you use for Amazon Textract operations.</p> <p>For Amazon Textract to process a file in an S3 bucket, the user must have permission to access the S3 bucket and file. </p>\"\
    },\
    \"S3ObjectName\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"S3ObjectVersion\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"SNSTopicArn\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":20,\
      \"pattern\":\"(^arn:([a-z\\\\d-]+):sns:[a-zA-Z\\\\d-]{1,20}:\\\\w{12}:.+$)\"\
    },\
    \"SelectionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SELECTED\",\
        \"NOT_SELECTED\"\
      ]\
    },\
    \"StartDocumentAnalysisRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DocumentLocation\",\
        \"FeatureTypes\"\
      ],\
      \"members\":{\
        \"DocumentLocation\":{\
          \"shape\":\"DocumentLocation\",\
          \"documentation\":\"<p>The location of the document to be processed.</p>\"\
        },\
        \"FeatureTypes\":{\
          \"shape\":\"FeatureTypes\",\
          \"documentation\":\"<p>A list of the types of analysis to perform. Add TABLES to the list to return information about the tables that are detected in the input document. Add FORMS to return detected fields and the associated text. To perform both types of analysis, add TABLES and FORMS to <code>FeatureTypes</code>. All selectable elements (<code>SELECTION_ELEMENT</code>) that are detected are returned, whatever the value of <code>FeatureTypes</code>. </p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The idempotent token that you use to identify the start request. If you use the same token with multiple <code>StartDocumentAnalysis</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidentally started more than once. </p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>An identifier you specify that's included in the completion notification that's published to the Amazon SNS topic. For example, you can use <code>JobTag</code> to identify the type of document, such as a tax form or a receipt, that the completion notification corresponds to.</p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The Amazon SNS topic ARN that you want Amazon Textract to publish the completion status of the operation to. </p>\"\
        }\
      }\
    },\
    \"StartDocumentAnalysisResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the document text detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetDocumentAnalysis</code>.</p>\"\
        }\
      }\
    },\
    \"StartDocumentTextDetectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DocumentLocation\"],\
      \"members\":{\
        \"DocumentLocation\":{\
          \"shape\":\"DocumentLocation\",\
          \"documentation\":\"<p>The location of the document to be processed.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The idempotent token that's used to identify the start request. If you use the same token with multiple <code>StartDocumentTextDetection</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidentally started more than once. </p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>An identifier you specify that's included in the completion notification that's published to the Amazon SNS topic. For example, you can use <code>JobTag</code> to identify the type of document, such as a tax form or a receipt, that the completion notification corresponds to.</p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The Amazon SNS topic ARN that you want Amazon Textract to publish the completion status of the operation to. </p>\"\
        }\
      }\
    },\
    \"StartDocumentTextDetectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the document text-detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetDocumentTextDetection</code>.</p>\"\
        }\
      }\
    },\
    \"StatusMessage\":{\"type\":\"string\"},\
    \"String\":{\"type\":\"string\"},\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Amazon Textract is temporarily unable to process the request. Try your call again.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"UInteger\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"UnsupportedDocumentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The format of the input document isn't supported. Amazon Textract supports documents that are .png or .jpg format.</p>\",\
      \"exception\":true\
    },\
    \"Warning\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ErrorCode\":{\
          \"shape\":\"ErrorCode\",\
          \"documentation\":\"<p>The error code for the warning.</p>\"\
        },\
        \"Pages\":{\
          \"shape\":\"Pages\",\
          \"documentation\":\"<p>A list of the pages that the warning applies to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A warning about an issue that occurred during asynchronous text analysis (<a>StartDocumentAnalysis</a>) or asynchronous document-text detection (<a>StartDocumentTextDetection</a>). </p>\"\
    },\
    \"Warnings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Warning\"}\
    }\
  },\
  \"documentation\":\"<p>Amazon Textract detects and analyzes text in documents and converts it into machine-readable text. This is the API reference documentation for Amazon Textract.</p>\"\
}\
";
}

@end
