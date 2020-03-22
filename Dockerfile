FROM centos:latest as builder 

WORKDIR /home/frontend

COPY package.json /

RUN yum install -y npm && npm install

COPY . .

RUN npm run build



FROM nginx

COPY --from=builder /home/frontend/build /usr/share/nginx/html

