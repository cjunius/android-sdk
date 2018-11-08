FROM openjdk:8

ARG SDK_TOOLS_LINUX=sdk-tools-linux-4333796.zip
ENV ANDROID_HOME /opt/android-sdk-linux

RUN mkdir -p ${ANDROID_HOME} && \
    cd ${ANDROID_HOME} && \
    wget -q https://dl.google.com/android/repository/${SDK_TOOLS_LINUX} -O android_tools.zip && \
    unzip android_tools.zip && \
    rm android_tools.zip

ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

RUN mkdir /root/.android \
 && touch /root/.android/repositories.cfg \
 && yes | sdkmanager --licenses
 
RUN sdkmanager "platform-tools"
RUN sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2"
RUN sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2"
RUN sdkmanager "extras;android;m2repository"
RUN sdkmanager "extras;google;m2repository"
RUN sdkmanager "extras;google;google_play_services"
