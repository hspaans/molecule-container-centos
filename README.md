# CentOS Container for Molecule

An [CentOS][centos] based container image for testing [Ansible][ansible] Roles with [Molecule][molecule]. The [repository][docker-centos8-ansible] from [Jeff Geerling][geerlingguy] was taken as starting point to create the repository.

## Example Molecule scenario

The example `molecule.yml` below is a scenario to run test on CentOS 8.

```yml
---
dependency:
  name: galaxy
driver:
  name: docker
lint: |
  set -e
  yamllint .
  ansible-lint
  flake8
platforms:
  - name: instance
    image: "ghcr.io/hspaans/molecule-container-centos:8"
    command: ""
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    privileged: true
    pre_build_image: true
provisioner:
  name: ansible
verifier:
  name: testinfra
```

## Versions

The container is based on [LTS](https://en.wikipedia.org/wiki/Long-term_support) distribution versions with official support and fall within N and N-1. The *latest*-tag is an experimental tag to test future releases.

| Platform | Version |                                    Image                                     |
| :------: | :-----: | :--------------------------------------------------------------------------: |
|  CentOS  |    7    |      [hspaans/molecule-container-centos:7][molecule-container-centos:7]      |
|  CentOS  |    8    |      [hspaans/molecule-container-centos:8][molecule-container-centos:8]      |
|  CentOS  |    8    | [hspaans/molecule-container-centos:latest][molecule-container-centos:latest] |

[ansible]: https://github.com/ansible/ansible
[centos]: https://centos.org
[docker-centos8-ansible]: https://github.com/geerlingguy/docker-centos8-ansible
[geerlingguy]: https://github.com/geerlingguy
[molecule]: https://github.com/ansible-community/molecule
[molecule-container-centos:latest]: ghcr.io/hspaans/molecule-container-centos:latest
[molecule-container-centos:7]: ghcr.io/hspaans/molecule-container-centos:7
[molecule-container-centos:8]: ghcr.io/hspaans/molecule-container-centos:8
