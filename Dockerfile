FROM ubuntu:24.04

LABEL authors="Gregoire Denay" \
      description="Docker image to run this package"

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y python3 python3-pip

COPY requirements.txt ./

RUN python -m pip install --no-cache-dir --upgrade pip \
  && python -m pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python -m pip install . -vv --no-deps --no-build-isolation

CMD ["python"]
