pipeline {
    agent {label 'agent' }

    environment {
        registry = 'manojkumar641027/myregistry'
        }
    stages {
        stage('Build & Publish the image') { 
            steps { 
                script {
                    docker.withTool('docker') {
                        docker.withRegistry('https://registry.hub.docker.com', 'c7e5d531-63dc-4392-9e4e-69739f37fd95'){
                            //docker.build(registry + "ubuntu:java8").push()
                            docker.build(registry).push()
                            sh 'docker images'
                            sh 'docker rmi ${registry}'
                            echo '************after remove image*****************' 
                            sh 'docker images'
                            sh 'docker pull ${registry}'
                            echo '************after Pull images*****************' 
                            sh 'docker images'

                        }
                    }
                } 
            }
        }
    }
}
