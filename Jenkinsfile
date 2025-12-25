pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
               git 'https://github.com/seshadrireddy10/spring-swagger-app.git'
            }
        }
        stage ('build') {
            steps {
                sh 'mvn install -Dmaven.test.skip=true'
            }
        }
        stage ('docker') {
            steps {
                sh '''docker images'''
                sh 'docker ps -a '
                sh 'docker ps'
            }
        }
        stage ('docker-build') {
            steps {
                sh '''docker build -t jenkins-docker-build-pipeline . '''
            }
        }
        // stage ('docker-run') {
        //   steps {
        //       sh '''docker run -itd -p 8011:8011 jenkins-docker-build-pipeline - name jenkins-docker-build-pipeline'''  
        //     }
        // }
        stage ('docker-commit') {
            steps {
                sh 'docker commit 8dd709815ba2 reddyp/jenkins-docker-build-pipeline'
            }
        }
        stage ('docker-push') {
            steps {
                sh 'docker login -u reddyp -p reddyp '
                sh 'docker push reddyp/jenkins-docker-build-pipeline'
                
            }
        }
     }
}
