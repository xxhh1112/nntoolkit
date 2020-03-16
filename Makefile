docs:
	python setup.py upload_docs --upload-dir docs/_build/html

localinstall:
	sudo -H python setup.py install

upload:
	make clean
	python3 setup.py sdist bdist_wheel && twine upload dist/*

test:
	pytest

testall:
	make test
	cheesecake_index -n nntoolkit -v

count:
	cloc . --exclude-dir=docs,cover,dist,nntoolkit.egg-info

countc:
	cloc . --exclude-dir=docs,cover,dist,nntoolkit.egg-info,tests

countt:
	cloc tests

clean:
	python setup.py clean --all
	rm -f *.hdf5 *.yml *.csv
	find . -name "*.pyc" -exec rm -rf {} \;
	find . -type d -name "__pycache__" -delete
	rm -rf build
	rm -rf cover
	rm -rf dist
	rm -rf nntoolkit.egg-info
	rm -rf tests/reports
