FROM gpac/ubuntu


WORKDIR /app
#COPY --from=builder /app /app
COPY ./wrapper /app/wrapper
RUN chmod 755 /app/wrapper
COPY ./mp4decrypt /usr/bin/
RUN chmod 755 /usr/bin/mp4decrypt
COPY ./dl /usr/bin/
RUN chmod 755 /usr/bin/dl
ENV args ""

CMD ["bash", "-c", "/app/wrapper/wrapper ${args}"]

EXPOSE 10020 20020
