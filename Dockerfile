FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build-env
WORKDIR /app
COPY ./source/ConsoleRandomAnswerGenerator .
RUN dotnet restore
RUN dotnet build

# Move build output to a runtime environment

FROM mcr.microsoft.com/dotnet/framework/runtime:4.8 AS runtime
WORKDIR /app
COPY --from=build-env /app/bin/Debug .
# EXPOSE 80 8080
# ENTRYPOINT []

