<?php

use GuzzleHttp\Client as GuzzleClient;
use GuzzleHttp\Psr7\Request as GuzzleRequest;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

define('APP_PATH', dirname(__FILE__) . "/../");

require APP_PATH . 'vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(APP_PATH);
$dotenv->load();

$app = AppFactory::create();

$app->addRoutingMiddleware();

$errorMiddleware = $app->addErrorMiddleware(true, true, true);

$app->get('/send', function (Request $request, Response $response, $args) {
    $file = APP_PATH . 'html/send.html';
    $response->getBody()->write(file_get_contents($file));
    return $response;
});

$app->run();
