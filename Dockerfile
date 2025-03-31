FROM gpac/ubuntu


WORKDIR /app
#COPY --from=builder /app /app
COPY ./wrapper /app/wrapper
COPY ./mp4decrypt /usr/bin/
COPY ./dl /usr/bin/
ENV args ""

CMD ["bash", "-c", "/app/wrapper/wrapper ${args}"]

EXPOSE 10020 20020
