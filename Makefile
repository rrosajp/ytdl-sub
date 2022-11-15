
wheel: clean
	pip3 install build
	python3 -m build
docker_stage: wheel
	cp dist/*.whl docker/root/
	cp -R examples docker/root/defaults/
docker: docker_stage
	sudo docker build --no-cache -t ytdl-sub:0.1 docker/
docs:
	sphinx-build -a -b html docs docs/_html
clean:
	rm -rf \
		.pytest_cache/ \
		build/ \
		dist/ \
		src/ytdl_sub.egg-info/ \
		docs/_html/ \
		.coverage \
		docker/root/*.whl \
		docker/root/defaults/examples \
		coverage.xml

.PHONY: wheel docker docs clean
