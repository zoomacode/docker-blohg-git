UNDER CONSTRUCTION
=====
This image is a boilerplate for blogs based on blohg, pages are served by uwsgi and Nginx.

```bash
git clone https://your-blog/blog.git
or
hg clone https://your-blog/blog.hg

docker run -P --name "blog" -v /path/to/your-blog:/var/www/blog/ zoomacode/docker-blohg-git:latest
```

Source code: https://github.com/zoomacode/docker-blohg-git
Based on source code: https://github.com/p0bailey/docker-flask
