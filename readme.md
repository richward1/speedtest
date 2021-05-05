# Speedtest Docker

Speedtest CLI image, based on Ookla's speedtest CLI application. For more, see [here](https://www.speedtest.net/apps/cli).

You can either build this yourself (see below), or just run it from Docker hub.

## Build from Dockerfile

Clone the repo
```
git clone https://github.com/richward1/speedtest.git
```

Build using Docker
```
docker build -t richward/speedtest .
```

## Running

By default, the CLI application has two agreements you need to acknowledge: license, and gdpr. Running a container from this image, will default to prompting you to accept both of these. You have a few options here:

### Run interactively with no arguments.

This will prompt you to manually accept the license, then accept the gdpr before starting. The container will exit upon completion.

```
docker run -it richward/speedtest
```

Do not run without `-it`, this will cause the container to exit immediately, unless you changed the Dockerfile as per the last section.

### Run interactively with acceptance arguments

You can override the entrypoint by adding `speedtest --accept-license --accept-gdpr` to the end of the run command. This will run the test automatically, and will not prompt for anything. The container will exit upon completion.

```
docker run -it richward/speedtest speedtest --accept-license --accept-gdpr
```

### Change the Dockerfile first

Probably the best option is to change the Dockerfile itself, then build. I left this option in because I didn't want to push a repo that ignored Ookla's license and terms etc, but here's how you can accept it pretty much permanently. 

1. Swap the comment on the last two lines of the Dockerfile. So you end up with:

    ```
    #ENTRYPOINT speedtest
    ENTRYPOINT speedtest --accept-license --accept-gdpr
    ```

2. Build a new image
    ```
    docker build richward/speedtest .
    ```

3. Choose how you want to run.
    
    The following will run the test once, with a progress bar, and will exit upon completion.
    ```
    docker run -it richward/speedtest
    ```

    The following will run the test once, without a progress bar, and will exit upon completion.
    ```
    docker run richward/speedtest
    ```