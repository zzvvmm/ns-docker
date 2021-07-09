## Prepare
- Install git
- [Install docker](https://docs.docker.com/get-docker/)
- [Install docker-compose](https://docs.docker.com/compose/install/)

## Setup steps
### 1. Clone neccessary repos (3mins):
```bash
git clone git@github.com:zzvvmm/ns-docker.git
git clone git@github.com:zzvvmm/ns-laravel-api.git
git clone git@github.com:zzvvmm/ns-nextjs.git
```
### 2. Build and run docker containers (10mins):
```sh
cd ns-docker
docker-compose up
```
### 3. Make some config of Laravel (for API Back-end):
```sh
docker-compose exec ns-web-server cp .env.example .env
docker-compose exec ns-web-server composer install
docker-compose exec ns-web-server php artisan key:generate
```

### 4. Make some config of Nextjs (for web Front-end):
```sh
cp ../ns-nextjs/.env.example ../ns-nextjs/.env.local
```

### 5. Enjoy it:
- Laravel App: [http://localhost:8002/](http://localhost:8002/)
- PHPMyAdmin: [http://localhost:5002/](http://localhost:5002/)
- Nextjs: [http://localhost:3002/](http://localhost:3002/)


## Some common command
1. Show running containers:
```sh
docker ps
```
2. Access to php server:
```sh
docker-compose exec ns-web-server bash
```
or
```
docker exec -it $web-server-container-id bash
```
3. Access to mysql:
```sh
docker-compose exec ns-mysql-server mysql -u root -p
```
or
```
docker exec -it $mysql-container-id mysql -u root -p
```
- `$web-server-container-id` and `$mysql-container-id` can be found in section 1 (by `docker ps` command)
- mysql user/password: `root/secret`

## Dev/debug/test kit (recommended by Duc)
- VisualCode + extensions (ESLint, Laravel Blade Snippets...)
  - Tab size: 2
  - Auto insert final newline (VSCode: Preferences -> Settings -> search insert final newline -> tick vào)
    ![image](https://user-images.githubusercontent.com/26274752/125071804-fa82b480-e0e3-11eb-98d9-24c6ab10dd9b.png)  

 
- Chrome + extentions (Chrome DevTools + React Developer Tools, Window Resizer...)
- Postman (for API testing)
