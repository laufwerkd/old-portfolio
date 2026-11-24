FROM nginx:alpine
# dist/ is built by the GitHub workflow and copied to the server
COPY dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8081
CMD ["nginx", "-g", "daemon off;"]
