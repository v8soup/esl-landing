# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.4.4
FROM ghcr.io/rails/devcontainer/images/ruby:$RUBY_VERSION

# Install flyctl for the vscode user
USER vscode
RUN curl -L https://fly.io/install.sh | sh

# Add flyctl to PATH for all users
ENV FLYCTL_INSTALL="/home/vscode/.fly"
ENV PATH="$FLYCTL_INSTALL/bin:${PATH}"