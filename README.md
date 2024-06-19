### Project Overview: 3-Tier Web Application Using Python and OpenShift Pipeline

#### Objective
Develop a 3-tier web application using Python, containerized with Docker, and deployed using OpenShift pipeline. The application will consist of a web front end, an API server, and a database, each running in separate containers.

#### Project Requirements
1. **Environment Access**:
   - Ensure access to an OpenShift environment. If access is not available, request it through the OpenShift IBM Tech Zone, which typically provides a two-day access period. This can be renewed as needed.

2. **Application Structure**:
   - **Web Front End**: A web server hosting the web application.
   - **API Server**: A separate server handling API requests.
   - **Database**: A persistent storage solution using DB2.

3. **Containerization**:
   - Each component (web front end, API server, database) will be containerized using Docker.
   - Create Dockerfiles for each component manually, without relying on OpenShift's source-to-image (S2I) feature.

4. **CI/CD Pipeline**:
   - Use OpenShift pipeline to implement a CI/CD process.
   - Deploy the Docker images to OpenShift using ArgoCD or Tekton.

#### Steps to Complete the Project

1. **Set Up OpenShift Environment**:
   - Verify or request access to an OpenShift environment.
   - Ensure the environment is available for the duration of the project.

2. **Develop the Application**:
   - **Web Front End**: Develop the web application using Python frameworks like Flask or Django.
   - **API Server**: Create RESTful APIs using Flask or Django REST framework.
   - **Database**: Set up a DB2 database and ensure it can be accessed by the API server.

3. **Containerization**:
   - Write Dockerfiles for each component:
     - **Web Front End Dockerfile**
     - **API Server Dockerfile**
     - **Database Dockerfile**
   - Build Docker images using Docker commands.

4. **Deploy Using OpenShift Pipeline**:
   - Push Docker images to a container registry (e.g., Docker Hub).
   - Configure OpenShift pipeline to automate the deployment process.
   - Use ArgoCD or Tekton to manage the deployment of the Docker images to OpenShift.

5. **Testing and Validation**:
   - Test the deployment to ensure all components are working correctly.
   - Validate the CI/CD pipeline to ensure it automates the build and deployment process effectively.

6. **Documentation and Handover**:
   - Document the entire process, including setup, development, containerization, and deployment steps.
   - Prepare a handover document detailing how to maintain and extend the application.

#### Timeline
- **Week 1**: Set up the OpenShift environment and develop the web application, API server, and database.
- **Week 2**: Containerize the application components, set up the CI/CD pipeline, and deploy the application.
- **End of Week 2**: Conduct a review meeting to demonstrate the application and discuss any final adjustments.

#### Deliverables
- Source code for the web application, API server, and database setup.
- Dockerfiles for each component.
- CI/CD pipeline configuration.
- Documentation detailing the setup, development, and deployment process.
