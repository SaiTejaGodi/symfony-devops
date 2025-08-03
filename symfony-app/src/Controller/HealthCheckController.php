<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HealthCheckController
{
    #[Route('/healthz', name: 'health_check')]
    public function index(): Response
    {
        return new Response('OK', 200);
    }
}

