A Small demo iron-function which pulls some image from Joyent Manta OS, resizes it, and uploads it back to Manta OS.

Steps for usage :

1. build: `fn build`
2. run your local iron functions service `docker run --rm -it --name functions -v ${PWD}/data:/app/data -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 iron/functions`
3. create an app `fn apps create fn-demo`
4. create a route `fn routes create fn-demo /resize -i coze/fn-resizeimage-ruby` (modify the image name as you see fit)
5. By default, `fn` tags the image with version. tag it with `latest` : `docker tag coze/fn-resizeimage-ruby:0.0.1 coze/fn-resizeimage-ruby:latest`
6. *optional* call from `fn` tool :  `echo '{"file": "The_Blue_Marble.jpg", "width":200, "height": 200}' | fn call fn-demo /resize`
7. *optional* call via curl iron functions API `curl -H "Content-Type: application/json" -X POST -d '{"file": "The_Blue_Marble.jpg", "width":100, "height": 100}' http://localhost:8080/r/fn-demo/resize`
8. Check results at Joyent Manta Stor.
