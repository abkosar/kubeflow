{
<<<<<<< HEAD
  all(params):: {
=======
  all(params):: [
    $.service(params),
  ],

  service(params):: {
>>>>>>> upstream/master
    kind: "Service",
    apiVersion: "v1",
    metadata: {
      name: params.name,
      namespace: params.namespace,
      labels: {
        app: params.name,
      },
    },
    spec: {
      ports: [
        {
<<<<<<< HEAD
          name: "port",
          port: 8080,
          targetPort: 8080,
=======
          name: "openmpi",  // not used
          port: 12345,
          targetPort: 12345,
>>>>>>> upstream/master
        },
      ],
      selector: {
        app: params.name,
      },
      clusterIP: "None",
    },
  },
}
