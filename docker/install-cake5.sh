#!/bin/bash

mkdir /var/www/cake5
cd /var/www/cake5
composer create-project --prefer-dist cakephp/app . "5.*"
cd /var/www/html
cp -prT /var/www/cake5 /var/www/html
rm -rf /var/www/cake5