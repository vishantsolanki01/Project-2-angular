pipeline {
   agent any

   stages {
      stage('Build') {
         steps {
            sh "./build.sh"
         }
      }
      stage('Sonar') {
         steps {
            sh "./sonar.sh"
         }
      }
   }
}
