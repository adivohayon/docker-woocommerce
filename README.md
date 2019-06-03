Woocommerce Integration
===

Woo commerce is a free eCommerce toolkit for WordPress.

# Quick Start

`docker-compose up`

Point your browser to `http://127.0.0.1:8080`


# Setup
## Import data 
	dummy-data.csv


## WP-JSON
1. Make sure  pretty permalinks are available
2. `http://localhost:8080/wp-json` should be available

## Setup JWT Token
1. `.htaccess` (in root):
```
...
RewriteEngine On
RewriteCond %{HTTP:Authorization} ^(.*)
RewriteRule ^(.*) - [E=HTTP_AUTHORIZATION:%1]
RewriteBase /
...
```

2. `wp-config.php` (in root)
```
define('JWT_AUTH_SECRET_KEY', 'your-top-secret-key');
define('JWT_AUTH_CORS_ENABLE', true);
...
```

3. POST `http://localhost:8080/wp-json/jwt-auth/v1/token`
```
	{
		"username": "wordpress_user",
		"password": "wordpress_password"
	}
```

4. Send token in all headers
```
Authorization: Bearer ey13123oss.....
```

License
---


MIT

**Free Software, Hell Yeah!**
