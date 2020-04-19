NAME = distcc
IMAGE = $(NAME):latest
TAG = $(shell git describe --first-parent --always --abbrev=0 --match='v[0-9]*.*' HEAD)

image::
	docker build --tag $(IMAGE) .

tag::
	docker tag $(IMAGE) $(NAME):$(TAG)
