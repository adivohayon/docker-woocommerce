Woocommerce Docker
===

Wordpress with Woocommerce installed.  
Includes JWT Auth for API access.


# Quick Start

`docker-compose up`

Point your browser to `http://127.0.0.1:8080`


# Setup

1. `docker-compose build`  

2. `docker-compose up`  

3. Go to: `http://127.0.0.1:8080`
	* Follow steps to install Wordpress  

4. Go to *Plugins*:
	* Activate JWT Authentication Plugin
	* Activate WooCommerce, and install

5. Woocommerce Installation
	* Follow steps to install Woocommerce
	* In final step click on *Import Products* - `dumnmy-data.csv`

6. Go to *Settings -> Permalinks*
	* Select `Post name` and save - This is so that `wp-json` will work properly  
	* Make sure this link works: `http://127.0.0.1:8080/wp-json`  


# Usage
## JWT

1. **POST** :: `http://127.0.0.1:8080/wp-json/jwt-auth/v1/token`  

**Request**  
```
	{
		"username": "wordpress_user",
		"password": "wordpress_password"
	}
```

2. Send token in all required requests in headers
```
Authorization: Bearer ey13123oss.....
```

## API
1. **GET** :: `http://localhost:8080/wp-json/wp/v2/users/me`
