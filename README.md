Container for easy installation of blohg
=====
This image is a boilerplate for blogs based on blohg, pages are served by uwsgi and Nginx.

For details about Blohg http://docs.blohg.org

Source code: https://github.com/zoomacode/docker-blohg-git
Based on source code: https://github.com/p0bailey/docker-flask

Quick start
---
```bash
git clone https://your-blog/blog.git
or
hg clone https://your-blog/blog.hg

docker run -P --name "blog" -v /path/to/your-blog:/var/www/blog/ zoomacode/docker-blohg-git:latest
```

Init blog repository
---
Start container
```
docker run -it --rm zoomacode/docker-blohg-git:latest /bin/bash
```

Create new Mercurial repository:
```
blohg initrepo --repo-path my_blohg
```
or Git
```
blohg initrepo --repo-path my_blohg --git
```

Initial commit:
```
hg commit -Am 'initial commit'
```
or for Git:
```
git add .
git commit -m 'initial commit'
```

When the repository is created and commited, push it to github.com

Previewing your post/page
---
```
git clone https://your-blog/blog.git
docker run -p 5000:5000 --rm -it -v /path/to/your-blog:/var/www/blog/ zoomacode/docker-blohg-git:latest

blohg runserver --repo-path my_blohg
```

