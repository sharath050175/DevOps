FROM nginx:alpine

# Remove default nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy ShopHub files
COPY index.html /usr/share/nginx/html/

EXPOSE 80
