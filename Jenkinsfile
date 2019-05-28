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
        withKubeConfig(clusterName: 'fpt-box', contextName: 'fpt-box', credentialsId: 'rancher-server', serverUrl: 'https://rancher.platform.tdsltestbed.test') {
          sh 'kubectl get all'
        }

      }
    }
  }
}