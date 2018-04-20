{
<<<<<<< HEAD
  all(params):: {
=======
  all(params):: [
    $.configMap(params),
  ],

  configMap(params):: {
>>>>>>> upstream/master
    kind: "ConfigMap",
    apiVersion: "v1",
    metadata: {
      name: "openmpi-assets",
      namespace: params.namespace,
      labels: {
        app: params.name,
      },
    },
    data: {
      "init.sh": importstr "assets/init.sh",
      "mca-params.conf": importstr "assets/mca-params.conf",
      "ssh_config": importstr "assets/ssh_config",
      'sshd_config': importstr "assets/sshd_config",
      "hostfile": $.genHostfile(params),
    },
  },

  genHostfile(params)::
    std.lines(
      std.map(
<<<<<<< HEAD
        function(index) "openmpi-worker-%(index)d.%(name)s.%(namespace)s.svc.cluster.local" % {
          index: index,
          name: params.name,
          namespace: params.namespace,
=======
        function(index) "openmpi-worker-%(index)d.%(name)s.%(namespace)s%(slots)s" % {
          index: index,
          name: params.name,
          namespace: params.namespace,
          slots: if params.gpus > 1 then " slots=%d" % params.gpus else ""
>>>>>>> upstream/master
        },
        std.range(0, params.workers - 1)
      )
    ),
}
