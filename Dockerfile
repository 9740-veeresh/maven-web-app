# Use an official Tomcat base image (pick the version you need)
FROM tomcat:10-jdk17-corretto

# Remove default apps if you want a clean image (optional)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR produced by Maven into Tomcat webapps as ROOT.war
# This will make the app serve at "/"
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose the container port that Tomcat uses
EXPOSE 8080

# Use Tomcat's default startup command (already provided by the base image)
# No ENTRYPOINT needed; the base image already runs catalina.sh run
