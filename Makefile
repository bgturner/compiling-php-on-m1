
all: build/buildconf

build/buildconf: build
	touch build/buildconf
	build/php-src-master/buildconf

# Need to use ditto to overcome encoding issues when unzipping under MacOS
build: php.zip
	ditto -x -k --sequesterRsrc --rsrc php.zip build

php.zip:
	curl -L https://github.com/php/php-src/archive/refs/heads/master.zip -o php.zip

clean:
	rm -rf build
	rm -rf php-src-master
	rm php.zip
