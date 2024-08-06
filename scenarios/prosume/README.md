# Scenario: Prosume
This scenario sets up a producing and a consuming machine. The producing machine mints some kWs and send a bunch of them to a consuming machine which burns it.

## Prerequisites

Clone planetmint-go repository

`git clone git@github.com:planetmint/planetmint-go.git`

Checkout the following branch

`git checkout 434-add-kwh-capabilities`

Download ignite binary

`curl https://get.ignite.com/cli@v0.27.1 | bash`

Build the binary

`./ignite chain build`

Copy binary to compose repo and mount on volumes in `compose.yml` as well as script to create machines as shown in diff:
```diff
diff --git a/compose.yml b/compose.yml
index 0c33b60..83db02c 100644
--- a/compose.yml
+++ b/compose.yml
@@ -5,6 +5,8 @@ services:
       dockerfile: dockerfiles/Planetmint.Dockerfile
     volumes:
       - ./node-1:/home/ubuntu/.planetmint-go:rw
+      - ./scenarios/prosume:/home/ubuntu/scripts:rw
+      - ./planetmint-god:/usr/local/bin/planetmint-god
     networks:
       - rddl
     command: planetmint-god start
@@ -15,6 +17,7 @@ services:
       dockerfile: dockerfiles/Planetmint.Dockerfile
     volumes:
       - ./node-2:/home/ubuntu/.planetmint-go:rw
+      - ./planetmint-god:/usr/local/bin/planetmint-god
     networks:
       - rddl
     command: planetmint-god start
@@ -25,6 +28,7 @@ services:
       dockerfile: dockerfiles/Planetmint.Dockerfile
     volumes:
       - ./node-3:/home/ubuntu/.planetmint-go:rw
+      - ./planetmint-god:/usr/local/bin/planetmint-god
     networks:
       - rddl
     command: planetmint-god start
@@ -35,6 +39,7 @@ services:
       dockerfile: dockerfiles/Planetmint.Dockerfile
     volumes:
       - ./node-4:/home/ubuntu/.planetmint-go:rw
+      - ./planetmint-god:/usr/local/bin/planetmint-god
     networks:
       - rddl
     command: planetmint-god start
```

# Steps
```bash
# Spin up network
docker compose up planetmint-1 planetmint-2 planetmint-3 planetmint-4
```

```bash
# Connect to Node 1
docker exec -it compose-planetmint-1-1 /bin/bash

# Run script
cd ~/scripts
./prosume.sh
```

# Cleanup
Reset the `compose.yml`:

`git checkout compose.yml`

and remove binary:

`rm planetmint-god`