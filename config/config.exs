import Config

config :oapi_generator,
  default: [
    output: [
      base_module: LagoApiClient,
      extra_fields: [__info__: :map],
      location: "lib/codegen",
      operation_subdirectory: "operations/",
      schema_subdirectory: "schemas/",
      schema_use: LagoApiClient.Encoder,
      types: [
        error: {LagoApiClient.Error, :t}
      ]
    ]
  ]
