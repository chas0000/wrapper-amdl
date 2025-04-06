FROM gpac/ubuntu

RUN apt update&&apt install screen -y
WORKDIR /app
#COPY --from=builder /app /app
COPY ./wrapper /app/
COPY ./mp4decrypt /usr/bin/
COPY ./dl /app/amdl/
COPY ./config.yaml /app/amdl/
RUN chmod -R 755 /app&& chmod 755 /usr/bin/mp4decrypt
RUN ln -s /app/amdl/dl /usr/bin
ENV args ""

CMD ["bash", "-c", "/app/wrapper ${args}"]

EXPOSE 10020 20020
