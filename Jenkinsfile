pipeline {
     agent any
     stages {
         stage('Build') {
             steps {
                 sh 'sh docker_build.sh'
             }
         }
         stage('Lint HTML') {
              steps {
                sh 'tidy -q -e /var/lib/jenkins/workspace/capstoneProject_master/src/main/resources/templates/*.html'
              }
         }
         stage('Push image to dockerHub') {
              steps {
                  sh 'sh docker_update.sh'
              }
         }
        //  stage('Upload to AWS') {
        //       steps {
        //           withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_credential', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
        //           {
        //                //s3Upload consoleLogLevel: 'INFO', pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'index.html', bucket:'bonduu-static-jenkins-pipeline'
        //                s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'bonduu-static-jenkins-pipeline', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'us-west-2', showDirectlyInBrowser: false, sourceFile: 'index.html', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'bonduu-static-jenkins-pipeline', userMetadata: []
        //           }
        //       }
        //  }
     }
}