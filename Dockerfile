FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY home/ubuntu/docker/brain-tasks-app/dist/.  /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
