
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
        jacoco(
          execPattern: 'target/*.exec',
          classPattern: 'target/classes',
          sourcePattern: 'src/main/java',
          exclusionPattern: 'src/test*'
          )
        dir('C:/Users/ls930499/.jenkins/workspace/Jeevitha/trailrunner') 
        junit '**/TEST*.xml'
      }
     }
    }
  }
}
