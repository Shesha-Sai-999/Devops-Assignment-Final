# Nomad job file to run the Docker container for devops-hello
job "devops-hello" {
  # Specify the datacenter where the job should run
  datacenters = ["dc1"]

  # Define a service job
  group "hello" {
    type = "service"

    # Minimal resource allocation
    resources {
      cpu    = 50     
      memory = 64     
    }

    # Task definition
    task "hello" {
      driver = "docker"

      config {
        image = "devops-hello:v1"
        
        # Run once and exit
        # This overrides the default CMD in Dockerfile
        command = "python"
        args    = ["-c", "print('Hello, DevOps from Nomad!')"]
      }
    }
  }
}