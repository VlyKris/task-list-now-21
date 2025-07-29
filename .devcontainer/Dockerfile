FROM node:20-slim AS builder
RUN npm install -g pnpm@10.2.0

RUN apt-get update && apt-get install -y jc

RUN npm install @dotenvx/dotenvx --global

RUN npm install jwt-keygen --global

# write the contents of the CONVEX_TOKEN environment variable to ~/.convex/config.json as is
RUN mkdir -p $HOME/.convex
RUN echo "{\"accessToken\":\"eyJ2MiI6ImQ2MTNjMWRmOTU0OTQ1NzU4NzM3YWIxNWY4OThlZGNmIn0=\"}"> $HOME/.convex/config.json

RUN apt-get update && apt-get install -y git
RUN git config --global user.email "agent@vly.ai"
RUN git config --global user.name "Vly Agent"
RUN git config --global init.defaultBranch main