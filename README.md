## CLI/IDE Content Image Template

An example template help get a content image up and running quickly.

Content images are for providing initial content (`src/`) and running validation check functions via shell scripts/`make`.

See [Process for Creating IDE/CLI Labs](https://clouda.atlassian.net/wiki/spaces/CT/pages/2429157412/Process+for+Creating+IDE+CLI+Labs) for more information.

### Simulating production multi-container environment locally with `docker-compose`

1. Configure the `image` and `build` properties in `docker-compose.yaml` to point to the correct Docker image names and build path for the content image. The workspace image must already be built locally or in a container registry.

1. Use Docker compose to build the content image and create the workspace and content containers in a shared network with shared volume (workspace@`/home/project` and content@`/root/lab/src`):

    ```sh
    docker-compose up --build --force-recreate
    ```

1. Access the containers:

    1. Workspace will be available at [localhost:3000](http://localhost:3000)

    1. Get a shell in the content image with:

    ```sh
    docker exec -it ${PWD##*/}_content_1 /bin/bash
    ```

    From there, you can validation checks with:
    
    ```sh
    cd test
    make one # prints an error on failure
    ```

1. Clean up with:

    ```sh
    docker-compose down -v
    ```

## Simulating production multi-container environment locally with Kubernetes

1. With Docker for Desktop, you can enable a Kubernetes cluster locally (You should see __Kubernetes is running__ when the local cluster is up in the Docker menu). The current context for `kubectl` will appear as `docker-desktop` when running `kubectl config get-contexts`.

1. Configure the `image` properties in `deployment.yaml` to point to the correct Docker images (`init-src-volume` and `content` should have the same image). The <ins>workspace and content image must already be built locally or in a container registry</ins>.

1. Deploy with:

    ```sh
    kubectl apply -f deployment.yaml
    ```

1. Check the deployment has a __READY__ value of __1/1__ with:

    ```sh
    kubectl get deployments
    ```

1. Forward the pod's port with:

    ```sh
    lab_pod=$(kubectl get pod -o jsonpath={.items[*].metadata.name} | grep ide-lab)
    kubectl port-forward $lab_pod 3000:3000
    ```

1. Access the containers:

    1. Workspace will be available at [localhost:3000](http://localhost:3000).

    1. Get a shell in the content image with:

    ```sh
    kubectl exec -it $lab_pod -c content -- /bin/bash
    ```

    From there, you can validation checks with:
    
    ```sh
    cd test
    make one # prints an error on failure
    ```

1. Clean up with:

    ```sh
    kubectl delete -f deployment.yaml
    ```
