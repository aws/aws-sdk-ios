from subprocess import Popen, PIPE
import os
from datetime import datetime
import time
podpackages = [
               'AWSCore.podspec',
               'AWSAPIGateway.podspec',
               'AWSAutoScaling.podspec',
               'AWSCloudWatch.podspec',
               'AWSCognito.podspec',
               'AWSCognitoIdentityProvider.podspec',
               'AWSCognitoSync.podspec',
               'AWSCognitoAuth.podspec',
               'AWSDynamoDB.podspec',
               'AWSEC2.podspec',
               'AWSElasticLoadBalancing.podspec',
               'AWSIoT.podspec',
               'AWSKinesis.podspec',
               'AWSKinesisVideo.podspec',
               'AWSKinesisVideoArchivedMedia.podspec',
               'AWSKMS.podspec',
               'AWSLambda.podspec',
               'AWSLogs.podspec',
               'AWSMachineLearning.podspec',
               'AWSMobileAnalytics.podspec',
               'AWSPinpoint.podspec',
               'AWSS3.podspec',
               'AWSSES.podspec',
               'AWSSimpleDB.podspec',
               'AWSSNS.podspec',
               'AWSSQS.podspec',
               'AWSLex.podspec',
               'AWSPolly.podspec',
               'AWSRekognition.podspec',
               'AWSTranslate.podspec',
               'AWSComprehend.podspec',
               'AWSTranscribe.podspec',
               
               'AWSAuthCore.podspec',
               'AWSUserPoolsSignIn.podspec',
               'AWSFacebookSignIn.podspec',
               'AWSGoogleSignIn.podspec',
               'AWSAuthUI.podspec',
               'AWSAuth.podspec',
               
               'AWSMobileClient.podspec',
               
               'AWSiOSSDKv2.podspec',

               ]
print (str(datetime.now()) + ': publishing cocoapods ...')
for package in podpackages:
    print (str(datetime.now())+': publishing ' + package + ' ...')
    process = Popen(["pod", 'trunk','push',package,'--allow-warnings'], stdout=PIPE)
    #process = Popen(["pod", 'repo','push','https://github.com/sunchunqiang/mypod-specs',package,'--allow-warnings'], stdout=PIPE)
    (output, err) = process.communicate()
    wait_times = 0 ;
    while process.poll() is None:
        wait_times = wait_times + 1;
        if wait_times % 50 == 0 :
            print(str(datetime.now())+ ": I am still alive")
        if wait_times > 600 :
            print(str(datetime.now())+ ": time out")
            quit(1)
        time.sleep(10)
    exit_code = process.poll()
# (output, err) = process.communicate()
    if exit_code != 0 :
        if "Unable to accept duplicate entry for:" in str(output):
            print (str(datetime.now()) +": " +  package +" is already published")
        else:
            print(output)
            print(err,  exit_code  )
            print(str(datetime.now()) + " Failed to publish " + package)
            quit(exit_code);
    print (str(datetime.now())+': published ' + package)
  
