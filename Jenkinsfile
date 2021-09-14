pipeline { 
    environment { 
        //registry = "manojkumar641027/myregistry" 
        registry = 'https://hub.docker.com/repository/docker/manojkumar641027/myregistry'
        registryCredential = 'c7e5d531-63dc-4392-9e4e-69739f37fd95' 
        dockerImage = '' 
    }
    agent {label 'agent' }
    stages { 
        stage('Cloning our Git') { 
            steps { 
                git 'https://gitlab.training.dagility.com/manojkumar_gnanasekaran/dagilitytrainingdockerfile.git' 
            }
        } 
        stage('Building our image') { 
            steps { 
                script { 
                    docker.withTool('docker') {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                    }
                }
            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    //docker.withRegistry( '', registryCredential ) { 
                    //    dockerImage.push() 
                    //}
                    withDockerRegistry(credentialsId: registryCredential, toolName: 'docker', url: registry) {
    dockerImage.push() 
}
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}
