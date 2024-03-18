
pipeline {
  agent any 
  
  stages {  
    stage('Build') {
      steps {
        bat "mvn compile"
        }
      } 
    stage('Test') {
      steps {
        bat "mvn test"
      }
     post {
      always {
        dir('C:/Users/ls930499/.jenkins/workspace/Jeevitha/trailrunner') {
        jacoco(
          execPattern: 'target/*.exec',
          classPattern: 'target/classes',
          sourcePattern: 'src/main/java',
          exclusionPattern: 'src/test*'
          ) 
        junit '**/TEST*.xml'
        }
      }
     }
    }
  }
}
