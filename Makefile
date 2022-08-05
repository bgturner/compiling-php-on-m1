all: /opt/lightning-services/php-7.4.30

/opt/lightning-services/php-7.4.30: build/php-7.4.30
	./compile-php.sh 7.4.30 && cd build/php-7.4.30 && make install

build/php-7.4.30: build/php-7.4.30.tar.gz
	cd build && tar xzf php-7.4.30.tar.gz

build/php-7.4.30.tar.gz:
	mkdir -p build
	curl -L https://www.php.net/distributions/php-7.4.30.tar.gz -o build/php-7.4.30.tar.gz

clean:
	rm -rf php-*
	rm -rf /opt/lightning-services/php-*
