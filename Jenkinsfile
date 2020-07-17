pipeline {
   agent any

   stages {
      stage('Build') {
         steps {
            sh "./build.sh"
         }
      }
      stage('Push Docker Image') {
         environment {
                SERVICE_CREDS = credentials('dockerid')
         }
         steps {
            sh "docker login --username=$SERVICE_CREDS_USR --password=$SERVICE_CREDS_PSW";
            sh "docker image push vishantsolanki01/reactapp:${BUILD_ID}";
	    sh "docker image rm vishantsolanki01/reactapp:${BUILD_ID}"
         }
      }
      stage('testing') {
         steps {
            echo 'testing'
         }
      }
      stage('staging') {
         steps {
            sh 'docker context use staging'
	    sh 'docker service create --with-registry-auth --name reactproject -d -p 8000:8080 vishantsolanki01/reactapp:${BUILD_ID} || docker service update --with-registry-auth --image=vishantsolanki01/reactapp:${BUILD_ID} reactproject'
         }
      }
      stage('Production') {
         steps {
            sh 'docker context use production'
	    sh 'docker service create --with-registry-auth --name reactproject -d -p 8000:8080 vishantsolanki01/reactapp:${BUILD_ID} || docker service update --with-registry-auth --image=vishantsolanki01/reactapp:${BUILD_ID} reactproject'
	    echo 'Production Environment'
         }
      }
   }	   
   
   post { 
        always { 
            sh 'docker context use default'
        }
    }
}


