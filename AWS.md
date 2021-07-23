There is only one container in the Pod and it is running. The container exits successfully.
Record completion event.
If you restartPolicyare:
Always: Restart the container; Pod is phasestill Running.
OnFailure: Pod phasebecomes Succeeded.
Never: Pod phasebecomes Succeeded.
There is only one container in the Pod and it is running. The container failed to exit.
Log failure events.
If you restartPolicyare:
Always: Restart the container; Pod is phasestill Running.
OnFailure: Restart the container; Pod is phasestill Running.
Never: Pod phasebecomes Failed.
There are two containers in the Pod and they are running. One container failed to exit.
Log failure events.
If restartPolicy is:
Always: Restart the container; Pod is phasestill Running.
OnFailure: Restart the container; Pod is phasestill Running.
Never: Do not restart the container; Pod is phasestill Running.
If one container is not running, and two containers exit:
Log failure events.
If you restartPolicyare:
Always: Restart the container; Pod is phasestill Running.
OnFailure: Restart the container; Pod is phasestill Running.
Never: Pod phasebecomes Failed.
There is only one container in the Pod and it is running. When the container is running, the memory exceeds the limit:
The container terminates in a failed state.
Log OOM events.
If you restartPolicyare:
Always: Restart the container; Pod is phasestill Running.
OnFailure: Restart the container; Pod is phasestill Running.
Never: Record failed events; Pod is phasestill Failed.
Pod is running, disk failure:
Kill all containers.
Record appropriate events.
Pod phasebecomes Failed.
If you use the controller to run, the Pod will be rebuilt elsewhere.
The Pod is running and its nodes are segmented.
The node controller waits until it times out.
The node controller sets the Pod phaseto Failed.
If it is running with a controller, the Pod will be rebuilt elsewhere.
