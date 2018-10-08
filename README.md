## Running CICS Transaction Gateway Liberty JCA ECI sample code on websphere-liberty docker container

In this project we will show how to configure websphere-liberty container with CICSTG ECI Resource adapter and run a JCAServlet sample which uses CICSTC ECI Resource adapter to execute EC01 ( Date-Time CICS Application ) on CICSTS

### Pre-reqs
* CICS Transaction Gateway 9.1 or later instance with TCP/IP port listener or SSL port listener
* CICS Transaction Gateway (CICS TG) SDK. Download the latest 9.1 or 9.2 SDK from https://developer.ibm.com/cics/2016/03/11/cics-tg-sdks/ and copy it to current directory to create the docker image 
* websphere-liberty docker container (  https://hub.docker.com/_/websphere-liberty/ )
* Supported latest docker version and down to 1.6 on a best-effort basis  
* To test the JCA Servlet sample configure CICSTS region with EC01 program

### Configuration
The supplied `server.xml` file shows the required configuration paramters for adding the ECI resource adapter, 
creating a connection factory and adding the classes supplied with the resource adapter to the classpath of the application. 
This file can be used as-is or the configuration options can be copied into an existing server configuration.

### Compiling the sample
The sample servlet code can be added to a Web Project. To correct any compilation errors either the cicsjee.jar 
should be added to the build path if using the CICS TG, or the CICS Liberty JVM server libraries added using the Add Library
menu if using the CICS Explorer SDK for Servlet and JSP support.

### Docker build
We will build the docker image from websphere-liberty and configure the CICSTG ECI resource adapter. Build the docker instance using bellow command

```sh

docker build -t liberty-cicstg-eci-resource-adapter .

```

### Run the Docker instance
Run the docker instance using the bellow command

```sh

docker run -it -p 9080:9080 liberty-cicstg-eci-resource-adapter

```

The docker instance will start the liberty server with CICSTG ECI Resource adapter configured. The sample JCAServlet will use the CICSTG JCA resource adapter to connect to CICSTS and execute EC01 application on CICSTS.

### Test JCA Servlet sample
Test the JCA Servlet sample using the url http://<HOST_IP_ADDRESS>:9080/libertyJCA/JCAServlet

The above sample will display date and time of CICSTS

### Reference
* More information about working with CICS TG resource adapters in WebSphere Liberty can be found in this [tutorial](https://developer.ibm.com/cics/2014/05/06/using-jca-with-the-cics-tg-in-websphere-liberty-profile/)  
* Information on porting JCA ECI applications into CICS using the JCA local ECI resource adapter in Liberty can be found in this CICS developer center [tutorial](https://developer.ibm.com/cics/2015/07/23/porting-jca-eci-applications-into-a-cics-liberty-jvm-server/)
