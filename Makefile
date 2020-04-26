NAME = justroots/distcc
IMAGE = $(NAME):latest
TAG = $(shell git describe --first-parent --always --abbrev=0 --match='v[0-9]*.*' HEAD)

build::
	docker build --rm --tag $(IMAGE) .

run::
	docker run -p 3632:3632 -p 3633:3633 -d --rm $(IMAGE)

tag::
	docker tag $(IMAGE) $(NAME):$(TAG)

push-latest::
	docker push $(IMAGE)

push-tag::
	docker push $(NAME):$(TAG)
