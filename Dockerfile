ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --update --no-cache gcc g++ cmake make wget libusb-dev autoconf automake bash
RUN wget https://github.com/sigmdel/mochad/archive/refs/heads/master.zip
RUN unzip master.zip
RUN chmod +x /mochad-master/autogen.sh
RUN bash /mochad-master/autogen.sh
RUN cd /mochad-master/ && make
RUN cd /mochad-master/ && make install
RUN apk --purge del gcc g++ cmake make wget autoconf automake
RUN rm -rf /var/cache/apk/* /lib/apk/db/* /mochad-master/

# Copy data for add-on
COPY run.sh /run.sh
RUN chmod +x /run.sh
RUN ls

CMD [ "/run.sh" ]
