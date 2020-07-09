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
         stage('Deploy to production') {
              steps {
                  sh 'ansible-playbook -i inventory deploy.yml'
              }
         }
     }
}