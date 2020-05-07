<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'user' );

/** MySQL database password */
define( 'DB_PASSWORD', '1234' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         'T>bUlOc1|yJrbp${0sgoUI%!5TgF}4=-GJe+@4U8cMnGmH+*uP$%|i-.RH@Dz0g4');
define('SECURE_AUTH_KEY',  'oYAy2)8>8^B$$}yO<{|K@1U3Py_#faWd(|i)32wvAhw^fL+)7SEyNIJ=LFqo%=9+');
define('LOGGED_IN_KEY',    'nvl;-9~BAJBXi4~/*2_i{Edg 2%iO;lwu,r(fIBD//+v,:lRiI5v|vf_;DidUo]F');
define('NONCE_KEY',        'X|;CG|zE0>-8MsfjcG b:#N7e50casBS`Lwzt$.3k*]ZT)H~#e<]M[9k+joH`Y.a');
define('AUTH_SALT',        'v?uSp`q!?{1gkK[ aQAq+9l5;.{S}C:uRt<Q9Ai/zSw+enL:tPJ_TSz%jp)-AWTc');
define('SECURE_AUTH_SALT', '=BcXA`_&`43az^M&VDK*f`|]&L6W^-g_(h=Ca:4p[NUxF;X@/ZEqVK+hvh?s}?%+');
define('LOGGED_IN_SALT',   '~y7< PeKm,M#(d5L^TYf4zb}RB4&bj&Y^==mC+&!UOM&J6*&-e=D=egUPoA^,wiG');
define('NONCE_SALT',       'Zla8-Fpw+`$h-z360L-W&q)n(%$TM3jut1lMJJ%( 4=9P*DBR&#e>rN>g-ClT5B1');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
