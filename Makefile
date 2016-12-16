image_name := ruby
image_registry := quay.io/nordstrom
ruby_version := 2.3
image_release := $(ruby_version)-2

build := build

build_args := --build-arg RUBY_VERSION=$(ruby_version)

ifdef http_proxy
build_args += --build-arg=http_proxy=$(http_proxy)
build_args += --build-arg=https_proxy=$(http_proxy)
build_args += --build-arg=HTTP_PROXY=$(http_proxy)
build_args += --build-arg=HTTPS_PROXY=$(http_proxy)
endif

.PHONY: build/image tag/image push/image clean

build/image: | build
	docker build -t $(image_name) $(build_args) .

tag/image: build/image
	docker tag $(image_name) $(image_registry)/$(image_name):$(image_release)

push/image: tag/image
	docker push $(image_registry)/$(image_name):$(image_release)

build:
	mkdir -p $@

clean:
	rm -rf build
