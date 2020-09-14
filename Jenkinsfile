node {
  def dockerContainer = ""
  stage("Start Docker container and Run Tests") {
    dockerContainer = sh(script: "docker run -d spacyexample-test ./run-junit.sh", returnStdout: true).trim()
  }
  stage("Wait for Results") {
    retry(10) {
      sleep (time: 10, unit: 'SECONDS')
      sh "docker exec $dockerContainer ls results.xml"
    }
    // Once finished, we copy the results file.
    sh "docker cp $dockerContainer:/usr/src/app/tests/results.xml $WORKSPACE"
  }
  stage("Stop Container") {
    sh "docker stop $dockerContainer"
  }
  stage("Publish results") {
    junit "results.xml"
  }
}
