pipeline {
  agent any 

  stages {
    stage('Build') {
      steps {
        sh "mvn compile"
      }
    }  
    stage('Test') {
      steps {
        sh "mvn test"
      }
    stage('Post Test'){
     post {
      always {
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
