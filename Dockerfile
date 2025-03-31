FROM gpac/ubuntu

RUN apt-get update && apt-get install -y \
    weget \
    
RUN wget "https://github.com/zhaarey/wrapper/releases/download/linux.V2/wrapper.x86_64.tar.gz"
RUN mkdir /app/wrapper
RUN tar -xzf wrapper.x86_64.tar.gz -C /app/wrapper
WORKDIR /app
#COPY --from=builder /app /app
#COPY . /app
COPY ./mp4decrypt /usr/bin/
ENV args ""

CMD ["bash", "-c", "/app/wrapper/wrapper ${args}"]

EXPOSE 10020 20020
