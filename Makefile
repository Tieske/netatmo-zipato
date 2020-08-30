.PHONY: build run save load clean

build:
	docker build -t tieske/netatmo-zipato .

run:
	docker run --rm -t -v $(shell pwd)/config.lua:/config.lua tieske/netatmo-zipato

save:
	docker save -o netatmo-zipato.img tieske/netatmo-zipato

load:
	docker load -i netatmo-zipato.img

clean:
	-docker rmi tieske/netatmo-zipato
	-rm netatmo-zipato.img

push:
	docker push tieske/netatmo-zipato
