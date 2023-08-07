FROM node

# execute all below commands in this root directory
WORKDIR /app

# if package.json changed, only then execute npm install 
COPY package.json /app

# RUN command executes when image is created (no container yet)
RUN npm install

# now this dest path points to our WORKDIR
COPY . /app

# expose port so that we can communicate with our app inside container
# this is optional, remote port of the container
# for this to work, we need to map our local port, to the container port
# to do this, when executing docker run from cmd, we need to provide:
# docker run -p <local_port>:<remote_port> <image_id>
# so for example: docker run 3000:80 <image_id>
EXPOSE 80

# CMD command executes only when whole container is started
CMD [ "node", "server.js" ]