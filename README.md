# Habitat resource

A Concourse resource for publishing Habitat artifacts.

## Source configuration

* `origin`: _Required_ the package origin.
* `name`: _Required_ the package name.
* `auth_token`: _Optional_ the token to authenticate with the depot. Required when uploading packages.
* `channel`: _Optional_ the channel to check defaults to 'unstable'.
* `bldr_url`: _Optional_ the root url to the bldr instance. Defaults to `https://bldr.habitat.sh`.
* `target`: _Optional_ the target for the package. Defaults to `x86_64-linux`.

### Example

```
- name: stable-core-consul-pkg
  source:
    channel: stable
    auth_token: <auth-token>
    name: consul
    origin: core
    type: hab-pkg
    bldr_url: https://bldr.mycompany.com
    target: x86_64-windows
resource_types:
- name: hab-pkg
  source:
    repository: starkandwayne/habitat-resource
    type: docker-image
```

## Behaviour

### `out`: Upload a habitat package
#### Parameters
* `channel`: _Optional_ overrides the source level channel configuration

### `in`: Download a habitat package
Will download the \*.hart file for the habitat package.
