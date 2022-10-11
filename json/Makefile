all:
	for I in ../hcl/*.tf ; do hcl2json $$I > $$(basename $$I).json; done
