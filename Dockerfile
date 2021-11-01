FROM <IMAGE> as build-env

WORKDIR /app
RUN <build command>
COPY . ./
RUN <publish command>


FROM <IMAGE> as run-env
WORKDIR /app
COPY --from=build-env /app/output .
EXPOSE 80 8080
ENTRYPOINT []

