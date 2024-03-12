pipeline {
  agent any 
  environment {
    def myString = 'https://github.com/InfotivVince/fooproject.git'
    def myString1 = "mvn compile"
    def myStirng2 = "mvn test"
    def myStirng3 = '**/TEST*.xml'
  }

  stages {
    stage('Checkout') {
      steps {
        git ${myString}
      }
    }  

    stage('Build') {
      steps {
        sh ${myString1}
      }
    }  
    stage('Test') {
      steps {
        sh ${myString2}
      }
     post {
      always {
        junit ${myString3}
      }
     }
  }
