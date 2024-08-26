pipeline {
    agent any
    environment {
        appversion=""
        nexusURL="184.73.57.35:8081"
    }
    options {
        // Timeout counter starts AFTER agent is allocated
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
    }
    stages{
        stage('clone'){
            steps{
                echo "The Jenkins file is in same code folder so no need of git checkout"
            }
        }
        stage('getversion'){
            steps{
                script {

                    def Jsonfile = readJSON file: 'package.json'
                    appversion = Jsonfile.version
                    echo "appversion : $appversion"
                }             
            }
        }
        stage("installing dependencies"){
            steps{

                sh"""

                    npm install
                    ls -lart

                """
            }
        }
        stage("creating artifact file") {
            steps{

                sh """
                    zip -q -r catalogue.zip ./* -x ".git" -x "*.zip"
                    ls -lart
                """
            }
        }
        stage('Publish Artifact') {
            steps {
                 nexusArtifactUploader(
                    nexusVersion: 'nexus3',
                    protocol: 'http',
                    nexusUrl: "${nexusURL}",
                    groupId: 'com.roboshop',
                    version: "${packageVersion}",
                    repository: 'catalogue',
                    credentialsId: 'nexus-auth',
                    artifacts: [
                        [artifactId: 'catalogue',
                        classifier: '',
                        file: 'catalogue.zip',
                        type: 'zip']
                    ]
                )
            }
        }
    }
    post {

        always {
            deleteDir()
            echo "Deleted previous workspace"
        }
        success{
            echo "Your pipeline job is success"
        }
        failure{
            echo "Your pipeline job is failure"
        }
    }
}