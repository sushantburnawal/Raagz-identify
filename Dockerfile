FROM python:3.9

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    freetds-bin \
    freetds-common \
    freetds-dev

RUN git clone https://github.com/sushantburnawal/Raagz-identify .

RUN apt-get update && apt-get install -y ffmpeg
RUN apt-get install gcc
RUN apt-get install g++
RUN pip3 install streamlit-audiorecorder
RUN pip3 install -r requirements.txt

EXPOSE 7860

HEALTHCHECK CMD curl --fail http://localhost:7860/_stcore/health

ENTRYPOINT ["streamlit", "run", "chordentify.py", "--server.port=7860", "--server.address=0.0.0.0"]