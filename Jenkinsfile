pipeline { 
    environment { 
        registry = "manojkumar641027/myregistry" 
        //registryurl = 'https://hub.docker.com/repository/docker/manojkumar641027/myregistry'
        registryurl = 'https://registry.hub.docker.com'
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
                    sh 'docker image tag ${dockerImage} ${registry}'
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
                    docker.withTool('docker') {
                        withDockerRegistry(credentialsId: registryCredential, toolName: 'docker', url: registryurl){
                            dockerImage.push()                            
                        }                         
                    }
                    /*docker.withRegistry('https://hub.docker.com/repository/docker/', 'c7e5d531-63dc-4392-9e4e-69739f37fd95'){
                            docker.build(registry + "ubuntu:java8").push()
                        }*/

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
