local service = import "kubeflow/openmpi/service.libsonnet";
local workloads = import "kubeflow/openmpi/workloads.libsonnet";
local assets = import "kubeflow/openmpi/assets.libsonnet";
<<<<<<< HEAD

{
=======
local redis = import "kubeflow/openmpi/redis.libsonnet";

{
  all(params, env):: $.parts(params, env).all,

>>>>>>> upstream/master
  parts(params, env):: {
    // updatedParams uses the environment namespace if
    // the namespace parameter is not explicitly set
    local updatedParams = params {
      namespace: if params.namespace == "null" then env.namespace else params.namespace,
<<<<<<< HEAD
    },

    all:: [
      service.all(updatedParams),
      workloads.master(updatedParams),
      workloads.worker(updatedParams),
      assets.all(updatedParams),
    ],
=======
      init: if params.init == "null" then "/kubeflow/openmpi/assets/init.sh" else params.init,
      exec: if params.exec == "null" then "sleep infinity" else params.exec,
    },

    all::
      redis.all(updatedParams)
      + assets.all(updatedParams)
      + workloads.all(updatedParams)
      + service.all(updatedParams)
>>>>>>> upstream/master
  },
}
