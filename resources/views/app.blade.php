<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title inertia>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link rel="stylesheet" href="https://fonts.bunny.net/css2?family=Nunito:wght@400;600;700&display=swap">

        <!-- Scripts -->
        @routes
        @if (env('APP_ENV') == 'local')
            @php
            $url = env('APP_URL');
            echo('
            <script type="module" src="'.$url.':5174/@vite/client"></script>
            <script type="module" src="'.$url.':5174/resources/js/app.js"></script>
            ');@endphp
        @else
            @vite('resources/js/app.js')
        @endif
        @inertiaHead
    </head>
    <body class="font-sans antialiased">
        @inertia
    </body>
</html>
