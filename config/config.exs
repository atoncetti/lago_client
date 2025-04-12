import Config

config :oapi_generator,
  default: [
    output: [
      base_module: LagoClient,
      extra_fields: [__info__: :map],
      location: "lib/codegen",
      operation_subdirectory: "operations/",
      schema_subdirectory: "schemas/",
      schema_use: LagoClient.Encoder,
      types: [
        error: {LagoClient.Error, :t}
      ]
    ]
  ]
