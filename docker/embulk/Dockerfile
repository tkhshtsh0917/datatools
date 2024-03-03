# EmBulkの実行にはJavaが必要なため、Javaが含まれているベースイメージを使用します
FROM eclipse-temurin:8-jre-jammy

ENV LANG=C.UTF-8 \
    EMBULK_HOME=/opt/.embulk \
    PATH=${PATH}:/opt/.embulk \
    TZ=Asia/Tokyo

WORKDIR /opt/.embulk

# install curl
RUN apt-get update && \
    apt-get install --no-install-recommends -y curl && \
    rm -rf /var/lib/apt/lists/*

# install jruby
RUN curl --create-dirs -o ${EMBULK_HOME}/jruby-complete-9.4.6.0.jar \
    -L https://repo1.maven.org/maven2/org/jruby/jruby-complete/9.4.6.0/jruby-complete-9.4.6.0.jar && \
    chmod +x ${EMBULK_HOME}/jruby-complete-9.4.6.0.jar

# install embulk
RUN curl --create-dirs -o ${EMBULK_HOME}/embulk -L https://dl.embulk.org/embulk-0.11.2.jar && \
    chmod +x ${EMBULK_HOME}/embulk

# install ruby gems
COPY ./embulk.properties embulk.properties
RUN embulk gem install embulk -v 0.11.2 && \
    embulk gem install msgpack -v 1.7.2 && \
    embulk gem install liquid -v 5.4.0
# if you need bundler
#   embulk gem install bundler

# install embulk plugins
COPY ./config.yml.liquid config.yml.liquid
RUN embulk gem install embulk-input-mysql && \
    embulk gem install embulk-output-mysql && \
    embulk gem install embulk-filter-column && \
    embulk gem install embulk-filter-add_time

# run embulk
CMD ["java", "-jar", "embulk", "run", "config.yml.liquid", "-c", "state.yml"]
