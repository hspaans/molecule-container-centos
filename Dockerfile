FROM centos:8.3.2011

LABEL org.opencontainers.image.description="CentOS container for Molecule"
LABEL org.opencontainers.image.source=https://github.com/hspaans/molecule-container-centos

# Configure apt and install packages
# hadolint ignore=DL3008
RUN yum -y update \
    && yum -y install systemd systemd-sysv python3 \
    # Clean up
    && yum clean all

# Make sure systemd doesn't start agettys on tty[1-6].
RUN rm -f /lib/systemd/system/multi-user.target.wants/getty.target

VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]