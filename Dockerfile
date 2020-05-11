#First block id refered to "AS" Builder Phase
FROM node:alpine as builder 

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#2nd from statement is new Phase 

FROM nginx

#expose port (for elasticbeanstalk)
EXPOSE 80

#copy from builder phase
COPY --from=builder /app/build /usr/share/nginx/html

#nginx starts automatically

