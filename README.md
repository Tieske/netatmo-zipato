# netatmo-zipato
push netatmo measurements to URLs (Zipato)

"zipabox.lua" pushes NetAtmo data to a Zipabox.

Everything is wrapped in a docker container see the [Makefile](Makefile).

The container is available as [tieske/netatmo-zipato](https://hub.docker.com/repository/docker/tieske/netatmo-zipato)

Configuration is in "config.lua", see [config_sample.lua](config_sample.lua) for
an example.
