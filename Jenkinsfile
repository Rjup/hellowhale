pipeline {
  agent any
  stages {
    stage('docker') {
      steps {
        sh '''docker images
'''
      }
    }
    stage('kubectl') {
      steps {
        sh '''cd 
kubectl get all'''
      }
    }
  }
}