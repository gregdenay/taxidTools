FROM ubuntu:24.04

LABEL authors="Gregoire Denay" \
      description="Docker image to run this package"

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y python3-full python3-pip

COPY requirements.txt ./

RUN python3 -m venv .venv
RUN . .venv/bin/activate

RUN python3 -m pip install --break-system-packages --no-cache-dir -r requirements.txt

COPY . .

RUN python3 -m pip install . -vv --no-deps --no-build-isolation --break-system-packages

CMD ["python3"]
