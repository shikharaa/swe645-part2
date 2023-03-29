//This file with create a CI/CD pipeline for building and deploying the dcoker image to k8 cluster using Github as source control version.

pipeline{
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
  stages{
    stage('Build') {
      steps {
	sh 'rm -rf *.var'
        sh 'jar -cvf studentsurvey.war -C src/main/webapp .'      
        sh 'docker build -t shikhara1997/studentsurvey645:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
       }
    }
    stage("Push image to docker hub"){
      steps {
        sh 'docker push shikhara1997/studentsurvey645:latest'
      }
    }
        stage("deploying on k8")
	{
		steps{
			sh 'kubectl set image deployment/studentpage container-0=shikhara1997/studentsurvey645:latest -n default'
			sh 'kubectl rollout restart deploy studentpage -n default'
		}
	} 
  }
 
  post {
	  always {
			sh 'docker logout'
		}
	}    
}
