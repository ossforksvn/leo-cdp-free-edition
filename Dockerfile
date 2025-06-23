FROM amazoncorretto:11

# Install required packages, including telnet and ping (iputils)
RUN yum update -y && \
    yum install -y git fontconfig nano net-tools nginx procps-ng telnet iputils && \
    yum clean all

# Create user and group
RUN useradd -ms /bin/bash cdpsysuser && \
    usermod -aG wheel cdpsysuser

# Set up working directories
RUN mkdir -p /build /home/cdpsysuser && \
    chown -R cdpsysuser:cdpsysuser /build /home/cdpsysuser

# Set build arg for working directory, default to /build/leo-cdp
ARG CDP_WORKDIR=/build/leo-cdp
WORKDIR ${CDP_WORKDIR}

# Copy current folder (project source) into workdir and set permissions as root
# COPY . ${CDP_WORKDIR}
# RUN chmod +x ${CDP_WORKDIR}/*.sh && \
    # chown -R cdpsysuser:cdpsysuser ${CDP_WORKDIR}

RUN chown -R cdpsysuser:cdpsysuser ${CDP_WORKDIR}

USER cdpsysuser

EXPOSE 80

CMD ["sh", "-c", "bash"]