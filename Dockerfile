FROM node

RUN ["npm", "install", "-g", "http-server", "live-server"]

RUN ["mkdir", "/webapp"]
WORKDIR /webapp

COPY webapp/* /webapp/

# When running this image, a local volume mount should be set to provide the contents that are served.
# If a volume is not specified, the container will only serve the contents of this build's webapp directory which is a Hello World page.
#VOLUME /webapp/

EXPOSE 8080
CMD [ "live-server", "/webapp/" ]


# Build:            docker build --rm -t klopezinfor/npm-server .
# Run Image:        docker run -p 8080:8080 -d klopezinfor/npm-server
# Run Development:  docker run -v <loal_dir>:/webapp/ p 8080:8080 -d klopezinfor/npm-server