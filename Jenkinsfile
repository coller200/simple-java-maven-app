pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }

    stages {
        stage('Build') {
            steps {
                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
    
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    //archiveArtifacts 'target/*.jar'
                }
            }
        }

        stage('Deliver') {
            steps {
                //sh 'chmod +x ./jenkins/scripts/deliver.sh'
                //sh './jenkins/scripts/deliver.sh'
                sh '''ssh ubuntu@13.208.172.148 -rm -rf /home/ubuntu/testjava/*
                ssh ubuntu@13.208.172.148 mkdir -p /home/ubuntu/testjava
                scp -r \'target/*.jar\' ubuntu@13.208.172.148:/home/ubuntu/testjava/'''
            }
        }
    }
}
