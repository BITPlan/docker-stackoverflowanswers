FROM java:8
RUN ["java", "-version"]
RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*
RUN ["java", "-version"]
CMD ["java", "-version"]