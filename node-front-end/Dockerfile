FROM node:14

# Create app directory
WORKDIR /usr/src/app

# for gfw
RUN yarn config set registry https://registry.npm.taobao.org

RUN npm config set registry http://registry.npm.taobao.org

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
COPY yarn.lock ./

RUN yarn install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

# ENV PORT 3334

# EXPOSE 3334

CMD [ "yarn", "start"  ]

