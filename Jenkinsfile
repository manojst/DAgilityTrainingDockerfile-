pipeline {
  environment {
    registry = "manojkumar641027/myregistry"
    registryCredential = "dockerhub"
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://gitlab.training.dagility.com/manojkumar_gnanasekaran/dagilitytrainingdockerfile.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
