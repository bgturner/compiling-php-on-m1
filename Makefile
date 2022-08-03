all: php-7.4.30

php-7.4.30: php-7.4.30.tar.gz
	tar xzf php-7.4.30.tar.gz

php-7.4.30.tar.gz:
	curl -L https://www.php.net/distributions/php-7.4.30.tar.gz -o php-7.4.30.tar.gz

clean:
	rm -rf php-*
