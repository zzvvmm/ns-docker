
## Cài đặt server

- Launch EC2

- Cài Security Group:

  - Mở cổng 22 cho SSH

  - Mở cổng 80 cho PHP Laravel (apache)

  - Mở cổng 3000 cho Nextjs (nodejs)

- Cài đặt các services, packages lên EC2: [Setup EC2](https://docs.google.com/document/d/1zNA25JYNNsovW_Fx6xr0kXqrl1MTFH3XnDpV7u02y4c/edit)

  - Back-end:

     - Apache2: Tạo web server

     - Php 8

     - Composer: php dependencies manager

     - Setup http.conf (config DocumentRoot)

     - Cài MySQL 8

  

  - Front-end:

    - [NVM](https://github.com/nvm-sh/nvm): Quản lý phiên bản Node

     ```bash

      curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
      export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

    ```


       - Nodejs v16.4.0

       ```bash
      nvm install v16.4.0
    ```

    -   Yarn: Quản lý packages/dependencies cho node (thay cho npm)
    
      ```bash
         npm install -g yarn
    ```

     -   [PM2](https://pm2.keymetrics.io/): Quản lý process
    
     ```bash

       npm install pm2 -g

       ** config file ecosystem.config.js **

       pm2 start // chạy next background = pm2

       pm2 startup // tự khởi động pm2 lúc server boot

       pm2 save // lưu tiến trình đang chạy = pm2 vào danh sách tự khởi động lúc server boot
    ```

    

  
  
  
  

-   Tạo image ec2 (EC2 Dashboard -> Select instance -> Actions -> Images and Templates -> Create Image
    -   Image 1: `php8.0_apache2_laravel8.12` Gồm môi trường backend (php, apache, mysql, laravel)  
    -   Image 2: `php8.0_apache2_laravel8.12_nextjs11_pm2` Image 1 + frontend (nvm, node, yarn, nextjs, pm2)
