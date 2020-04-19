NAME = justroots/distcc
IMAGE = $(NAME):latest
TAG = $(shell git describe --first-parent --always --abbrev=0 --match='v[0-9]*.*' HEAD)

build::
	docker build --rm --tag $(IMAGE) .

tag::
	docker tag $(IMAGE) $(NAME):$(TAG)

run::
	docker run --rm $(IMAGE)

push-latest::
	docker push $(IMAGE)

push-tag::
	docker push $(NAME):$(TAG)
